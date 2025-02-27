DELIMITER $$

USE `ftdbw_bpictl`$$

DROP PROCEDURE IF EXISTS `FTSI_IMPORT_AP_CREDIT_MEMO`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_AP_CREDIT_MEMO`(
	IN Id VARCHAR(36), DocType VARCHAR(1)
)
BEGIN
	-- HEADER --
	SELECT 		U_RefNum, 
			U_FileName, 
			DocType, 
			CardCode, 
			CardName, 
			NumAtCard, 
			DATE_FORMAT(T1.DocDate, "%Y%m%d") 'DocDate',
			DATE_FORMAT(T1.DocDueDate, "%Y%m%d") 'DocDueDate',
			DATE_FORMAT(T1.TaxDate, "%Y%m%d") 'TaxDate',
			JrnlMemo, 
			Comments,
			Id AS 'U_Id'
		
	FROM ftorpc T1
	WHERE T1.Id = Id;
	
	-- Item --
	IF DocType = 'I'
	THEN 
		-- LINES --
		SELECT		LineNum,
				U_BaseType AS 'BaseType', 
				T2.DocEntry AS 'BaseEntry', 
				U_BaseLine AS 'BaseLine', 
				ItemCode,
				AccountCode AS 'AcctCode',
				DiscPrcnt,
				Quantity,
				Price AS 'PriceBefDi', 
				VATGroup,
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
				
		FROM ftrpc1 T1
		LEFT JOIN ftopch T2
			ON T1.U_BaseRef = T2.U_RefNum
		WHERE T1.HeaderId = Id AND T2.IntegrationStatus = 'S';
	
	END IF;
	-- Service --
	IF DocType = 'S'
	THEN 
		SELECT		LineNum,
				U_BaseType AS 'BaseType', 
				T2.DocEntry AS 'BaseEntry', 
				U_BaseLine AS 'BaseLine', 
				ItemCode,
				AccountCode AS 'AcctCode',
				DiscPrcnt,
				Quantity,
				Price AS 'PriceBefDi', 
				VATGroup,
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
	FROM ftrpc1 T1
	LEFT JOIN ftopch T2
			ON T1.U_BaseRef = T2.U_RefNum
	WHERE T1.HeaderId = Id AND T2.IntegrationStatus = 'S';
	END IF;
	
	-- WTax --
	SELECT U_RefNum,
	       T1.WTCode,
	       TaxbleAmnt,
	       WTAmnt
		
	FROM ftrpc5 T1 
	WHERE T1.HeaderId = Id AND 
	      IFNULL(WTCode,'') <> '';
	
END$$

DELIMITER ;