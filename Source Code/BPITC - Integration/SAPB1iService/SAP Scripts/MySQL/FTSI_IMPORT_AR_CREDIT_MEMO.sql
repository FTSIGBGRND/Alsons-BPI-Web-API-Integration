DELIMITER $$

USE `ftdbw_bpictl`$$

DROP PROCEDURE IF EXISTS `FTSI_IMPORT_AR_CREDIT_MEMO`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_AR_CREDIT_MEMO`(
	IN Id VARCHAR(36) , DocType VARCHAR(1)
)
BEGIN
IF DocType = 'I'
THEN 
	-- HEADER --
	SELECT  	CardCode, 
			CardName,
			NumAtCard,
			DocType, 
			DATE_FORMAT(T1.DocDate, "%Y%m%d") 'DocDate',
			DATE_FORMAT(T1.DocDueDate, "%Y%m%d") 'DocDueDate',
			DATE_FORMAT(T1.TaxDate, "%Y%m%d") 'TaxDate',
			JrnlMemo,
			Comments, 
			T1.U_RefNum, 
			U_FileName,
			Canceled,
			Id AS 'U_Id'
			
	FROM ftorin T1
	WHERE T1.Id = Id;
	
	
	-- LINES --
	SELECT  	LineNum, 
			U_BaseType AS 'BaseType', 
			T2.DocEntry AS 'BaseEntry', 
			U_BaseLine AS 'BaseLine', 
			ItemCode, 
			DESCRIPTION AS 'Dscription', 
			AccountCode AS 'AcctCode',
			DiscPrcnt, 
			Quantity, 
			Price AS 'PriceBefDi',
			VatGroup, 
			PriceAfVAT, 
			WTLiable AS 'WtLiable',
			OcrCode, 
			OcrCode2, 
			OcrCode3, 
			OcrCode4, 
			OcrCode5,
			T1.U_RefNum,
			U_LngDscrptn, 
			U_Period
		
	FROM ftrin1 T1 
	LEFT JOIN ftoinv T2
		ON T1.U_BaseRef = T2.U_RefNum
	WHERE T1.HeaderId = Id AND T2.IntegrationStatus = 'S';
	
	-- WTax --
	SELECT  LineNum, 
			T1.U_RefNum, 
			WTCode, 
			TaxbleAmnt, 
			WTAmnt
		
	FROM ftrin5 T1
	WHERE T1.HeaderId = Id AND
	      IFNULL(WTCode,'') <> '';
END IF;
IF DocType = 'S' 
THEN 
	-- HEADER --
	SELECT  	CardCode, 
			CardName,
			NumAtCard,
			DocType, 
			DATE_FORMAT(T1.DocDate, "%Y%m%d") 'DocDate',
			DATE_FORMAT(T1.DocDueDate, "%Y%m%d") 'DocDueDate',
			DATE_FORMAT(T1.TaxDate, "%Y%m%d") 'TaxDate',
			JrnlMemo,
			Comments, 
			T1.U_RefNum, 
			U_FileName,
			Canceled,
			Id AS 'U_Id'
		
	FROM ftorin T1
	WHERE T1.Id = Id;
	
	
	-- LINES --
	SELECT  	LineNum, 
			U_BaseType AS 'BaseType', 
			T2.DocEntry AS 'BaseEntry', 
			U_BaseLine AS 'BaseLine', 
			ItemCode, 
			DESCRIPTION AS 'Dscription', 
			AccountCode AS 'AcctCode',
			DiscPrcnt, 
			Quantity, 
			Price AS 'PriceBefDi',
			VatGroup, 
			PriceAfVAT, 
			WTLiable AS 'WtLiable',
			OcrCode, 
			OcrCode2, 
			OcrCode3, 
			OcrCode4, 
			OcrCode5,
			T1.U_RefNum,
			U_LngDscrptn, 
			U_Period
		
	FROM ftrin1 T1
	LEFT JOIN ftoinv T2
		ON T1.U_BaseRef = T2.U_RefNum
	WHERE T1.HeaderId = Id AND T2.IntegrationStatus = 'S';
	
	-- WTax --
	SELECT  LineNum, 
			T1.U_RefNum, 
			WTCode, 
			TaxbleAmnt, 
			WTAmnt
		
	FROM ftrin5 T1
	WHERE T1.HeaderId = Id AND
	      IFNULL(WTCode,'') <> '';
END IF;
	
END$$

DELIMITER ;