using MySql.Data.MySqlClient;
using SAPbobsCOM;
using System;
using System.Data;
using System.IO;

namespace FTSISAPB1iService
{
    public class ImportJornalEntry
    {
        private static DateTime dteStart;
        private static string strTransType;
        private static string strSapDocNum;

        public static void _ImportJornalEntry()
        {
            string strId = string.Empty;
            string strU_RefNum = string.Empty;
            string strDocType = string.Empty;
            string strXmlPath = string.Empty;
            string strPostDocEntry, strPostDocNum;
            string strMySQLTable;

            try
            {
                dteStart = DateTime.Now;

                // Initialize Object Type.
                GlobalFunction.getObjType(30);
                strTransType = "Journal Entry - " + GlobalVariable.strDocType;

                // Get All data for processing using Stored Procedure
                DataSet dsProcessData = SQLSettings.getDataFromMySQL(string.Format("CALL FTSI_IMPORT_GET_PROCESS_DATA({0})", GlobalVariable.intObjType));

                // Run process for each row
                foreach (DataRow oDataRow in dsProcessData.Tables[0].Rows)
                {
                    strId = oDataRow["Id"].ToString();
                    //strU_xWTVendor = oDataRow["U_xWTVendor"].ToString();
                    //strU_xSupplierName = oDataRow["U_xSupplierName"].ToString();
                    strPostDocNum = oDataRow["U_DocNum"].ToString();
                    strMySQLTable = oDataRow["MySQLTable"].ToString();

                    try
                    {
                        //Check if Business Partner is existing
                        DataSet dsftjdt1 = SQLSettings.getDataFromMySQL(string.Format("CALL FTSI_CHECK_BP('{0}')", strId));

                        foreach (DataRow oftjdt1Row in dsftjdt1.Tables[0].Rows)
                        {
                            string cardCode = oftjdt1Row["U_xWTVendor"].ToString();
                            string cardName = oftjdt1Row["U_xSupplierName"].ToString();
                            string cardType = oftjdt1Row["U_xCardType"].ToString();
                            string uAddress = oftjdt1Row["U_Address"].ToString();
                            string licTradNum = oftjdt1Row["LicTradNum"].ToString();
                            string groupNum = oftjdt1Row["GroupNum"].ToString();
                            string wtLiable = oftjdt1Row["WTLiable"].ToString();
                            string email = oftjdt1Row["E_Mail"].ToString();
                            string phone = oftjdt1Row["Phone1"].ToString();
                            string contactPerson = oftjdt1Row["CntctPrsn"].ToString();

                            StartCompanyTransaction();

                            SAPbobsCOM.BusinessPartners oBusinessPartner;

                            oBusinessPartner = null;
                            oBusinessPartner = (SAPbobsCOM.BusinessPartners)GlobalVariable.oCompany.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oBusinessPartners);

                            oBusinessPartner.CardCode = cardCode;
                            oBusinessPartner.CardName = cardCode;
                            oBusinessPartner.Address = uAddress;
                            oBusinessPartner.FederalTaxID = licTradNum;

                            if (cardType == "C")
                            {
                                oBusinessPartner.CardType = SAPbobsCOM.BoCardTypes.cCustomer;
                            }
                            else if (cardType == "S")
                            {
                                oBusinessPartner.CardType = SAPbobsCOM.BoCardTypes.cSupplier;
                            }
                            oBusinessPartner.PayTermsGrpCode = int.Parse(groupNum);

                            if (wtLiable == "Y")
                            {
                                oBusinessPartner.SubjectToWithholdingTax = BoYesNoNoneEnum.boYES;
                            }
                            else if (wtLiable == "N")
                            {
                                oBusinessPartner.SubjectToWithholdingTax = BoYesNoNoneEnum.boNO;
                            }
                            oBusinessPartner.EmailAddress = email;
                            oBusinessPartner.Phone1 = phone;
                            oBusinessPartner.ContactPerson = contactPerson;
                            if (oBusinessPartner.GetByKey(cardCode))
                            {
                                if (oBusinessPartner.Update() != 0)
                                {
                                    SystemFunction.transHandler("Import", "Business Partner - 2", "2", Path.GetFileName(strXmlPath), "", "", dteStart, "E", "-" + "2", "Error Posting SAP Business Object");
                                }
                                else
                                {
                                    // Output to Integration Log
                                    SystemFunction.transHandler("Import", "Business Partner - 2", "2", Path.GetFileName(strXmlPath), "", "", dteStart, "S", "2", string.Format("Successfully Updating Business Partner {0}", "Business Partner - 2"));
                                   
                                }

                                EndCompanyTransaction(BoWfTransOpt.wf_Commit);
                            }
                            else
                            {
                                
                                if (oBusinessPartner.Add() != 0)
                                {
                                    SystemFunction.transHandler("Import", "Business Partner - 2", "2", Path.GetFileName(strXmlPath), "", "", dteStart, "E", "-" + "2", "Error Posting SAP Business Object");
                                }
                                else
                                {
                                    // Output to Integration Log
                                    SystemFunction.transHandler("Import", "Business Partner - 2", "2", Path.GetFileName(strXmlPath), "", "", dteStart, "S", "2", string.Format("Successfully Adding Business Partner {0}", "Business Partner - 2"));
                                    
                                }

                                EndCompanyTransaction(BoWfTransOpt.wf_Commit);
                            }

                        }

                        // Get Document Header and Line Details
                        DataSet dsBusinessObject = SQLSettings.getDataFromMySQL(string.Format("CALL FTSI_IMPORT_JOURNAL_ENTRY('{0}')", strId));

                        // Rename DataTables.
                        // NOTE: Make sure to rename DataTable because the names will be used as TAGS in XML file.
                        dsBusinessObject.Tables[0].TableName = "OJDT";
                        dsBusinessObject.Tables[1].TableName = "JDT1";

                        // Process XML File Creation
                        strXmlPath = GenerateFilePath(dsBusinessObject.Tables["OJDT"].Rows[0]["U_RefNum"].ToString());
                        XMLGenerator.GenerateXMLFile(GlobalVariable.oObjectType, dsBusinessObject, strXmlPath);


                        // Start XML Import
                        StartCompanyTransaction();

                        if (ImportDocumentsXML.importJournalEntryXMLDocument(strXmlPath, strId))
                        {
                            // Get Posted DocEntry and DocNum
                            //strPostDocEntry = GlobalVariable.oCompany.GetNewObjectKey().ToString();
                            //strPostDocNum = GlobalFunction.getDocNum(GlobalVariable.intObjType, strPostDocEntry);
                            // Output to Integration Log
                            SystemFunction.transHandler("Import", strTransType, GlobalVariable.intObjType.ToString(), Path.GetFileName(strXmlPath), "", strPostDocNum, dteStart, "S", GlobalVariable.intObjType.ToString(), string.Format("Successfully Posted {0}", strTransType));

                            // Update Staging DB 
                            SQLSettings.executeQuery(string.Format("UPDATE {0} SET IntegrationStatus = 'S' ,  IntegrationMessage = \"Successfully Posted\" WHERE Id = '{1}'", strMySQLTable, strId));

                            EndCompanyTransaction(BoWfTransOpt.wf_Commit);
                        }
                        else
                        {
                            // Output to Integration Log
                            // -- to be fill, docNum and docEntry
                            SystemFunction.transHandler("Import", strTransType, GlobalVariable.intObjType.ToString(), Path.GetFileName(strXmlPath), "", strPostDocNum, dteStart, "E", "-" + GlobalVariable.intObjType.ToString(), string.Format("Error Posting SAP Business Object: {0}", GlobalVariable.strErrMsg.Replace("\\", "").Replace("\"", "'")));

                            // Update Staging DB
                            SQLSettings.executeQuery(string.Format("UPDATE {0} SET IntegrationStatus = 'E', IntegrationMessage = \"{1}\" WHERE Id = '{2}'", strMySQLTable, GlobalVariable.strErrMsg.Replace("\\", "").Replace("\"", "'"), strId));

                            EndCompanyTransaction(BoWfTransOpt.wf_RollBack);
                        }
                    }

                    catch (Exception ex)
                    {
                        GlobalVariable.intErrNum = -111;
                        GlobalVariable.strErrMsg = string.Format("Error Processing Import. {0}", ex.Message.ToString());

                        SystemFunction.transHandler("Import", strTransType, GlobalVariable.intObjType.ToString(), Path.GetFileName(strXmlPath), "", strU_RefNum, dteStart, "E", GlobalVariable.intErrNum.ToString(), GlobalVariable.strErrMsg);

                        // Update Staging DB
                        SQLSettings.executeQuery(string.Format("UPDATE {0} SET IntegrationStatus = 'E', IntegrationMessage = \"{1}\" WHERE Id = '{2}'", strMySQLTable, GlobalVariable.strErrMsg.Replace("\\", "").Replace("\"", "'"), strId));

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

