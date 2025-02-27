DELIMITER $$

USE `ftdbw_bpictl`$$

DROP PROCEDURE IF EXISTS `FTSI_IMPORT_INCOMING_PAYMENT`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_INCOMING_PAYMENT`(
	IN Id VARCHAR(36), InvType VARCHAR(2)
)
BEGIN


	-- HEADER --
	SELECT  	CardCode,
			CardName,
			DATE_FORMAT(T1.DocDate, "%Y%m%d") 'DocDate',
			CashSum, 
			TrsfrAcct,
			DATE_FORMAT(T1.TrsfrDate, "%Y%m%d") 'TrsfrDate',
			TrsfrRef, 
			TrsfrSum,
			Canceled,
			Series,
			U_RefNum, 
			U_FileName,
			Id AS 'U_Id'
			
	FROM ftorct T1
	WHERE T1.Id = Id;

	-- AR Invoice --
	IF InvType = '13'
	THEN 

		SELECT 
				T1.InvType, 
				T1.SumApplied,
				T1.U_RefNum AS 'U_InvRefNum',
				O.DocEntry AS 'DocEntry'
		FROM ftrct2 T1
		LEFT JOIN ftoinv O
			ON T1.U_RefNum = O.U_RefNum
		WHERE T1.HeaderId = Id;

	END IF;

	-- AR DP --
	IF InvType = '203'
	THEN 

		SELECT
				T1.InvType, 
				T1.SumApplied,
				T1.U_RefNum AS 'U_InvRefNum',
				O.DocEntry AS 'DocEntry'
		FROM ftrct2 T1
		LEFT JOIN ftodpi O
			ON T1.U_RefNum = O.U_RefNum
		WHERE T1.HeaderId = Id;

	END IF;

END$$

DELIMITER ;