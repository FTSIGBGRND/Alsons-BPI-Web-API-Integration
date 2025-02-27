using System;
using System.IO;

namespace FTSISAPB1iService
{
    class SystemInitialization
    {
        public static bool initTables()
        {

            /******************************* TOUCH ME NOT PLEASE *****************************************************/

            if (SystemFunction.createUDT("FTISL", "FT Integration Service Log", SAPbobsCOM.BoUTBTableType.bott_NoObject) == false)
                return false;

            if (SystemFunction.createUDT("FTISS", "FT Integration Service SetUp", SAPbobsCOM.BoUTBTableType.bott_NoObject) == false)
                return false;

            /****************************** UNTIL HERE - THANK YOU ***************************************************/

            return true;
        }
        public static bool initFields()
        {

            /******************************* TOUCH ME NOT PLEASE *****************************************************/

            #region "FRAMEWORK UDF"

            /************************** MARKETING DOCUMENTS ****************************************************************/

            if (SystemFunction.isUDFexists("OINV", "isExtract") == false)
                if (SystemFunction.createUDF("OINV", "isExtract", "Extracted", SAPbobsCOM.BoFieldTypes.db_Alpha, 1, "N", "N - No, E - Error, S - Success", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OINV", "FileName") == false)
                if (SystemFunction.createUDF("OINV", "FileName", "FileName", SAPbobsCOM.BoFieldTypes.db_Alpha, 100, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OINV", "RefNum") == false)
                if (SystemFunction.createUDF("OINV", "RefNum", "Reference Number", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("INV1", "RefNum") == false)
                if (SystemFunction.createUDF("INV1", "RefNum", "Reference Number", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("INV1", "BaseLine") == false)
                if (SystemFunction.createUDF("INV1", "BaseLine", "Base Line", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("INV1", "BaseRef") == false)
                if (SystemFunction.createUDF("INV1", "BaseRef", "Base Reference", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("INV1", "BaseType") == false)
                if (SystemFunction.createUDF("INV1", "BaseType", "Base Type", SAPbobsCOM.BoFieldTypes.db_Alpha, 30, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("INV3", "RefNum") == false)
                if (SystemFunction.createUDF("INV3", "RefNum", "Reference Number", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("INV3", "BaseLine") == false)
                if (SystemFunction.createUDF("INV3", "BaseLine", "Base Line", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("INV3", "BaseRef") == false)
                if (SystemFunction.createUDF("INV3", "BaseRef", "Base Reference", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("INV3", "BaseType") == false)
                if (SystemFunction.createUDF("INV3", "BaseType", "Base Type", SAPbobsCOM.BoFieldTypes.db_Alpha, 30, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("INV5", "RefNum") == false)
                if (SystemFunction.createUDF("INV5", "RefNum", "Reference Number", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            /************************** ITEM MASTER DATA ***************************************************************/

            if (SystemFunction.isUDFexists("OITM", "isExtract") == false)
                if (SystemFunction.createUDF("OITM", "isExtract", "Extracted", SAPbobsCOM.BoFieldTypes.db_Alpha, 1, "N", "N - No, E - Error, S - Success", "") == false)
                    return false;


            if (SystemFunction.isUDFexists("OITM", "RefCode") == false)
                if (SystemFunction.createUDF("OITM", "RefCode", "Reference Code", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            /************************** BUSINESS PARTNER DATA **********************************************************/

            if (SystemFunction.isUDFexists("OCRD", "isExtract") == false)
                if (SystemFunction.createUDF("OCRD", "isExtract", "Extracted", SAPbobsCOM.BoFieldTypes.db_Alpha, 1, "N", "N - No, E - Error, S - Success", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "RefCode") == false)
                if (SystemFunction.createUDF("OCRD", "RefCode", "Reference Code", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;


            /************************** INCOMING PAYMENT **********************************************************/

            if (SystemFunction.isUDFexists("ORCT", "isExtract") == false)
                if (SystemFunction.createUDF("ORCT", "isExtract", "Extracted", SAPbobsCOM.BoFieldTypes.db_Alpha, 1, "N", "N - No, E - Error, S - Success", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("ORCT", "RefNum") == false)
                if (SystemFunction.createUDF("ORCT", "RefNum", "Reference Number", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("ORCT", "FileName") == false)
                if (SystemFunction.createUDF("ORCT", "FileName", "FileName", SAPbobsCOM.BoFieldTypes.db_Alpha, 100, "", "", "") == false)
                    return false;

            /************************** ADMINISTRATION ****************************************************************/

            if (SystemFunction.isUDFexists("OUSR", "IntMsg") == false)
                if (SystemFunction.createUDF("OUSR", "IntMsg", "Integration Message", SAPbobsCOM.BoFieldTypes.db_Alpha, 1, "N", "N - No, Y - Yes", "") == false)
                    return false;

            #endregion

            /****************************** UNTIL HERE - THANK YOU ***************************************************/

            #region AP CREDIT MEMO

            if (SystemFunction.isUDFexists("ORPC", "Id") == false)
                if (SystemFunction.createUDF("ORPC", "Id", "Id", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("ORPC", "FileName") == false)
                if (SystemFunction.createUDF("ORPC", "FileName", "FileName", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("ORPC", "RefNum") == false)
                if (SystemFunction.createUDF("ORPC", "RefNum", "RefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("RPC1", "RefNum") == false)
                if (SystemFunction.createUDF("RPC1", "RefNum", "RefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("RPC1", "BaseRef") == false)
                if (SystemFunction.createUDF("RPC1", "BaseRef", "BaseRef", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("RPC1", "BaseType") == false)
                if (SystemFunction.createUDF("RPC1", "BaseType", "BaseType", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("RPC1", "BaseLine") == false)
                if (SystemFunction.createUDF("RPC1", "BaseLine", "BaseLine", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("RPC1", "LngDscrptn") == false)
                if (SystemFunction.createUDF("RPC1", "LngDscrptn", "LngDscrptn", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("RPC5", "RefNum") == false)
                if (SystemFunction.createUDF("RPC5", "RefNum", "RefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            #endregion

            #region AP INVOICE

            if (SystemFunction.isUDFexists("OPCH", "Id") == false)
                if (SystemFunction.createUDF("OPCH", "Id", "Id", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OPCH", "FileName") == false)
                if (SystemFunction.createUDF("OPCH", "FileName", "FileName", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OPCH", "RefNum") == false)
                if (SystemFunction.createUDF("OPCH", "RefNum", "RefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("PCH1", "RefNum") == false)
                if (SystemFunction.createUDF("PCH1", "RefNum", "RefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("PCH1", "BaseRef") == false)
                if (SystemFunction.createUDF("PCH1", "BaseRef", "BaseRef", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("PCH1", "BaseType") == false)
                if (SystemFunction.createUDF("PCH1", "BaseType", "BaseType", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("PCH1", "BaseLine") == false)
                if (SystemFunction.createUDF("PCH1", "BaseLine", "BaseLine", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("PCH1", "LngDscrptn") == false)
                if (SystemFunction.createUDF("PCH1", "LngDscrptn", "LngDscrptn", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("PCH5", "RefNum") == false)
                if (SystemFunction.createUDF("PCH5", "RefNum", "RefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            #endregion

            #region AR INVOICE

            if (SystemFunction.isUDFexists("OINV", "Id") == false)
                if (SystemFunction.createUDF("OINV", "Id", "Id", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("INV1", "LngDscrptn") == false)
                if (SystemFunction.createUDF("INV1", "LngDscrptn", "LngDscrptn", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("INV1", "Period") == false)
                if (SystemFunction.createUDF("INV1", "Period", "Period", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("INV9", "RefNum") == false)
                if (SystemFunction.createUDF("INV9", "RefNum", "Reference Number", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            #endregion

            #region AR DOWNPAYMENT

            if (SystemFunction.isUDFexists("ODPI", "Id") == false)
                if (SystemFunction.createUDF("ODPI", "Id", "Id", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("ODPI", "RefNum") == false)
                if (SystemFunction.createUDF("ODPI", "RefNum", "RefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("ODPI", "FileName") == false)
                if (SystemFunction.createUDF("ODPI", "FileName", "FileName", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("DPI1", "RefNum") == false)
                if (SystemFunction.createUDF("DPI1", "RefNum", "RefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("DPI1", "BaseRef") == false)
                if (SystemFunction.createUDF("DPI1", "BaseRef", "BaseRef", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("DPI1", "BaseType") == false)
                if (SystemFunction.createUDF("DPI1", "BaseType", "BaseType", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("DPI1", "BaseLine") == false)
                if (SystemFunction.createUDF("DPI1", "BaseLine", "BaseLine", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("DPI1", "LngDscrptn") == false)
                if (SystemFunction.createUDF("DPI1", "LngDscrptn", "LngDscrptn", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("DPI1", "Period") == false)
                if (SystemFunction.createUDF("DPI1", "Period", "Period", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("DPI5", "RefNum") == false)
                if (SystemFunction.createUDF("DPI5", "RefNum", "RefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            #endregion

            #region AR CREDIT MEMO

            if (SystemFunction.isUDFexists("ORIN", "Id") == false)
                if (SystemFunction.createUDF("ORIN", "Id", "Id", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("ORIN", "RefNum") == false)
                if (SystemFunction.createUDF("ORIN", "RefNum", "RefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("ORIN", "FileName") == false)
                if (SystemFunction.createUDF("ORIN", "FileName", "FileName", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("RIN1", "RefNum") == false)
                if (SystemFunction.createUDF("RIN1", "RefNum", "RefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("RIN1", "BaseRef") == false)
                if (SystemFunction.createUDF("RIN1", "BaseRef", "BaseRef", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("RIN1", "BaseType") == false)
                if (SystemFunction.createUDF("RIN1", "BaseType", "BaseType", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("RIN1", "BaseLine") == false)
                if (SystemFunction.createUDF("RIN1", "BaseLine", "BaseLine", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("RIN1", "LngDscrptn") == false)
                if (SystemFunction.createUDF("RIN1", "LngDscrptn", "LngDscrptn", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("RIN1", "Period") == false)
                if (SystemFunction.createUDF("RIN1", "Period", "Period", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("RIN5", "RefNum") == false)
                if (SystemFunction.createUDF("RIN5", "RefNum", "RefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("RIN5", "BaseRef") == false)
                if (SystemFunction.createUDF("RIN5", "BaseRef", "BaseRef", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("RIN5", "BaseType") == false)
                if (SystemFunction.createUDF("RIN5", "BaseType", "BaseType", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("RIN5", "BaseLine") == false)
                if (SystemFunction.createUDF("RIN5", "BaseLine", "BaseLine", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            #endregion

            #region INCOMING PAYMENT

            if (SystemFunction.isUDFexists("ORCT", "Id") == false)
                if (SystemFunction.createUDF("ORCT", "Id", "Id", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("ORCT", "RefNum") == false)
                if (SystemFunction.createUDF("ORCT", "RefNum", "RefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("ORCT", "FileName") == false)
                if (SystemFunction.createUDF("ORCT", "FileName", "FileName", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("RCT2", "InvRefNum") == false)
                if (SystemFunction.createUDF("RCT2", "InvRefNum", "InvRefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;



            #endregion

            #region BUSINESS PARTNER DATA

            if (SystemFunction.isUDFexists("OCRD", "Id") == false)
                if (SystemFunction.createUDF("OCRD", "Id", "Id", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "CstmNmSrch") == false)
                if (SystemFunction.createUDF("OCRD", "CstmNmSrch", "CstmNmSrch", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "CstmrCtgry") == false)
                if (SystemFunction.createUDF("OCRD", "CstmrCtgry", "CstmrCtgry", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "CstmrCdHQ") == false)
                if (SystemFunction.createUDF("OCRD", "CstmrCdHQ", "CstmrCdHQ", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "CutmrNtr") == false)
                if (SystemFunction.createUDF("OCRD", "CutmrNtr", "CutmrNtr", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "PsicPsoc") == false)
                if (SystemFunction.createUDF("OCRD", "PsicPsoc", "PsicPsoc", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "CrdtRtng") == false)
                if (SystemFunction.createUDF("OCRD", "CrdtRtng", "CrdtRtng", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "CrdRtUp") == false)
                if (SystemFunction.createUDF("OCRD", "CrdRtUp", "CrdRtUp", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "CrdtRtDtl") == false)
                if (SystemFunction.createUDF("OCRD", "CrdtRtDtl", "CrdtRtDtl", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "CrdtCtgry") == false)
                if (SystemFunction.createUDF("OCRD", "CrdtCtgry", "CrdtCtgry", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "VndrPrgrm") == false)
                if (SystemFunction.createUDF("OCRD", "VndrPrgrm", "VndrPrgrm", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "GrgCtgry") == false)
                if (SystemFunction.createUDF("OCRD", "GrgCtgry", "GrgCtgry", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "EqtyRt") == false)
                if (SystemFunction.createUDF("OCRD", "EqtyRt", "EqtyRt", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "OpePrd") == false)
                if (SystemFunction.createUDF("OCRD", "OpePrd", "OpePrd", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "ExpsrLmt") == false)
                if (SystemFunction.createUDF("OCRD", "ExpsrLmt", "ExpsrLmt", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "IDCrdAdd") == false)
                if (SystemFunction.createUDF("OCRD", "IDCrdAdd", "IDCrdAdd", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "MrtlStatus") == false)
                if (SystemFunction.createUDF("OCRD", "MrtlStatus", "MrtlStatus", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "Emplymnt") == false)
                if (SystemFunction.createUDF("OCRD", "Emplymnt", "Emplymnt", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "PrtsCmpyCd") == false)
                if (SystemFunction.createUDF("OCRD", "PrtsCmpyCd", "PrtsCmpyCd", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "PrtsCmpyNm") == false)
                if (SystemFunction.createUDF("OCRD", "PrtsCmpyNm", "PrtsCmpyNm", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "OrgnlGrpCd") == false)
                if (SystemFunction.createUDF("OCRD", "OrgnlGrpCd", "OrgnlGrpCd", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "OrgnlGrpNm") == false)
                if (SystemFunction.createUDF("OCRD", "OrgnlGrpNm", "OrgnlGrpNm", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "InvRtio") == false)
                if (SystemFunction.createUDF("OCRD", "InvRtio", "InvRtio", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "IntrdcrCd") == false)
                if (SystemFunction.createUDF("OCRD", "IntrdcrCd", "IntrdcrCd", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "IntrdcrNm") == false)
                if (SystemFunction.createUDF("OCRD", "IntrdcrNm", "IntrdcrNm", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "GrntrCd") == false)
                if (SystemFunction.createUDF("OCRD", "GrntrCd", "GrntrCd", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "AssetSize") == false)
                if (SystemFunction.createUDF("OCRD", "AssetSize", "AssetSize", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "TcCRR") == false)
                if (SystemFunction.createUDF("OCRD", "TcCRR", "TcCRR", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "PostCode") == false)
                if (SystemFunction.createUDF("OCRD", "PostCode", "PostCode", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "PrfssnType") == false)
                if (SystemFunction.createUDF("OCRD", "PrfssnType", "PrfssnType", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "Privies") == false)
                if (SystemFunction.createUDF("OCRD", "Privies", "Privies", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "FsclMnth") == false)
                if (SystemFunction.createUDF("OCRD", "FsclMnth", "FsclMnth", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "RgstrdCptl") == false)
                if (SystemFunction.createUDF("OCRD", "RgstrdCptl", "RgstrdCptl", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "EsblsmntDt") == false)
                if (SystemFunction.createUDF("OCRD", "EsblsmntDt", "EsblsmntDt", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "MngmntYrs") == false)
                if (SystemFunction.createUDF("OCRD", "MngmntYrs", "MngmntYrs", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "HeadCount") == false)
                if (SystemFunction.createUDF("OCRD", "HeadCount", "HeadCount", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "Credibility") == false)
                if (SystemFunction.createUDF("OCRD", "Credibility", "Credibility", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "RiskConcern") == false)
                if (SystemFunction.createUDF("OCRD", "RiskConcern", "RiskConcern", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "CstmerVst") == false)
                if (SystemFunction.createUDF("OCRD", "CstmerVst", "CstmerVst", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "WhtRcvd") == false)
                if (SystemFunction.createUDF("OCRD", "WhtRcvd", "WhtRcvd", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "SlsPicFl") == false)
                if (SystemFunction.createUDF("OCRD", "SlsPicFl", "SlsPicFl", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "SlsPicOI") == false)
                if (SystemFunction.createUDF("OCRD", "SlsPicOI", "SlsPicOI", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "SlsMngr9") == false)
                if (SystemFunction.createUDF("OCRD", "SlsMngr9", "SlsMngr9", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "SlsMngr10") == false)
                if (SystemFunction.createUDF("OCRD", "SlsMngr10", "SlsMngr10", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "CrdtAnlyst") == false)
                if (SystemFunction.createUDF("OCRD", "CrdtAnlyst", "CrdtAnlyst", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "HoldingCR") == false)
                if (SystemFunction.createUDF("OCRD", "HoldingCR", "HoldingCR", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "InCbnt") == false)
                if (SystemFunction.createUDF("OCRD", "InCbnt", "InCbnt", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "BzLink") == false)
                if (SystemFunction.createUDF("OCRD", "BzLink", "BzLink", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "DueDate") == false)
                if (SystemFunction.createUDF("OCRD", "DueDate", "DueDate", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "InvDvncDt") == false)
                if (SystemFunction.createUDF("OCRD", "InvDvncDt", "InvDvncDt", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "InvoicePIC") == false)
                if (SystemFunction.createUDF("OCRD", "InvoicePIC", "InvoicePIC", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "IBllngPic") == false)
                if (SystemFunction.createUDF("OCRD", "IBllngPic", "IBllngPic", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "SndngMthd") == false)
                if (SystemFunction.createUDF("OCRD", "SndngMthd", "SndngMthd", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "DescriptionPtn") == false)
                if (SystemFunction.createUDF("OCRD", "DescriptionPtn", "DescriptionPtn", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "ReceiptDsp") == false)
                if (SystemFunction.createUDF("OCRD", "ReceiptDsp", "ReceiptDsp", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "BranchID") == false)
                if (SystemFunction.createUDF("OCRD", "BranchID", "BranchID", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "BranchName") == false)
                if (SystemFunction.createUDF("OCRD", "BranchName", "BranchName", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "OffclCtgry") == false)
                if (SystemFunction.createUDF("OCRD", "OffclCtgry", "OffclCtgry", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "GrntLttrDt") == false)
                if (SystemFunction.createUDF("OCRD", "GrntLttrDt", "GrntLttrDt", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "AgrAcvtyCd") == false)
                if (SystemFunction.createUDF("OCRD", "AgrAcvtyCd", "AgrAcvtyCd", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "EcAcvtyCd") == false)
                if (SystemFunction.createUDF("OCRD", "EcAcvtyCd", "EcAcvtyCd", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "InvPrntPtrn") == false)
                if (SystemFunction.createUDF("OCRD", "InvPrntPtrn", "InvPrntPtrn", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "CreditTerm") == false)
                if (SystemFunction.createUDF("OCRD", "CreditTerm", "CreditTerm", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "RefNum") == false)
                if (SystemFunction.createUDF("OCRD", "RefNum", "RefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCPR", "NameLocal") == false)
                if (SystemFunction.createUDF("OCPR", "NameLocal", "NameLocal", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCPR", "Email3") == false)
                if (SystemFunction.createUDF("OCPR", "Email3", "Email3", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCPR", "RefNum") == false)
                if (SystemFunction.createUDF("OCPR", "RefNum", "RefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCPR", "Id") == false)
                if (SystemFunction.createUDF("OCPR", "Id", "Id", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("CRD1", "BranchID") == false)
                if (SystemFunction.createUDF("CRD1", "BranchID", "BranchID", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("CRD1", "BranchName") == false)
                if (SystemFunction.createUDF("CRD1", "BranchName", "BranchName", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("CRD1", "LngAddrs1") == false)
                if (SystemFunction.createUDF("CRD1", "LngAddrs1", "LngAddrs1", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("CRD1", "LngAddrs2") == false)
                if (SystemFunction.createUDF("CRD1", "LngAddrs2", "LngAddrs2", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("CRD1", "RefNum") == false)
                if (SystemFunction.createUDF("CRD1", "RefNum", "RefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            #endregion

            #region FIXED ASSET

            if (SystemFunction.isUDFexists("OITM", "Id") == false)
                if (SystemFunction.createUDF("OITM", "Id", "Id", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "RefNum") == false)
                if (SystemFunction.createUDF("OITM", "RefNum", "Reference Number", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "SalesAg") == false)
                if (SystemFunction.createUDF("OITM", "SalesAg", "Sales Agreement No.", SAPbobsCOM.BoFieldTypes.db_Alpha, 30, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "AssetAcct") == false)
                if (SystemFunction.createUDF("OITM", "AssetAcct", "Asset Cust Account No.", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "Maker") == false)
                if (SystemFunction.createUDF("OITM", "Maker", "Asset Maker", SAPbobsCOM.BoFieldTypes.db_Alpha, 100, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "Model") == false)
                if (SystemFunction.createUDF("OITM", "Model", "Asset Model", SAPbobsCOM.BoFieldTypes.db_Alpha, 100, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "ModYear") == false)
                if (SystemFunction.createUDF("OITM", "ModYear", "Model Year", SAPbobsCOM.BoFieldTypes.db_Alpha, 10, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "Serial") == false)
                if (SystemFunction.createUDF("OITM", "Serial", "Serial", SAPbobsCOM.BoFieldTypes.db_Alpha, 30, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "GDate") == false)
                if (SystemFunction.createUDF("OITM", "GDate", "Guaranteed Date", SAPbobsCOM.BoFieldTypes.db_Alpha, 10, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "Chasis") == false)
                if (SystemFunction.createUDF("OITM", "Chasis", "Asset IVZ Chasis No", SAPbobsCOM.BoFieldTypes.db_Alpha, 254, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "Engine") == false)
                if (SystemFunction.createUDF("OITM", "Engine", "Asset IVZ Engine No", SAPbobsCOM.BoFieldTypes.db_Alpha, 254, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "Color") == false)
                if (SystemFunction.createUDF("OITM", "Color", "Asset IVZ Car Color", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "EquipID") == false)
                if (SystemFunction.createUDF("OITM", "EquipID", "Asset IVZ Equipment ID", SAPbobsCOM.BoFieldTypes.db_Alpha, 10, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "LMADate") == false)
                if (SystemFunction.createUDF("OITM", "LMADate", "Asset Last MA Date", SAPbobsCOM.BoFieldTypes.db_Alpha, 10, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "NMADate") == false)
                if (SystemFunction.createUDF("OITM", "NMADate", "Asset Next MA Date", SAPbobsCOM.BoFieldTypes.db_Alpha, 10, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "AssInfo1") == false)
                if (SystemFunction.createUDF("OITM", "AssInfo1", "Asset Info 1", SAPbobsCOM.BoFieldTypes.db_Alpha, 254, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "AssInfo2") == false)
                if (SystemFunction.createUDF("OITM", "AssInfo2", "Asset Info 2", SAPbobsCOM.BoFieldTypes.db_Alpha, 254, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "AssInfo3") == false)
                if (SystemFunction.createUDF("OITM", "AssInfo3", "Asset Info 3", SAPbobsCOM.BoFieldTypes.db_Alpha, 254, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "AssLoc") == false)
                if (SystemFunction.createUDF("OITM", "AssLoc", "Asset Location", SAPbobsCOM.BoFieldTypes.db_Alpha, 10, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "AssLocM") == false)
                if (SystemFunction.createUDF("OITM", "AssLocM", "Asset Location Memo", SAPbobsCOM.BoFieldTypes.db_Alpha, 254, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "AssRes") == false)
                if (SystemFunction.createUDF("OITM", "AssRes", "Asset Responsible", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OITM", "Contract") == false)
                if (SystemFunction.createUDF("OITM", "Contract", "Contract ID", SAPbobsCOM.BoFieldTypes.db_Alpha, 30, "", "", "") == false)
                    return false;

            #endregion

            #region JOURNAL ENTRY

            if (SystemFunction.isUDFexists("OJDT", "DocNum") == false)
                if (SystemFunction.createUDF("OJDT", "DocNum", "DocNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OJDT", "Id") == false)
                if (SystemFunction.createUDF("OJDT", "Id", "Id", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OJDT", "RefNum") == false)
                if (SystemFunction.createUDF("OJDT", "RefNum", "RefNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OJDT", "DocNum") == false)
                if (SystemFunction.createUDF("OJDT", "DocNum", "DocNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "InvDate") == false)
                if (SystemFunction.createUDF("JDT1", "InvDate", "InvDate", SAPbobsCOM.BoFieldTypes.db_Date, 10, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "InvNum") == false)
                if (SystemFunction.createUDF("JDT1", "InvNum", "InvNum", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "VATBase") == false)
                if (SystemFunction.createUDF("JDT1", "VATBase", "VATBase", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "TransType") == false)
                if (SystemFunction.createUDF("JDT1", "TransType", "TransType", SAPbobsCOM.BoFieldTypes.db_Alpha, 100, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "xWTCode") == false)
                if (SystemFunction.createUDF("JDT1", "xWTCode", "xWTCode", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "xWTVendor") == false)
                if (SystemFunction.createUDF("JDT1", "xWTVendor", "xWTVendor", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "xSupplierName") == false)
                if (SystemFunction.createUDF("JDT1", "xSupplierName", "xSupplierName", SAPbobsCOM.BoFieldTypes.db_Alpha, 100, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "xCardType") == false)
                if (SystemFunction.createUDF("JDT1", "xCardType", "xCardType", SAPbobsCOM.BoFieldTypes.db_Alpha, 100, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "Address") == false)
                if (SystemFunction.createUDF("JDT1", "Address", "Address", SAPbobsCOM.BoFieldTypes.db_Alpha, 200, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "TIN") == false)
                if (SystemFunction.createUDF("JDT1", "TIN", "TIN", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "TIN1") == false)
                if (SystemFunction.createUDF("JDT1", "TIN1", "TIN1", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "TIN2") == false)
                if (SystemFunction.createUDF("JDT1", "TIN2", "TIN2", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "TaxAmt") == false)
                if (SystemFunction.createUDF("JDT1", "TaxAmt", "TaxAmt", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "TaxableAmt") == false)
                if (SystemFunction.createUDF("JDT1", "TaxableAmt", "TaxableAmt", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "SrceDocNo") == false)
                if (SystemFunction.createUDF("JDT1", "SrceDocNo", "SrceDocNo", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "SOA") == false)
                if (SystemFunction.createUDF("JDT1", "SOA", "SOA", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "CheckNo") == false)
                if (SystemFunction.createUDF("JDT1", "CheckNo", "CheckNo", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "CheckDate") == false)
                if (SystemFunction.createUDF("JDT1", "CheckDate", "CheckDate", SAPbobsCOM.BoFieldTypes.db_Date, 10, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "APVNo") == false)
                if (SystemFunction.createUDF("JDT1", "APVNo", "APVNo", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "VSIRefNo") == false)
                if (SystemFunction.createUDF("JDT1", "VSIRefNo", "VSIRefNo", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("JDT1", "Contract") == false)
                if (SystemFunction.createUDF("JDT1", "Contract", "Contract", SAPbobsCOM.BoFieldTypes.db_Alpha, 50, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "xWTCode") == false)
                if (SystemFunction.createUDF("OCRD", "xWTCode", "xWTCode", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "xWTVendor") == false)
                if (SystemFunction.createUDF("OCRD", "xWTVendor", "xWTVendor", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "xSupplierName") == false)
                if (SystemFunction.createUDF("OCRD", "xSupplierName", "xSupplierName", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "xCardType") == false)
                if (SystemFunction.createUDF("OCRD", "xCardType", "xCardType", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "TIN") == false)
                if (SystemFunction.createUDF("OCRD", "TIN", "TIN", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "TIN1") == false)
                if (SystemFunction.createUDF("OCRD", "TIN1", "TIN1", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            if (SystemFunction.isUDFexists("OCRD", "TIN2") == false)
                if (SystemFunction.createUDF("OCRD", "TIN2", "TIN2", SAPbobsCOM.BoFieldTypes.db_Alpha, 20, "", "", "") == false)
                    return false;

            #endregion

            return true;
        }

        public static bool initUDO()
        {
            return true;
        }
        public static bool initFolders()
        {
            try
            {
                string strDate = DateTime.Today.ToString("MMddyyyy") + @"\";

                string strExp = @"Export\" + strDate;
                string strImp = @"Import\" + strDate;

                GlobalVariable.strErrLogPath = GlobalVariable.strFilePath + @"\Error Log";
                if (!Directory.Exists(GlobalVariable.strErrLogPath))
                    Directory.CreateDirectory(GlobalVariable.strErrLogPath);

                GlobalVariable.strSQLScriptPath = GlobalVariable.strFilePath + @"\SQL Scripts\";
                if (!Directory.Exists(GlobalVariable.strSQLScriptPath))
                    Directory.CreateDirectory(GlobalVariable.strSQLScriptPath);

                GlobalVariable.strSAPScriptPath = GlobalVariable.strFilePath + @"\SAP Scripts\";
                if (!Directory.Exists(GlobalVariable.strSAPScriptPath))
                    Directory.CreateDirectory(GlobalVariable.strSAPScriptPath);

                GlobalVariable.strExpSucPath = GlobalVariable.strFilePath + @"\Success Files\" + strExp;
                if (!Directory.Exists(GlobalVariable.strExpSucPath))
                    Directory.CreateDirectory(GlobalVariable.strExpSucPath);

                GlobalVariable.strExpErrPath = GlobalVariable.strFilePath + @"\Error Files\" + strExp;
                if (!Directory.Exists(GlobalVariable.strExpErrPath))
                    Directory.CreateDirectory(GlobalVariable.strExpErrPath);

                GlobalVariable.strImpSucPath = GlobalVariable.strFilePath + @"\Success Files\" + strImp;
                if (!Directory.Exists(GlobalVariable.strImpSucPath))
                    Directory.CreateDirectory(GlobalVariable.strImpSucPath);

                GlobalVariable.strImpErrPath = GlobalVariable.strFilePath + @"\Error Files\" + strImp;
                if (!Directory.Exists(GlobalVariable.strImpErrPath))
                    Directory.CreateDirectory(GlobalVariable.strImpErrPath);

                GlobalVariable.strImpPath = GlobalVariable.strFilePath + @"\Import Files\";
                if (!Directory.Exists(GlobalVariable.strImpPath))
                    Directory.CreateDirectory(GlobalVariable.strImpPath);

                GlobalVariable.strExpPath = GlobalVariable.strFilePath + @"\Export Files\";
                if (!Directory.Exists(GlobalVariable.strExpPath))
                    Directory.CreateDirectory(GlobalVariable.strExpPath);

                GlobalVariable.strConPath = GlobalVariable.strFilePath + @"\Connection Path\";
                if (!Directory.Exists(GlobalVariable.strConPath))
                    Directory.CreateDirectory(GlobalVariable.strConPath);

                GlobalVariable.strTempPath = GlobalVariable.strFilePath + @"\Temp Files\";
                if (!Directory.Exists(GlobalVariable.strTempPath))
                    Directory.CreateDirectory(GlobalVariable.strTempPath);

                GlobalVariable.strAttImpPath = GlobalVariable.strFilePath + @"\Attachment\" + strImp;
                if (!Directory.Exists(GlobalVariable.strAttImpPath))
                    Directory.CreateDirectory(GlobalVariable.strAttImpPath);

                GlobalVariable.strAttExpPath = GlobalVariable.strFilePath + @"\Attachment\" + strExp;
                if (!Directory.Exists(GlobalVariable.strAttExpPath))
                    Directory.CreateDirectory(GlobalVariable.strAttExpPath);

                GlobalVariable.strArcExpPath = GlobalVariable.strFilePath + @"\Archive Files\Export\";
                if (!Directory.Exists(GlobalVariable.strArcExpPath))
                    Directory.CreateDirectory(GlobalVariable.strArcExpPath);

                GlobalVariable.strArcImpPath = GlobalVariable.strFilePath + @"\Archive Files\Import\";
                if (!Directory.Exists(GlobalVariable.strArcImpPath))
                    Directory.CreateDirectory(GlobalVariable.strArcImpPath);

                GlobalVariable.strCRPath = GlobalVariable.strFilePath + @"\Crystal Report\";
                if (!Directory.Exists(GlobalVariable.strCRPath))
                    Directory.CreateDirectory(GlobalVariable.strCRPath);


                return true;
            }
            catch (Exception ex)
            {
                SystemFunction.errorAppend(string.Format("Error initializing program directory. {0}", ex.Message.ToString()));
                return false;
            }
        }
        public static bool initStoreProcedure()
        {
            //if (!(SystemFunction.initStoredProcedures(GlobalVariable.strSAPScriptPath)))
            //    return false;

            return true;
        }
    }
}
