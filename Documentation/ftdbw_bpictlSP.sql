/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - ftdbw_bpictl
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ftdbw_bpictl` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `ftdbw_bpictl`;

/* Procedure structure for procedure `FTSI_CHECK_BP` */

/*!50003 DROP PROCEDURE IF EXISTS  `FTSI_CHECK_BP` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_CHECK_BP`(
	IN Id VARCHAR(36)
)
BEGIN
	-- LINES --
SELECT	    U_xWTVendor,
            U_xSupplierName,
            U_xCardTyp AS 'U_xCardType',
            U_Address,
            U_TIN as 'LicTradNum',
            CardType,
            GroupNum,
            WTLiable,
            E_mail AS 'E_Mail',
            Phone1,
            CntctPrsn
FROM ftjdt1 T1
WHERE T1.HeaderId = Id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `FTSI_IMPORT_AP_CREDIT_MEMO` */

/*!50003 DROP PROCEDURE IF EXISTS  `FTSI_IMPORT_AP_CREDIT_MEMO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_AP_CREDIT_MEMO`(
	IN Id varchar(36), DocType VARCHAR(1)
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
				DESCRIPTION AS 'Dscription',
				DiscPrcnt,
				Quantity,
				Price AS 'PriceBefDi', 
				VATGroup,
				PriceAfVAT,
				WTLiable as 'WtLiable',
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
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `FTSI_IMPORT_AP_INVOICE` */

/*!50003 DROP PROCEDURE IF EXISTS  `FTSI_IMPORT_AP_INVOICE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_AP_INVOICE`(
	IN Id VARCHAR(36), DocType VARCHAR(1)
)
BEGIN
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
			WTLiable AS 'WtLiable',
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
			U_LngDscrptn,
			U_Period,
			AccountCode AS 'AcctCode',
			DESCRIPTION AS 'Dscription',
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
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `FTSI_IMPORT_AR_CREDIT_MEMO` */

/*!50003 DROP PROCEDURE IF EXISTS  `FTSI_IMPORT_AR_CREDIT_MEMO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_AR_CREDIT_MEMO`(
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
			AccountCode as 'AcctCode',
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
	WHERE T1.HeaderId = Id and T2.IntegrationStatus = 'S';
	
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
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `FTSI_IMPORT_AR_DOWNPAYMENT` */

/*!50003 DROP PROCEDURE IF EXISTS  `FTSI_IMPORT_AR_DOWNPAYMENT` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_AR_DOWNPAYMENT`(
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `FTSI_IMPORT_AR_INVOICE` */

/*!50003 DROP PROCEDURE IF EXISTS  `FTSI_IMPORT_AR_INVOICE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_AR_INVOICE`(
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
				U_DPRefNum as 'DocEntry',
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
				Description as 'Dscription',
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
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `FTSI_IMPORT_BP_MASTERDATA` */

