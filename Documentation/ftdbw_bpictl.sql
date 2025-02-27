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

/*Table structure for table `__efmigrationshistory` */

DROP TABLE IF EXISTS `__efmigrationshistory`;

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `__efmigrationshistory` */

insert  into `__efmigrationshistory`(`MigrationId`,`ProductVersion`) values 
('20241218091806_Initialization','8.0.8');

/*Table structure for table `ftacq1` */

DROP TABLE IF EXISTS `ftacq1`;

CREATE TABLE `ftacq1` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LineNum` int(11) NOT NULL,
  `ItemCode` varchar(50) DEFAULT NULL,
  `AcctCode` varchar(15) DEFAULT NULL,
  `Quantity` decimal(19,6) DEFAULT NULL,
  `LineTotal` decimal(19,6) DEFAULT NULL,
  `TotalFrgn` decimal(19,6) DEFAULT NULL,
  `TotalSys` decimal(19,6) DEFAULT NULL,
  `DprArea` varchar(15) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `LogInstanc` int(11) DEFAULT NULL,
  `NewItemCod` varchar(50) DEFAULT NULL,
  `Partial` varchar(1) DEFAULT NULL,
  `APC` decimal(19,6) DEFAULT NULL,
  `NewAstCls` varchar(20) DEFAULT NULL,
  `ObjType` varchar(20) DEFAULT NULL,
  `TransType` varchar(4) DEFAULT NULL,
  `OcrCode` varchar(8) DEFAULT NULL,
  `OcrCode2` varchar(8) DEFAULT NULL,
  `OcrCode3` varchar(8) DEFAULT NULL,
  `OcrCode4` varchar(8) DEFAULT NULL,
  `OcrCode5` varchar(8) DEFAULT NULL,
  `Project` varchar(20) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`HeaderId`,`LineNum`),
  CONSTRAINT `FK_FTACQ1_FTOACQ_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftoacq` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftacq1` */

