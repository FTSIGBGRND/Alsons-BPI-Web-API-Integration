using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FTSISAPB1iService
{
    public class ImportBusinessPartnerImportStatus
    {
        public static void _ImportBusinessPartnerImportStatuss()
        {
            string strMySQLRefNum = "", strMySQLStatus, strMySQLId;
            DateTime dtStart = DateTime.Now;
            string strTransactionType = "Business Partner";
            try
            {

                // Get Process Data from MYSQL
                DataSet oDataSet = SQLSettings.getDataFromMySQL("SELECT RefNum, Status, Id FROM ftbplog WHERE IFNULL(U_Posted, 'N') = 'N'");

                // For each row, update SAP 
                foreach (DataRow dataRow in oDataSet.Tables[0].Rows)
                {
                    strMySQLId = dataRow["ID"].ToString();
                    strMySQLRefNum = dataRow["RefNum"].ToString();
                    strMySQLStatus = dataRow["Status"].ToString();

                    if (SystemFunction.executeQuery(string.Format("UPDATE \"OCRD\" SET \"U_isExtract\" = '{0}' WHERE \"CardCode\" = '{1}'", strMySQLStatus, strMySQLRefNum)))
                    {
                        // Update MySQL
                        SQLSettings.executeQuery(string.Format("UPDATE ftbplog SET Posted = 'Y' WHERE Id = '{0}'", strMySQLId));
                    }
                    else
                    {
                        // Error Message to Integration Logs
                        GlobalVariable.intErrNum = -2;
                        GlobalVariable.strErrMsg = string.Format("Error Updating Business Partner Extract Status");
                        SystemFunction.transHandler("Import", strTransactionType, "2", "", "", strMySQLRefNum, dtStart, "E", GlobalVariable.intErrNum.ToString(), GlobalVariable.strErrMsg);

                        // Update MySQL
                        SQLSettings.executeQuery(string.Format("UPDATE ftbplog SET Posted = 'E' WHERE Id = '{0}'", strMySQLId));
                    }
                }
            }
            catch (Exception ex)
            {
                GlobalVariable.intErrNum = -111;
                GlobalVariable.strErrMsg = string.Format("Error Updating Business Partner Extract Status. {0}", ex.Message);

                SystemFunction.transHandler("Import", strTransactionType, "2", "", "", strMySQLRefNum, dtStart, "E", GlobalVariable.intErrNum.ToString(), GlobalVariable.strErrMsg);
            }

        }
    }
}
