using MySql.Data.MySqlClient;
using SAPbobsCOM;
using System;
using System.Data;
using System.IO;
using System.Runtime.InteropServices;

namespace FTSISAPB1iService
{
    public class ImportAssetMasterData
    {
        private static DateTime dteStart;
        private static string strTransType;

        public static void _ImportAssetMasterData()
        {
            string strType = string.Empty;
            string strXmlPath = string.Empty;
            string strId = string.Empty;
            string strMySQLTable;
            string strU_RefNum = string.Empty;

            string format = "yyyyMMdd";

            DateTime dteDprStart;
            DateTime dtePostDate;

            bool blWithErr = false;

            SAPbobsCOM.Items oItems;

            try
            {
                dteStart = DateTime.Now;

                // Initialize Object Type.
                GlobalFunction.getObjType(4);
                strTransType = "Fixed Asset Master Data - " + GlobalVariable.strDocType;

                // Get All data for processing using Stored Procedure
                DataSet dsProcessData = SQLSettings.getDataFromMySQL(string.Format("CALL FTSI_IMPORT_GET_PROCESS_DATA('{0}')", GlobalVariable.intObjType));

                // Process Retrieved Data from Stored Procedure
                foreach (DataRow oDataRow in dsProcessData.Tables[0].Rows)
                {

                    strMySQLTable = oDataRow["MySQLTable"].ToString();
                    strU_RefNum = oDataRow["U_RefNum"].ToString();
                    strId = oDataRow["Id"].ToString();

                    try
                    {
                        SAPbobsCOM.Recordset oRecordset = (SAPbobsCOM.Recordset)GlobalVariable.oCompany.GetBusinessObject(SAPbobsCOM.BoObjectTypes.BoRecordset);

                        // Validation: Check if U_RefNum exists in OITM
                        if (!GlobalFunction.checkRefNum(strU_RefNum, GlobalVariable.strTableHeader))
                        {
                            DataSet oDataSet = SQLSettings.getDataFromMySQL(string.Format("CALL FTSI_IMPORT_FIXED_ASSET('{0}')", strId));
                            StartCompanyTransaction();

                            oItems = null;
                            oItems = (SAPbobsCOM.Items)GlobalVariable.oCompany.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oItems);

                            oItems.UserFields.Fields.Item("U_SalesAg").Value = oDataSet.Tables[0].Rows[0]["U_SalesAg"].ToString();
                            oItems.UserFields.Fields.Item("U_AssetAcct").Value = oDataSet.Tables[0].Rows[0]["U_AssetAcct"].ToString();
                            oItems.UserFields.Fields.Item("U_Maker").Value = oDataSet.Tables[0].Rows[0]["U_Maker"].ToString();
                            oItems.UserFields.Fields.Item("U_Model").Value = oDataSet.Tables[0].Rows[0]["U_Model"].ToString();
                            oItems.UserFields.Fields.Item("U_ModYear").Value = oDataSet.Tables[0].Rows[0]["U_ModYear"].ToString();
                            oItems.UserFields.Fields.Item("U_Serial").Value = oDataSet.Tables[0].Rows[0]["U_Serial"].ToString();
                            oItems.UserFields.Fields.Item("U_GDate").Value = oDataSet.Tables[0].Rows[0]["U_GDate"].ToString();
                            oItems.UserFields.Fields.Item("U_Chasis").Value = oDataSet.Tables[0].Rows[0]["U_Chasis"].ToString();
                            oItems.UserFields.Fields.Item("U_Engine").Value = oDataSet.Tables[0].Rows[0]["U_Engine"].ToString();
                            oItems.UserFields.Fields.Item("U_Color").Value = oDataSet.Tables[0].Rows[0]["U_Color"].ToString();
                            oItems.UserFields.Fields.Item("U_EquipID").Value = oDataSet.Tables[0].Rows[0]["U_EquipID"].ToString();
                            oItems.UserFields.Fields.Item("U_LMADate").Value = oDataSet.Tables[0].Rows[0]["U_LMADate"].ToString();
                            oItems.UserFields.Fields.Item("U_NMADate").Value = oDataSet.Tables[0].Rows[0]["U_NMADate"].ToString();
                            oItems.UserFields.Fields.Item("U_AssInfo1").Value = oDataSet.Tables[0].Rows[0]["U_AssInfo1"].ToString();
                            oItems.UserFields.Fields.Item("U_AssInfo2").Value = oDataSet.Tables[0].Rows[0]["U_AssInfo2"].ToString();
                            oItems.UserFields.Fields.Item("U_AssInfo3").Value = oDataSet.Tables[0].Rows[0]["U_AssInfo3"].ToString();
                            oItems.UserFields.Fields.Item("U_AssLoc").Value = oDataSet.Tables[0].Rows[0]["U_AssLoc"].ToString();
                            oItems.UserFields.Fields.Item("U_AssLocM").Value = oDataSet.Tables[0].Rows[0]["U_AssLocM"].ToString();
                            oItems.UserFields.Fields.Item("U_AssRes").Value = oDataSet.Tables[0].Rows[0]["U_AssRes"].ToString();
                            oItems.UserFields.Fields.Item("U_Contract").Value = oDataSet.Tables[0].Rows[0]["U_Contract"].ToString();
                            oItems.UserFields.Fields.Item("U_RefNum").Value = oDataSet.Tables[0].Rows[0]["U_RefNum"].ToString();
                            oItems.UserFields.Fields.Item("U_ContractStatus").Value = "0";

                            oItems.AssetClass = oDataSet.Tables[0].Rows[0]["AssetClass"].ToString();
                            oItems.ItemName = oDataSet.Tables[0].Rows[0]["ItemName"].ToString();
                            oItems.ItemCode = oDataSet.Tables[0].Rows[0]["ItemCode"].ToString();
                            oItems.ItemType = SAPbobsCOM.ItemTypeEnum.itFixedAssets;

                            string strDprStart = oDataSet.Tables[0].Rows[0]["DprStart"].ToString();
                            DateTime.TryParseExact(strDprStart, format, null, System.Globalization.DateTimeStyles.None, out dteDprStart);

                            oItems.DepreciationParameters.Add();
                            oItems.DepreciationParameters.DepreciationStartDate = dteDprStart;
                            oItems.DepreciationParameters.UsefulLife = Convert.ToInt32(Math.Truncate(Convert.ToDecimal(oDataSet.Tables[0].Rows[0]["UsefulLife"].ToString())));
                            oItems.Frozen = SAPbobsCOM.BoYesNoEnum.tNO;


                            if (oItems.Add() != 0)
                            {
                                blWithErr = true;

                                SystemFunction.transHandler("Import", strTransType, "4", Path.GetFileName(strXmlPath), "", "", dteStart, "E", GlobalVariable.oCompany.GetLastErrorCode().ToString(), GlobalVariable.oCompany.GetLastErrorDescription());
                                // Update Staging DB
                                string strErrmsg = GlobalVariable.oCompany.GetLastErrorDescription().ToString();

                                SQLSettings.executeQuery(string.Format("UPDATE {0} SET IntegrationStatus = 'E', IntegrationMessage = \"{1}\" WHERE Id = '{2}'", strMySQLTable, strErrmsg, strId));

                                SQLSettings.executeQuery(string.Format("UPDATE ftoitm SET IntegrationStatus = 'E' WHERE U_RefNum = '{0}'", strU_RefNum));

                                EndCompanyTransaction(BoWfTransOpt.wf_RollBack);
                            }
                            else
                            {
                                CompanyService oCmpSrvc = GlobalVariable.oCompany.GetCompanyService();
                                AssetDocumentService AssetService = (AssetDocumentService)oCmpSrvc.GetBusinessService(ServiceTypes.AssetCapitalizationService);

                                AssetDocument AssetDocument = AssetService.GetDataInterface(AssetDocumentServiceDataInterfaces.adsAssetDocument);
                                AssetDocumentLine AssetDocLine = AssetDocument.AssetDocumentLineCollection.Add();
                                AssetDocumentAreaJournal JrnlEntry = AssetDocument.AssetDocumentAreaJournalCollection.Add();

                                string strPostDate = oDataSet.Tables[0].Rows[0]["PostDate"].ToString();
                                DateTime.TryParseExact(strPostDate, format, null, System.Globalization.DateTimeStyles.None, out dtePostDate);
                                AssetDocument.PostingDate = dtePostDate;

                                AssetDocLine.AssetNumber = oDataSet.Tables[0].Rows[0]["ItemCode"].ToString();

                                AssetDocLine.Quantity = Convert.ToDouble(oDataSet.Tables[0].Rows[0]["Quantity"]);
                                AssetDocLine.TotalLC = Convert.ToDouble(oDataSet.Tables[0].Rows[0]["Linetotal"]);
                                AssetService.Add(AssetDocument);

                                if (blWithErr == false)
                                {
                                    StartCompanyTransaction();

                                    // Output to Integration Log
                                    SystemFunction.transHandler("Import", strTransType, GlobalVariable.intObjType.ToString(), Path.GetFileName(strXmlPath), "", "", dteStart, "S", GlobalVariable.intObjType.ToString(), string.Format("Successfully Posted {0}", strTransType));

                                    // Update Staging DB
                                    SQLSettings.executeQuery(string.Format("UPDATE {0} SET IntegrationStatus = 'S', IntegrationMessage = \"Successfully Posted\" WHERE Id = '{1}'", strMySQLTable, strId));

                                    SQLSettings.executeQuery(string.Format("UPDATE ftoitm SET IntegrationStatus = 'S' WHERE U_RefNum = '{0}'", strU_RefNum));

                                    EndCompanyTransaction(BoWfTransOpt.wf_Commit);
                                }
                            }
                        }
                        else
                        {
                            SystemFunction.transHandler("Import", strTransType, GlobalVariable.intObjType.ToString(), Path.GetFileName(strXmlPath), "", strU_RefNum, dteStart, "E", "", $"Validation failed: U_RefNum '{strU_RefNum}' already exists.");

                            // Update Staging DB
                            SQLSettings.executeQuery(string.Format("UPDATE {0} SET IntegrationStatus = 'E', IntegrationMessage = \"U_RefNum already exist\" WHERE Id = '{1}'", strMySQLTable, strId));

                            SQLSettings.executeQuery(string.Format("UPDATE ftoitm SET IntegrationStatus = 'E' WHERE U_RefNum = '{0}'", strU_RefNum));
                        }
                    }
                    catch (Exception ex)
                    {
                        blWithErr = true;

                        GlobalVariable.intErrNum = -111;
                        GlobalVariable.strErrMsg = string.Format("Error Processing Import. {0}", ex.Message.ToString());

                        SystemFunction.transHandler("Import", strTransType, GlobalVariable.intObjType.ToString(), Path.GetFileName(strXmlPath), "", "", dteStart, "E", GlobalVariable.intErrNum.ToString(), GlobalVariable.strErrMsg);

                        // Update Staging DB
                        SQLSettings.executeQuery(string.Format("UPDATE {0} SET IntegrationStatus = 'E', IntegrationMessage = \"{1}\" WHERE Id = '{2}'", strMySQLTable, GlobalVariable.strErrMsg.Replace("\\", "").Replace("\"", "'"), strId));

                        SQLSettings.executeQuery(string.Format("UPDATE ftoitm SET IntegrationStatus = 'E' WHERE U_RefNum = '{0}'", strU_RefNum));

                        GC.Collect();

                        EndCompanyTransaction(BoWfTransOpt.wf_RollBack);
                    }

                }

            }
            catch (Exception ex)
            {
                GlobalVariable.intErrNum = -111;
                GlobalVariable.strErrMsg = string.Format("Error Processing Fixed Asset. {0}", ex.Message.ToString());

                SystemFunction.transHandler("Import", strTransType, GlobalVariable.intObjType.ToString(), Path.GetFileName(strXmlPath), "", "", dteStart, "E", GlobalVariable.intErrNum.ToString(), GlobalVariable.strErrMsg);

                GC.Collect();

                EndCompanyTransaction(BoWfTransOpt.wf_RollBack);
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
