CREATE TABLE IF NOT EXISTS `__EFMigrationsHistory` (
    `MigrationId` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `ProductVersion` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT `PK___EFMigrationsHistory` PRIMARY KEY (`MigrationId`)
) CHARACTER SET=utf8mb4;

START TRANSACTION;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    ALTER DATABASE CHARACTER SET utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTOACQ` (
        `Id` char(36) COLLATE ascii_general_ci NOT NULL,
        `DocNum` int NULL,
        `Series` int NULL,
        `PeriodCat` varchar(10) CHARACTER SET utf8mb4 NULL,
        `FinncPeroid` int NULL,
        `PostDate` date NULL,
        `DocDate` date NULL,
        `DocStatus` varchar(1) CHARACTER SET utf8mb4 NULL,
        `TransId` int NULL,
        `Comments` varchar(254) CHARACTER SET utf8mb4 NULL,
        `Reference` varchar(32) CHARACTER SET utf8mb4 NULL,
        `ObjType` varchar(20) CHARACTER SET utf8mb4 NULL,
        `Currency` varchar(3) CHARACTER SET utf8mb4 NULL,
        `DocRate` decimal(19,6) NULL,
        `SysRate` decimal(19,6) NULL,
        `PIndicator` varchar(10) CHARACTER SET utf8mb4 NULL,
        `DocTotal` decimal(19,6) NULL,
        `DocTotalFC` decimal(19,6) NULL,
        `DocTotalSy` decimal(19,6) NULL,
        `DataSource` varchar(1) CHARACTER SET utf8mb4 NULL,
        `UserSign` int NULL,
        `LogInstanc` int NULL,
        `CreateDate` date NULL,
        `UserSign2` int NULL,
        `UpdateDate` date NULL,
        `TransType` varchar(20) CHARACTER SET utf8mb4 NULL,
        `CreatedBy` int NULL,
        `JrnlMemo` varchar(254) CHARACTER SET utf8mb4 NULL,
        `AssetDate` date NULL,
        `CurSource` varchar(1) CHARACTER SET utf8mb4 NULL,
        `DocType` varchar(15) CHARACTER SET utf8mb4 NULL,
        `PrjSmarz` varchar(1) CHARACTER SET utf8mb4 NULL,
        `DstRlSmarz` varchar(1) CHARACTER SET utf8mb4 NULL,
        `ManDprType` varchar(15) CHARACTER SET utf8mb4 NULL,
        `Handwrtten` varchar(1) CHARACTER SET utf8mb4 NULL,
        `CancelDate` date NULL,
        `DprArea` varchar(15) CHARACTER SET utf8mb4 NULL,
        `BPLId` int NULL,
        `BaseRef` varchar(11) CHARACTER SET utf8mb4 NULL,
        `LVARetire` varchar(1) CHARACTER SET utf8mb4 NULL,
        `CancelOpt` int NULL,
        `BPLName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `VatRegNum` varchar(32) CHARACTER SET utf8mb4 NULL,
        `GdsMovType` varchar(2) CHARACTER SET utf8mb4 NULL,
        `CreatedAt` datetime(6) NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
        `IntegrationStatus` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `IntegrationMessage` longtext CHARACTER SET utf8mb4 NULL,
        CONSTRAINT `PK_FTOACQ` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTOCRD` (
        `Id` char(36) COLLATE ascii_general_ci NOT NULL,
        `CardCode` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
        `CardName` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
        `CardFName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `CardType` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `GroupCode` int NULL,
        `CmpPrivate` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `ValidFor` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `ECVatGroup` varchar(8) CHARACTER SET utf8mb4 NULL,
        `AddId` varchar(64) CHARACTER SET utf8mb4 NULL,
        `IndustryC` int NULL,
        `ValidComm` varchar(30) CHARACTER SET utf8mb4 NULL,
        `LicTradNum` varchar(32) CHARACTER SET utf8mb4 NULL,
        `DflAccount` varchar(50) CHARACTER SET utf8mb4 NULL,
        `GroupNum` int NULL,
        `DflBranch` longtext CHARACTER SET utf8mb4 NULL,
        `WTLiable` varchar(1) CHARACTER SET utf8mb4 NULL,
        `E_mail` varchar(100) CHARACTER SET utf8mb4 NULL,
        `Phone1` varchar(50) CHARACTER SET utf8mb4 NULL,
        `CntctPrsn` varchar(90) CHARACTER SET utf8mb4 NULL,
        `CreatedAt` datetime(6) NOT NULL,
        `IntegrationStatus` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `IntegrationMessage` longtext CHARACTER SET utf8mb4 NULL,
        `U_CstmNmSrch` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_CstmrCtgry` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_CstmrCdHQ` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_CutmrNtr` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_PsicPsoc` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_CrdtRtng` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_CrdRtUp` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_CrdtRtDtl` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_CrdtCtgry` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_VndrPrgrm` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_GrgCtgry` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_EqtyRt` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_OpePrd` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_ExpsrLmt` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_IDCrdAdd` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_MrtlStatus` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_Emplymnt` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_PrtsCmpyCd` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_PrtsCmpyNm` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_OrgnlGrpCd` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_OrgnlGrpNm` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_InvRtio` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_IntrdcrCd` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_IntrdcrNm` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_GrntrCd` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_AssetSize` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_TcCRR` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_PostCode` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_PrfssnType` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_Privies` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_FsclMnth` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_RgstrdCptl` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_EsblsmntDt` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_MngmntYrs` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_HeadCount` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_Credibility` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_RiskConcern` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_CstmerVst` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_WhtRcvd` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_SlsPicFl` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_SlsPicOI` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_SlsMngr9` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_SlsMngr10` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_CrdtAnlyst` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_HoldingCR` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_InCbnt` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_BzLink` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_DueDate` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_InvDvncDt` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_InvoicePIC` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_IBllngPic` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_SndngMthd` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_DescriptionPtn` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_ReceiptDsp` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_BranchID` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_BranchName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_OffclCtgry` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_GrntLttrDt` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_AgrAcvtyCd` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_EcAcvtyCd` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_InvPrntPtrn` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_CreditTerm` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        CONSTRAINT `PK_FTOCRD` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTODPI` (
        `Id` char(36) COLLATE ascii_general_ci NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `U_FileName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `IntegrationStatus` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `IntegrationMessage` longtext CHARACTER SET utf8mb4 NULL,
        `DocEntry` int NULL,
        `DocNum` int NULL,
        `CardCode` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
        `CardName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `NumAtCard` varchar(100) CHARACTER SET utf8mb4 NULL,
        `DocType` varchar(1) CHARACTER SET utf8mb4 NULL,
        `DocDate` date NOT NULL,
        `DocDueDate` date NOT NULL,
        `TaxDate` date NOT NULL,
        `PaymentTerms` longtext CHARACTER SET utf8mb4 NULL,
        `JrnlMemo` varchar(254) CHARACTER SET utf8mb4 NULL,
        `Comments` varchar(254) CHARACTER SET utf8mb4 NULL,
        `Posted` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `Canceled` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `CancelDate` datetime(6) NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTODPI` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTOINV` (
        `Id` char(36) COLLATE ascii_general_ci NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `U_FileName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `IntegrationStatus` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `IntegrationMessage` longtext CHARACTER SET utf8mb4 NULL,
        `DocEntry` int NULL,
        `DocNum` int NULL,
        `CardCode` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
        `CardName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `NumAtCard` varchar(100) CHARACTER SET utf8mb4 NULL,
        `DocType` varchar(1) CHARACTER SET utf8mb4 NULL,
        `DocDate` date NOT NULL,
        `DocDueDate` date NOT NULL,
        `TaxDate` date NOT NULL,
        `PaymentTerms` longtext CHARACTER SET utf8mb4 NULL,
        `JrnlMemo` varchar(254) CHARACTER SET utf8mb4 NULL,
        `Comments` varchar(254) CHARACTER SET utf8mb4 NULL,
        `Posted` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `Canceled` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `CancelDate` datetime(6) NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTOINV` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTOITM` (
        `Id` char(36) COLLATE ascii_general_ci NOT NULL,
        `ItemCode` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
        `ItemName` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
        `AsstStatus` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `AssetClass` varchar(20) CHARACTER SET utf8mb4 NULL,
        `ItemType` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `CreatedAt` datetime(6) NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
        `U_SalesAg` varchar(30) CHARACTER SET utf8mb4 NULL,
        `U_AssetAcct` varchar(20) CHARACTER SET utf8mb4 NULL,
        `U_Maker` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_Model` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_ModYear` varchar(10) CHARACTER SET utf8mb4 NULL,
        `U_Serial` varchar(30) CHARACTER SET utf8mb4 NULL,
        `U_GDate` varchar(10) CHARACTER SET utf8mb4 NULL,
        `U_Chasis` varchar(254) CHARACTER SET utf8mb4 NULL,
        `U_Engine` varchar(254) CHARACTER SET utf8mb4 NULL,
        `U_Color` varchar(20) CHARACTER SET utf8mb4 NULL,
        `U_EquipID` varchar(10) CHARACTER SET utf8mb4 NULL,
        `U_LMADate` varchar(10) CHARACTER SET utf8mb4 NULL,
        `U_NMADate` varchar(10) CHARACTER SET utf8mb4 NULL,
        `U_AssInfo1` varchar(254) CHARACTER SET utf8mb4 NULL,
        `U_AssInfo2` varchar(254) CHARACTER SET utf8mb4 NULL,
        `U_AssInfo3` varchar(254) CHARACTER SET utf8mb4 NULL,
        `U_AssLoc` varchar(10) CHARACTER SET utf8mb4 NULL,
        `U_AssLocM` varchar(254) CHARACTER SET utf8mb4 NULL,
        `U_AssRes` varchar(20) CHARACTER SET utf8mb4 NULL,
        `U_Contract` varchar(30) CHARACTER SET utf8mb4 NULL,
        CONSTRAINT `PK_FTOITM` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTOJDT` (
        `Id` char(36) COLLATE ascii_general_ci NOT NULL,
        `BatchNum` int NULL,
        `TransId` int NULL,
        `BtfStatus` varchar(1) CHARACTER SET utf8mb4 NULL,
        `TransType` varchar(20) CHARACTER SET utf8mb4 NULL,
        `BaseRef` varchar(11) CHARACTER SET utf8mb4 NULL,
        `RefDate` date NULL,
        `Memo` varchar(254) CHARACTER SET utf8mb4 NULL,
        `Ref1` varchar(100) CHARACTER SET utf8mb4 NULL,
        `Ref2` varchar(100) CHARACTER SET utf8mb4 NULL,
        `CreatedBy` int NULL,
        `LocTotal` decimal(19,6) NULL,
        `FcTotal` decimal(19,6) NULL,
        `SysTotal` decimal(19,6) NULL,
        `TransCode` varchar(4) CHARACTER SET utf8mb4 NULL,
        `OrignCurr` varchar(3) CHARACTER SET utf8mb4 NULL,
        `TransRate` decimal(19,6) NULL,
        `BtfLine` int NULL,
        `TransCurr` varchar(3) CHARACTER SET utf8mb4 NULL,
        `Project` varchar(20) CHARACTER SET utf8mb4 NULL,
        `DueDate` date NULL,
        `TaxDate` date NULL,
        `PCAddition` varchar(1) CHARACTER SET utf8mb4 NULL,
        `FinncPriod` int NULL,
        `DataSource` varchar(1) CHARACTER SET utf8mb4 NULL,
        `UpdateDate` date NULL,
        `CreateDate` date NULL,
        `UserSign` int NULL,
        `UserSign2` int NULL,
        `RefndRprt` varchar(1) CHARACTER SET utf8mb4 NULL,
        `LogInstanc` int NULL,
        `ObjType` varchar(20) CHARACTER SET utf8mb4 NULL,
        `Indicator` varchar(2) CHARACTER SET utf8mb4 NULL,
        `AdjTran` varchar(1) CHARACTER SET utf8mb4 NULL,
        `RevSource` varchar(1) CHARACTER SET utf8mb4 NULL,
        `StornoDate` date NULL,
        `StornoToTr` int NULL,
        `AutoStorno` varchar(1) CHARACTER SET utf8mb4 NULL,
        `Corisptivi` varchar(1) CHARACTER SET utf8mb4 NULL,
        `VatDate` date NULL,
        `StampTax` varchar(1) CHARACTER SET utf8mb4 NULL,
        `Series` int NULL,
        `Number` int NULL,
        `AutoVAT` varchar(1) CHARACTER SET utf8mb4 NULL,
        `DocSeries` int NULL,
        `FolioPref` varchar(4) CHARACTER SET utf8mb4 NULL,
        `FolioNum` int NULL,
        `CreateTime` int NULL,
        `BlockDunn` varchar(1) CHARACTER SET utf8mb4 NULL,
        `ReportEU` varchar(1) CHARACTER SET utf8mb4 NULL,
        `Report347` varchar(1) CHARACTER SET utf8mb4 NULL,
        `Printed` varchar(1) CHARACTER SET utf8mb4 NULL,
        `DocType` varchar(60) CHARACTER SET utf8mb4 NULL,
        `AttNum` int NULL,
        `GenRegNo` varchar(1) CHARACTER SET utf8mb4 NULL,
        `RG23APart2` int NULL,
        `RG23CPart2` int NULL,
        `MatType` int NULL,
        `Creator` varchar(155) CHARACTER SET utf8mb4 NULL,
        `Approver` varchar(155) CHARACTER SET utf8mb4 NULL,
        `Location` int NULL,
        `SeqCode` int NULL,
        `Serial` int NULL,
        `SeriesStr` varchar(3) CHARACTER SET utf8mb4 NULL,
        `SubStr` varchar(3) CHARACTER SET utf8mb4 NULL,
        `AutoWT` varchar(1) CHARACTER SET utf8mb4 NULL,
        `WTSum` decimal(19,6) NULL,
        `WTSumSC` decimal(19,6) NULL,
        `WTSumFC` decimal(19,6) NULL,
        `WTApplied` decimal(19,6) NULL,
        `WTAppliedS` decimal(19,6) NULL,
        `WTAppliedF` decimal(19,6) NULL,
        `BaseAmnt` decimal(19,6) NULL,
        `BaseAmntSC` decimal(19,6) NULL,
        `BaseAmntFC` decimal(19,6) NULL,
        `BaseVtAt` decimal(19,6) NULL,
        `BaseVtAtSC` decimal(19,6) NULL,
        `BaseVtAtFC` decimal(19,6) NULL,
        `VersionNum` varchar(13) CHARACTER SET utf8mb4 NULL,
        `BaseTrans` int NULL,
        `ResidenNum` varchar(1) CHARACTER SET utf8mb4 NULL,
        `OperatCode` varchar(1) CHARACTER SET utf8mb4 NULL,
        `Ref3` varchar(100) CHARACTER SET utf8mb4 NULL,
        `SSIExmpt` varchar(1) CHARACTER SET utf8mb4 NULL,
        `SignMsg` varchar(16) CHARACTER SET utf8mb4 NULL,
        `SignDigest` varchar(16) CHARACTER SET utf8mb4 NULL,
        `CertifNum` varchar(50) CHARACTER SET utf8mb4 NULL,
        `KeyVersion` int NULL,
        `CUP` int NULL,
        `CIG` int NULL,
        `SupplCode` varchar(254) CHARACTER SET utf8mb4 NULL,
        `SPSrcType` int NULL,
        `SPSrcID` int NULL,
        `SPSrcDLN` int NULL,
        `DeferedTax` varchar(1) CHARACTER SET utf8mb4 NULL,
        `AgrNo` int NULL,
        `SeqNum` int NULL,
        `ECDPosTyp` varchar(1) CHARACTER SET utf8mb4 NULL,
        `RptPeriod` varchar(5) CHARACTER SET utf8mb4 NULL,
        `RptMonth` date NULL,
        `ExTransId` int NULL,
        `PrlLinked` varchar(1) CHARACTER SET utf8mb4 NULL,
        `PTICode` varchar(5) CHARACTER SET utf8mb4 NULL,
        `Letter` varchar(1) CHARACTER SET utf8mb4 NULL,
        `FolNumFrom` int NULL,
        `FolNumTo` int NULL,
        `RepSection` varchar(3) CHARACTER SET utf8mb4 NULL,
        `ExclTaxRep` varchar(1) CHARACTER SET utf8mb4 NULL,
        `IsCoEntry` varchar(1) CHARACTER SET utf8mb4 NULL,
        `SAPPassprt` varchar(16) CHARACTER SET utf8mb4 NULL,
        `AtcEntry` int NULL,
        `Attachment` varchar(16) CHARACTER SET utf8mb4 NULL,
        `EBookable` varchar(1) CHARACTER SET utf8mb4 NULL,
        `DataVers` int NULL,
        `CreatedAt` datetime(6) NULL,
        `U_DocNum` varchar(20) CHARACTER SET utf8mb4 NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
        `IntegrationStatus` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `IntegrationMessage` longtext CHARACTER SET utf8mb4 NULL,
        CONSTRAINT `PK_FTOJDT` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTOPCH` (
        `Id` char(36) COLLATE ascii_general_ci NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `U_FileName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `IntegrationStatus` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `IntegrationMessage` longtext CHARACTER SET utf8mb4 NULL,
        `DocEntry` int NULL,
        `DocNum` int NULL,
        `CardCode` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
        `CardName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `NumAtCard` varchar(100) CHARACTER SET utf8mb4 NULL,
        `DocType` varchar(1) CHARACTER SET utf8mb4 NULL,
        `DocDate` date NOT NULL,
        `DocDueDate` date NOT NULL,
        `TaxDate` date NOT NULL,
        `PaymentTerms` longtext CHARACTER SET utf8mb4 NULL,
        `JrnlMemo` varchar(254) CHARACTER SET utf8mb4 NULL,
        `Comments` varchar(254) CHARACTER SET utf8mb4 NULL,
        `Posted` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `Canceled` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `CancelDate` datetime(6) NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTOPCH` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTORCT` (
        `Id` char(36) COLLATE ascii_general_ci NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `U_FileName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `IntegrationStatus` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `IntegrationMessage` longtext CHARACTER SET utf8mb4 NULL,
        `DocNum` int NULL,
        `CardCode` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
        `CardName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `DocDate` date NULL,
        `CashAccnt` longtext CHARACTER SET utf8mb4 NULL,
        `CashSum` decimal(19,6) NOT NULL,
        `TrsfrAcct` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
        `TrsfrDate` date NULL,
        `TrsfrRef` varchar(15) CHARACTER SET utf8mb4 NULL,
        `TrsfrSum` decimal(19,6) NOT NULL,
        `Canceled` varchar(1) CHARACTER SET utf8mb4 NULL,
        `Series` int NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTORCT` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTORIN` (
        `Id` char(36) COLLATE ascii_general_ci NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `U_FileName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `IntegrationStatus` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `IntegrationMessage` longtext CHARACTER SET utf8mb4 NULL,
        `DocEntry` int NULL,
        `DocNum` int NULL,
        `CardCode` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
        `CardName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `NumAtCard` varchar(100) CHARACTER SET utf8mb4 NULL,
        `DocType` varchar(1) CHARACTER SET utf8mb4 NULL,
        `DocDate` date NOT NULL,
        `DocDueDate` date NOT NULL,
        `TaxDate` date NOT NULL,
        `PaymentTerms` longtext CHARACTER SET utf8mb4 NULL,
        `JrnlMemo` varchar(254) CHARACTER SET utf8mb4 NULL,
        `Comments` varchar(254) CHARACTER SET utf8mb4 NULL,
        `Posted` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `Canceled` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `CancelDate` datetime(6) NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTORIN` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTORPC` (
        `Id` char(36) COLLATE ascii_general_ci NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `U_FileName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `IntegrationStatus` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `IntegrationMessage` longtext CHARACTER SET utf8mb4 NULL,
        `DocEntry` int NULL,
        `DocNum` int NULL,
        `CardCode` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
        `CardName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `NumAtCard` varchar(100) CHARACTER SET utf8mb4 NULL,
        `DocType` varchar(1) CHARACTER SET utf8mb4 NULL,
        `DocDate` date NOT NULL,
        `DocDueDate` date NOT NULL,
        `TaxDate` date NOT NULL,
        `PaymentTerms` longtext CHARACTER SET utf8mb4 NULL,
        `JrnlMemo` varchar(254) CHARACTER SET utf8mb4 NULL,
        `Comments` varchar(254) CHARACTER SET utf8mb4 NULL,
        `Posted` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `Canceled` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `CancelDate` datetime(6) NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTORPC` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTORTI` (
        `Id` char(36) COLLATE ascii_general_ci NOT NULL,
        `DocNum` int NULL,
        `Series` int NULL,
        `PeriodCat` varchar(10) CHARACTER SET utf8mb4 NULL,
        `FinncPriod` int NULL,
        `PostDate` date NULL,
        `DocDate` date NULL,
        `DocStatus` varchar(1) CHARACTER SET utf8mb4 NULL,
        `TransId` int NULL,
        `Comments` varchar(254) CHARACTER SET utf8mb4 NULL,
        `Reference` varchar(32) CHARACTER SET utf8mb4 NULL,
        `ObjType` varchar(20) CHARACTER SET utf8mb4 NULL,
        `Currency` varchar(3) CHARACTER SET utf8mb4 NULL,
        `DocRate` decimal(19,6) NULL,
        `SysRate` decimal(19,6) NULL,
        `PIndicator` varchar(10) CHARACTER SET utf8mb4 NULL,
        `DocTotal` decimal(19,6) NULL,
        `DocTotalFC` decimal(19,6) NULL,
        `DocTotalSy` decimal(19,6) NULL,
        `DataSource` varchar(1) CHARACTER SET utf8mb4 NULL,
        `UserSign` int NULL,
        `LogInstanc` int NULL,
        `CreateDate` date NULL,
        `UserSign2` int NULL,
        `UpdateDate` date NULL,
        `TransType` varchar(20) CHARACTER SET utf8mb4 NULL,
        `CreatedBy` int NULL,
        `JrnlMemo` varchar(254) CHARACTER SET utf8mb4 NULL,
        `AssetDate` date NULL,
        `CurSource` varchar(1) CHARACTER SET utf8mb4 NULL,
        `DocType` varchar(15) CHARACTER SET utf8mb4 NULL,
        `PrjSmarz` varchar(1) CHARACTER SET utf8mb4 NULL,
        `DstRlSmarz` varchar(1) CHARACTER SET utf8mb4 NULL,
        `ManDprType` varchar(15) CHARACTER SET utf8mb4 NULL,
        `Handwrtten` varchar(1) CHARACTER SET utf8mb4 NULL,
        `CancelDate` date NULL,
        `DprArea` varchar(15) CHARACTER SET utf8mb4 NULL,
        `BPLId` int NULL,
        `BaseRef` varchar(11) CHARACTER SET utf8mb4 NULL,
        `LVARetire` varchar(1) CHARACTER SET utf8mb4 NULL,
        `CancelOpt` int NULL,
        `BPLName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `VatRegNum` varchar(32) CHARACTER SET utf8mb4 NULL,
        `GdsMovType` varchar(2) CHARACTER SET utf8mb4 NULL,
        `CreatedAt` datetime(6) NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
        `IntegrationStatus` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `IntegrationMessage` longtext CHARACTER SET utf8mb4 NULL,
        CONSTRAINT `PK_FTORTI` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTACQ1` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `LineNum` int NOT NULL,
        `ItemCode` varchar(50) CHARACTER SET utf8mb4 NULL,
        `AcctCode` varchar(15) CHARACTER SET utf8mb4 NULL,
        `Quantity` decimal(19,6) NULL,
        `LineTotal` decimal(19,6) NULL,
        `TotalFrgn` decimal(19,6) NULL,
        `TotalSys` decimal(19,6) NULL,
        `DprArea` varchar(15) CHARACTER SET utf8mb4 NULL,
        `Remarks` varchar(100) CHARACTER SET utf8mb4 NULL,
        `LogInstanc` int NULL,
        `NewItemCod` varchar(50) CHARACTER SET utf8mb4 NULL,
        `Partial` varchar(1) CHARACTER SET utf8mb4 NULL,
        `APC` decimal(19,6) NULL,
        `NewAstCls` varchar(20) CHARACTER SET utf8mb4 NULL,
        `ObjType` varchar(20) CHARACTER SET utf8mb4 NULL,
        `TransType` varchar(4) CHARACTER SET utf8mb4 NULL,
        `OcrCode` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode2` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode3` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode4` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode5` varchar(8) CHARACTER SET utf8mb4 NULL,
        `Project` varchar(20) CHARACTER SET utf8mb4 NULL,
        `CreatedAt` datetime(6) NULL,
        CONSTRAINT `PK_FTACQ1` PRIMARY KEY (`HeaderId`, `LineNum`),
        CONSTRAINT `FK_FTACQ1_FTOACQ_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTOACQ` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTCRD1` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `Address` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
        `Country` varchar(3) CHARACTER SET utf8mb4 NULL,
        `ZipCode` varchar(20) CHARACTER SET utf8mb4 NULL,
        `City` varchar(100) CHARACTER SET utf8mb4 NULL,
        `State` varchar(3) CHARACTER SET utf8mb4 NULL,
        `Street` varchar(100) CHARACTER SET utf8mb4 NULL,
        `Block` varchar(100) CHARACTER SET utf8mb4 NULL,
        `AdresType` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `CreatedAt` datetime(6) NOT NULL,
        `U_BranchID` varchar(255) CHARACTER SET utf8mb4 NULL,
        `U_BranchName` varchar(255) CHARACTER SET utf8mb4 NULL,
        `U_LngAddrs1` varchar(255) CHARACTER SET utf8mb4 NULL,
        `U_LngAddrs2` varchar(255) CHARACTER SET utf8mb4 NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        CONSTRAINT `PK_FTCRD1` PRIMARY KEY (`HeaderId`, `Address`),
        CONSTRAINT `FK_FTCRD1_FTOCRD_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTOCRD` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTOCPR` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `Name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
        `FirstName` varchar(50) CHARACTER SET utf8mb4 NULL,
        `Position` varchar(90) CHARACTER SET utf8mb4 NULL,
        `Title` varchar(10) CHARACTER SET utf8mb4 NULL,
        `Profession` varchar(50) CHARACTER SET utf8mb4 NULL,
        `Tel1` varchar(50) CHARACTER SET utf8mb4 NULL,
        `Fax` varchar(50) CHARACTER SET utf8mb4 NULL,
        `Notes1` varchar(100) CHARACTER SET utf8mb4 NULL,
        `Email` varchar(100) CHARACTER SET utf8mb4 NULL,
        `Notes2` varchar(100) CHARACTER SET utf8mb4 NULL,
        `Gender` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `BirthDate` date NULL,
        `CreatedAt` datetime(6) NOT NULL,
        `U_NameLocal` varchar(255) CHARACTER SET utf8mb4 NULL,
        `U_Email3` varchar(255) CHARACTER SET utf8mb4 NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        CONSTRAINT `PK_FTOCPR` PRIMARY KEY (`HeaderId`, `Name`),
        CONSTRAINT `FK_FTOCPR_FTOCRD_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTOCRD` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTDPI1` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `LineNum` int NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `U_BaseRef` varchar(255) CHARACTER SET utf8mb4 NULL,
        `U_BaseType` int NULL,
        `U_BaseLine` int NULL,
        `U_LngDscrptn` longtext CHARACTER SET utf8mb4 NULL,
        `U_Period` varchar(10) CHARACTER SET utf8mb4 NULL,
        `BaseType` int NULL,
        `BaseEntry` int NULL,
        `BaseRef` int NULL,
        `BaseLine` int NULL,
        `ItemCode` varchar(50) CHARACTER SET utf8mb4 NULL,
        `Description` varchar(200) CHARACTER SET utf8mb4 NULL,
        `AccountCode` varchar(15) CHARACTER SET utf8mb4 NULL,
        `DiscPrcnt` decimal(19,6) NULL,
        `Quantity` decimal(19,6) NULL,
        `Price` decimal(19,6) NULL,
        `VatGroup` varchar(8) CHARACTER SET utf8mb4 NULL,
        `PriceAfVAT` decimal(19,6) NULL,
        `WTLiable` longtext CHARACTER SET utf8mb4 NULL,
        `LineTotal` decimal(19,6) NULL,
        `GrossTotal` decimal(19,6) NULL,
        `OcrCode` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode2` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode3` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode4` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode5` varchar(8) CHARACTER SET utf8mb4 NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTDPI1` PRIMARY KEY (`HeaderId`, `LineNum`),
        CONSTRAINT `FK_FTDPI1_FTODPI_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTODPI` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTDPI5` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `LineNum` int NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `WTCode` varchar(4) CHARACTER SET utf8mb4 NULL,
        `TaxbleAmnt` decimal(19,6) NULL,
        `WTAmnt` decimal(19,6) NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTDPI5` PRIMARY KEY (`HeaderId`, `LineNum`),
        CONSTRAINT `FK_FTDPI5_FTODPI_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTODPI` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTINV1` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `LineNum` int NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `U_BaseRef` varchar(255) CHARACTER SET utf8mb4 NULL,
        `U_BaseType` int NULL,
        `U_BaseLine` int NULL,
        `U_LngDscrptn` longtext CHARACTER SET utf8mb4 NULL,
        `U_Period` varchar(10) CHARACTER SET utf8mb4 NULL,
        `BaseType` int NULL,
        `BaseEntry` int NULL,
        `BaseRef` int NULL,
        `BaseLine` int NULL,
        `ItemCode` varchar(50) CHARACTER SET utf8mb4 NULL,
        `Description` varchar(200) CHARACTER SET utf8mb4 NULL,
        `AccountCode` varchar(15) CHARACTER SET utf8mb4 NULL,
        `DiscPrcnt` decimal(19,6) NULL,
        `Quantity` decimal(19,6) NULL,
        `Price` decimal(19,6) NULL,
        `VatGroup` varchar(8) CHARACTER SET utf8mb4 NULL,
        `PriceAfVAT` decimal(19,6) NULL,
        `WTLiable` longtext CHARACTER SET utf8mb4 NULL,
        `LineTotal` decimal(19,6) NULL,
        `GrossTotal` decimal(19,6) NULL,
        `OcrCode` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode2` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode3` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode4` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode5` varchar(8) CHARACTER SET utf8mb4 NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTINV1` PRIMARY KEY (`HeaderId`, `LineNum`),
        CONSTRAINT `FK_FTINV1_FTOINV_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTOINV` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTINV5` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `LineNum` int NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `WTCode` varchar(4) CHARACTER SET utf8mb4 NULL,
        `TaxbleAmnt` decimal(19,6) NULL,
        `WTAmnt` decimal(19,6) NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTINV5` PRIMARY KEY (`HeaderId`, `LineNum`),
        CONSTRAINT `FK_FTINV5_FTOINV_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTOINV` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTINV9` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `LineNum` int NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `DrawnSum` decimal(19,6) NOT NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTINV9` PRIMARY KEY (`HeaderId`, `LineNum`),
        CONSTRAINT `FK_FTINV9_FTOINV_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTOINV` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTITM7` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `ItemCode` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
        `VisOrder` int NOT NULL,
        `PrediodCat` varchar(10) CHARACTER SET utf8mb4 NULL,
        `DprArea` varchar(15) CHARACTER SET utf8mb4 NULL,
        `UsefulLife` int NOT NULL,
        `DprStart` date NOT NULL,
        `DprEnd` date NULL,
        `RemainLife` decimal(19,6) NULL,
        `DprType` varchar(15) CHARACTER SET utf8mb4 NULL,
        `DprTypeC` varchar(15) CHARACTER SET utf8mb4 NULL,
        `UsefulLfeC` int NULL,
        `LogInstanc` int NULL,
        `ObjType` varchar(20) CHARACTER SET utf8mb4 NULL,
        `RemainDays` decimal(19,6) NULL,
        `TotalUnits` int NULL,
        `RemainUnit` int NULL,
        `StanUnit` int NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTITM7` PRIMARY KEY (`HeaderId`, `VisOrder`, `ItemCode`),
        CONSTRAINT `FK_FTITM7_FTOITM_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTOITM` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTJDT1` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `LineId` int NOT NULL,
        `TransId` int NULL,
        `Account` varchar(15) CHARACTER SET utf8mb4 NULL,
        `Debit` decimal(19,6) NULL,
        `Credit` decimal(19,6) NULL,
        `SYSCred` decimal(19,6) NULL,
        `SYSDeb` decimal(19,6) NULL,
        `FCDebit` decimal(19,6) NULL,
        `FCCredit` decimal(19,6) NULL,
        `FCCurrency` varchar(3) CHARACTER SET utf8mb4 NULL,
        `DueDate` date NULL,
        `SourceID` int NULL,
        `SourceLine` int NULL,
        `ShortName` varchar(15) CHARACTER SET utf8mb4 NULL,
        `IntrnMatch` int NULL,
        `ExtrMatch` int NULL,
        `ContraAct` varchar(15) CHARACTER SET utf8mb4 NULL,
        `LineMemo` varchar(254) CHARACTER SET utf8mb4 NULL,
        `Ref3Line` varchar(100) CHARACTER SET utf8mb4 NULL,
        `TransType` varchar(20) CHARACTER SET utf8mb4 NULL,
        `RefDate` date NULL,
        `Ref2Date` date NULL,
        `Ref1` varchar(100) CHARACTER SET utf8mb4 NULL,
        `Ref2` varchar(100) CHARACTER SET utf8mb4 NULL,
        `CreatedBy` int NULL,
        `BaseRef` varchar(11) CHARACTER SET utf8mb4 NULL,
        `Project` varchar(20) CHARACTER SET utf8mb4 NULL,
        `TransCode` varchar(4) CHARACTER SET utf8mb4 NULL,
        `ProfitCode` varchar(8) CHARACTER SET utf8mb4 NULL,
        `TaxDate` date NULL,
        `SystemRate` decimal(19,6) NULL,
        `MthDate` date NULL,
        `ToMthSum` decimal(19,6) NULL,
        `UserSign` int NULL,
        `BatchNum` int NULL,
        `FinncPriod` int NULL,
        `RelTransId` int NULL,
        `RelLineID` int NULL,
        `RelType` varchar(1) CHARACTER SET utf8mb4 NULL,
        `LogInstanc` int NULL,
        `VatGroup` varchar(8) CHARACTER SET utf8mb4 NULL,
        `BaseSum` decimal(19,6) NULL,
        `VatRate` decimal(19,6) NULL,
        `Indicator` varchar(2) CHARACTER SET utf8mb4 NULL,
        `AdjTran` varchar(1) CHARACTER SET utf8mb4 NULL,
        `RevSource` varchar(1) CHARACTER SET utf8mb4 NULL,
        `ObjType` varchar(20) CHARACTER SET utf8mb4 NULL,
        `VatDate` date NULL,
        `PaymentRef` varchar(27) CHARACTER SET utf8mb4 NULL,
        `SYSBaseSum` decimal(19,6) NULL,
        `MultMatch` int NULL,
        `VatLine` varchar(1) CHARACTER SET utf8mb4 NULL,
        `VatAmount` decimal(19,6) NULL,
        `SYSVatSum` decimal(19,6) NULL,
        `Closed` varchar(1) CHARACTER SET utf8mb4 NULL,
        `GrossValue` decimal(19,6) NULL,
        `CheckAbs` int NULL,
        `LineType` int NULL,
        `DebCred` varchar(1) CHARACTER SET utf8mb4 NULL,
        `SequenceNr` int NULL,
        `StornoAcc` varchar(15) CHARACTER SET utf8mb4 NULL,
        `BalDueDeb` decimal(19,6) NULL,
        `BalDueCred` decimal(19,6) NULL,
        `BalFcDeb` decimal(19,6) NULL,
        `BalFcCred` decimal(19,6) NULL,
        `BalScDeb` decimal(19,6) NULL,
        `BalScCred` decimal(19,6) NULL,
        `IsNet` varchar(1) CHARACTER SET utf8mb4 NULL,
        `DunWizBlck` varchar(1) CHARACTER SET utf8mb4 NULL,
        `DunnLevel` int NULL,
        `DunDate` date NULL,
        `TaxType` int NULL,
        `TaxPostAcc` varchar(1) CHARACTER SET utf8mb4 NULL,
        `StaCode` varchar(8) CHARACTER SET utf8mb4 NULL,
        `StaType` int NULL,
        `TaxCode` varchar(8) CHARACTER SET utf8mb4 NULL,
        `ValidFrom` date NULL,
        `GrossValFc` decimal(19,6) NULL,
        `LvlUpdDate` date NULL,
        `OcrCode2` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode3` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode4` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode5` varchar(8) CHARACTER SET utf8mb4 NULL,
        `MIEntry` int NULL,
        `MIVEntry` int NULL,
        `ClsInTP` int NULL,
        `CenVatCom` int NULL,
        `MatType` int NULL,
        `PstngType` int NULL,
        `ValidFrom2` date NULL,
        `ValidFrom3` date NULL,
        `ValidFrom4` date NULL,
        `ValidFrom5` date NULL,
        `Location` int NULL,
        `WTaxCode` varchar(4) CHARACTER SET utf8mb4 NULL,
        `EquVatRate` decimal(19,6) NULL,
        `EquVatSum` decimal(19,6) NULL,
        `SYSEquSum` decimal(19,6) NULL,
        `TotalVat` decimal(19,6) NULL,
        `SYSTVat` decimal(19,6) NULL,
        `WTLiable` varchar(1) CHARACTER SET utf8mb4 NULL,
        `WTLine` varchar(1) CHARACTER SET utf8mb4 NULL,
        `WTApplied` decimal(19,6) NULL,
        `WTAppliedS` decimal(19,6) NULL,
        `WTAppliedF` decimal(19,6) NULL,
        `WTSum` decimal(19,6) NULL,
        `WTSumFC` decimal(19,6) NULL,
        `WTSumSC` decimal(19,6) NULL,
        `PayBlock` varchar(1) CHARACTER SET utf8mb4 NULL,
        `PayBlckRef` int NULL,
        `LicTradNum` varchar(32) CHARACTER SET utf8mb4 NULL,
        `InterimTyp` int NULL,
        `DprId` int NULL,
        `MatchRef` varchar(20) CHARACTER SET utf8mb4 NULL,
        `Ordered` varchar(1) CHARACTER SET utf8mb4 NULL,
        `CUP` int NULL,
        `CIG` int NULL,
        `BPLId` int NULL,
        `BPLName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `VatRegNum` varchar(32) CHARACTER SET utf8mb4 NULL,
        `SLEDGERF` varchar(1) CHARACTER SET utf8mb4 NULL,
        `InitRef2` varchar(100) CHARACTER SET utf8mb4 NULL,
        `InitRef3Ln` varchar(27) CHARACTER SET utf8mb4 NULL,
        `ExpUUID` varchar(50) CHARACTER SET utf8mb4 NULL,
        `ExpOPType` varchar(1) CHARACTER SET utf8mb4 NULL,
        `ExTransId` int NULL,
        `DocArr` int NULL,
        `DocLine` int NULL,
        `MYFtype` varchar(2) CHARACTER SET utf8mb4 NULL,
        `DocEntry` int NULL,
        `DocNum` int NULL,
        `DocType` varchar(20) CHARACTER SET utf8mb4 NULL,
        `DocSubType` varchar(2) CHARACTER SET utf8mb4 NULL,
        `RmrkTmpt` int NULL,
        `CemCode` varchar(20) CHARACTER SET utf8mb4 NULL,
        `InClassCat` int NULL,
        `InClassTyp` int NULL,
        `ExClassCat` int NULL,
        `ExClassTyp` int NULL,
        `VATClassCa` int NULL,
        `VATClassTy` int NULL,
        `EVatCate` int NULL,
        `EWtPercCat` int NULL,
        `EWtAmount` decimal(19,6) NULL,
        `EBVatExCau` int NULL,
        `CreatedAt` datetime(6) NULL,
        `U_InvDate` date NULL,
        `U_InvNum` varchar(20) CHARACTER SET utf8mb4 NULL,
        `U_VatBase` decimal(19,6) NULL,
        `U_TransType` varchar(20) CHARACTER SET utf8mb4 NULL,
        `U_xWTCode` varchar(10) CHARACTER SET utf8mb4 NULL,
        `U_xWTVendor` varchar(20) CHARACTER SET utf8mb4 NULL,
        `U_xSupplierName` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_xCardTyp` varchar(100) CHARACTER SET utf8mb4 NULL,
        `U_Address` varchar(254) CHARACTER SET utf8mb4 NULL,
        `U_TIN` varchar(20) CHARACTER SET utf8mb4 NULL,
        `U_TIN1` varchar(20) CHARACTER SET utf8mb4 NULL,
        `U_TIN2` varchar(20) CHARACTER SET utf8mb4 NULL,
        `U_TaxAmt` decimal(19,6) NULL,
        `U_TaxableAmt` decimal(19,6) NULL,
        `U_SrceDocNo` varchar(20) CHARACTER SET utf8mb4 NULL,
        `U_ORNo` varchar(20) CHARACTER SET utf8mb4 NULL,
        `U_SOA` varchar(20) CHARACTER SET utf8mb4 NULL,
        `U_CheckNo` varchar(20) CHARACTER SET utf8mb4 NULL,
        `U_CheckDate` date NULL,
        `U_APVNo` varchar(20) CHARACTER SET utf8mb4 NULL,
        `U_VSIRefNo` varchar(20) CHARACTER SET utf8mb4 NULL,
        `U_Contract` varchar(30) CHARACTER SET utf8mb4 NULL,
        `CardType` varchar(1) CHARACTER SET utf8mb4 NOT NULL,
        `GroupNum` int NOT NULL,
        `E_mail` varchar(100) CHARACTER SET utf8mb4 NULL,
        `Phone1` varchar(50) CHARACTER SET utf8mb4 NULL,
        `CntctPrsn` varchar(90) CHARACTER SET utf8mb4 NULL,
        CONSTRAINT `PK_FTJDT1` PRIMARY KEY (`HeaderId`, `LineId`),
        CONSTRAINT `FK_FTJDT1_FTOJDT_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTOJDT` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTPCH1` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `LineNum` int NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `U_BaseRef` varchar(255) CHARACTER SET utf8mb4 NULL,
        `U_BaseType` int NULL,
        `U_BaseLine` int NULL,
        `U_LngDscrptn` longtext CHARACTER SET utf8mb4 NULL,
        `U_Period` varchar(10) CHARACTER SET utf8mb4 NULL,
        `BaseType` int NULL,
        `BaseEntry` int NULL,
        `BaseRef` int NULL,
        `BaseLine` int NULL,
        `ItemCode` varchar(50) CHARACTER SET utf8mb4 NULL,
        `Description` varchar(200) CHARACTER SET utf8mb4 NULL,
        `AccountCode` varchar(15) CHARACTER SET utf8mb4 NULL,
        `DiscPrcnt` decimal(19,6) NULL,
        `Quantity` decimal(19,6) NULL,
        `Price` decimal(19,6) NULL,
        `VatGroup` varchar(8) CHARACTER SET utf8mb4 NULL,
        `PriceAfVAT` decimal(19,6) NULL,
        `WTLiable` longtext CHARACTER SET utf8mb4 NULL,
        `LineTotal` decimal(19,6) NULL,
        `GrossTotal` decimal(19,6) NULL,
        `OcrCode` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode2` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode3` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode4` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode5` varchar(8) CHARACTER SET utf8mb4 NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTPCH1` PRIMARY KEY (`HeaderId`, `LineNum`),
        CONSTRAINT `FK_FTPCH1_FTOPCH_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTOPCH` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTPCH5` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `LineNum` int NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `WTCode` varchar(4) CHARACTER SET utf8mb4 NULL,
        `TaxbleAmnt` decimal(19,6) NULL,
        `WTAmnt` decimal(19,6) NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTPCH5` PRIMARY KEY (`HeaderId`, `LineNum`),
        CONSTRAINT `FK_FTPCH5_FTOPCH_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTOPCH` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTRCT2` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `LineNum` int NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `InvType` int NOT NULL,
        `SumApplied` decimal(19,6) NOT NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTRCT2` PRIMARY KEY (`HeaderId`, `LineNum`),
        CONSTRAINT `FK_FTRCT2_FTORCT_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTORCT` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTRIN1` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `LineNum` int NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `U_BaseRef` varchar(255) CHARACTER SET utf8mb4 NULL,
        `U_BaseType` int NULL,
        `U_BaseLine` int NULL,
        `U_LngDscrptn` longtext CHARACTER SET utf8mb4 NULL,
        `U_Period` varchar(10) CHARACTER SET utf8mb4 NULL,
        `BaseType` int NULL,
        `BaseEntry` int NULL,
        `BaseRef` int NULL,
        `BaseLine` int NULL,
        `ItemCode` varchar(50) CHARACTER SET utf8mb4 NULL,
        `Description` varchar(200) CHARACTER SET utf8mb4 NULL,
        `AccountCode` varchar(15) CHARACTER SET utf8mb4 NULL,
        `DiscPrcnt` decimal(19,6) NULL,
        `Quantity` decimal(19,6) NULL,
        `Price` decimal(19,6) NULL,
        `VatGroup` varchar(8) CHARACTER SET utf8mb4 NULL,
        `PriceAfVAT` decimal(19,6) NULL,
        `WTLiable` longtext CHARACTER SET utf8mb4 NULL,
        `LineTotal` decimal(19,6) NULL,
        `GrossTotal` decimal(19,6) NULL,
        `OcrCode` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode2` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode3` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode4` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode5` varchar(8) CHARACTER SET utf8mb4 NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTRIN1` PRIMARY KEY (`HeaderId`, `LineNum`),
        CONSTRAINT `FK_FTRIN1_FTORIN_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTORIN` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTRIN5` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `LineNum` int NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `WTCode` varchar(4) CHARACTER SET utf8mb4 NULL,
        `TaxbleAmnt` decimal(19,6) NULL,
        `WTAmnt` decimal(19,6) NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTRIN5` PRIMARY KEY (`HeaderId`, `LineNum`),
        CONSTRAINT `FK_FTRIN5_FTORIN_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTORIN` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTRPC1` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `LineNum` int NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `U_BaseRef` varchar(255) CHARACTER SET utf8mb4 NULL,
        `U_BaseType` int NULL,
        `U_BaseLine` int NULL,
        `U_LngDscrptn` longtext CHARACTER SET utf8mb4 NULL,
        `U_Period` varchar(10) CHARACTER SET utf8mb4 NULL,
        `BaseType` int NULL,
        `BaseEntry` int NULL,
        `BaseRef` int NULL,
        `BaseLine` int NULL,
        `ItemCode` varchar(50) CHARACTER SET utf8mb4 NULL,
        `Description` varchar(200) CHARACTER SET utf8mb4 NULL,
        `AccountCode` varchar(15) CHARACTER SET utf8mb4 NULL,
        `DiscPrcnt` decimal(19,6) NULL,
        `Quantity` decimal(19,6) NULL,
        `Price` decimal(19,6) NULL,
        `VatGroup` varchar(8) CHARACTER SET utf8mb4 NULL,
        `PriceAfVAT` decimal(19,6) NULL,
        `WTLiable` longtext CHARACTER SET utf8mb4 NULL,
        `LineTotal` decimal(19,6) NULL,
        `GrossTotal` decimal(19,6) NULL,
        `OcrCode` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode2` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode3` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode4` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode5` varchar(8) CHARACTER SET utf8mb4 NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTRPC1` PRIMARY KEY (`HeaderId`, `LineNum`),
        CONSTRAINT `FK_FTRPC1_FTORPC_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTORPC` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTRPC5` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `LineNum` int NOT NULL,
        `U_RefNum` varchar(30) CHARACTER SET utf8mb4 NULL,
        `WTCode` varchar(4) CHARACTER SET utf8mb4 NULL,
        `TaxbleAmnt` decimal(19,6) NULL,
        `WTAmnt` decimal(19,6) NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTRPC5` PRIMARY KEY (`HeaderId`, `LineNum`),
        CONSTRAINT `FK_FTRPC5_FTORPC_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTORPC` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTRTI1` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `LineNum` int NOT NULL,
        `ItemCode` varchar(50) CHARACTER SET utf8mb4 NULL,
        `AcctCode` varchar(15) CHARACTER SET utf8mb4 NULL,
        `Quantity` decimal(19,6) NULL,
        `LineTotal` decimal(19,6) NULL,
        `TotalFrgn` decimal(19,6) NULL,
        `TotalSys` decimal(19,6) NULL,
        `DprArea` varchar(15) CHARACTER SET utf8mb4 NULL,
        `Remarks` varchar(100) CHARACTER SET utf8mb4 NULL,
        `LogInstanc` int NULL,
        `NewItemCod` varchar(50) CHARACTER SET utf8mb4 NULL,
        `Partial` varchar(1) CHARACTER SET utf8mb4 NULL,
        `APC` decimal(19,6) NULL,
        `NewAstCls` varchar(20) CHARACTER SET utf8mb4 NULL,
        `ObjType` varchar(20) CHARACTER SET utf8mb4 NULL,
        `TransType` varchar(4) CHARACTER SET utf8mb4 NULL,
        `OcrCode` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode2` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode3` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode4` varchar(8) CHARACTER SET utf8mb4 NULL,
        `OcrCode5` varchar(8) CHARACTER SET utf8mb4 NULL,
        `Project` varchar(20) CHARACTER SET utf8mb4 NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTRTI1` PRIMARY KEY (`HeaderId`, `LineNum`),
        CONSTRAINT `FK_FTRTI1_FTORTI_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTORTI` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE TABLE `FTRTI2` (
        `HeaderId` char(36) COLLATE ascii_general_ci NOT NULL,
        `LineNum` int NOT NULL,
        `DprArea` varchar(15) CHARACTER SET utf8mb4 NULL,
        `JrnlMemo` varchar(254) CHARACTER SET utf8mb4 NULL,
        `ObjType` varchar(20) CHARACTER SET utf8mb4 NULL,
        `LogInstanc` int NULL,
        `TransNum` int NULL,
        `JrnlMemo1` varchar(254) CHARACTER SET utf8mb4 NULL,
        `TransNum1` int NULL,
        `CreatedAt` datetime(6) NOT NULL,
        CONSTRAINT `PK_FTRTI2` PRIMARY KEY (`HeaderId`, `LineNum`),
        CONSTRAINT `FK_FTRTI2_FTORTI_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `FTORTI` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE UNIQUE INDEX `IX_FTDPI5_HeaderId` ON `FTDPI5` (`HeaderId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE UNIQUE INDEX `IX_FTINV5_HeaderId` ON `FTINV5` (`HeaderId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    CREATE UNIQUE INDEX `IX_FTPCH5_HeaderId` ON `FTPCH5` (`HeaderId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20241218091806_Initialization') THEN

    INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
    VALUES ('20241218091806_Initialization', '8.0.8');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

COMMIT;

