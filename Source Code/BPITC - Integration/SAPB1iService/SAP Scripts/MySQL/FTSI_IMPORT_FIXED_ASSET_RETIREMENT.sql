DELIMITER $$

USE `ftdbw_bpictl`$$

DROP PROCEDURE IF EXISTS `FTSI_IMPORT_FIXED_ASSET_RETIREMENT`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_FIXED_ASSET_RETIREMENT`(
	IN Id VARCHAR(36)
)
BEGIN
	-- HEADER --
	SELECT			A.DocType,
				DATE_FORMAT(A.PostDate, "%Y%m%d") 'PostDate',
				DATE_FORMAT(A.DocDate, "%Y%m%d") 'DocDate',
				DATE_FORMAT(A.AssetDate, "%Y%m%d") 'AssetDate', 
				A.DocStatus AS 'Status',
				A.Comments,
				B.LineTotal,
				B.ItemCode,
				B.Partial,
				B.APC,
				C.DprArea,
				A.Id AS 'U_Id'

	FROM ftorti A
	LEFT JOIN ftrti1 B
		ON A.Id = B.HeaderId
	LEFT JOIN ftrti2 C
		ON A.Id = C.HeaderId
	WHERE A.Id = Id;
END$$

DELIMITER ;