/*!50003 DROP PROCEDURE IF EXISTS  `FTSI_IMPORT_BP_MASTERDATA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_BP_MASTERDATA`(
	IN Id VARCHAR(36)
)
BEGIN
	-- HEADER --
	SELECT		CardCode, 
			CardName, 
			CardFName, 
			CardType, 
			GroupCode, 
			CmpPrivate, 
			ValidFor, 
			ECVatGroup, 
			AddId, 
			ValidComm, 
			LicTradNum, 
			DflAccount, 
			GroupNum, 
			DflBranch, 
			U_CstmNmSrch, 
			U_CstmrCtgry, 
			U_CstmrCdHQ, 
			U_CutmrNtr, 
			U_PsicPsoc, 
			U_CrdtRtng, 
			U_CrdRtUp, 
			U_CrdtRtDtl, 
			U_CrdtCtgry, 
			U_VndrPrgrm, 
			U_GrgCtgry, 
			U_EqtyRt, 
			U_OpePrd, 
			U_ExpsrLmt, 
			U_IDCrdAdd, 
			U_MrtlStatus, 
			U_Emplymnt, 
			U_PrtsCmpyCd, 
			U_PrtsCmpyNm, 
			U_OrgnlGrpCd, 
			U_OrgnlGrpNm, 
			U_InvRtio, 
			U_IntrdcrCd, 
			U_IntrdcrNm, 
			U_GrntrCd, 
			U_AssetSize, 
			U_TcCRR, 
			U_PostCode, 
			U_PrfssnType, 
			U_Privies, 
			U_FsclMnth, 
			U_RgstrdCptl, 
			U_EsblsmntDt, 
			U_MngmntYrs, 
			U_HeadCount, 
			U_Credibility, 
			U_RiskConcern, 
			U_CstmerVst, 
			U_WhtRcvd, 
			U_SlsPicFl, 
			U_SlsPicOI, 
			U_SlsMngr9, 
			U_SlsMngr10, 
			U_CrdtAnlyst, 
			U_HoldingCR, 
			U_InCbnt, 
			U_BzLink, 
			U_DueDate, 
			U_InvDvncDt, 
			U_InvoicePIC, 
			U_IBllngPic, 
			U_SndngMthd, 
			U_DescriptionPtn, 
			U_ReceiptDsp, 
			U_BranchID, 
			U_BranchName, 
			U_OffclCtgry, 
			U_GrntLttrDt, 
			U_AgrAcvtyCd, 
			U_EcAcvtyCd, 
			U_InvPrntPtrn, 
			U_CreditTerm, 
			U_RefNum,
			Id AS 'U_Id'
	FROM ftocrd T1
	WHERE T1.Id = Id;
	-- Addresses Table --
	SELECT	Address, 
			Country, 
			ZipCode, 
			City, 
			State, 
			Street, 
			BLOCK, 
			AdresType, 
			U_BranchID, 
			U_BranchName, 
			U_LngAddrs1, 
			U_LngAddrs2, 
			U_RefNum
		
	FROM ftcrd1 T1 
	WHERE T1.HeaderId = Id;
	-- Contact Table --
	SELECT	Name, 
			FirstName, 
			Position as 'Position', 
			Title, 
			Profession, 
			Tel1, 
			Fax, 
			Notes1, 
			Email as 'E_MailL', 
			Notes2, 
			Gender, 
			DATE_FORMAT(T1.BirthDate, "%Y%m%d") 'BirthDate',
			U_NameLocal,
			U_Email3, 
			U_Refnum
			
		
	FROM ftocpr T1 
	WHERE T1.HeaderId = Id;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `FTSI_IMPORT_FIXED_ASSET` */

/*!50003 DROP PROCEDURE IF EXISTS  `FTSI_IMPORT_FIXED_ASSET` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_FIXED_ASSET`(
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
				T1.U_RefNum,
				A.Id AS 'U_Id'
	FROM ftoitm T1
	LEFT JOIN ftoacq A
		ON T1.U_RefNum = A.U_RefNum
	LEFT JOIN ftacq1 B
		ON A.Id = B.HeaderId
	LEFT JOIN ftitm7 C
		ON T1.Id = C.HeaderId
	WHERE A.Id = Id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `FTSI_IMPORT_FIXED_ASSET_RETIREMENT` */

/*!50003 DROP PROCEDURE IF EXISTS  `FTSI_IMPORT_FIXED_ASSET_RETIREMENT` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_FIXED_ASSET_RETIREMENT`(
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
				B.LineNum,
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `FTSI_IMPORT_GET_PROCESS_DATA` */

