DELIMITER $$

USE `ftdbw_bpictl`$$

DROP PROCEDURE IF EXISTS `FTSI_IMPORT_AR_INVOICE`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_AR_INVOICE`(
	IN Id VARCHAR(36), DocType VARCHAR(1)
)
BEGIN
IF DocType = 'I'
THEN 
	-- HEADER --
		SELECT 		DocType,
				U_RefNum, 
				U_FileName, 
				DocNum, 
				CardCode, 
				NumAtCard, 
				DATE_FORMAT(T1.DocDate, "%Y%m%d") 'DocDate',
				DATE_FORMAT(T1.DocDueDate, "%Y%m%d") 'DocDueDate',
				DATE_FORMAT(T1.TaxDate, "%Y%m%d") 'TaxDate',
				JrnlMemo, 
				Comments,
				Canceled,
				Id AS 'U_Id'
		
		FROM ftoinv T1
		WHERE T1.Id = Id;
	
	
		-- LINES --
		SELECT		LineNum,
				ItemCode, 
				U_LngDscrptn, 
				U_Period, 
				Price AS 'PriceBefDi',
				DiscPrcnt,
				Quantity, 
				VatGroup, 
				WTLiable AS 'WtLiable',
				PriceAfVAT, 
				OcrCode, 
				OcrCode2, 
				OcrCode3, 
				OcrCode4, 
				OcrCode5
		FROM ftinv1 T1
		WHERE T1.HeaderId = Id;
	
		-- WTax --
		SELECT U_RefNum,
			   T1.WTCode,
			   TaxbleAmnt,
			   WTAmnt
		
		FROM ftinv5 T1 
		WHERE T1.HeaderId = Id AND 
			  IFNULL(WTCode,'') <> '';
		-- Drawn Dpm --
		SELECT 		 LineNum, 
				U_RefNum,
				U_DPRefNum,
				U_DPRefNum AS 'DocEntry',
				DrawnSum
		FROM ftinv9 T1 
		WHERE T1.HeaderId = Id ;
END IF;
IF DocType = 'S' 
THEN 
	-- HEADER --
		SELECT 		DocType, 
				U_RefNum,
				U_FileName, 
				DocNum, 
				CardCode, 
				NumAtCard, 
				DATE_FORMAT(T1.DocDate, "%Y%m%d") 'DocDate',
				DATE_FORMAT(T1.DocDueDate, "%Y%m%d") 'DocDueDate',
				DATE_FORMAT(T1.TaxDate, "%Y%m%d") 'TaxDate',
				JrnlMemo, 
				Comments,
				Canceled,
				Id AS 'U_Id'
		
		FROM ftoinv T1
		WHERE T1.Id = Id;
	
	
		-- LINES --
		SELECT		LineNum,
				DESCRIPTION AS 'Dscription',
				U_LngDscrptn, 
				U_Period, 
				AccountCode AS 'AcctCode',
				Price AS 'PriceBefDi', 
				DiscPrcnt,
				VatGroup, 
				WTLiable AS 'WtLiable',
				PriceAfVAT, 
				OcrCode, 
				OcrCode2, 
				OcrCode3, 
				OcrCode4, 
				OcrCode5
		FROM ftinv1 T1
		WHERE T1.HeaderId = Id;
	
		-- WTax --
		SELECT U_RefNum,
			   T1.WTCode,
			   TaxbleAmnt,
			   WTAmnt
		
		FROM ftinv5 T1 
		WHERE T1.HeaderId = Id AND 
			  IFNULL(WTCode,'') <> '';
END IF;
	
END$$

DELIMITER ;