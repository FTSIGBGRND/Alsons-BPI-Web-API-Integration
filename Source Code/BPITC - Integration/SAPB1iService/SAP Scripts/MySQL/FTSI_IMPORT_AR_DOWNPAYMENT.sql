DELIMITER $$

USE `ftdbw_bpictl`$$

DROP PROCEDURE IF EXISTS `FTSI_IMPORT_AR_DOWNPAYMENT`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_AR_DOWNPAYMENT`(
	IN Id VARCHAR(36)
)
BEGIN
	-- HEADER --
	SELECT		CardCode,
			CardName,
			NumAtCard, 
			DocType, 
			DATE_FORMAT(T1.DocDate, "%Y%m%d") 'DocDate',
			DATE_FORMAT(T1.DocDueDate, "%Y%m%d") 'DocDueDate',
			DATE_FORMAT(T1.TaxDate, "%Y%m%d") 'TaxDate',
			JrnlMemo, 
			Comments, 
			U_RefNum, 
			U_FileName, 
			Posted,
			Id AS 'U_Id'
			
		
	FROM ftodpi T1
	WHERE T1.Id = Id;
	
	
	-- LINES --
	SELECT		LineNum, 
			ItemCode, 
			-- DESCRIPTION AS 'Dscription', 
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
			U_RefNum,
			U_LngDscrptn,
			U_Period  
	FROM ftdpi1 T1
	WHERE T1.HeaderId = Id;
	
	-- WTax --
	SELECT U_RefNum,
	       WTCode,
	       TaxbleAmnt,
	       WTAmnt
		
	FROM ftdpi5 T1 
	WHERE T1.HeaderId = Id AND 
	      IFNULL(WtCode,'') <> '';
END$$

DELIMITER ;