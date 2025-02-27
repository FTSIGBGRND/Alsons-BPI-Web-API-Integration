DELIMITER $$

USE `ftdbw_bpictl`$$

DROP PROCEDURE IF EXISTS `FTSI_IMPORT_BP_MASTERDATA`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FTSI_IMPORT_BP_MASTERDATA`(
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
	SELECT	NAME, 
			FirstName, 
			POSITION AS 'Position', 
			Title, 
			Profession, 
			Tel1, 
			Fax, 
			Notes1, 
			Email AS 'E_MailL', 
			Notes2, 
			Gender, 
			DATE_FORMAT(T1.BirthDate, "%Y%m%d") 'BirthDate',
			U_NameLocal,
			U_Email3, 
			U_Refnum
			
		
	FROM ftocpr T1 
	WHERE T1.HeaderId = Id;


	
END$$

DELIMITER ;