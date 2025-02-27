DELIMITER $$

USE `ftdbw_bpictl`$$

DROP PROCEDURE IF EXISTS `FTSI_IMPORT_AP_INVOICE`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_AP_INVOICE`(
	IN Id VARCHAR(36), DocType VARCHAR(1)
)
BEGIN
-- ITEM --
IF DocType = 'I'
THEN 
	-- HEADER --
	SELECT  	CardCode,
			CardName, 
			NumAtCard, 
			DATE_FORMAT(T1.DocDate, "%Y%m%d") 'DocDate',
			DATE_FORMAT(T1.DocDueDate, "%Y%m%d") 'DocDueDate',
			DATE_FORMAT(T1.TaxDate, "%Y%m%d") 'TaxDate',
			JrnlMemo, 
			Comments,	
			U_RefNum, 
			U_FileName,
			Id AS 'U_Id'
		
	FROM ftopch T1
	WHERE T1.Id = Id;
	
	
	-- LINES --
	SELECT		LineNum,
			U_BaseRef,
			U_BaseLine,
			U_BaseType,
			ItemCode,
			DESCRIPTION AS 'Dscription',
			DiscPrcnt,
			Quantity,
			Price AS 'PriceBefDi', 
			VatGroup,
			PriceAfVAT,
			WTLiable,
			OcrCode,
			OcrCode2,
			OcrCode3,
			OcrCode4,
			OcrCode5,
			U_RefNum,
			U_LngDscrptn,
			U_Period
			
	FROM ftpch1 T1
	WHERE T1.HeaderId = Id;
	
	-- WTax --
	SELECT 		T1.WTCode,
			U_RefNum,
			WTAmnt,
			TaxbleAmnt
		
	FROM ftpch5 T1 
	WHERE T1.HeaderId = Id AND 
	      IFNULL(WTCode,'') <> '';
END IF;

-- SERVICE --
IF DocType = 'S' 
THEN 
	-- HEADER --
	SELECT  	DocType,
			DATE_FORMAT(T1.DocDate, "%Y%m%d") 'DocDate',
			DATE_FORMAT(T1.DocDueDate, "%Y%m%d") 'DocDueDate',
			DATE_FORMAT(T1.TaxDate, "%Y%m%d") 'TaxDate',
			CardCode,
			CardName, 
			NumAtCard, 
			JrnlMemo, 
			Comments,	
			U_RefNum, 
			U_FileName,
			Id AS 'U_Id'
		
	FROM ftopch T1
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
			WTLiable,
			PriceAfVAT,
			OcrCode,
			OcrCode2,
			OcrCode3,
			OcrCode4,
			OcrCode5
			
	FROM ftpch1 T1
	WHERE T1.HeaderId = Id;
	
	-- WTax --
	SELECT 		T1.WTCode,	
			U_RefNum,
			TaxbleAmnt,
			WTAmnt
		
		
	FROM ftpch5 T1 
	WHERE T1.HeaderId = Id AND 
	      IFNULL(WTCode,'') <> '';
END IF;
	
END$$

DELIMITER ;