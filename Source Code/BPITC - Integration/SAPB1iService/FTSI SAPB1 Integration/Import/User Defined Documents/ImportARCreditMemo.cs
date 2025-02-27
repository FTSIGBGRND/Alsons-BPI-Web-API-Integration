using MySql.Data.MySqlClient;
using SAPbobsCOM;
using System;
using System.Data;
using System.IO;

namespace FTSISAPB1iService
{
    public class ImportARCreditMemo
    {

        private static DateTime dteStart;
        private static string strTransType;
        private static string strSapDocNum;

        public static void _ImportARCreditMemo()
        {
            string strId = string.Empty;
            string strU_RefNum = string.Empty;
            string strXmlPath = string.Empty;
            string strPostDocEntry, strPostDocNum;
            string strMySQLTable;
            string strCancel = string.Empty;
            string strIntegrationStatus = string.Empty;
            string strDocType = string.Empty;


            try
            {
                dteStart = DateTime.Now;

                // Initialize Object Type
                GlobalFunction.getObjType(14);
                strTransType = "Documents - " + GlobalVariable.strDocType;
               
                SAPbobsCOM.Recordset oRecordset = (SAPbobsCOM.Recordset)GlobalVariable.oCompany.GetBusinessObject(SAPbobsCOM.BoObjectTypes.BoRecordset);

                // Get All data for processing using Stored Procedure
                DataSet dsProcessData = SQLSettings.getDataFromMySQL(string.Format("CALL FTSI_IMPORT_GET_PROCESS_DATA({0})", GlobalVariable.intObjType));

                // Run process for each row
                foreach (DataRow oDataRow in dsProcessData.Tables[0].Rows)
                {
                    strId = oDataRow["Id"].ToString();
                    strMySQLTable = oDataRow["MySQLTable"].ToString();
                    strCancel = oDataRow["Canceled"].ToString();
                    strU_RefNum = oDataRow["U_RefNum"].ToString();
                    strDocType = oDataRow["DocType"].ToString();

                    try
                    {
                        
                        if (strCancel == "Y") // process is for cancellation
                        {
                            SystemFunction.errorAppend($"For Cancellation");
                            StartCompanyTransaction();

                            SAPbobsCOM.Documents oCreditNotes = null;
                            oCreditNotes = (SAPbobsCOM.Documents)GlobalVariable.oCompany.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oCreditNotes);

                            string query = $"SELECT DocEntry, Canceled FROM ORIN WHERE U_RefNum = '{strU_RefNum}'";
                            oRecordset.DoQuery(query);

                            // Get the DocEntry from the query result
                            int docEntry = oRecordset.Fields.Item("DocEntry").Value;

                            //SystemFunction.errorAppend($"For Cancellation: DocEntry: {docEntry}");

                            try
                            {
                                if (oCreditNotes.GetByKey(docEntry)) // docEntry
                                {
                                    Documents cancelDoc = oCreditNotes.CreateCancellationDocument();

                                    if (cancelDoc.Add() != 0)
                                    {
                                        SystemFunction.errorAppend($"For Cancellation2");

                                        // Output to Integration Log
                                        SystemFunction.transHandler("Import", strTransType + " Cancellation", GlobalVariable.intObjType.ToString(), Path.GetFileName(strXmlPath), "", "", dteStart, "E", "-" + GlobalVariable.intObjType.ToString(), string.Format("Error Cancelling SAP Business Object: {0}", GlobalVariable.strErrMsg.Replace("\\", "").Replace("\"", "'")));

                                        // Update Staging DB
                                        SQLSettings.executeQuery(string.Format("UPDATE {0} SET Canceled = 'E', Posted = 'E', IntegrationStatus = 'E', IntegrationMessage = \"{1}\" WHERE Id = '{2}'", strMySQLTable, GlobalVariable.strErrMsg.Replace("\\", "").Replace("\"", "'"), strId));
                                    }
                                    else
                                    {
                                        SystemFunction.errorAppend($"For Cancellation3");

                                        // Output to Integration Log
                                        SystemFunction.transHandler("Import", strTransType + " Cancellation", GlobalVariable.intObjType.ToString(), Path.GetFileName(strXmlPath), "", "", dteStart, "S", GlobalVariable.intObjType.ToString(), string.Format("Successfully Cancelled {0}", strTransType));

                                        SQLSettings.executeQuery(string.Format("UPDATE {0} SET Canceled = 'S', Posted = 'Y', IntegrationStatus = 'S' , IntegrationMessage = \"Successfully Cancelled\" WHERE U_RefNum = '{1}'", strMySQLTable, strU_RefNum));
                                    }

                                    EndCompanyTransaction(BoWfTransOpt.wf_Commit);

                                }
                                else
                                {
                                    SystemFunction.errorAppend($"For Cancellation5");

                                    // Output to Integration Log
                                    SystemFunction.transHandler("Import", strTransType + " Cancellation", GlobalVariable.intObjType.ToString(), Path.GetFileName(strXmlPath), "", docEntry.ToString(), dteStart, "E", "-" + GlobalVariable.intObjType.ToString(), "Error Cancelling AR Credit Memo, DocEntry Not Found");

                                    // Update Staging DB
                                    SQLSettings.executeQuery(string.Format("UPDATE {0} SET Canceled = 'E', Posted = 'E', IntegrationStatus = 'E', IntegrationMessage = \"{1}\" WHERE Id = '{2}'", strMySQLTable, GlobalVariable.strErrMsg.Replace("\\", "").Replace("\"", "'"), strId));

                                    EndCompanyTransaction(BoWfTransOpt.wf_Commit);
                                }
                            }
                            catch (Exception ex)
                            {
                                GlobalVariable.intErrNum = -111;
                                GlobalVariable.strErrMsg = string.Format("Error Processing Cancellation. {0}", ex.Message.ToString());

                                SystemFunction.transHandler("Import", strTransType, GlobalVariable.intObjType.ToString(), Path.GetFileName(strXmlPath), "", strU_RefNum, dteStart, "E", GlobalVariable.intErrNum.ToString(), GlobalVariable.strErrMsg);

                                // Update Staging DB
                                SQLSettings.executeQuery(string.Format("UPDATE {0} SET Canceled = 'S', Posted = 'E', IntegrationStatus = 'E', IntegrationMessage = \"{1}\" WHERE Id = '{2}'", strMySQLTable, GlobalVariable.strErrMsg.Replace("\\", "").Replace("\"", "'"), strId));

                                EndCompanyTransaction(BoWfTransOpt.wf_Commit);
                            }

                        }

                        else
                        {
                            // Get DataSet from Stored Procedure
                            DataSet dsBusinessObject = SQLSettings.getDataFromMySQL(string.Format(" CALL FTSI_IMPORT_AR_CREDIT_MEMO('{0}', '{1}')", strId, strDocType));

                            // Rename DataTables
                            // NOTE: Make sure to rename DataTable because the names will be used as TAGS in XML file.
                            dsBusinessObject.Tables[0].TableName = "ORIN";
                            dsBusinessObject.Tables[1].TableName = "RIN1";
                            dsBusinessObject.Tables[2].TableName = "RIN5";

                            // Process XML File
                            strXmlPath = GenerateFilePath(dsBusinessObject.Tables["ORIN"].Rows[0]["U_RefNum"].ToString());
                            XMLGenerator.GenerateXMLFile(GlobalVariable.oObjectType, dsBusinessObject, strXmlPath);


                            // Start Import Process
                            StartCompanyTransaction();

                            if (ImportDocumentsXML.importTempXMLDocument(strXmlPath, strId))
                            {
                                // Get Posted DocEntry and DocNum
                                strPostDocEntry = GlobalVariable.oCompany.GetNewObjectKey().ToString();
                                strPostDocNum = GlobalFunction.getDocNum(GlobalVariable.intObjType, strPostDocEntry);

                                // Output to Integration Log
                                SystemFunction.transHandler("Import", strTransType, GlobalVariable.intObjType.ToString(), Path.GetFileName(strXmlPath), strPostDocEntry, strPostDocNum, dteStart, "S", GlobalVariable.intObjType.ToString(), string.Format("Successfully Posted {0}", strTransType));

                                // Update Staging DB
                                SQLSettings.executeQuery(string.Format("UPDATE {0} SET Posted = 'Y', IntegrationStatus = 'S', DocNum = {1} , IntegrationMessage = \"Successfully Posted\" WHERE Id = '{2}'", strMySQLTable, strPostDocNum, strId));

                                EndCompanyTransaction(BoWfTransOpt.wf_Commit);
                            }
                            else
                            {
                                // Output to Integration Log
                                SystemFunction.transHandler("Import", strTransType, GlobalVariable.intObjType.ToString(), Path.GetFileName(strXmlPath), "", "", dteStart, "E", "-" + GlobalVariable.intObjType.ToString(), string.Format("Error Posting SAP Business Object: {0}", GlobalVariable.strErrMsg.Replace("\\", "").Replace("\"", "'")));

                                // Update Staging DB
                                SQLSettings.executeQuery(string.Format("UPDATE {0} SET Posted = 'E', IntegrationStatus = 'E', IntegrationMessage = \"{1}\" WHERE Id = '{2}'", strMySQLTable, GlobalVariable.strErrMsg.Replace("\\", "").Replace("\"", "'"), strId));

                                EndCompanyTransaction(BoWfTransOpt.wf_RollBack);
                            }

                        }
                        


                       
                    }
                    catch (Exception ex)
                    {
                        GlobalVariable.intErrNum = -111;
                        GlobalVariable.strErrMsg = string.Format("Error Processing Import. {0}", ex.Message.ToString());

                        SystemFunction.transHandler("Import", strTransType, GlobalVariable.intObjType.ToString(), Path.GetFileName(strXmlPath), "", strU_RefNum, dteStart, "E", GlobalVariable.intErrNum.ToString(), GlobalVariable.strErrMsg);

                        GC.Collect();

                        EndCompanyTransaction(BoWfTransOpt.wf_RollBack);
                    }
                }
            }
            catch (Exception ex)
            {
                GlobalVariable.intErrNum = -111;
                GlobalVariable.strErrMsg = string.Format("Error Processing Import. {0}", ex.Message.ToString());

                SystemFunction.transHandler("Import", strTransType, GlobalVariable.intObjType.ToString(), Path.GetFileName(strXmlPath), strId, strU_RefNum, dteStart, "E", GlobalVariable.intErrNum.ToString(), GlobalVariable.strErrMsg);

                GC.Collect();

                EndCompanyTransaction(BoWfTransOpt.wf_RollBack);
            }
        }

        private static void StartCompanyTransaction()
        {
            if (!(GlobalVariable.oCompany.InTransaction))
                GlobalVariable.oCompany.StartTransaction();
        }

        private static void EndCompanyTransaction(BoWfTransOpt transOpt)
        {
            if (GlobalVariable.oCompany.InTransaction)
                GlobalVariable.oCompany.EndTransaction(transOpt);
        }

        private static string GenerateFilePath(string strRefNum)
        {
            return GlobalVariable.strTempPath + string.Format("{0}_DOC_{1}_{2}_{3}_1.xml", GlobalVariable.strCompany, GlobalVariable.strTableHeader, GlobalVariable.intObjType, strRefNum, DateTime.Today.ToString("MMddyyyy"));
        }
    }
}
