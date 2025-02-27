DELIMITER $$

USE `ftdbw_bpictl`$$

DROP PROCEDURE IF EXISTS `FTSI_IMPORT_JOURNAL_ENTRY`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_JOURNAL_ENTRY`(
	IN Id VARCHAR(36)
)
BEGIN
SELECT 	    U_DocNum,
            DATE_FORMAT(T1.RefDate , "%Y%m%d") 'RefDate',
            Memo,
            U_RefNum,
	    Id AS 'U_Id'
		
FROM ftojdt T1
WHERE T1.Id = Id;
	
	-- LINES --
SELECT	   ShortName, 
            ACCOUNT AS 'Account',
            LineMemo, 
            Debit,
            Credit, 
            FCCurrency, 
            ProfitCode, 
            OcrCode2,
            OcrCode3, 
            OcrCode4, 
            OcrCode5, 
            DATE_FORMAT(T1.U_InvDate , "%Y%m%d") 'U_InvDate',
            U_InvNum, 
            U_VATBase,
            U_TransType, 
            U_xWTCode,
            U_xWTVendor,
            U_xSupplierName,
	    U_xCardTyp AS ' U_xCardType',
            U_Address AS 'U_xAddress',
            U_TIN AS 'LicTradNum',
            U_TIN AS 'U_xTINnumber',
            U_TIN,
            U_TIN1,
            U_TIN2,
            U_TaxAmt,
            U_TaxableAmt AS 'U_xTaxbleAmnt',
            U_SrceDocNo,
            U_SOA,
            U_CheckNo,
            DATE_FORMAT(T1.U_CheckDate , "%Y%m%d") 'U_CheckDate',
            U_APVNo,
            U_VSIRefNo,
            U_Contract
FROM ftjdt1 T1
WHERE T1.HeaderId = Id;
END$$

DELIMITER ;