/*!50003 DROP PROCEDURE IF EXISTS  `FTSI_IMPORT_GET_PROCESS_DATA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_GET_PROCESS_DATA`(
  IN ObjType INT
)
BEGIN
IF ObjType = 2
THEN 
	SELECT 'ftocrd' AS MySQLTable,
	        Id,
	        U_RefNum
	FROM ftocrd T1
	WHERE IFNULL(IntegrationStatus, 'P') = 'P';
	
END IF;
IF ObjType = 4
THEN 
	SELECT 'ftoacq' AS MySQLTable,
	        Id,
	        U_RefNum
	FROM ftoacq T1
	WHERE IFNULL(IntegrationStatus, 'P') = 'P';
	
END IF;
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
IF ObjType = 14
THEN 
	SELECT 'ftorin' AS MySQLTable,
		Id,
		U_RefNum,
		Canceled,
		DocType,
		IntegrationStatus
	FROM ftorin
	WHERE (IFNULL(Posted, 'N') = 'N'
	AND IFNULL(IntegrationStatus, 'P') = 'P') OR  Canceled = 'Y';
END IF;
IF ObjType = 203
THEN 
	SELECT 'ftodpi' AS MySQLTable,
		U_RefNum,
	       Id
	FROM ftodpi
	WHERE IFNULL(Posted, 'N') = 'N'
	AND IFNULL(IntegrationStatus, 'P') = 'P';
END IF;
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
IF ObjType = 19
THEN 
	SELECT 'ftorpc' AS MySQLTable,
	        Id,
	        U_RefNum,
	        DocType
	FROM ftorpc T1
	WHERE IFNULL(IntegrationStatus, 'P') = 'P';
END IF;
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
	WHERE (IFNULL(CardCode, '') <> '' 
	AND IFNULL(IntegrationStatus, 'P') = 'P') OR  Canceled = 'Y';
END IF;
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
IF ObjType = 1470000049
THEN 
	SELECT 'ftoacq' AS MySQLTable,
		Id,
		U_RefNum,
		IntegrationStatus
	FROM ftoacq
	WHERE IFNULL(IntegrationStatus, 'P') = 'P';
END IF;
	
IF ObjType = 310
THEN 
	SELECT 'ftorti' AS MySQLTable,
		Id,
		U_RefNum,
		IntegrationStatus
	FROM ftorti
	WHERE IFNULL(IntegrationStatus, 'P') = 'P';
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `FTSI_IMPORT_INCOMING_PAYMENT` */

/*!50003 DROP PROCEDURE IF EXISTS  `FTSI_IMPORT_INCOMING_PAYMENT` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_INCOMING_PAYMENT`(
	IN Id VARCHAR(36), InvType VARCHAR(3)
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `FTSI_IMPORT_JOURNAL_ENTRY` */

/*!50003 DROP PROCEDURE IF EXISTS  `FTSI_IMPORT_JOURNAL_ENTRY` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_JOURNAL_ENTRY`(
	IN Id VARCHAR(36)
)
BEGIN
SELECT 	    U_DocNum,
            DATE_FORMAT(T1.RefDate , "%Y%m%d") 'RefDate',
            Memo,
            U_RefNum,
	    Id AS 'U_Id'
		
FROM ftojdt T1
WHERE T1.Id = Id;
	
	-- LINES --
SELECT	   ShortName, 
            Account as 'Account',
            LineMemo, 
            Debit,
            Credit, 
            FCCurrency, 
            ProfitCode, 
            OcrCode2,
            OcrCode3, 
            OcrCode4, 
            OcrCode5, 
            DATE_FORMAT(T1.U_InvDate , "%Y%m%d") 'U_InvDate',
            U_InvNum, 
            U_VATBase,
            U_TransType, 
            U_xWTCode,
            U_xWTVendor,
            U_xSupplierName,
	    U_xCardTyp AS ' U_xCardType',
            U_Address as 'U_xAddress',
            U_TIN as 'LicTradNum',
            U_TIN as 'U_xTINnumber',
            U_TIN,
            U_TIN1,
            U_TIN2,
            U_TaxAmt,
            U_TaxableAmt AS 'U_xTaxbleAmnt',
            U_SrceDocNo,
            U_SOA,
            U_CheckNo,
            DATE_FORMAT(T1.U_CheckDate , "%Y%m%d") 'U_CheckDate',
            U_APVNo,
            U_VSIRefNo,
            U_Contract
FROM ftjdt1 T1
WHERE T1.HeaderId = Id;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