insert  into `ftacq1`(`HeaderId`,`LineNum`,`ItemCode`,`AcctCode`,`Quantity`,`LineTotal`,`TotalFrgn`,`TotalSys`,`DprArea`,`Remarks`,`LogInstanc`,`NewItemCod`,`Partial`,`APC`,`NewAstCls`,`ObjType`,`TransType`,`OcrCode`,`OcrCode2`,`OcrCode3`,`OcrCode4`,`OcrCode5`,`Project`,`CreatedAt`) values 
('08dd1fcb-9758-4f76-8201-26cb45865fe8',0,'V0006261',NULL,1.000000,517857.140000,NULL,NULL,NULL,NULL,0,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('08dd1fcc-26d9-444a-8421-81b743f91dcb',0,'FA1219003',NULL,1.000000,517857.140000,NULL,NULL,NULL,NULL,0,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('08dd1fcc-8309-4707-8b9a-023c1509a684',0,'FA1219004',NULL,1.000000,517857.140000,NULL,NULL,NULL,NULL,0,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('08dd1fd5-b89e-4f6e-8ca3-91dbfa660bd7',0,'FA1219004',NULL,1.000000,517857.140000,NULL,NULL,NULL,NULL,0,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('08dd1fd6-9ed5-4738-828d-d5b51ffba477',0,'FA1219004',NULL,1.000000,517857.140000,NULL,NULL,NULL,NULL,0,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('08dd1fd8-8b08-46cd-836a-b3173579c866',0,'FA1219004',NULL,1.000000,517857.140000,NULL,NULL,NULL,NULL,0,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('08dd200e-76f6-48c5-885c-b54131d3da72',0,'FA12190010',NULL,1.000000,517857.140000,NULL,NULL,NULL,NULL,0,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('08dd200e-ed61-493d-8fe0-3f3c224d321f',0,'FA12190011',NULL,1.000000,517857.140000,NULL,NULL,NULL,NULL,0,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `ftcrd1` */

DROP TABLE IF EXISTS `ftcrd1`;

CREATE TABLE `ftcrd1` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Country` varchar(3) DEFAULT NULL,
  `ZipCode` varchar(20) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(3) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `Block` varchar(100) DEFAULT NULL,
  `AdresType` varchar(1) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `U_BranchID` varchar(255) DEFAULT NULL,
  `U_BranchName` varchar(255) DEFAULT NULL,
  `U_LngAddrs1` varchar(255) DEFAULT NULL,
  `U_LngAddrs2` varchar(255) DEFAULT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`HeaderId`,`Address`),
  CONSTRAINT `FK_FTCRD1_FTOCRD_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftocrd` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftcrd1` */

/*Table structure for table `ftdpi1` */

DROP TABLE IF EXISTS `ftdpi1`;

CREATE TABLE `ftdpi1` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LineNum` int(11) NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `U_BaseRef` varchar(255) DEFAULT NULL,
  `U_BaseType` int(11) DEFAULT NULL,
  `U_BaseLine` int(11) DEFAULT NULL,
  `U_LngDscrptn` longtext DEFAULT NULL,
  `U_Period` varchar(10) DEFAULT NULL,
  `BaseType` int(11) DEFAULT NULL,
  `BaseEntry` int(11) DEFAULT NULL,
  `BaseRef` int(11) DEFAULT NULL,
  `BaseLine` int(11) DEFAULT NULL,
  `ItemCode` varchar(50) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `AccountCode` varchar(15) DEFAULT NULL,
  `DiscPrcnt` decimal(19,6) DEFAULT NULL,
  `Quantity` decimal(19,6) DEFAULT NULL,
  `Price` decimal(19,6) DEFAULT NULL,
  `VatGroup` varchar(8) DEFAULT NULL,
  `PriceAfVAT` decimal(19,6) DEFAULT NULL,
  `WTLiable` longtext DEFAULT NULL,
  `LineTotal` decimal(19,6) DEFAULT NULL,
  `GrossTotal` decimal(19,6) DEFAULT NULL,
  `OcrCode` varchar(8) DEFAULT NULL,
  `OcrCode2` varchar(8) DEFAULT NULL,
  `OcrCode3` varchar(8) DEFAULT NULL,
  `OcrCode4` varchar(8) DEFAULT NULL,
  `OcrCode5` varchar(8) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`HeaderId`,`LineNum`),
  CONSTRAINT `FK_FTDPI1_FTODPI_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftodpi` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftdpi1` */

insert  into `ftdpi1`(`HeaderId`,`LineNum`,`U_RefNum`,`U_BaseRef`,`U_BaseType`,`U_BaseLine`,`U_LngDscrptn`,`U_Period`,`BaseType`,`BaseEntry`,`BaseRef`,`BaseLine`,`ItemCode`,`Description`,`AccountCode`,`DiscPrcnt`,`Quantity`,`Price`,`VatGroup`,`PriceAfVAT`,`WTLiable`,`LineTotal`,`GrossTotal`,`OcrCode`,`OcrCode2`,`OcrCode3`,`OcrCode4`,`OcrCode5`,`CreatedAt`) values 
('08dd345b-744f-4b8b-8a9c-e5c88f91a7ed',0,'1126003',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 13:22:35.395872'),
('08dd345b-744f-4b8b-8a9c-e5c88f91a7ed',1,'1126003',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 13:22:35.395872'),
('08dd345b-744f-4b8b-8a9c-e5c88f91a7ed',2,'1126003',NULL,NULL,NULL,'Long Description 3','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 13:22:35.395872'),
('08dd345b-cfc9-4d5f-86ac-5402408830f6',0,'1126004',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 13:25:08.921990'),
('08dd345b-cfc9-4d5f-86ac-5402408830f6',1,'1126004',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 13:25:08.921990'),
('08dd345b-cfc9-4d5f-86ac-5402408830f6',2,'1126004',NULL,NULL,NULL,'Long Description 3','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 13:25:08.921990'),
('08dd345c-1df2-416d-84cf-a166c97b7c46',0,'11260031',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 13:27:20.050799'),
('08dd345c-1df2-416d-84cf-a166c97b7c46',1,'11260031',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 13:27:20.050799'),
('08dd345c-1df2-416d-84cf-a166c97b7c46',2,'11260031',NULL,NULL,NULL,'Long Description 3','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 13:27:20.050799'),
('08dd3478-827a-42a5-8b09-8b545fa2b298',0,'11260031',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 16:50:34.567032'),
('08dd3478-827a-42a5-8b09-8b545fa2b298',1,'11260031',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 16:50:34.567032'),
('08dd3478-827a-42a5-8b09-8b545fa2b298',2,'11260031',NULL,NULL,NULL,'Long Description 3','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 16:50:34.567032'),
('08dd3479-1d0a-4e84-830e-491a18099965',0,'11260031',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 16:54:53.869326'),
('08dd3479-1d0a-4e84-830e-491a18099965',1,'11260031',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 16:54:53.869326'),
('08dd3479-1d0a-4e84-830e-491a18099965',2,'11260031',NULL,NULL,NULL,'Long Description 3','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 16:54:53.869326'),
('08dd347d-ed23-407c-87a8-d533c4cdf022',0,'11260031',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 17:29:20.981629'),
('08dd347d-ed23-407c-87a8-d533c4cdf022',1,'11260031',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 17:29:20.981629'),
('08dd347d-ed23-407c-87a8-d533c4cdf022',2,'11260031',NULL,NULL,NULL,'Long Description 3','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-14 17:29:20.981629'),
('08dd3507-911d-4772-858b-75385cf9fc6f',0,'011525001',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-15 09:54:37.153431'),
('08dd3507-911d-4772-858b-75385cf9fc6f',1,'011525001',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-15 09:54:37.153431'),
('08dd3507-911d-4772-858b-75385cf9fc6f',2,'011525001',NULL,NULL,NULL,'Long Description 3','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-15 09:54:37.153431'),
('08dd368c-630a-4ffd-8aed-d9eb67788a31',0,'011725001',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-17 08:17:54.087102'),
('08dd368c-630a-4ffd-8aed-d9eb67788a31',1,'011725001',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-17 08:17:54.087102'),
('08dd368c-630a-4ffd-8aed-d9eb67788a31',2,'011725001',NULL,NULL,NULL,'Long Description 3','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-17 08:17:54.087102'),
('08dd368d-68fb-41cd-8a56-f48bf6c52adc',0,'011725002',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-17 08:25:13.536921'),
('08dd368d-68fb-41cd-8a56-f48bf6c52adc',1,'011725002',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-17 08:25:13.536921'),
('08dd368d-68fb-41cd-8a56-f48bf6c52adc',2,'011725002',NULL,NULL,NULL,'Long Description 3','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-17 08:25:13.536921'),
('08dd368f-6744-475d-8b22-8dc9a8f67cf3',0,'011725004',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-17 08:39:29.723418'),
('08dd368f-6744-475d-8b22-8dc9a8f67cf3',1,'011725004',NULL,NULL,NULL,'Long Description 1','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-17 08:39:29.723418'),
('08dd368f-6744-475d-8b22-8dc9a8f67cf3',2,'011725004',NULL,NULL,NULL,'Long Description 3','6/12',NULL,NULL,NULL,NULL,'FL004','Special Accommodation- PMS','_SYS00000000004',0.000000,1.000000,5000.000000,'VOS',5600.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-17 08:39:29.723418');

/*Table structure for table `ftdpi5` */

DROP TABLE IF EXISTS `ftdpi5`;

CREATE TABLE `ftdpi5` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LineNum` int(11) NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `WTCode` varchar(4) DEFAULT NULL,
  `TaxbleAmnt` decimal(19,6) DEFAULT NULL,
  `WTAmnt` decimal(19,6) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`HeaderId`,`LineNum`),
  UNIQUE KEY `IX_FTDPI5_HeaderId` (`HeaderId`),
  CONSTRAINT `FK_FTDPI5_FTODPI_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftodpi` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftdpi5` */

insert  into `ftdpi5`(`HeaderId`,`LineNum`,`U_RefNum`,`WTCode`,`TaxbleAmnt`,`WTAmnt`,`CreatedAt`) values 
('08dd345b-744f-4b8b-8a9c-e5c88f91a7ed',0,'1126003','CT65',15000.000000,750.000000,'2025-01-14 13:22:35.395872'),
('08dd345b-cfc9-4d5f-86ac-5402408830f6',0,'1126004','CT65',15000.000000,750.000000,'2025-01-14 13:25:08.921990'),
('08dd345c-1df2-416d-84cf-a166c97b7c46',0,'11260031','CT65',15000.000000,750.000000,'2025-01-14 13:27:20.050799'),
('08dd3478-827a-42a5-8b09-8b545fa2b298',0,'11260031','CT65',1500.000000,70.000000,'2025-01-14 16:50:34.567032'),
('08dd3479-1d0a-4e84-830e-491a18099965',0,'11260031',NULL,1500.000000,70.000000,'2025-01-14 16:54:53.869326'),
('08dd347d-ed23-407c-87a8-d533c4cdf022',0,'11260031','CT01',1500.000000,70.000000,'2025-01-14 17:29:20.981629'),
('08dd3507-911d-4772-858b-75385cf9fc6f',0,'011525001','CT65',150.000000,70.000000,'2025-01-15 09:54:37.153431'),
('08dd368c-630a-4ffd-8aed-d9eb67788a31',0,'011725001','CT65',15000.000000,750.000000,'2025-01-17 08:17:54.087102'),
('08dd368d-68fb-41cd-8a56-f48bf6c52adc',0,'011725002','CT65',15000.000000,750.000000,'2025-01-17 08:25:13.536921'),
('08dd368f-6744-475d-8b22-8dc9a8f67cf3',0,'011725004','CT65',15000.000000,750.000000,'2025-01-17 08:39:29.723418');

/*Table structure for table `ftinv1` */

DROP TABLE IF EXISTS `ftinv1`;

CREATE TABLE `ftinv1` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LineNum` int(11) NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `U_BaseRef` varchar(255) DEFAULT NULL,
  `U_BaseType` int(11) DEFAULT NULL,
  `U_BaseLine` int(11) DEFAULT NULL,
  `U_LngDscrptn` longtext DEFAULT NULL,
  `U_Period` varchar(10) DEFAULT NULL,
  `BaseType` int(11) DEFAULT NULL,
  `BaseEntry` int(11) DEFAULT NULL,
  `BaseRef` int(11) DEFAULT NULL,
  `BaseLine` int(11) DEFAULT NULL,
  `ItemCode` varchar(50) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `AccountCode` varchar(15) DEFAULT NULL,
  `DiscPrcnt` decimal(19,6) DEFAULT NULL,
  `Quantity` decimal(19,6) DEFAULT NULL,
  `Price` decimal(19,6) DEFAULT NULL,
  `VatGroup` varchar(8) DEFAULT NULL,
  `PriceAfVAT` decimal(19,6) DEFAULT NULL,
  `WTLiable` longtext DEFAULT NULL,
  `LineTotal` decimal(19,6) DEFAULT NULL,
  `GrossTotal` decimal(19,6) DEFAULT NULL,
  `OcrCode` varchar(8) DEFAULT NULL,
  `OcrCode2` varchar(8) DEFAULT NULL,
  `OcrCode3` varchar(8) DEFAULT NULL,
  `OcrCode4` varchar(8) DEFAULT NULL,
  `OcrCode5` varchar(8) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`HeaderId`,`LineNum`),
  CONSTRAINT `FK_FTINV1_FTOINV_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftoinv` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftinv1` */

insert  into `ftinv1`(`HeaderId`,`LineNum`,`U_RefNum`,`U_BaseRef`,`U_BaseType`,`U_BaseLine`,`U_LngDscrptn`,`U_Period`,`BaseType`,`BaseEntry`,`BaseRef`,`BaseLine`,`ItemCode`,`Description`,`AccountCode`,`DiscPrcnt`,`Quantity`,`Price`,`VatGroup`,`PriceAfVAT`,`WTLiable`,`LineTotal`,`GrossTotal`,`OcrCode`,`OcrCode2`,`OcrCode3`,`OcrCode4`,`OcrCode5`,`CreatedAt`) values 
('08dd1fc8-084a-4fd9-8c31-6beef535003d',0,'1218001',NULL,NULL,NULL,NULL,'32/60',NULL,NULL,NULL,NULL,NULL,NULL,'_SYS00000000251',0.000000,NULL,50000.000000,'VOT',56000.000000,'Y',NULL,NULL,'OPS',NULL,'FSOL',NULL,NULL,'2024-12-19 08:56:54.898631'),
('08dd1fd2-0da3-40ea-8546-8b8c0a53f32e',0,'65000280206',NULL,NULL,NULL,NULL,'32/60',NULL,NULL,NULL,NULL,NULL,'RENT INCOME (BPICTR)','_SYS00000000251',0.000000,NULL,50000.000000,'VOT',56000.000000,'Y',NULL,NULL,'OPS',NULL,'FSOL',NULL,NULL,'2024-12-19 10:08:38.822308'),
('08dd1fd2-bc65-45a9-8ead-f2bcfa0fd5ad',0,'65000280206',NULL,NULL,NULL,NULL,'32/60',NULL,NULL,NULL,NULL,NULL,'RENT INCOME (BPICTR)','_SYS00000000251',0.000000,NULL,50000.000000,'VOT',56000.000000,'Y',NULL,NULL,'OPS',NULL,'FSOL',NULL,NULL,'2024-12-19 10:13:32.080520'),
('08dd1fd4-f440-4f2c-88cc-17a8011a910d',0,'65000280206',NULL,NULL,NULL,NULL,'32/60',NULL,NULL,NULL,NULL,NULL,'RENT INCOME (BPICTR)','_SYS00000000251',0.000000,NULL,50000.000000,'VOT',56000.000000,'Y',NULL,NULL,'OPS',NULL,'FSOL',NULL,NULL,'2024-12-19 10:29:24.788798'),
('08dd200e-a1dc-485a-8532-2985c6a6c1ff',0,'65000280206',NULL,NULL,NULL,NULL,'32/60',NULL,NULL,NULL,NULL,NULL,'RENT INCOME (BPICTR)','_SYS00000000251',0.000000,NULL,50000.000000,'VOT',56000.000000,'Y',NULL,NULL,'OPS',NULL,'FSOL',NULL,NULL,'2024-12-19 17:22:17.365741'),
('08dd200f-d2b3-4407-850f-e81f6d061271',0,'1219009',NULL,NULL,NULL,NULL,'32/60',NULL,NULL,NULL,NULL,NULL,NULL,'_SYS00000000251',0.000000,NULL,50000.000000,'VOT',56000.000000,'Y',NULL,NULL,'OPS',NULL,'FSOL',NULL,NULL,'2024-12-19 17:30:48.802297'),
('08dd200f-e16e-41c5-8a77-b16303969830',0,'12190012',NULL,NULL,NULL,NULL,'32/60',NULL,NULL,NULL,NULL,NULL,NULL,'_SYS00000000251',0.000000,NULL,50000.000000,'VOT',56000.000000,'Y',NULL,NULL,'OPS',NULL,'FSOL',NULL,NULL,'2024-12-19 17:31:13.515163'),
('08dd2010-372e-401e-821c-f4585ceff6cc',0,'65000280206',NULL,NULL,NULL,NULL,'32/60',NULL,NULL,NULL,NULL,NULL,'RENT INCOME (BPICTR)','_SYS00000000251',0.000000,NULL,50000.000000,'VOT',56000.000000,'Y',NULL,NULL,'OPS',NULL,'FSOL',NULL,NULL,'2024-12-19 17:33:37.379173'),
('08dd2010-de86-4f1d-8989-84c9da48fa61',0,'12190013',NULL,NULL,NULL,NULL,'32/60',NULL,NULL,NULL,NULL,NULL,NULL,'_SYS00000000251',0.000000,NULL,50000.000000,'VOT',56000.000000,'Y',NULL,NULL,'OPS',NULL,'FSOL',NULL,NULL,'2024-12-19 17:38:18.140979'),
('08dd2011-cab1-4fce-844a-15db1d70eaec',0,'65000280206',NULL,NULL,NULL,NULL,'32/60',NULL,NULL,NULL,NULL,NULL,'RENT INCOME (BPICTR)','_SYS00000000251',0.000000,NULL,50000.000000,'VOT',56000.000000,'Y',NULL,NULL,'OPS',NULL,'FSOL',NULL,NULL,'2024-12-19 17:44:54.365847'),
('08dd3528-856e-457c-8eec-8874d60c360e',0,NULL,NULL,NULL,NULL,NULL,'6/12',NULL,NULL,NULL,NULL,'string',NULL,NULL,0.000000,NULL,50000.000000,'VOS',56000.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1001','1','2025-01-15 13:50:30.949352'),
('08dd3529-9ef6-4309-8957-7e9defe292ee',0,'string','string',0,0,'string','string',NULL,NULL,NULL,NULL,'string','string','string',0.000000,0.000000,0.000000,'stri',0.000000,'N',NULL,NULL,'string','string','string','string','string','2025-01-15 13:58:23.264940'),
('08dd35f3-2243-40f3-88ad-2e1ba0e3223c',0,'121300013',NULL,NULL,NULL,NULL,'12-Jun',NULL,NULL,NULL,NULL,NULL,'RENT INCOME (BPICTR)','_SYS00000000251',0.000000,1.000000,50000.000000,'VOS',56000.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1001','1','2025-01-16 14:00:52.416381'),
('08dd35f4-3031-4545-8cab-96614fedf0df',0,'121300013',NULL,NULL,NULL,NULL,'12-Jun',NULL,NULL,NULL,NULL,NULL,'RENT INCOME (BPICTR)','_SYS00000000251',0.000000,1.000000,50000.000000,'VOS',56000.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1001','1','2025-01-16 14:08:25.257963'),
('08dd368e-31a3-4d2a-88cf-5a8ade364f73',0,NULL,NULL,NULL,NULL,NULL,'6/12',NULL,NULL,NULL,NULL,'FL004',NULL,NULL,0.000000,1.000000,10000.000000,'VOS',11200.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-17 08:30:50.252752'),
('08dd368e-31a3-4d2a-88cf-5a8ade364f73',1,NULL,NULL,NULL,NULL,NULL,'6/12',NULL,NULL,NULL,NULL,'FL003',NULL,NULL,0.000000,1.000000,10000.000000,'VOS',11200.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-17 08:30:50.252752'),
('08dd368e-31a3-4d2a-88cf-5a8ade364f73',2,NULL,NULL,NULL,NULL,NULL,'6/12',NULL,NULL,NULL,NULL,'FL002',NULL,NULL,0.000000,1.000000,10000.000000,'VOS',11200.000000,'Y',NULL,NULL,'ASSETMGT','A','FL','1002','1','2025-01-17 08:30:50.252752');

/*Table structure for table `ftinv5` */

DROP TABLE IF EXISTS `ftinv5`;

CREATE TABLE `ftinv5` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LineNum` int(11) NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `WTCode` varchar(4) DEFAULT NULL,
  `TaxbleAmnt` decimal(19,6) DEFAULT NULL,
  `WTAmnt` decimal(19,6) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`HeaderId`,`LineNum`),
  UNIQUE KEY `IX_FTINV5_HeaderId` (`HeaderId`),
  CONSTRAINT `FK_FTINV5_FTOINV_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftoinv` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftinv5` */

insert  into `ftinv5`(`HeaderId`,`LineNum`,`U_RefNum`,`WTCode`,`TaxbleAmnt`,`WTAmnt`,`CreatedAt`) values 
('08dd1fc8-084a-4fd9-8c31-6beef535003d',0,NULL,NULL,NULL,NULL,'0001-01-01 00:00:00.000000'),
('08dd1fd2-0da3-40ea-8546-8b8c0a53f32e',0,NULL,NULL,NULL,NULL,'0001-01-01 00:00:00.000000'),
('08dd1fd2-bc65-45a9-8ead-f2bcfa0fd5ad',0,NULL,NULL,NULL,NULL,'0001-01-01 00:00:00.000000'),
('08dd1fd4-f440-4f2c-88cc-17a8011a910d',0,NULL,NULL,NULL,NULL,'0001-01-01 00:00:00.000000'),
('08dd200e-a1dc-485a-8532-2985c6a6c1ff',0,'65000280206','CT65',50000.000000,2500.000000,'2024-12-19 17:22:17.365741'),
('08dd200f-d2b3-4407-850f-e81f6d061271',0,'1219009','CT01',50000.000000,2500.000000,'2024-12-19 17:30:48.802297'),
('08dd200f-e16e-41c5-8a77-b16303969830',0,'12190012','CT01',50000.000000,2500.000000,'2024-12-19 17:31:13.515163'),
('08dd2010-372e-401e-821c-f4585ceff6cc',0,'65000280206','CT65',50000.000000,2500.000000,'2024-12-19 17:33:37.379173'),
('08dd2010-de86-4f1d-8989-84c9da48fa61',0,'12190013','CT01',50000.000000,2500.000000,'2024-12-19 17:38:18.140979'),
('08dd2011-cab1-4fce-844a-15db1d70eaec',0,'65000280206','CT65',50000.000000,2500.000000,'2024-12-19 17:44:54.365847'),
('08dd3528-856e-457c-8eec-8874d60c360e',0,NULL,NULL,NULL,NULL,'0001-01-01 00:00:00.000000'),
('08dd3529-9ef6-4309-8957-7e9defe292ee',0,'string','stri',0.000000,0.000000,'2025-01-15 13:58:23.264940'),
('08dd35f3-2243-40f3-88ad-2e1ba0e3223c',0,NULL,NULL,NULL,NULL,'0001-01-01 00:00:00.000000'),
('08dd35f4-3031-4545-8cab-96614fedf0df',0,NULL,NULL,NULL,NULL,'0001-01-01 00:00:00.000000'),
('08dd368e-31a3-4d2a-88cf-5a8ade364f73',0,NULL,NULL,NULL,NULL,'0001-01-01 00:00:00.000000');

/*Table structure for table `ftinv9` */

DROP TABLE IF EXISTS `ftinv9`;

CREATE TABLE `ftinv9` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LineNum` int(11) NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `DrawnSum` decimal(19,6) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`HeaderId`,`LineNum`),
  CONSTRAINT `FK_FTINV9_FTOINV_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftoinv` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftinv9` */

insert  into `ftinv9`(`HeaderId`,`LineNum`,`U_RefNum`,`DrawnSum`,`CreatedAt`) values 
('08dd3529-9ef6-4309-8957-7e9defe292ee',0,'string',0.000000,'2025-01-15 13:58:23.264940'),
('08dd3529-9ef6-4309-8957-7e9defe292ee',2,'string',0.000000,'2025-01-15 13:58:23.264940'),
('08dd3529-9ef6-4309-8957-7e9defe292ee',3,'string',0.000000,'2025-01-15 13:58:23.264940');

/*Table structure for table `ftitm7` */

DROP TABLE IF EXISTS `ftitm7`;

CREATE TABLE `ftitm7` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ItemCode` varchar(50) NOT NULL,
  `VisOrder` int(11) NOT NULL,
  `PrediodCat` varchar(10) DEFAULT NULL,
  `DprArea` varchar(15) DEFAULT NULL,
  `UsefulLife` int(11) NOT NULL,
  `DprStart` date NOT NULL,
  `DprEnd` date DEFAULT NULL,
  `RemainLife` decimal(19,6) DEFAULT NULL,
  `DprType` varchar(15) DEFAULT NULL,
  `DprTypeC` varchar(15) DEFAULT NULL,
  `UsefulLfeC` int(11) DEFAULT NULL,
  `LogInstanc` int(11) DEFAULT NULL,
  `ObjType` varchar(20) DEFAULT NULL,
  `RemainDays` decimal(19,6) DEFAULT NULL,
  `TotalUnits` int(11) DEFAULT NULL,
  `RemainUnit` int(11) DEFAULT NULL,
  `StanUnit` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`HeaderId`,`VisOrder`,`ItemCode`),
  CONSTRAINT `FK_FTITM7_FTOITM_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftoitm` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftitm7` */

insert  into `ftitm7`(`HeaderId`,`ItemCode`,`VisOrder`,`PrediodCat`,`DprArea`,`UsefulLife`,`DprStart`,`DprEnd`,`RemainLife`,`DprType`,`DprTypeC`,`UsefulLfeC`,`LogInstanc`,`ObjType`,`RemainDays`,`TotalUnits`,`RemainUnit`,`StanUnit`,`CreatedAt`) values 
('08dd1fcb-9737-476e-8707-3aa222915a1a','V0006261',0,NULL,NULL,5,'2024-11-15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-19 09:22:23.161025'),
('08dd1fcc-26d9-41df-8b40-fc41245f3595','FA1219003',0,NULL,NULL,5,'2024-11-15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-19 09:26:24.200179'),
('08dd1fcc-8309-43e1-84ed-3fa3884c7b0e','FA1219004',0,NULL,NULL,5,'2024-11-15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-19 09:28:58.867037'),
('08dd1fd5-b890-4dd1-8cb7-4961f0b4364e','FA1219004',0,NULL,NULL,5,'2024-11-15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-19 10:34:54.143658'),
('08dd1fd6-9ed5-4419-854c-46a7a1415c02','FA1219004',0,NULL,NULL,5,'2024-11-15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-19 10:41:20.470085'),
('08dd1fd8-8b08-44aa-8110-33cb89a9ebf5','FA1219004',0,NULL,NULL,5,'2024-11-15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-19 10:55:06.244114'),
('08dd200e-76d7-4d9b-8f1f-1758bed8c05d','FA12190010',0,NULL,NULL,5,'2024-11-15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-19 17:21:05.135352'),
('08dd200e-ed61-4622-83ba-fb839d05c092','FA12190011',0,NULL,NULL,5,'2024-11-15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-19 17:24:24.064991');

/*Table structure for table `ftjdt1` */

DROP TABLE IF EXISTS `ftjdt1`;

CREATE TABLE `ftjdt1` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LineId` int(11) NOT NULL,
  `TransId` int(11) DEFAULT NULL,
  `Account` varchar(15) DEFAULT NULL,
  `Debit` decimal(19,6) DEFAULT NULL,
  `Credit` decimal(19,6) DEFAULT NULL,
  `SYSCred` decimal(19,6) DEFAULT NULL,
  `SYSDeb` decimal(19,6) DEFAULT NULL,
  `FCDebit` decimal(19,6) DEFAULT NULL,
  `FCCredit` decimal(19,6) DEFAULT NULL,
  `FCCurrency` varchar(3) DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `SourceID` int(11) DEFAULT NULL,
  `SourceLine` int(11) DEFAULT NULL,
  `ShortName` varchar(15) DEFAULT NULL,
  `IntrnMatch` int(11) DEFAULT NULL,
  `ExtrMatch` int(11) DEFAULT NULL,
  `ContraAct` varchar(15) DEFAULT NULL,
  `LineMemo` varchar(254) DEFAULT NULL,
  `Ref3Line` varchar(100) DEFAULT NULL,
  `TransType` varchar(20) DEFAULT NULL,
  `RefDate` date DEFAULT NULL,
  `Ref2Date` date DEFAULT NULL,
  `Ref1` varchar(100) DEFAULT NULL,
  `Ref2` varchar(100) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `BaseRef` varchar(11) DEFAULT NULL,
  `Project` varchar(20) DEFAULT NULL,
  `TransCode` varchar(4) DEFAULT NULL,
  `ProfitCode` varchar(8) DEFAULT NULL,
  `TaxDate` date DEFAULT NULL,
  `SystemRate` decimal(19,6) DEFAULT NULL,
  `MthDate` date DEFAULT NULL,
  `ToMthSum` decimal(19,6) DEFAULT NULL,
  `UserSign` int(11) DEFAULT NULL,
  `BatchNum` int(11) DEFAULT NULL,
  `FinncPriod` int(11) DEFAULT NULL,
  `RelTransId` int(11) DEFAULT NULL,
  `RelLineID` int(11) DEFAULT NULL,
  `RelType` varchar(1) DEFAULT NULL,
  `LogInstanc` int(11) DEFAULT NULL,
  `VatGroup` varchar(8) DEFAULT NULL,
  `BaseSum` decimal(19,6) DEFAULT NULL,
  `VatRate` decimal(19,6) DEFAULT NULL,
  `Indicator` varchar(2) DEFAULT NULL,
  `AdjTran` varchar(1) DEFAULT NULL,
  `RevSource` varchar(1) DEFAULT NULL,
  `ObjType` varchar(20) DEFAULT NULL,
  `VatDate` date DEFAULT NULL,
  `PaymentRef` varchar(27) DEFAULT NULL,
  `SYSBaseSum` decimal(19,6) DEFAULT NULL,
  `MultMatch` int(11) DEFAULT NULL,
  `VatLine` varchar(1) DEFAULT NULL,
  `VatAmount` decimal(19,6) DEFAULT NULL,
  `SYSVatSum` decimal(19,6) DEFAULT NULL,
  `Closed` varchar(1) DEFAULT NULL,
  `GrossValue` decimal(19,6) DEFAULT NULL,
  `CheckAbs` int(11) DEFAULT NULL,
  `LineType` int(11) DEFAULT NULL,
  `DebCred` varchar(1) DEFAULT NULL,
  `SequenceNr` int(11) DEFAULT NULL,
  `StornoAcc` varchar(15) DEFAULT NULL,
  `BalDueDeb` decimal(19,6) DEFAULT NULL,
  `BalDueCred` decimal(19,6) DEFAULT NULL,
  `BalFcDeb` decimal(19,6) DEFAULT NULL,
  `BalFcCred` decimal(19,6) DEFAULT NULL,
  `BalScDeb` decimal(19,6) DEFAULT NULL,
  `BalScCred` decimal(19,6) DEFAULT NULL,
  `IsNet` varchar(1) DEFAULT NULL,
  `DunWizBlck` varchar(1) DEFAULT NULL,
  `DunnLevel` int(11) DEFAULT NULL,
  `DunDate` date DEFAULT NULL,
  `TaxType` int(11) DEFAULT NULL,
  `TaxPostAcc` varchar(1) DEFAULT NULL,
  `StaCode` varchar(8) DEFAULT NULL,
  `StaType` int(11) DEFAULT NULL,
  `TaxCode` varchar(8) DEFAULT NULL,
  `ValidFrom` date DEFAULT NULL,
  `GrossValFc` decimal(19,6) DEFAULT NULL,
  `LvlUpdDate` date DEFAULT NULL,
  `OcrCode2` varchar(8) DEFAULT NULL,
  `OcrCode3` varchar(8) DEFAULT NULL,
  `OcrCode4` varchar(8) DEFAULT NULL,
  `OcrCode5` varchar(8) DEFAULT NULL,
  `MIEntry` int(11) DEFAULT NULL,
  `MIVEntry` int(11) DEFAULT NULL,
  `ClsInTP` int(11) DEFAULT NULL,
  `CenVatCom` int(11) DEFAULT NULL,
  `MatType` int(11) DEFAULT NULL,
  `PstngType` int(11) DEFAULT NULL,
  `ValidFrom2` date DEFAULT NULL,
  `ValidFrom3` date DEFAULT NULL,
  `ValidFrom4` date DEFAULT NULL,
  `ValidFrom5` date DEFAULT NULL,
  `Location` int(11) DEFAULT NULL,
  `WTaxCode` varchar(4) DEFAULT NULL,
  `EquVatRate` decimal(19,6) DEFAULT NULL,
  `EquVatSum` decimal(19,6) DEFAULT NULL,
  `SYSEquSum` decimal(19,6) DEFAULT NULL,
  `TotalVat` decimal(19,6) DEFAULT NULL,
  `SYSTVat` decimal(19,6) DEFAULT NULL,
  `WTLiable` varchar(1) DEFAULT NULL,
  `WTLine` varchar(1) DEFAULT NULL,
  `WTApplied` decimal(19,6) DEFAULT NULL,
  `WTAppliedS` decimal(19,6) DEFAULT NULL,
  `WTAppliedF` decimal(19,6) DEFAULT NULL,
  `WTSum` decimal(19,6) DEFAULT NULL,
  `WTSumFC` decimal(19,6) DEFAULT NULL,
  `WTSumSC` decimal(19,6) DEFAULT NULL,
  `PayBlock` varchar(1) DEFAULT NULL,
  `PayBlckRef` int(11) DEFAULT NULL,
  `LicTradNum` varchar(32) DEFAULT NULL,
  `InterimTyp` int(11) DEFAULT NULL,
  `DprId` int(11) DEFAULT NULL,
  `MatchRef` varchar(20) DEFAULT NULL,
  `Ordered` varchar(1) DEFAULT NULL,
  `CUP` int(11) DEFAULT NULL,
  `CIG` int(11) DEFAULT NULL,
  `BPLId` int(11) DEFAULT NULL,
  `BPLName` varchar(100) DEFAULT NULL,
  `VatRegNum` varchar(32) DEFAULT NULL,
  `SLEDGERF` varchar(1) DEFAULT NULL,
  `InitRef2` varchar(100) DEFAULT NULL,
  `InitRef3Ln` varchar(27) DEFAULT NULL,
  `ExpUUID` varchar(50) DEFAULT NULL,
  `ExpOPType` varchar(1) DEFAULT NULL,
  `ExTransId` int(11) DEFAULT NULL,
  `DocArr` int(11) DEFAULT NULL,
  `DocLine` int(11) DEFAULT NULL,
  `MYFtype` varchar(2) DEFAULT NULL,
  `DocEntry` int(11) DEFAULT NULL,
  `DocNum` int(11) DEFAULT NULL,
  `DocType` varchar(20) DEFAULT NULL,
  `DocSubType` varchar(2) DEFAULT NULL,
  `RmrkTmpt` int(11) DEFAULT NULL,
  `CemCode` varchar(20) DEFAULT NULL,
  `InClassCat` int(11) DEFAULT NULL,
  `InClassTyp` int(11) DEFAULT NULL,
  `ExClassCat` int(11) DEFAULT NULL,
  `ExClassTyp` int(11) DEFAULT NULL,
  `VATClassCa` int(11) DEFAULT NULL,
  `VATClassTy` int(11) DEFAULT NULL,
  `EVatCate` int(11) DEFAULT NULL,
  `EWtPercCat` int(11) DEFAULT NULL,
  `EWtAmount` decimal(19,6) DEFAULT NULL,
  `EBVatExCau` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `U_InvDate` date DEFAULT NULL,
  `U_InvNum` varchar(20) DEFAULT NULL,
  `U_VatBase` decimal(19,6) DEFAULT NULL,
  `U_TransType` varchar(20) DEFAULT NULL,
  `U_xWTCode` varchar(10) DEFAULT NULL,
  `U_xWTVendor` varchar(20) DEFAULT NULL,
  `U_xSupplierName` varchar(100) DEFAULT NULL,
  `U_xCardTyp` varchar(100) DEFAULT NULL,
  `U_Address` varchar(254) DEFAULT NULL,
  `U_TIN` varchar(20) DEFAULT NULL,
  `U_TIN1` varchar(20) DEFAULT NULL,
  `U_TIN2` varchar(20) DEFAULT NULL,
  `U_TaxAmt` decimal(19,6) DEFAULT NULL,
  `U_TaxableAmt` decimal(19,6) DEFAULT NULL,
  `U_SrceDocNo` varchar(20) DEFAULT NULL,
  `U_ORNo` varchar(20) DEFAULT NULL,
  `U_SOA` varchar(20) DEFAULT NULL,
  `U_CheckNo` varchar(20) DEFAULT NULL,
  `U_CheckDate` date DEFAULT NULL,
  `U_APVNo` varchar(20) DEFAULT NULL,
  `U_VSIRefNo` varchar(20) DEFAULT NULL,
  `U_Contract` varchar(30) DEFAULT NULL,
  `CardType` varchar(1) NOT NULL,
  `GroupNum` int(11) NOT NULL,
  `E_mail` varchar(100) DEFAULT NULL,
  `Phone1` varchar(50) DEFAULT NULL,
  `CntctPrsn` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`HeaderId`,`LineId`),
  CONSTRAINT `FK_FTJDT1_FTOJDT_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftojdt` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftjdt1` */

/*Table structure for table `ftoacq` */

DROP TABLE IF EXISTS `ftoacq`;

CREATE TABLE `ftoacq` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `DocNum` int(11) DEFAULT NULL,
  `Series` int(11) DEFAULT NULL,
  `PeriodCat` varchar(10) DEFAULT NULL,
  `FinncPeroid` int(11) DEFAULT NULL,
  `PostDate` date DEFAULT NULL,
  `DocDate` date DEFAULT NULL,
  `DocStatus` varchar(1) DEFAULT NULL,
  `TransId` int(11) DEFAULT NULL,
  `Comments` varchar(254) DEFAULT NULL,
  `Reference` varchar(32) DEFAULT NULL,
  `ObjType` varchar(20) DEFAULT NULL,
  `Currency` varchar(3) DEFAULT NULL,
  `DocRate` decimal(19,6) DEFAULT NULL,
  `SysRate` decimal(19,6) DEFAULT NULL,
  `PIndicator` varchar(10) DEFAULT NULL,
  `DocTotal` decimal(19,6) DEFAULT NULL,
  `DocTotalFC` decimal(19,6) DEFAULT NULL,
  `DocTotalSy` decimal(19,6) DEFAULT NULL,
  `DataSource` varchar(1) DEFAULT NULL,
  `UserSign` int(11) DEFAULT NULL,
  `LogInstanc` int(11) DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  `UserSign2` int(11) DEFAULT NULL,
  `UpdateDate` date DEFAULT NULL,
  `TransType` varchar(20) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `JrnlMemo` varchar(254) DEFAULT NULL,
  `AssetDate` date DEFAULT NULL,
  `CurSource` varchar(1) DEFAULT NULL,
  `DocType` varchar(15) DEFAULT NULL,
  `PrjSmarz` varchar(1) DEFAULT NULL,
  `DstRlSmarz` varchar(1) DEFAULT NULL,
  `ManDprType` varchar(15) DEFAULT NULL,
  `Handwrtten` varchar(1) DEFAULT NULL,
  `CancelDate` date DEFAULT NULL,
  `DprArea` varchar(15) DEFAULT NULL,
  `BPLId` int(11) DEFAULT NULL,
  `BaseRef` varchar(11) DEFAULT NULL,
  `LVARetire` varchar(1) DEFAULT NULL,
  `CancelOpt` int(11) DEFAULT NULL,
  `BPLName` varchar(100) DEFAULT NULL,
  `VatRegNum` varchar(32) DEFAULT NULL,
  `GdsMovType` varchar(2) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `U_RefNum` varchar(30) NOT NULL,
  `IntegrationStatus` varchar(1) NOT NULL,
  `IntegrationMessage` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftoacq` */

insert  into `ftoacq`(`Id`,`DocNum`,`Series`,`PeriodCat`,`FinncPeroid`,`PostDate`,`DocDate`,`DocStatus`,`TransId`,`Comments`,`Reference`,`ObjType`,`Currency`,`DocRate`,`SysRate`,`PIndicator`,`DocTotal`,`DocTotalFC`,`DocTotalSy`,`DataSource`,`UserSign`,`LogInstanc`,`CreateDate`,`UserSign2`,`UpdateDate`,`TransType`,`CreatedBy`,`JrnlMemo`,`AssetDate`,`CurSource`,`DocType`,`PrjSmarz`,`DstRlSmarz`,`ManDprType`,`Handwrtten`,`CancelDate`,`DprArea`,`BPLId`,`BaseRef`,`LVARetire`,`CancelOpt`,`BPLName`,`VatRegNum`,`GdsMovType`,`CreatedAt`,`U_RefNum`,`IntegrationStatus`,`IntegrationMessage`) values 
('08dd1fcb-9758-4f76-8201-26cb45865fe8',NULL,NULL,NULL,NULL,'2024-11-15',NULL,'P',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,0,NULL,NULL,NULL,'-1',NULL,NULL,NULL,'L','PL','N','N',NULL,'N',NULL,NULL,NULL,NULL,'N',1,NULL,NULL,NULL,'2024-12-19 09:22:23.161025','1218002','S','Successfully Posted'),
('08dd1fcc-26d9-444a-8421-81b743f91dcb',NULL,NULL,NULL,NULL,'2024-11-15',NULL,'P',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,0,NULL,NULL,NULL,'-1',NULL,NULL,NULL,'L','PL','N','N',NULL,'N',NULL,NULL,NULL,NULL,'N',1,NULL,NULL,NULL,'2024-12-19 09:26:24.200179','1218002','S','Successfully Posted'),
('08dd1fcc-8309-4707-8b9a-023c1509a684',NULL,NULL,NULL,NULL,'2024-11-15',NULL,'P',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,0,NULL,NULL,NULL,'-1',NULL,NULL,NULL,'L','PL','N','N',NULL,'N',NULL,NULL,NULL,NULL,'N',1,NULL,NULL,NULL,'2024-12-19 09:28:58.867037','1219004','S','Successfully Posted'),
('08dd1fd5-b89e-4f6e-8ca3-91dbfa660bd7',NULL,NULL,NULL,NULL,'2024-11-15',NULL,'P',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,0,NULL,NULL,NULL,'-1',NULL,NULL,NULL,'L','PL','N','N',NULL,'N',NULL,NULL,NULL,NULL,'N',1,NULL,NULL,NULL,'2024-12-19 10:34:54.143658','1219004','S','Successfully Posted'),
('08dd1fd6-9ed5-4738-828d-d5b51ffba477',NULL,NULL,NULL,NULL,'2024-11-15',NULL,'P',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,0,NULL,NULL,NULL,'-1',NULL,NULL,NULL,'L','PL','N','N',NULL,'N',NULL,NULL,NULL,NULL,'N',1,NULL,NULL,NULL,'2024-12-19 10:41:20.470085','1219004','S','Successfully Posted'),
('08dd1fd8-8b08-46cd-836a-b3173579c866',NULL,NULL,NULL,NULL,'2024-11-15',NULL,'P',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,0,NULL,NULL,NULL,'-1',NULL,NULL,NULL,'L','PL','N','N',NULL,'N',NULL,NULL,NULL,NULL,'N',1,NULL,NULL,NULL,'2024-12-19 10:55:06.244114','1219004','E','Item code \'FA1219004\' already exists'),
('08dd200e-76f6-48c5-885c-b54131d3da72',NULL,NULL,NULL,NULL,'2024-11-15',NULL,'P',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,0,NULL,NULL,NULL,'-1',NULL,NULL,NULL,'L','PL','N','N',NULL,'N',NULL,NULL,NULL,NULL,'N',1,NULL,NULL,NULL,'2024-12-19 17:21:05.135352','12190010','S','Successfully Posted'),
('08dd200e-ed61-493d-8fe0-3f3c224d321f',NULL,NULL,NULL,NULL,'2024-11-15',NULL,'P',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,0,NULL,NULL,NULL,'-1',NULL,NULL,NULL,'L','PL','N','N',NULL,'N',NULL,NULL,NULL,NULL,'N',1,NULL,NULL,NULL,'2024-12-19 17:24:24.064991','12190011','S','Successfully Posted');

/*Table structure for table `ftocpr` */

DROP TABLE IF EXISTS `ftocpr`;

CREATE TABLE `ftocpr` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(50) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `Position` varchar(90) DEFAULT NULL,
  `Title` varchar(10) DEFAULT NULL,
  `Profession` varchar(50) DEFAULT NULL,
  `Tel1` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `Notes1` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Notes2` varchar(100) DEFAULT NULL,
  `Gender` varchar(1) NOT NULL,
  `BirthDate` date DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `U_NameLocal` varchar(255) DEFAULT NULL,
  `U_Email3` varchar(255) DEFAULT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`HeaderId`,`Name`),
  CONSTRAINT `FK_FTOCPR_FTOCRD_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftocrd` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftocpr` */

insert  into `ftocpr`(`HeaderId`,`Name`,`FirstName`,`Position`,`Title`,`Profession`,`Tel1`,`Fax`,`Notes1`,`Email`,`Notes2`,`Gender`,`BirthDate`,`CreatedAt`,`U_NameLocal`,`U_Email3`,`U_RefNum`) values 
('08dd1fda-69b5-49e0-8631-838bbfc8f1be','FESTO INC','FESTO INC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'E','2001-10-01','2024-12-19 11:08:29.326869',NULL,NULL,'1219005'),
('08dd1fda-9468-4c63-889a-ac2a0479ca40','FESTO INC','FESTO INC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'E','2001-10-01','2024-12-19 11:09:40.969013',NULL,NULL,'1219005'),
('08dd1fda-a189-4688-82f2-d7d8b7a97d1e','FESTO INC','FESTO INC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'E','2001-10-01','2024-12-19 11:10:02.993829',NULL,NULL,'1219006'),
('08dd1fda-a332-4c60-8749-a31c53b22bb9','FESTO INC','FESTO INC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'E','2001-10-01','2024-12-19 11:10:05.781506',NULL,NULL,'1219006'),
('08dd1fda-b177-409c-8906-21462b224734','FESTO INC','FESTO INC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'E','2001-10-01','2024-12-19 11:10:29.717310',NULL,NULL,'1219007'),
('08dd1fdb-4784-4c5c-8176-f85bdb690ed5','FESTO INC','FESTO INC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'E','2001-10-01','2024-12-19 11:14:41.464994',NULL,NULL,'1219007'),
('08dd1fdb-6759-49aa-8533-7e994a81b753','FESTO INC','FESTO INC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'E','2001-10-01','2024-12-19 11:15:34.869365',NULL,NULL,'1219007'),
('08dd1fdb-937b-4943-833b-80dec96488ee','FESTO INC','FESTO INC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'E','2001-10-01','2024-12-19 11:16:48.910823',NULL,NULL,'1219008'),
('08dd1fdc-1afb-46aa-8333-ea807bc3e930','FESTO INC','FESTO INC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'E','2001-10-01','2024-12-19 11:20:36.241450',NULL,NULL,'1219008'),
('08dd1fdc-2b5f-4709-8814-7d6cffe87ff7','FESTO INC','FESTO INC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'E','2001-10-01','2024-12-19 11:21:03.741210',NULL,NULL,'1219009'),
('08dd1fdc-66e5-468b-8983-fc1a67dd8e65','FESTO INC','FESTO INC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'E','2001-10-01','2024-12-19 11:22:43.604670',NULL,NULL,'1219009');

/*Table structure for table `ftocrd` */

DROP TABLE IF EXISTS `ftocrd`;

CREATE TABLE `ftocrd` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `CardCode` varchar(15) NOT NULL,
  `CardName` varchar(100) NOT NULL,
  `CardFName` varchar(100) DEFAULT NULL,
  `CardType` varchar(1) NOT NULL,
  `GroupCode` int(11) DEFAULT NULL,
  `CmpPrivate` varchar(1) NOT NULL,
  `ValidFor` varchar(1) NOT NULL,
  `ECVatGroup` varchar(8) DEFAULT NULL,
  `AddId` varchar(64) DEFAULT NULL,
  `IndustryC` int(11) DEFAULT NULL,
  `ValidComm` varchar(30) DEFAULT NULL,
  `LicTradNum` varchar(32) DEFAULT NULL,
  `DflAccount` varchar(50) DEFAULT NULL,
  `GroupNum` int(11) DEFAULT NULL,
  `DflBranch` longtext DEFAULT NULL,
  `WTLiable` varchar(1) DEFAULT NULL,
  `E_mail` varchar(100) DEFAULT NULL,
  `Phone1` varchar(50) DEFAULT NULL,
  `CntctPrsn` varchar(90) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `IntegrationStatus` varchar(1) NOT NULL,
  `IntegrationMessage` longtext DEFAULT NULL,
  `U_CstmNmSrch` varchar(100) DEFAULT NULL,
  `U_CstmrCtgry` varchar(100) DEFAULT NULL,
  `U_CstmrCdHQ` varchar(100) DEFAULT NULL,
  `U_CutmrNtr` varchar(100) DEFAULT NULL,
  `U_PsicPsoc` varchar(100) DEFAULT NULL,
  `U_CrdtRtng` varchar(100) DEFAULT NULL,
  `U_CrdRtUp` varchar(100) DEFAULT NULL,
  `U_CrdtRtDtl` varchar(100) DEFAULT NULL,
  `U_CrdtCtgry` varchar(100) DEFAULT NULL,
  `U_VndrPrgrm` varchar(100) DEFAULT NULL,
  `U_GrgCtgry` varchar(100) DEFAULT NULL,
  `U_EqtyRt` varchar(100) DEFAULT NULL,
  `U_OpePrd` varchar(100) DEFAULT NULL,
  `U_ExpsrLmt` varchar(100) DEFAULT NULL,
  `U_IDCrdAdd` varchar(100) DEFAULT NULL,
  `U_MrtlStatus` varchar(100) DEFAULT NULL,
  `U_Emplymnt` varchar(100) DEFAULT NULL,
  `U_PrtsCmpyCd` varchar(100) DEFAULT NULL,
  `U_PrtsCmpyNm` varchar(100) DEFAULT NULL,
  `U_OrgnlGrpCd` varchar(100) DEFAULT NULL,
  `U_OrgnlGrpNm` varchar(100) DEFAULT NULL,
  `U_InvRtio` varchar(100) DEFAULT NULL,
  `U_IntrdcrCd` varchar(100) DEFAULT NULL,
  `U_IntrdcrNm` varchar(100) DEFAULT NULL,
  `U_GrntrCd` varchar(100) DEFAULT NULL,
  `U_AssetSize` varchar(100) DEFAULT NULL,
  `U_TcCRR` varchar(100) DEFAULT NULL,
  `U_PostCode` varchar(100) DEFAULT NULL,
  `U_PrfssnType` varchar(100) DEFAULT NULL,
  `U_Privies` varchar(100) DEFAULT NULL,
  `U_FsclMnth` varchar(100) DEFAULT NULL,
  `U_RgstrdCptl` varchar(100) DEFAULT NULL,
  `U_EsblsmntDt` varchar(100) DEFAULT NULL,
  `U_MngmntYrs` varchar(100) DEFAULT NULL,
  `U_HeadCount` varchar(100) DEFAULT NULL,
  `U_Credibility` varchar(100) DEFAULT NULL,
  `U_RiskConcern` varchar(100) DEFAULT NULL,
  `U_CstmerVst` varchar(100) DEFAULT NULL,
  `U_WhtRcvd` varchar(100) DEFAULT NULL,
  `U_SlsPicFl` varchar(100) DEFAULT NULL,
  `U_SlsPicOI` varchar(100) DEFAULT NULL,
  `U_SlsMngr9` varchar(100) DEFAULT NULL,
  `U_SlsMngr10` varchar(100) DEFAULT NULL,
  `U_CrdtAnlyst` varchar(100) DEFAULT NULL,
  `U_HoldingCR` varchar(100) DEFAULT NULL,
  `U_InCbnt` varchar(100) DEFAULT NULL,
  `U_BzLink` varchar(100) DEFAULT NULL,
  `U_DueDate` varchar(100) DEFAULT NULL,
  `U_InvDvncDt` varchar(100) DEFAULT NULL,
  `U_InvoicePIC` varchar(100) DEFAULT NULL,
  `U_IBllngPic` varchar(100) DEFAULT NULL,
  `U_SndngMthd` varchar(100) DEFAULT NULL,
  `U_DescriptionPtn` varchar(100) DEFAULT NULL,
  `U_ReceiptDsp` varchar(100) DEFAULT NULL,
  `U_BranchID` varchar(100) DEFAULT NULL,
  `U_BranchName` varchar(100) DEFAULT NULL,
  `U_OffclCtgry` varchar(100) DEFAULT NULL,
  `U_GrntLttrDt` varchar(100) DEFAULT NULL,
  `U_AgrAcvtyCd` varchar(100) DEFAULT NULL,
  `U_EcAcvtyCd` varchar(100) DEFAULT NULL,
  `U_InvPrntPtrn` varchar(100) DEFAULT NULL,
  `U_CreditTerm` varchar(100) DEFAULT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftocrd` */

insert  into `ftocrd`(`Id`,`CardCode`,`CardName`,`CardFName`,`CardType`,`GroupCode`,`CmpPrivate`,`ValidFor`,`ECVatGroup`,`AddId`,`IndustryC`,`ValidComm`,`LicTradNum`,`DflAccount`,`GroupNum`,`DflBranch`,`WTLiable`,`E_mail`,`Phone1`,`CntctPrsn`,`CreatedAt`,`IntegrationStatus`,`IntegrationMessage`,`U_CstmNmSrch`,`U_CstmrCtgry`,`U_CstmrCdHQ`,`U_CutmrNtr`,`U_PsicPsoc`,`U_CrdtRtng`,`U_CrdRtUp`,`U_CrdtRtDtl`,`U_CrdtCtgry`,`U_VndrPrgrm`,`U_GrgCtgry`,`U_EqtyRt`,`U_OpePrd`,`U_ExpsrLmt`,`U_IDCrdAdd`,`U_MrtlStatus`,`U_Emplymnt`,`U_PrtsCmpyCd`,`U_PrtsCmpyNm`,`U_OrgnlGrpCd`,`U_OrgnlGrpNm`,`U_InvRtio`,`U_IntrdcrCd`,`U_IntrdcrNm`,`U_GrntrCd`,`U_AssetSize`,`U_TcCRR`,`U_PostCode`,`U_PrfssnType`,`U_Privies`,`U_FsclMnth`,`U_RgstrdCptl`,`U_EsblsmntDt`,`U_MngmntYrs`,`U_HeadCount`,`U_Credibility`,`U_RiskConcern`,`U_CstmerVst`,`U_WhtRcvd`,`U_SlsPicFl`,`U_SlsPicOI`,`U_SlsMngr9`,`U_SlsMngr10`,`U_CrdtAnlyst`,`U_HoldingCR`,`U_InCbnt`,`U_BzLink`,`U_DueDate`,`U_InvDvncDt`,`U_InvoicePIC`,`U_IBllngPic`,`U_SndngMthd`,`U_DescriptionPtn`,`U_ReceiptDsp`,`U_BranchID`,`U_BranchName`,`U_OffclCtgry`,`U_GrntLttrDt`,`U_AgrAcvtyCd`,`U_EcAcvtyCd`,`U_InvPrntPtrn`,`U_CreditTerm`,`U_RefNum`) values 
('08dd1fda-69b5-49e0-8631-838bbfc8f1be','C-1219005','SAMPLE BP 1219005','FESTO INC','C',101,'C','Y',NULL,'testing',NULL,NULL,'006720958000',NULL,-1,NULL,NULL,NULL,NULL,NULL,'2024-12-19 11:08:29.326869','E',' [OCRD.GroupCode] , \'Linked value 101 does not exist\'','FESTO INC',NULL,NULL,'testing','82223- Administrative Support Activities','5 - Corporate - Acceptable','2024-07-22',NULL,'C1:Normal',NULL,NULL,NULL,NULL,NULL,'testing','testing','testing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Large (assets>P100M)',NULL,'1605',NULL,NULL,NULL,NULL,'2007-05-03',NULL,NULL,NULL,NULL,'NOT REQUIRED','Agent (net)','Matthew Joshua Tan','Matthew Joshua Tan','Dianne Althea N. Red','Dianne Althea N. Red',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','00- Non Agricultural','74960- Management/Administrative Services',NULL,'On the execute date','C-12292'),
('08dd1fda-9468-4c63-889a-ac2a0479ca40','C-1219005','SAMPLE BP 1219005','FESTO INC','C',101,'C','Y',NULL,'testing',NULL,NULL,'006720958000',NULL,-1,NULL,NULL,NULL,NULL,NULL,'2024-12-19 11:09:40.969013','E',' [OCRD.GroupCode] , \'Linked value 101 does not exist\'','FESTO INC',NULL,NULL,'testing','82223- Administrative Support Activities','5 - Corporate - Acceptable','2024-07-22',NULL,'C1:Normal',NULL,NULL,NULL,NULL,NULL,'testing','testing','testing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Large (assets>P100M)',NULL,'1605',NULL,NULL,NULL,NULL,'2007-05-03',NULL,NULL,NULL,NULL,'NOT REQUIRED','Agent (net)','Matthew Joshua Tan','Matthew Joshua Tan','Dianne Althea N. Red','Dianne Althea N. Red',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','00- Non Agricultural','74960- Management/Administrative Services',NULL,'On the execute date','1219005'),
('08dd1fda-a189-4688-82f2-d7d8b7a97d1e','C-1219006','SAMPLE BP 1219006','FESTO INC','C',101,'C','Y',NULL,'testing',NULL,NULL,'006720958000',NULL,-1,NULL,NULL,NULL,NULL,NULL,'2024-12-19 11:10:02.993829','E',' [OCRD.GroupCode] , \'Linked value 101 does not exist\'','FESTO INC',NULL,NULL,'testing','82223- Administrative Support Activities','5 - Corporate - Acceptable','2024-07-22',NULL,'C1:Normal',NULL,NULL,NULL,NULL,NULL,'testing','testing','testing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Large (assets>P100M)',NULL,'1605',NULL,NULL,NULL,NULL,'2007-05-03',NULL,NULL,NULL,NULL,'NOT REQUIRED','Agent (net)','Matthew Joshua Tan','Matthew Joshua Tan','Dianne Althea N. Red','Dianne Althea N. Red',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','00- Non Agricultural','74960- Management/Administrative Services',NULL,'On the execute date','1219006'),
('08dd1fda-a332-4c60-8749-a31c53b22bb9','C-1219006','SAMPLE BP 1219006','FESTO INC','C',101,'C','Y',NULL,'testing',NULL,NULL,'006720958000',NULL,-1,NULL,NULL,NULL,NULL,NULL,'2024-12-19 11:10:05.781506','E',' [OCRD.GroupCode] , \'Linked value 101 does not exist\'','FESTO INC',NULL,NULL,'testing','82223- Administrative Support Activities','5 - Corporate - Acceptable','2024-07-22',NULL,'C1:Normal',NULL,NULL,NULL,NULL,NULL,'testing','testing','testing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Large (assets>P100M)',NULL,'1605',NULL,NULL,NULL,NULL,'2007-05-03',NULL,NULL,NULL,NULL,'NOT REQUIRED','Agent (net)','Matthew Joshua Tan','Matthew Joshua Tan','Dianne Althea N. Red','Dianne Althea N. Red',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','00- Non Agricultural','74960- Management/Administrative Services',NULL,'On the execute date','1219006'),
('08dd1fda-b177-409c-8906-21462b224734','C-1219007','SAMPLE BP 1219007','FESTO INC','C',101,'C','Y',NULL,'testing',NULL,NULL,'006720958000',NULL,-1,NULL,NULL,NULL,NULL,NULL,'2024-12-19 11:10:29.717310','E',' [OCRD.GroupCode] , \'Linked value 101 does not exist\'','FESTO INC',NULL,NULL,'testing','82223- Administrative Support Activities','5 - Corporate - Acceptable','2024-07-22',NULL,'C1:Normal',NULL,NULL,NULL,NULL,NULL,'testing','testing','testing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Large (assets>P100M)',NULL,'1605',NULL,NULL,NULL,NULL,'2007-05-03',NULL,NULL,NULL,NULL,'NOT REQUIRED','Agent (net)','Matthew Joshua Tan','Matthew Joshua Tan','Dianne Althea N. Red','Dianne Althea N. Red',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','00- Non Agricultural','74960- Management/Administrative Services',NULL,'On the execute date','1219007'),
('08dd1fdb-4784-4c5c-8176-f85bdb690ed5','C-1219007','SAMPLE BP 1219007','FESTO INC','S',101,'C','Y',NULL,'testing',NULL,NULL,'006720958000',NULL,-1,NULL,NULL,NULL,NULL,NULL,'2024-12-19 11:14:41.464994','S','Successfully Posted','FESTO INC',NULL,NULL,'testing','82223- Administrative Support Activities','5 - Corporate - Acceptable','2024-07-22',NULL,'C1:Normal',NULL,NULL,NULL,NULL,NULL,'testing','testing','testing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Large (assets>P100M)',NULL,'1605',NULL,NULL,NULL,NULL,'2007-05-03',NULL,NULL,NULL,NULL,'NOT REQUIRED','Agent (net)','Matthew Joshua Tan','Matthew Joshua Tan','Dianne Althea N. Red','Dianne Althea N. Red',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','00- Non Agricultural','74960- Management/Administrative Services',NULL,'On the execute date','1219007'),
('08dd1fdb-6759-49aa-8533-7e994a81b753','C-1219007','SAMPLE BP 1219007','FESTO INC','S',103,'C','Y',NULL,'testing',NULL,NULL,'006720958000',NULL,-1,NULL,NULL,NULL,NULL,NULL,'2024-12-19 11:15:34.869365','E','1320000140 - Business partner code \'C-1219007\' already assigned to a business partner; enter a unique business partner code','FESTO INC',NULL,NULL,'testing','82223- Administrative Support Activities','5 - Corporate - Acceptable','2024-07-22',NULL,'C1:Normal',NULL,NULL,NULL,NULL,NULL,'testing','testing','testing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Large (assets>P100M)',NULL,'1605',NULL,NULL,NULL,NULL,'2007-05-03',NULL,NULL,NULL,NULL,'NOT REQUIRED','Agent (net)','Matthew Joshua Tan','Matthew Joshua Tan','Dianne Althea N. Red','Dianne Althea N. Red',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','00- Non Agricultural','74960- Management/Administrative Services',NULL,'On the execute date','1219007'),
('08dd1fdb-937b-4943-833b-80dec96488ee','C-1219008','SAMPLE BP 1219008','FESTO INC','S',103,'C','Y',NULL,'testing',NULL,NULL,'006720958000',NULL,-1,NULL,NULL,NULL,NULL,NULL,'2024-12-19 11:16:48.910823','S','Successfully Posted','FESTO INC',NULL,NULL,'testing','82223- Administrative Support Activities','5 - Corporate - Acceptable','2024-07-22',NULL,'C1:Normal',NULL,NULL,NULL,NULL,NULL,'testing','testing','testing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Large (assets>P100M)',NULL,'1605',NULL,NULL,NULL,NULL,'2007-05-03',NULL,NULL,NULL,NULL,'NOT REQUIRED','Agent (net)','Matthew Joshua Tan','Matthew Joshua Tan','Dianne Althea N. Red','Dianne Althea N. Red',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','00- Non Agricultural','74960- Management/Administrative Services',NULL,'On the execute date','1219008'),
('08dd1fdc-1afb-46aa-8333-ea807bc3e930','C-1219008','SAMPLE BP 1219008','FESTO INC','S',103,'C','N',NULL,'testing',NULL,NULL,'006720958000',NULL,-1,NULL,NULL,NULL,NULL,NULL,'2024-12-19 11:20:36.241450','E','1320000140 - Business partner code \'C-1219008\' already assigned to a business partner; enter a unique business partner code','FESTO INC',NULL,NULL,'testing','82223- Administrative Support Activities','5 - Corporate - Acceptable','2024-07-22',NULL,'C1:Normal',NULL,NULL,NULL,NULL,NULL,'testing','testing','testing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Large (assets>P100M)',NULL,'1605',NULL,NULL,NULL,NULL,'2007-05-03',NULL,NULL,NULL,NULL,'NOT REQUIRED','Agent (net)','Matthew Joshua Tan','Matthew Joshua Tan','Dianne Althea N. Red','Dianne Althea N. Red',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','00- Non Agricultural','74960- Management/Administrative Services',NULL,'On the execute date','1219008'),
('08dd1fdc-2b5f-4709-8814-7d6cffe87ff7','C-1219009','SAMPLE BP 1219009','FESTO INC','S',103,'C','N',NULL,'testing',NULL,NULL,'006720958000',NULL,-1,NULL,NULL,NULL,NULL,NULL,'2024-12-19 11:21:03.741210','S','Successfully Posted','FESTO INC',NULL,NULL,'testing','82223- Administrative Support Activities','5 - Corporate - Acceptable','2024-07-22',NULL,'C1:Normal',NULL,NULL,NULL,NULL,NULL,'testing','testing','testing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Large (assets>P100M)',NULL,'1605',NULL,NULL,NULL,NULL,'2007-05-03',NULL,NULL,NULL,NULL,'NOT REQUIRED','Agent (net)','Matthew Joshua Tan','Matthew Joshua Tan','Dianne Althea N. Red','Dianne Althea N. Red',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','00- Non Agricultural','74960- Management/Administrative Services',NULL,'On the execute date','1219009'),
('08dd1fdc-66e5-468b-8983-fc1a67dd8e65','C-1219009','SAMPLE BP 1219009','FESTO INC','S',103,'C','N',NULL,'testing',NULL,NULL,'006720958000',NULL,-1,NULL,NULL,NULL,NULL,NULL,'2024-12-19 11:22:43.604670','E','1320000140 - Business partner code \'C-1219009\' already assigned to a business partner; enter a unique business partner code','FESTO INC',NULL,NULL,'testing','82223- Administrative Support Activities','5 - Corporate - Acceptable','2024-07-22',NULL,'C1:Normal',NULL,NULL,NULL,NULL,NULL,'testing','testing','testing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Large (assets>P100M)',NULL,'1605',NULL,NULL,NULL,NULL,'2007-05-03',NULL,NULL,NULL,NULL,'NOT REQUIRED','Agent (net)','Matthew Joshua Tan','Matthew Joshua Tan','Dianne Althea N. Red','Dianne Althea N. Red',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','00- Non Agricultural','74960- Management/Administrative Services',NULL,'On the execute date','1219009');

/*Table structure for table `ftodpi` */

DROP TABLE IF EXISTS `ftodpi`;

CREATE TABLE `ftodpi` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `U_FileName` varchar(100) DEFAULT NULL,
  `IntegrationStatus` varchar(1) NOT NULL,
  `IntegrationMessage` longtext DEFAULT NULL,
  `DocEntry` int(11) DEFAULT NULL,
  `DocNum` int(11) DEFAULT NULL,
  `CardCode` varchar(15) NOT NULL,
  `CardName` varchar(100) DEFAULT NULL,
  `NumAtCard` varchar(100) DEFAULT NULL,
  `DocType` varchar(1) DEFAULT NULL,
  `DocDate` date NOT NULL,
  `DocDueDate` date NOT NULL,
  `TaxDate` date NOT NULL,
  `PaymentTerms` longtext DEFAULT NULL,
  `JrnlMemo` varchar(254) DEFAULT NULL,
  `Comments` varchar(254) DEFAULT NULL,
  `Posted` varchar(1) NOT NULL,
  `Canceled` varchar(1) NOT NULL,
  `CancelDate` datetime(6) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftodpi` */

insert  into `ftodpi`(`Id`,`U_RefNum`,`U_FileName`,`IntegrationStatus`,`IntegrationMessage`,`DocEntry`,`DocNum`,`CardCode`,`CardName`,`NumAtCard`,`DocType`,`DocDate`,`DocDueDate`,`TaxDate`,`PaymentTerms`,`JrnlMemo`,`Comments`,`Posted`,`Canceled`,`CancelDate`,`CreatedAt`) values 
('08dd345b-744f-4b8b-8a9c-e5c88f91a7ed','1126003','BPICTR_DOC_0DPI_203_1126003_20241121_1','S','Successfully Posted',15,15,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','1126003','I','2024-11-26','2024-11-26','2024-11-26',NULL,'AR Invoice - Item Type with withholding -  API','AR Invoice - Item Type with withholding -  API','Y','N',NULL,'2025-01-14 13:22:35.395872'),
('08dd345b-cfc9-4d5f-86ac-5402408830f6','1126004','BPICTR_DOC_0DPI_203_1126003_20250114_1','E','10000156 - Posting Date deviates from the defined range. To complete the operation, define the posting period to match the entered Posting Date.',NULL,NULL,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','1126004','I','2025-01-14','2025-01-14','2025-01-14',NULL,'AR Invoice - Item Type with withholding -  API','AR Invoice - Item Type with withholding -  API','E','N',NULL,'2025-01-14 13:25:08.921990'),
('08dd345c-1df2-416d-84cf-a166c97b7c46','11260031','BPICTR_DOC_0DPI_203_11260031_20241121_1','E','1250000077 - Select a withholding tax code of the category \'Payment\'',16,16,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','11260031','I','2024-11-26','2024-11-26','2024-11-26',NULL,'AR Invoice - Item Type with withholding -  API','AR Invoice - Item Type with withholding -  API','E','N',NULL,'2025-01-14 13:27:20.050799'),
('08dd3478-827a-42a5-8b09-8b545fa2b298','11260031','BPICTR_DOC_0DPI_203_11260031_20241121_1','E','1250000077 - Select a withholding tax code of the category \'Payment\'',NULL,NULL,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','11260031','I','2024-11-26','2024-11-26','2024-11-26',NULL,'AR Invoice - Item Type with withholding -  API','AR Invoice - Item Type with withholding -  API','E','N',NULL,'2025-01-14 16:50:34.567032'),
('08dd3479-1d0a-4e84-830e-491a18099965','11260031','BPICTR_DOC_0DPI_203_11260031_20241121_1','S','Successfully Posted',20,20,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','11260031','I','2024-11-26','2024-11-26','2024-11-26',NULL,'AR Invoice - Item Type with withholding -  API','AR Invoice - Item Type with withholding -  API','Y','N',NULL,'2025-01-14 16:54:53.869326'),
('08dd347d-ed23-407c-87a8-d533c4cdf022','11260031','BPICTR_DOC_0DPI_203_11260031_20241121_1','S','Successfully Posted',21,21,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','11260031','I','2024-11-26','2024-11-26','2024-11-26',NULL,'AR Invoice - Item Type with withholding -  API','AR Invoice - Item Type with withholding -  API','Y','N',NULL,'2025-01-14 17:29:20.981629'),
('08dd3507-911d-4772-858b-75385cf9fc6f','011525001','BPICTR_DOC_0DPI_203_1126003_20241121_1','S','Successfully Posted',27,27,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','1126003','I','2025-01-15','2025-01-15','2025-01-15',NULL,'AR Invoice - Item Type with withholding -  API','AR Invoice - Item Type with withholding -  API','Y','N',NULL,'2025-01-15 09:54:37.153431'),
('08dd368c-630a-4ffd-8aed-d9eb67788a31','011725001','BPICTR_DOC_0DPI_203_1126003_20241121_1','S','Successfully Posted',28,28,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','1126003','I','2025-01-15','2025-01-15','2025-01-15',NULL,'AR Invoice - Item Type with withholding -  API','AR Invoice - Item Type with withholding -  API','Y','N',NULL,'2025-01-17 08:17:54.087102'),
('08dd368d-68fb-41cd-8a56-f48bf6c52adc','011725002','BPICTR_DOC_0DPI_203_1126003_20241121_1','S','Successfully Posted',29,29,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','011725002','I','2025-01-15','2025-01-15','2025-01-15',NULL,'AR Invoice - Item Type with withholding -  API','AR Invoice - Item Type with withholding -  API','Y','N',NULL,'2025-01-17 08:25:13.536921'),
('08dd368f-6744-475d-8b22-8dc9a8f67cf3','011725004','BPICTR_DOC_0DPI_203_1126003_20241121_1','S','Successfully Posted',31,31,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','011725004','I','2025-01-15','2025-01-15','2025-01-15',NULL,'AR Invoice - Item Type with withholding -  API','AR Invoice - Item Type with withholding -  API','Y','N',NULL,'2025-01-17 08:39:29.723418');

/*Table structure for table `ftoinv` */

DROP TABLE IF EXISTS `ftoinv`;

CREATE TABLE `ftoinv` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `U_FileName` varchar(100) DEFAULT NULL,
  `IntegrationStatus` varchar(1) NOT NULL,
  `IntegrationMessage` longtext DEFAULT NULL,
  `DocEntry` int(11) DEFAULT NULL,
  `DocNum` int(11) DEFAULT NULL,
  `CardCode` varchar(15) NOT NULL,
  `CardName` varchar(100) DEFAULT NULL,
  `NumAtCard` varchar(100) DEFAULT NULL,
  `DocType` varchar(1) DEFAULT NULL,
  `DocDate` date NOT NULL,
  `DocDueDate` date NOT NULL,
  `TaxDate` date NOT NULL,
  `PaymentTerms` longtext DEFAULT NULL,
  `JrnlMemo` varchar(254) DEFAULT NULL,
  `Comments` varchar(254) DEFAULT NULL,
  `Posted` varchar(1) NOT NULL,
  `Canceled` varchar(1) NOT NULL,
  `CancelDate` datetime(6) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftoinv` */

insert  into `ftoinv`(`Id`,`U_RefNum`,`U_FileName`,`IntegrationStatus`,`IntegrationMessage`,`DocEntry`,`DocNum`,`CardCode`,`CardName`,`NumAtCard`,`DocType`,`DocDate`,`DocDueDate`,`TaxDate`,`PaymentTerms`,`JrnlMemo`,`Comments`,`Posted`,`Canceled`,`CancelDate`,`CreatedAt`) values 
('08dd1fc8-084a-4fd9-8c31-6beef535003d','1218001','FESTO INC','S','Successfully Posted',190,360000190,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','1218001','S','2024-11-01','2024-11-15','2024-11-01',NULL,'0907-0007-01','RENTAL - Geely Coolray 1.5L Comfort DCT AT 2022','Y','N',NULL,'2024-12-19 08:56:54.898631'),
('08dd1fd2-0da3-40ea-8546-8b8c0a53f32e','65000280206','FESTO INC','S','Successfully Posted',192,360000192,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','65000280206','S','2024-11-01','2024-11-15','2024-11-01',NULL,'0907-0007-01','RENTAL - Geely Coolray 1.5L Comfort DCT AT 2022','Y','N',NULL,'2024-12-19 10:08:38.822308'),
('08dd1fd2-bc65-45a9-8ead-f2bcfa0fd5ad','65000280206','FESTO INC','S','Successfully Posted',193,360000193,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','65000280206','S','2024-11-01','2024-11-15','2024-11-01',NULL,'0907-0007-01','RENTAL - Geely Coolray 1.5L Comfort DCT AT 2022','Y','N',NULL,'2024-12-19 10:13:32.080520'),
('08dd1fd4-f440-4f2c-88cc-17a8011a910d','65000280206','FESTO INC','S','Successfully Posted',194,360000194,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','65000280206','S','2024-11-01','2024-11-15','2024-11-01',NULL,'0907-0007-01','RENTAL - Geely Coolray 1.5L Comfort DCT AT 2022','Y','N',NULL,'2024-12-19 10:29:24.788798'),
('08dd200e-a1dc-485a-8532-2985c6a6c1ff','65000280206','FESTO INC','S','Successfully Posted',195,360000195,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','65000280206','S','2024-11-01','2024-11-15','2024-11-01',NULL,'0907-0007-01','RENTAL - Geely Coolray 1.5L Comfort DCT AT 2022','Y','N',NULL,'2024-12-19 17:22:17.365741'),
('08dd200f-d2b3-4407-850f-e81f6d061271','1219009','FESTO INC','S','Successfully Posted',196,360000196,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','1219009','S','2024-11-01','2024-11-15','2024-11-01',NULL,'0907-0007-01','RENTAL - Geely Coolray 1.5L Comfort DCT AT 2022','Y','N',NULL,'2024-12-19 17:30:48.802297'),
('08dd200f-e16e-41c5-8a77-b16303969830','12190012','FESTO INC','S','Successfully Posted',197,360000197,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','12190012','S','2024-11-01','2024-11-15','2024-11-01',NULL,'0907-0007-01','RENTAL - Geely Coolray 1.5L Comfort DCT AT 2022','Y','N',NULL,'2024-12-19 17:31:13.515163'),
('08dd2010-372e-401e-821c-f4585ceff6cc','65000280206','FESTO INC','S','Successfully Posted',199,360000199,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','65000280206','S','2024-11-01','2024-11-15','2024-11-01',NULL,'0907-0007-01','RENTAL - Geely Coolray 1.5L Comfort DCT AT 2022','Y','N',NULL,'2024-12-19 17:33:37.379173'),
('08dd2010-de86-4f1d-8989-84c9da48fa61','12190013','FESTO INC','S','Successfully Posted',200,360000200,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','12190013','S','2024-11-01','2024-11-15','2024-11-01',NULL,'0907-0007-01','RENTAL - Geely Coolray 1.5L Comfort DCT AT 2022','Y','N',NULL,'2024-12-19 17:38:18.140979'),
('08dd2011-cab1-4fce-844a-15db1d70eaec','65000280206','FESTO INC','E','U_RefNum already exist',NULL,NULL,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','65000280206','S','2024-11-01','2024-11-15','2024-11-01',NULL,'0907-0007-01','RENTAL - Geely Coolray 1.5L Comfort DCT AT 2022','E','N',NULL,'2024-12-19 17:44:54.365847'),
('08dd3528-856e-457c-8eec-8874d60c360e','000018','string','E','Item number is missing; specify an item number',NULL,NULL,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','000018','I','2024-10-02','2024-10-02','2024-10-02',NULL,'AR invoice - Service CASH AND BANK TRANSFER-API','AR invoice - Service CASH AND BANK TRANSFER-API','E','N',NULL,'2025-01-15 13:50:30.949352'),
('08dd3529-9ef6-4309-8957-7e9defe292ee','string','string','E','Invalid BP code  [OINV.CardCode] , \'string\'',NULL,NULL,'string','string','string','I','2025-01-15','2025-01-15','2025-01-15',NULL,'string','string','E','N',NULL,'2025-01-15 13:58:23.264940'),
('08dd35f3-2243-40f3-88ad-2e1ba0e3223c','121300013','test ufileName','E','U_RefNum already exist',NULL,NULL,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','121300013','S','2024-12-03','2024-12-03','2024-12-03',NULL,'AR invoice - Service with withholding-API','AR invoice - Service with withholding-API','E','N',NULL,'2025-01-16 14:00:52.416381'),
('08dd35f4-3031-4545-8cab-96614fedf0df','121300013','test ufileName','E','U_RefNum already exist',NULL,NULL,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','121300013','S','2024-12-03','2024-12-03','2024-12-03',NULL,'AR invoice - Service with withholding-API','AR invoice - Service with withholding-API','E','N',NULL,'2025-01-16 14:08:25.257963'),
('08dd368e-31a3-4d2a-88cf-5a8ade364f73','011725003','BPICTR_DOC_OINV_13_011725003_20241121_1','S','Successfully Posted',203,360000203,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','011725003','I','2025-01-15','2025-01-15','2025-01-15',NULL,'AR Invoice - Item Type with withholding -  API','AR Invoice - Item Type with withholding - API','Y','N',NULL,'2025-01-17 08:30:50.252752');

/*Table structure for table `ftoitm` */

DROP TABLE IF EXISTS `ftoitm`;

CREATE TABLE `ftoitm` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ItemCode` varchar(50) NOT NULL,
  `ItemName` varchar(200) NOT NULL,
  `AsstStatus` varchar(1) NOT NULL,
  `AssetClass` varchar(20) DEFAULT NULL,
  `ItemType` varchar(1) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `U_RefNum` varchar(30) NOT NULL,
  `U_SalesAg` varchar(30) DEFAULT NULL,
  `U_AssetAcct` varchar(20) DEFAULT NULL,
  `U_Maker` varchar(100) DEFAULT NULL,
  `U_Model` varchar(100) DEFAULT NULL,
  `U_ModYear` varchar(10) DEFAULT NULL,
  `U_Serial` varchar(30) DEFAULT NULL,
  `U_GDate` varchar(10) DEFAULT NULL,
  `U_Chasis` varchar(254) DEFAULT NULL,
  `U_Engine` varchar(254) DEFAULT NULL,
  `U_Color` varchar(20) DEFAULT NULL,
  `U_EquipID` varchar(10) DEFAULT NULL,
  `U_LMADate` varchar(10) DEFAULT NULL,
  `U_NMADate` varchar(10) DEFAULT NULL,
  `U_AssInfo1` varchar(254) DEFAULT NULL,
  `U_AssInfo2` varchar(254) DEFAULT NULL,
  `U_AssInfo3` varchar(254) DEFAULT NULL,
  `U_AssLoc` varchar(10) DEFAULT NULL,
  `U_AssLocM` varchar(254) DEFAULT NULL,
  `U_AssRes` varchar(20) DEFAULT NULL,
  `U_Contract` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftoitm` */

insert  into `ftoitm`(`Id`,`ItemCode`,`ItemName`,`AsstStatus`,`AssetClass`,`ItemType`,`CreatedAt`,`U_RefNum`,`U_SalesAg`,`U_AssetAcct`,`U_Maker`,`U_Model`,`U_ModYear`,`U_Serial`,`U_GDate`,`U_Chasis`,`U_Engine`,`U_Color`,`U_EquipID`,`U_LMADate`,`U_NMADate`,`U_AssInfo1`,`U_AssInfo2`,`U_AssInfo3`,`U_AssLoc`,`U_AssLocM`,`U_AssRes`,`U_Contract`) values 
('08dd1fcb-9737-476e-8707-3aa222915a1a','V0006261','Toyota Wigo 1.0L J MT 2025','N','VEHICLE - Leased','I','2024-12-19 09:22:23.161025','1218002','0120-0197-01','C-12619',NULL,'1.0L J','2025','RK057A','','MHKAA1BC4RJ026984','1KRA916911','GRAY METALLIC',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'0120-0197-01'),
('08dd1fcc-26d9-41df-8b40-fc41245f3595','FA1219003','Sample FA1219003','N','VEHICLE - Leased','I','2024-12-19 09:26:24.200179','1218002','0120-0197-01','C-12619',NULL,'1.0L J','2025','RK057A','','MHKAA1BC4RJ026984','1KRA916911','GRAY METALLIC',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'0120-0197-01'),
('08dd1fcc-8309-43e1-84ed-3fa3884c7b0e','FA1219004','Sample FA1219004','N','VEHICLE - Leased','I','2024-12-19 09:28:58.867037','1219004','0120-0197-01','C-12619',NULL,'1.0L J','2025','RK057A','','MHKAA1BC4RJ026984','1KRA916911','GRAY METALLIC',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'0120-0197-01'),
('08dd1fd5-b890-4dd1-8cb7-4961f0b4364e','FA1219004','Sample FA1219004','N','VEHICLE - Leased','I','2024-12-19 10:34:54.143658','1219004','0120-0197-01','C-12619',NULL,'1.0L J','2025','RK057A','','MHKAA1BC4RJ026984','1KRA916911','GRAY METALLIC',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'0120-0197-01'),
('08dd1fd6-9ed5-4419-854c-46a7a1415c02','FA1219004','Sample FA1219004','N','VEHICLE - Leased','I','2024-12-19 10:41:20.470085','1219004','0120-0197-01','C-12619',NULL,'1.0L J','2025','RK057A','','MHKAA1BC4RJ026984','1KRA916911','GRAY METALLIC',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'0120-0197-01'),
('08dd1fd8-8b08-44aa-8110-33cb89a9ebf5','FA1219004','Sample FA1219004','N','VEHICLE - Leased','I','2024-12-19 10:55:06.244114','1219004','0120-0197-01','C-12619',NULL,'1.0L J','2025','RK057A','','MHKAA1BC4RJ026984','1KRA916911','GRAY METALLIC',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'0120-0197-01'),
('08dd200e-76d7-4d9b-8f1f-1758bed8c05d','FA12190010','Sample FA12190010','N','VEHICLE - Leased','I','2024-12-19 17:21:05.135352','12190010','0120-0197-01','C-12619',NULL,'1.0L J','2025','RK057A','','MHKAA1BC4RJ026984','1KRA916911','GRAY METALLIC',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'0120-0197-01'),
('08dd200e-ed61-4622-83ba-fb839d05c092','FA12190011','Sample FA12190011','N','VEHICLE - Leased','I','2024-12-19 17:24:24.064991','12190011','0120-0197-01','C-12619',NULL,'1.0L J','2025','RK057A','','MHKAA1BC4RJ026984','1KRA916911','GRAY METALLIC',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'0120-0197-01');

/*Table structure for table `ftojdt` */

DROP TABLE IF EXISTS `ftojdt`;

CREATE TABLE `ftojdt` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `BatchNum` int(11) DEFAULT NULL,
  `TransId` int(11) DEFAULT NULL,
  `BtfStatus` varchar(1) DEFAULT NULL,
  `TransType` varchar(20) DEFAULT NULL,
  `BaseRef` varchar(11) DEFAULT NULL,
  `RefDate` date DEFAULT NULL,
  `Memo` varchar(254) DEFAULT NULL,
  `Ref1` varchar(100) DEFAULT NULL,
  `Ref2` varchar(100) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `LocTotal` decimal(19,6) DEFAULT NULL,
  `FcTotal` decimal(19,6) DEFAULT NULL,
  `SysTotal` decimal(19,6) DEFAULT NULL,
  `TransCode` varchar(4) DEFAULT NULL,
  `OrignCurr` varchar(3) DEFAULT NULL,
  `TransRate` decimal(19,6) DEFAULT NULL,
  `BtfLine` int(11) DEFAULT NULL,
  `TransCurr` varchar(3) DEFAULT NULL,
  `Project` varchar(20) DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `TaxDate` date DEFAULT NULL,
  `PCAddition` varchar(1) DEFAULT NULL,
  `FinncPriod` int(11) DEFAULT NULL,
  `DataSource` varchar(1) DEFAULT NULL,
  `UpdateDate` date DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  `UserSign` int(11) DEFAULT NULL,
  `UserSign2` int(11) DEFAULT NULL,
  `RefndRprt` varchar(1) DEFAULT NULL,
  `LogInstanc` int(11) DEFAULT NULL,
  `ObjType` varchar(20) DEFAULT NULL,
  `Indicator` varchar(2) DEFAULT NULL,
  `AdjTran` varchar(1) DEFAULT NULL,
  `RevSource` varchar(1) DEFAULT NULL,
  `StornoDate` date DEFAULT NULL,
  `StornoToTr` int(11) DEFAULT NULL,
  `AutoStorno` varchar(1) DEFAULT NULL,
  `Corisptivi` varchar(1) DEFAULT NULL,
  `VatDate` date DEFAULT NULL,
  `StampTax` varchar(1) DEFAULT NULL,
  `Series` int(11) DEFAULT NULL,
  `Number` int(11) DEFAULT NULL,
  `AutoVAT` varchar(1) DEFAULT NULL,
  `DocSeries` int(11) DEFAULT NULL,
  `FolioPref` varchar(4) DEFAULT NULL,
  `FolioNum` int(11) DEFAULT NULL,
  `CreateTime` int(11) DEFAULT NULL,
  `BlockDunn` varchar(1) DEFAULT NULL,
  `ReportEU` varchar(1) DEFAULT NULL,
  `Report347` varchar(1) DEFAULT NULL,
  `Printed` varchar(1) DEFAULT NULL,
  `DocType` varchar(60) DEFAULT NULL,
  `AttNum` int(11) DEFAULT NULL,
  `GenRegNo` varchar(1) DEFAULT NULL,
  `RG23APart2` int(11) DEFAULT NULL,
  `RG23CPart2` int(11) DEFAULT NULL,
  `MatType` int(11) DEFAULT NULL,
  `Creator` varchar(155) DEFAULT NULL,
  `Approver` varchar(155) DEFAULT NULL,
  `Location` int(11) DEFAULT NULL,
  `SeqCode` int(11) DEFAULT NULL,
  `Serial` int(11) DEFAULT NULL,
  `SeriesStr` varchar(3) DEFAULT NULL,
  `SubStr` varchar(3) DEFAULT NULL,
  `AutoWT` varchar(1) DEFAULT NULL,
  `WTSum` decimal(19,6) DEFAULT NULL,
  `WTSumSC` decimal(19,6) DEFAULT NULL,
  `WTSumFC` decimal(19,6) DEFAULT NULL,
  `WTApplied` decimal(19,6) DEFAULT NULL,
  `WTAppliedS` decimal(19,6) DEFAULT NULL,
  `WTAppliedF` decimal(19,6) DEFAULT NULL,
  `BaseAmnt` decimal(19,6) DEFAULT NULL,
  `BaseAmntSC` decimal(19,6) DEFAULT NULL,
  `BaseAmntFC` decimal(19,6) DEFAULT NULL,
  `BaseVtAt` decimal(19,6) DEFAULT NULL,
  `BaseVtAtSC` decimal(19,6) DEFAULT NULL,
  `BaseVtAtFC` decimal(19,6) DEFAULT NULL,
  `VersionNum` varchar(13) DEFAULT NULL,
  `BaseTrans` int(11) DEFAULT NULL,
  `ResidenNum` varchar(1) DEFAULT NULL,
  `OperatCode` varchar(1) DEFAULT NULL,
  `Ref3` varchar(100) DEFAULT NULL,
  `SSIExmpt` varchar(1) DEFAULT NULL,
  `SignMsg` varchar(16) DEFAULT NULL,
  `SignDigest` varchar(16) DEFAULT NULL,
  `CertifNum` varchar(50) DEFAULT NULL,
  `KeyVersion` int(11) DEFAULT NULL,
  `CUP` int(11) DEFAULT NULL,
  `CIG` int(11) DEFAULT NULL,
  `SupplCode` varchar(254) DEFAULT NULL,
  `SPSrcType` int(11) DEFAULT NULL,
  `SPSrcID` int(11) DEFAULT NULL,
  `SPSrcDLN` int(11) DEFAULT NULL,
  `DeferedTax` varchar(1) DEFAULT NULL,
  `AgrNo` int(11) DEFAULT NULL,
  `SeqNum` int(11) DEFAULT NULL,
  `ECDPosTyp` varchar(1) DEFAULT NULL,
  `RptPeriod` varchar(5) DEFAULT NULL,
  `RptMonth` date DEFAULT NULL,
  `ExTransId` int(11) DEFAULT NULL,
  `PrlLinked` varchar(1) DEFAULT NULL,
  `PTICode` varchar(5) DEFAULT NULL,
  `Letter` varchar(1) DEFAULT NULL,
  `FolNumFrom` int(11) DEFAULT NULL,
  `FolNumTo` int(11) DEFAULT NULL,
  `RepSection` varchar(3) DEFAULT NULL,
  `ExclTaxRep` varchar(1) DEFAULT NULL,
  `IsCoEntry` varchar(1) DEFAULT NULL,
  `SAPPassprt` varchar(16) DEFAULT NULL,
  `AtcEntry` int(11) DEFAULT NULL,
  `Attachment` varchar(16) DEFAULT NULL,
  `EBookable` varchar(1) DEFAULT NULL,
  `DataVers` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `U_DocNum` varchar(20) DEFAULT NULL,
  `U_RefNum` varchar(30) NOT NULL,
  `IntegrationStatus` varchar(1) NOT NULL,
  `IntegrationMessage` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftojdt` */

/*Table structure for table `ftopch` */

DROP TABLE IF EXISTS `ftopch`;

CREATE TABLE `ftopch` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `U_FileName` varchar(100) DEFAULT NULL,
  `IntegrationStatus` varchar(1) NOT NULL,
  `IntegrationMessage` longtext DEFAULT NULL,
  `DocEntry` int(11) DEFAULT NULL,
  `DocNum` int(11) DEFAULT NULL,
  `CardCode` varchar(15) NOT NULL,
  `CardName` varchar(100) DEFAULT NULL,
  `NumAtCard` varchar(100) DEFAULT NULL,
  `DocType` varchar(1) DEFAULT NULL,
  `DocDate` date NOT NULL,
  `DocDueDate` date NOT NULL,
  `TaxDate` date NOT NULL,
  `PaymentTerms` longtext DEFAULT NULL,
  `JrnlMemo` varchar(254) DEFAULT NULL,
  `Comments` varchar(254) DEFAULT NULL,
  `Posted` varchar(1) NOT NULL,
  `Canceled` varchar(1) NOT NULL,
  `CancelDate` datetime(6) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftopch` */

/*Table structure for table `ftorct` */

DROP TABLE IF EXISTS `ftorct`;

CREATE TABLE `ftorct` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `U_FileName` varchar(100) DEFAULT NULL,
  `IntegrationStatus` varchar(1) NOT NULL,
  `IntegrationMessage` longtext DEFAULT NULL,
  `DocNum` int(11) DEFAULT NULL,
  `CardCode` varchar(15) NOT NULL,
  `CardName` varchar(100) DEFAULT NULL,
  `DocDate` date DEFAULT NULL,
  `CashAccnt` longtext DEFAULT NULL,
  `CashSum` decimal(19,6) NOT NULL,
  `TrsfrAcct` varchar(15) NOT NULL,
  `TrsfrDate` date DEFAULT NULL,
  `TrsfrRef` varchar(15) DEFAULT NULL,
  `TrsfrSum` decimal(19,6) NOT NULL,
  `Canceled` varchar(1) DEFAULT NULL,
  `Series` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftorct` */

insert  into `ftorct`(`Id`,`U_RefNum`,`U_FileName`,`IntegrationStatus`,`IntegrationMessage`,`DocNum`,`CardCode`,`CardName`,`DocDate`,`CashAccnt`,`CashSum`,`TrsfrAcct`,`TrsfrDate`,`TrsfrRef`,`TrsfrSum`,`Canceled`,`Series`,`CreatedAt`) values 
('08dd35f7-9e8f-4b3a-8eba-4bc5c8a30620','121300013','MICRODATA SYSTEMS AND MANAGEMENT, INC.','S','Successfully Cancelled',NULL,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','2025-01-16','test001',100000.000000,'test002','2025-01-16','121300013',10000.000000,'S',1,'2025-01-16 14:32:58.983046'),
('08dd368d-f8ac-4725-8d99-2ef675e96d16','011725002','BPICTR_PAY_ORCT_24_1128002_20241121_1','S','Successfully Posted',NULL,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','2025-01-15','_SYS00000000004',10000.000000,'_SYS00000000005','2025-01-15','011725002',6050.000000,'N',70,'2025-01-17 08:29:14.678355'),
('08dd368f-74c9-4360-8e0e-66f8466b15e8','011725002','BPICTR_PAY_ORCT_24_1128002_20241121_1','E','Payment amount is greater than invoice amount  [RCT2.SumApplied][line: 1]',NULL,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','2025-01-15','_SYS00000000004',10000.000000,'_SYS00000000005','2025-01-15','011725002',6050.000000,'N',70,'2025-01-17 08:39:52.403797'),
('08dd368f-8127-48ce-8576-6d165506ea0a','011725004','BPICTR_PAY_ORCT_24_1128002_20241121_1','S','Successfully Posted',NULL,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','2025-01-15','_SYS00000000004',10000.000000,'_SYS00000000005','2025-01-15','011725004',6050.000000,'N',70,'2025-01-17 08:40:13.154344'),
('08dd368f-8d12-4b98-8e84-96f05c4ed16e','011725004','BPICTR_PAY_ORCT_24_1128002_20241121_1','E','Payment amount is greater than invoice amount  [RCT2.SumApplied][line: 1]',NULL,'C-00005','MICRODATA SYSTEMS AND MANAGEMENT, INC.','2025-01-15','_SYS00000000004',10000.000000,'_SYS00000000005','2025-01-15','011725004',6050.000000,'N',70,'2025-01-17 08:40:33.150983');

/*Table structure for table `ftorin` */

DROP TABLE IF EXISTS `ftorin`;

CREATE TABLE `ftorin` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `U_FileName` varchar(100) DEFAULT NULL,
  `IntegrationStatus` varchar(1) NOT NULL,
  `IntegrationMessage` longtext DEFAULT NULL,
  `DocEntry` int(11) DEFAULT NULL,
  `DocNum` int(11) DEFAULT NULL,
  `CardCode` varchar(15) NOT NULL,
  `CardName` varchar(100) DEFAULT NULL,
  `NumAtCard` varchar(100) DEFAULT NULL,
  `DocType` varchar(1) DEFAULT NULL,
  `DocDate` date NOT NULL,
  `DocDueDate` date NOT NULL,
  `TaxDate` date NOT NULL,
  `PaymentTerms` longtext DEFAULT NULL,
  `JrnlMemo` varchar(254) DEFAULT NULL,
  `Comments` varchar(254) DEFAULT NULL,
  `Posted` varchar(1) NOT NULL,
  `Canceled` varchar(1) NOT NULL,
  `CancelDate` datetime(6) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftorin` */

/*Table structure for table `ftorpc` */

DROP TABLE IF EXISTS `ftorpc`;

CREATE TABLE `ftorpc` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `U_FileName` varchar(100) DEFAULT NULL,
  `IntegrationStatus` varchar(1) NOT NULL,
  `IntegrationMessage` longtext DEFAULT NULL,
  `DocEntry` int(11) DEFAULT NULL,
  `DocNum` int(11) DEFAULT NULL,
  `CardCode` varchar(15) NOT NULL,
  `CardName` varchar(100) DEFAULT NULL,
  `NumAtCard` varchar(100) DEFAULT NULL,
  `DocType` varchar(1) DEFAULT NULL,
  `DocDate` date NOT NULL,
  `DocDueDate` date NOT NULL,
  `TaxDate` date NOT NULL,
  `PaymentTerms` longtext DEFAULT NULL,
  `JrnlMemo` varchar(254) DEFAULT NULL,
  `Comments` varchar(254) DEFAULT NULL,
  `Posted` varchar(1) NOT NULL,
  `Canceled` varchar(1) NOT NULL,
  `CancelDate` datetime(6) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftorpc` */

/*Table structure for table `ftorti` */

DROP TABLE IF EXISTS `ftorti`;

CREATE TABLE `ftorti` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `DocNum` int(11) DEFAULT NULL,
  `Series` int(11) DEFAULT NULL,
  `PeriodCat` varchar(10) DEFAULT NULL,
  `FinncPriod` int(11) DEFAULT NULL,
  `PostDate` date DEFAULT NULL,
  `DocDate` date DEFAULT NULL,
  `DocStatus` varchar(1) DEFAULT NULL,
  `TransId` int(11) DEFAULT NULL,
  `Comments` varchar(254) DEFAULT NULL,
  `Reference` varchar(32) DEFAULT NULL,
  `ObjType` varchar(20) DEFAULT NULL,
  `Currency` varchar(3) DEFAULT NULL,
  `DocRate` decimal(19,6) DEFAULT NULL,
  `SysRate` decimal(19,6) DEFAULT NULL,
  `PIndicator` varchar(10) DEFAULT NULL,
  `DocTotal` decimal(19,6) DEFAULT NULL,
  `DocTotalFC` decimal(19,6) DEFAULT NULL,
  `DocTotalSy` decimal(19,6) DEFAULT NULL,
  `DataSource` varchar(1) DEFAULT NULL,
  `UserSign` int(11) DEFAULT NULL,
  `LogInstanc` int(11) DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  `UserSign2` int(11) DEFAULT NULL,
  `UpdateDate` date DEFAULT NULL,
  `TransType` varchar(20) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `JrnlMemo` varchar(254) DEFAULT NULL,
  `AssetDate` date DEFAULT NULL,
  `CurSource` varchar(1) DEFAULT NULL,
  `DocType` varchar(15) DEFAULT NULL,
  `PrjSmarz` varchar(1) DEFAULT NULL,
  `DstRlSmarz` varchar(1) DEFAULT NULL,
  `ManDprType` varchar(15) DEFAULT NULL,
  `Handwrtten` varchar(1) DEFAULT NULL,
  `CancelDate` date DEFAULT NULL,
  `DprArea` varchar(15) DEFAULT NULL,
  `BPLId` int(11) DEFAULT NULL,
  `BaseRef` varchar(11) DEFAULT NULL,
  `LVARetire` varchar(1) DEFAULT NULL,
  `CancelOpt` int(11) DEFAULT NULL,
  `BPLName` varchar(100) DEFAULT NULL,
  `VatRegNum` varchar(32) DEFAULT NULL,
  `GdsMovType` varchar(2) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `U_RefNum` varchar(30) NOT NULL,
  `IntegrationStatus` varchar(1) NOT NULL,
  `IntegrationMessage` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftorti` */

/*Table structure for table `ftpch1` */

DROP TABLE IF EXISTS `ftpch1`;

CREATE TABLE `ftpch1` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LineNum` int(11) NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `U_BaseRef` varchar(255) DEFAULT NULL,
  `U_BaseType` int(11) DEFAULT NULL,
  `U_BaseLine` int(11) DEFAULT NULL,
  `U_LngDscrptn` longtext DEFAULT NULL,
  `U_Period` varchar(10) DEFAULT NULL,
  `BaseType` int(11) DEFAULT NULL,
  `BaseEntry` int(11) DEFAULT NULL,
  `BaseRef` int(11) DEFAULT NULL,
  `BaseLine` int(11) DEFAULT NULL,
  `ItemCode` varchar(50) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `AccountCode` varchar(15) DEFAULT NULL,
  `DiscPrcnt` decimal(19,6) DEFAULT NULL,
  `Quantity` decimal(19,6) DEFAULT NULL,
  `Price` decimal(19,6) DEFAULT NULL,
  `VatGroup` varchar(8) DEFAULT NULL,
  `PriceAfVAT` decimal(19,6) DEFAULT NULL,
  `WTLiable` longtext DEFAULT NULL,
  `LineTotal` decimal(19,6) DEFAULT NULL,
  `GrossTotal` decimal(19,6) DEFAULT NULL,
  `OcrCode` varchar(8) DEFAULT NULL,
  `OcrCode2` varchar(8) DEFAULT NULL,
  `OcrCode3` varchar(8) DEFAULT NULL,
  `OcrCode4` varchar(8) DEFAULT NULL,
  `OcrCode5` varchar(8) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`HeaderId`,`LineNum`),
  CONSTRAINT `FK_FTPCH1_FTOPCH_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftopch` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftpch1` */

/*Table structure for table `ftpch5` */

DROP TABLE IF EXISTS `ftpch5`;

CREATE TABLE `ftpch5` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LineNum` int(11) NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `WTCode` varchar(4) DEFAULT NULL,
  `TaxbleAmnt` decimal(19,6) DEFAULT NULL,
  `WTAmnt` decimal(19,6) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`HeaderId`,`LineNum`),
  UNIQUE KEY `IX_FTPCH5_HeaderId` (`HeaderId`),
  CONSTRAINT `FK_FTPCH5_FTOPCH_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftopch` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftpch5` */

/*Table structure for table `ftrct2` */

DROP TABLE IF EXISTS `ftrct2`;

CREATE TABLE `ftrct2` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LineNum` int(11) NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `InvType` int(11) NOT NULL,
  `SumApplied` decimal(19,6) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`HeaderId`,`LineNum`),
  CONSTRAINT `FK_FTRCT2_FTORCT_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftorct` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftrct2` */

insert  into `ftrct2`(`HeaderId`,`LineNum`,`U_RefNum`,`InvType`,`SumApplied`,`CreatedAt`) values 
('08dd35f7-9e8f-4b3a-8eba-4bc5c8a30620',0,'121300013',13,0.000000,'2025-01-16 14:32:58.983046'),
('08dd368d-f8ac-4725-8d99-2ef675e96d16',0,'011725002',203,16050.000000,'2025-01-17 08:29:14.678355'),
('08dd368f-74c9-4360-8e0e-66f8466b15e8',0,'011725002',203,16050.000000,'2025-01-17 08:39:52.403797'),
('08dd368f-8127-48ce-8576-6d165506ea0a',0,'011725004',203,16050.000000,'2025-01-17 08:40:13.154344'),
('08dd368f-8d12-4b98-8e84-96f05c4ed16e',0,'011725004',203,16050.000000,'2025-01-17 08:40:33.150983');

/*Table structure for table `ftrin1` */

DROP TABLE IF EXISTS `ftrin1`;

CREATE TABLE `ftrin1` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LineNum` int(11) NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `U_BaseRef` varchar(255) DEFAULT NULL,
  `U_BaseType` int(11) DEFAULT NULL,
  `U_BaseLine` int(11) DEFAULT NULL,
  `U_LngDscrptn` longtext DEFAULT NULL,
  `U_Period` varchar(10) DEFAULT NULL,
  `BaseType` int(11) DEFAULT NULL,
  `BaseEntry` int(11) DEFAULT NULL,
  `BaseRef` int(11) DEFAULT NULL,
  `BaseLine` int(11) DEFAULT NULL,
  `ItemCode` varchar(50) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `AccountCode` varchar(15) DEFAULT NULL,
  `DiscPrcnt` decimal(19,6) DEFAULT NULL,
  `Quantity` decimal(19,6) DEFAULT NULL,
  `Price` decimal(19,6) DEFAULT NULL,
  `VatGroup` varchar(8) DEFAULT NULL,
  `PriceAfVAT` decimal(19,6) DEFAULT NULL,
  `WTLiable` longtext DEFAULT NULL,
  `LineTotal` decimal(19,6) DEFAULT NULL,
  `GrossTotal` decimal(19,6) DEFAULT NULL,
  `OcrCode` varchar(8) DEFAULT NULL,
  `OcrCode2` varchar(8) DEFAULT NULL,
  `OcrCode3` varchar(8) DEFAULT NULL,
  `OcrCode4` varchar(8) DEFAULT NULL,
  `OcrCode5` varchar(8) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`HeaderId`,`LineNum`),
  CONSTRAINT `FK_FTRIN1_FTORIN_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftorin` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftrin1` */

/*Table structure for table `ftrin5` */

DROP TABLE IF EXISTS `ftrin5`;

CREATE TABLE `ftrin5` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LineNum` int(11) NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `WTCode` varchar(4) DEFAULT NULL,
  `TaxbleAmnt` decimal(19,6) DEFAULT NULL,
  `WTAmnt` decimal(19,6) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`HeaderId`,`LineNum`),
  CONSTRAINT `FK_FTRIN5_FTORIN_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftorin` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftrin5` */

/*Table structure for table `ftrpc1` */

DROP TABLE IF EXISTS `ftrpc1`;

CREATE TABLE `ftrpc1` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LineNum` int(11) NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `U_BaseRef` varchar(255) DEFAULT NULL,
  `U_BaseType` int(11) DEFAULT NULL,
  `U_BaseLine` int(11) DEFAULT NULL,
  `U_LngDscrptn` longtext DEFAULT NULL,
  `U_Period` varchar(10) DEFAULT NULL,
  `BaseType` int(11) DEFAULT NULL,
  `BaseEntry` int(11) DEFAULT NULL,
  `BaseRef` int(11) DEFAULT NULL,
  `BaseLine` int(11) DEFAULT NULL,
  `ItemCode` varchar(50) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `AccountCode` varchar(15) DEFAULT NULL,
  `DiscPrcnt` decimal(19,6) DEFAULT NULL,
  `Quantity` decimal(19,6) DEFAULT NULL,
  `Price` decimal(19,6) DEFAULT NULL,
  `VatGroup` varchar(8) DEFAULT NULL,
  `PriceAfVAT` decimal(19,6) DEFAULT NULL,
  `WTLiable` longtext DEFAULT NULL,
  `LineTotal` decimal(19,6) DEFAULT NULL,
  `GrossTotal` decimal(19,6) DEFAULT NULL,
  `OcrCode` varchar(8) DEFAULT NULL,
  `OcrCode2` varchar(8) DEFAULT NULL,
  `OcrCode3` varchar(8) DEFAULT NULL,
  `OcrCode4` varchar(8) DEFAULT NULL,
  `OcrCode5` varchar(8) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`HeaderId`,`LineNum`),
  CONSTRAINT `FK_FTRPC1_FTORPC_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftorpc` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftrpc1` */

/*Table structure for table `ftrpc5` */

DROP TABLE IF EXISTS `ftrpc5`;

CREATE TABLE `ftrpc5` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LineNum` int(11) NOT NULL,
  `U_RefNum` varchar(30) DEFAULT NULL,
  `WTCode` varchar(4) DEFAULT NULL,
  `TaxbleAmnt` decimal(19,6) DEFAULT NULL,
  `WTAmnt` decimal(19,6) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`HeaderId`,`LineNum`),
  CONSTRAINT `FK_FTRPC5_FTORPC_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftorpc` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftrpc5` */

/*Table structure for table `ftrti1` */

DROP TABLE IF EXISTS `ftrti1`;

CREATE TABLE `ftrti1` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LineNum` int(11) NOT NULL,
  `ItemCode` varchar(50) DEFAULT NULL,
  `AcctCode` varchar(15) DEFAULT NULL,
  `Quantity` decimal(19,6) DEFAULT NULL,
  `LineTotal` decimal(19,6) DEFAULT NULL,
  `TotalFrgn` decimal(19,6) DEFAULT NULL,
  `TotalSys` decimal(19,6) DEFAULT NULL,
  `DprArea` varchar(15) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `LogInstanc` int(11) DEFAULT NULL,
  `NewItemCod` varchar(50) DEFAULT NULL,
  `Partial` varchar(1) DEFAULT NULL,
  `APC` decimal(19,6) DEFAULT NULL,
  `NewAstCls` varchar(20) DEFAULT NULL,
  `ObjType` varchar(20) DEFAULT NULL,
  `TransType` varchar(4) DEFAULT NULL,
  `OcrCode` varchar(8) DEFAULT NULL,
  `OcrCode2` varchar(8) DEFAULT NULL,
  `OcrCode3` varchar(8) DEFAULT NULL,
  `OcrCode4` varchar(8) DEFAULT NULL,
  `OcrCode5` varchar(8) DEFAULT NULL,
  `Project` varchar(20) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`HeaderId`,`LineNum`),
  CONSTRAINT `FK_FTRTI1_FTORTI_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftorti` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftrti1` */

/*Table structure for table `ftrti2` */

DROP TABLE IF EXISTS `ftrti2`;

CREATE TABLE `ftrti2` (
  `HeaderId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LineNum` int(11) NOT NULL,
  `DprArea` varchar(15) DEFAULT NULL,
  `JrnlMemo` varchar(254) DEFAULT NULL,
  `ObjType` varchar(20) DEFAULT NULL,
  `LogInstanc` int(11) DEFAULT NULL,
  `TransNum` int(11) DEFAULT NULL,
  `JrnlMemo1` varchar(254) DEFAULT NULL,
  `TransNum1` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`HeaderId`,`LineNum`),
  CONSTRAINT `FK_FTRTI2_FTORTI_HeaderId` FOREIGN KEY (`HeaderId`) REFERENCES `ftorti` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ftrti2` */

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
				U_RefNum, -- AR Invoice refnumber
				U_RefNum as 'DocEntry',
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
	WHERE (IFNULL(Posted, 'N') = 'N'
	AND IFNULL(IntegrationStatus, 'P') = 'P') OR  Canceled = 'Y';
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
	WHERE (IFNULL(CardCode, '') <> '' 
	AND IFNULL(IntegrationStatus, 'P') = 'P') OR  Canceled = 'Y';
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
