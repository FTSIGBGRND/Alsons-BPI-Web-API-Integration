DELIMITER $$

USE `ftdbw_bpictl`$$

DROP PROCEDURE IF EXISTS `FTSI_CHECK_BP`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_CHECK_BP`(
	IN Id VARCHAR(36)
)
BEGIN
	-- LINES --
SELECT	    U_xWTVendor,
            U_xSupplierName,
            U_xCardTyp AS 'U_xCardType',
            U_Address,
            U_TIN AS 'LicTradNum',
            CardType,
            GroupNum,
            WTLiable,
            E_mail AS 'E_Mail',
            Phone1,
            CntctPrsn
FROM ftjdt1 T1
WHERE T1.HeaderId = Id;
END$$

DELIMITER ;