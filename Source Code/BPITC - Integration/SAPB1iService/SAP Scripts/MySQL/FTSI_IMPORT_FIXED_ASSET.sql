DELIMITER $$

USE `ftdbw_bpictl`$$

DROP PROCEDURE IF EXISTS `FTSI_IMPORT_FIXED_ASSET`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_FIXED_ASSET`(
	IN Id VARCHAR(36)
)
BEGIN
	-- HEADER --
	SELECT			T1.AsstStatus, 
				T1.AssetClass,
				T1.ItemCode, 
				T1.ItemName, 
				T1.U_SalesAg, 
				T1.U_AssetAcct, 
				B.Quantity,
				T1.U_Maker, 
				T1.U_Model, 
				T1.U_ModYear, 
				T1.U_Serial, 
				T1.U_GDate, 
				T1.U_Chasis, 
				T1.U_Engine, 
				T1.U_Color, 
				T1.U_EquipID, 
				T1.U_LMADate, 
				T1.U_NMADate, 
				T1.U_AssInfo1, 
				T1.U_AssInfo2, 
				T1.U_AssInfo3, 
				T1.U_AssLoc, 
				T1.U_AssLocM, 
				T1.U_AssRes, 
				B.LineTotal,
				DATE_FORMAT(A.PostDate, "%Y%m%d") 'PostDate',
				DATE_FORMAT(C.DprStart, "%Y%m%d") 'DprStart',
				T1.U_Contract, 
				C.UsefulLife,
				T1.Id AS 'U_Id'

	FROM ftoitm T1
	LEFT JOIN ftoacq A
		ON T1.U_RefNum = A.U_RefNum
	LEFT JOIN ftacq1 B
		ON A.Id = B.HeaderId
	LEFT JOIN ftitm7 C
		ON T1.Id = C.HeaderId
	WHERE A.Id = Id;

END$$

DELIMITER ;