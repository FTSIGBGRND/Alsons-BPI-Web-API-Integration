using MySql.Data.MySqlClient;
using SAPbobsCOM;
using System;
using System.Data;
using System.IO;
using System.Windows.Forms;

namespace FTSISAPB1iService
{
    public class ImportAssetRetirement
    {
        private static DateTime dteStart;
        private static string strTransType;
        private static string strSapDocNum;

        public static void _ImportAssetRetirement()
        {
            string strId = string.Empty;
            string strU_RefNum = string.Empty;
            string strDocType = string.Empty;
            string strXmlPath = string.Empty;
            string strMySQLTable;

            string format = "yyyyMMdd";
            
            DateTime dtePostDate;
            DateTime dteDocDate;
            DateTime dteAssetDate;

            bool blWithErr = false;

            dteStart = DateTime.Now;

            // Initialize Object Type.
            GlobalFunction.getObjType(310);
            strTransType = "Fixed Asset - " + GlobalVariable.strDocType;

            // Get All data for processing using Stored Procedure
            DataSet dsProcessData = SQLSettings.getDataFromMySQL(string.Format("CALL FTSI_IMPORT_GET_PROCESS_DATA({0})", GlobalVariable.intObjType));

            // Run process for each row
            foreach (DataRow oDataRow in dsProcessData.Tables[0].Rows)
            {
                strId = oDataRow["Id"].ToString();
                strMySQLTable = oDataRow["MySQLTable"].ToString();

                try
                {
                    DataSet oDataSet = SQLSettings.getDataFromMySQL(string.Format("CALL FTSI_IMPORT_FIXED_ASSET_RETIREMENT('{0}')", strId));

                    string strdocType = oDataSet.Tables[0].Rows[0]["DocType"].ToString();

                    // Start Import Process 
                    StartCompanyTransaction();

                    CompanyService oCmpSrvc = GlobalVariable.oCompany.GetCompanyService();
                    AssetDocumentService AssetService = (AssetDocumentService)oCmpSrvc.GetBusinessService(ServiceTypes.AssetRetirementService);

                    AssetDocument AssetDocument = AssetService.GetDataInterface(AssetDocumentServiceDataInterfaces.adsAssetDocument);
                    AssetDocumentLine AssetDocLine = AssetDocument.AssetDocumentLineCollection.Add();
                    AssetDocumentAreaJournal JrnlEntry = AssetDocument.AssetDocumentAreaJournalCollection.Add();

                    if (strdocType == "NC")
                    {
                        AssetDocument.DocumentType = AssetDocumentTypeEnum.adtSales;
                    }
                    else if (strdocType == "SC")
                    {
                        AssetDocument.DocumentType = AssetDocumentTypeEnum.adtScrapping;
                    }

                    // AssetDocument.Status = oDataSet.Tables[0].Rows[0]["Status"].ToString();
                    AssetDocument.Remarks = oDataSet.Tables[0].Rows[0]["Comments"].ToString();

                    string strPostDate = oDataSet.Tables[0].Rows[0]["PostDate"].ToString();
                    DateTime.TryParseExact(strPostDate, format, null, System.Globalization.DateTimeStyles.None, out dtePostDate);
                    AssetDocument.PostingDate = dtePostDate;

                    string strDocDate = oDataSet.Tables[0].Rows[0]["DocDate"].ToString();
                    DateTime.TryParseExact(strDocDate, format, null, System.Globalization.DateTimeStyles.None, out dteDocDate);
                    AssetDocument.DocumentDate = dteDocDate;

                    string strAssetDate = oDataSet.Tables[0].Rows[0]["AssetDate"].ToString();
                    DateTime.TryParseExact(strAssetDate, format, null, System.Globalization.DateTimeStyles.None, out dteAssetDate);
                    AssetDocument.AssetValueDate = dteAssetDate;

                   // AssetDocument.Remarks = oDataSet.Tables[0].Rows[0]["Comments"].ToString();

                    AssetDocLine.LineNumber = Convert.ToInt32(oDataSet.Tables[0].Rows[0]["LineNum"]);
                    AssetDocLine.AssetNumber = oDataSet.Tables[0].Rows[0]["ItemCode"].ToString();
                    AssetDocLine.Partial = SAPbobsCOM.BoYesNoEnum.tNO;
                    AssetDocLine.APC = Convert.ToDouble(oDataSet.Tables[0].Rows[0]["APC"]);

                    AssetDocument.DepreciationArea = "*";



                    AssetService.Add(AssetDocument);

                    if (blWithErr == false)
                    {
                        StartCompanyTransaction();

                        // Output to Integration Log
                        SystemFunction.transHandler("Import", strTransType, GlobalVariable.intObjType.ToString(), Path.GetFileName(strXmlPath), "", "", dteStart, "S", GlobalVariable.intObjType.ToString(), string.Format("Successfully Posted {0}", strTransType));

                        // Update Staging DB
                        SQLSettings.executeQuery(string.Format("UPDATE {0} SET IntegrationStatus = 'S', IntegrationMessage = \"Successfully Posted\" WHERE Id = '{1}'", strMySQLTable, strId));

                        EndCompanyTransaction(BoWfTransOpt.wf_Commit);
                    }

                }

                catch (Exception ex)
                {
                    GlobalVariable.intErrNum = -111;
                    GlobalVariable.strErrMsg = string.Format("Error Processing Fixed Asset Retirement. {0}", ex.Message.ToString());

                    SystemFunction.transHandler("Import", strTransType, GlobalVariable.intObjType.ToString(), Path.GetFileName(strXmlPath), "", "", dteStart, "E", GlobalVariable.intErrNum.ToString(), GlobalVariable.strErrMsg);

                    // Update Staging DB
                    SQLSettings.executeQuery(string.Format("UPDATE {0} SET IntegrationStatus = 'E', IntegrationMessage = \"{1}\" WHERE Id = '{2}'", strMySQLTable, GlobalVariable.strErrMsg.Replace("\\", "").Replace("\"", "'"), strId));

                    GC.Collect();

                    EndCompanyTransaction(BoWfTransOpt.wf_RollBack);
                }

            }
           
        }
        public static void StartCompanyTransaction()
        {
            if (!(GlobalVariable.oCompany.InTransaction))
                GlobalVariable.oCompany.StartTransaction();
        }

        public static void EndCompanyTransaction(BoWfTransOpt transOpt)
        {
            if (GlobalVariable.oCompany.InTransaction)
                GlobalVariable.oCompany.EndTransaction(transOpt);
        }
    }
}
