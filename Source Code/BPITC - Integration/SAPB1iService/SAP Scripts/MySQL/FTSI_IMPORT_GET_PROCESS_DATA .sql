DELIMITER $$

USE `ftdbw_bpictl`$$

DROP PROCEDURE IF EXISTS `FTSI_IMPORT_GET_PROCESS_DATA`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_GET_PROCESS_DATA`(
  IN ObjType INT
)
BEGIN

-- BP MASTER --
IF ObjType = 2
THEN 
	SELECT 'ftocrd' AS MySQLTable,
	        Id,
	        U_RefNum
	FROM ftocrd T1
	WHERE IFNULL(IntegrationStatus, 'P') = 'P';
	
END IF;

-- ITEM MASTER DATA--
IF ObjType = 4
THEN 
	SELECT 'ftoacq' AS MySQLTable,
	        Id,
	        U_RefNum
	FROM ftoacq T1
	WHERE IFNULL(IntegrationStatus, 'P') = 'P';
	
END IF;

-- AR INVOICE --
IF ObjType = 13 
THEN 
	SELECT 'ftoinv' AS MySQLTable,
	        Id,
	        U_RefNum,
	        DocType
	FROM ftoinv T1
	WHERE IFNULL(Posted, 'N') = 'N'
	AND IFNULL(IntegrationStatus, 'P') = 'P';
END IF;

-- AR CREDIT MEMO --
IF ObjType = 14
THEN 
	SELECT 'ftorin' AS MySQLTable,
		Id,
		U_RefNum,
		Canceled,
		DocType,
		IntegrationStatus
	FROM ftorin
	WHERE IFNULL(Posted, 'N') = 'N'
	AND IFNULL(IntegrationStatus, 'P') = 'P';
END IF;

-- AR DOWNPAYMENT --
IF ObjType = 203
THEN 
	SELECT 'ftodpi' AS MySQLTable,
		U_RefNum,
	       Id
	FROM ftodpi
	WHERE IFNULL(Posted, 'N') = 'N'
	AND IFNULL(IntegrationStatus, 'P') = 'P';
END IF;

-- AP INVOICE --
IF ObjType = 18
THEN 
	SELECT 'ftopch' AS MySQLTable,
	        Id,
	        U_RefNum,
	        DocType
	FROM ftopch T1
	WHERE IFNULL(Posted, 'N') = 'N'
	AND IFNULL(IntegrationStatus, 'P') = 'P';
END IF;

-- AP CREDIT MEMO --
IF ObjType = 19
THEN 
	SELECT 'ftorpc' AS MySQLTable,
	        Id,
	        U_RefNum,
	        DocType
	FROM ftorpc T1
	WHERE IFNULL(IntegrationStatus, 'P') = 'P';
END IF;

-- INCOMING PAYMENT --
IF ObjType = 24 
THEN 
	SELECT 'ftorct' AS MySQLTable,
		T1.Id,
		T1.U_RefNum,
		T1.Canceled,
		T1.IntegrationStatus,
		T2.InvType

	FROM ftorct T1
	LEFT JOIN ftrct2 T2
		ON T1.U_RefNum = T2.U_RefNum
	WHERE IFNULL(CardCode, '') <> '' 
	AND IFNULL(IntegrationStatus, 'P') = 'P';
END IF;

-- JOURNAL ENTRY --
IF ObjType = 30
THEN 
	SELECT 'ftojdt' AS MySQLTable,
		Id,
		U_RefNum,
		U_DocNum,
		IntegrationStatus
	FROM ftojdt
	WHERE IFNULL(IntegrationStatus, 'P') = 'P';
END IF;

-- CAPITALIZATION --
IF ObjType = 1470000049
THEN 
	SELECT 'ftoacq' AS MySQLTable,
		Id,
		U_RefNum,
		IntegrationStatus
	FROM ftoacq
	WHERE IFNULL(IntegrationStatus, 'P') = 'P';
END IF;
	
-- RETIREMENT --
IF ObjType = 310
THEN 
	SELECT 'ftorti' AS MySQLTable,
		Id,
		U_RefNum,
		IntegrationStatus
	FROM ftorti
	WHERE IFNULL(IntegrationStatus, 'P') = 'P';
END IF;

END$$

DELIMITER ;