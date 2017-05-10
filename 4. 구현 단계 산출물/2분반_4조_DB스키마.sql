-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.7.16-log - MySQL Community Server (GPL)
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- software 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `software` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `software`;

-- 테이블 software.account 구조 내보내기
DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `accountNumber` varchar(50) NOT NULL,
  `bankCode` varchar(5) NOT NULL,
  `memberID` varchar(8) NOT NULL,
  PRIMARY KEY (`accountNumber`),
  KEY `FK_account_memberdata` (`memberID`),
  CONSTRAINT `FK_account_memberdata` FOREIGN KEY (`memberID`) REFERENCES `memberdata` (`memberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.account:~5 rows (대략적) 내보내기
DELETE FROM `account`;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`accountNumber`, `bankCode`, `memberID`) VALUES
	('1', '1', 'E10'),
	('3020345999462', '02', 'A0000002'),
	('3020345999463', '02', 'A0000003'),
	('3020345999464', '03', 'E0000001'),
	('3020345999465', '03', 'E0000002');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- 테이블 software.attandancerecord 구조 내보내기
DROP TABLE IF EXISTS `attandancerecord`;
CREATE TABLE IF NOT EXISTS `attandancerecord` (
  `memberId` varchar(20) NOT NULL,
  `processCode` varchar(20) NOT NULL,
  `record` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`memberId`,`processCode`),
  KEY `FK_attandancerecord_establishprocess` (`processCode`),
  CONSTRAINT `FK_attandancerecord_establishprocess` FOREIGN KEY (`processCode`) REFERENCES `establishprocess` (`processCode`),
  CONSTRAINT `FK_attandancerecord_memberdata` FOREIGN KEY (`memberId`) REFERENCES `memberdata` (`memberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.attandancerecord:~3 rows (대략적) 내보내기
DELETE FROM `attandancerecord`;
/*!40000 ALTER TABLE `attandancerecord` DISABLE KEYS */;
INSERT INTO `attandancerecord` (`memberId`, `processCode`, `record`) VALUES
	('A0000002', 'P001', '1/3/1/1/3/1/1/1/1/1/1/0/1/1/1/2/1/1/1/1/2/1/1/1/0/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/'),
	('S0000001', 'P001', '1/1/1/1/2/1/1/3/1/1/1/1/1/1/1/2/1/0/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/'),
	('S0000001', 'P005', '1/2/3/4/5/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/1/');
/*!40000 ALTER TABLE `attandancerecord` ENABLE KEYS */;

-- 테이블 software.bulletinboard 구조 내보내기
DROP TABLE IF EXISTS `bulletinboard`;
CREATE TABLE IF NOT EXISTS `bulletinboard` (
  `bulletinBoardNum` int(4) NOT NULL,
  `bulletinBoard` varchar(20) NOT NULL,
  `openingDate` int(8) NOT NULL,
  `closingDate` int(8) DEFAULT NULL,
  `kindOfbulletinBoard` varchar(15) NOT NULL,
  `creator` varchar(8) NOT NULL,
  `closer` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`bulletinBoardNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.bulletinboard:~13 rows (대략적) 내보내기
DELETE FROM `bulletinboard`;
/*!40000 ALTER TABLE `bulletinboard` DISABLE KEYS */;
INSERT INTO `bulletinboard` (`bulletinBoardNum`, `bulletinBoard`, `openingDate`, `closingDate`, `kindOfbulletinBoard`, `creator`, `closer`) VALUES
	(1, 'Notice', 20160924, NULL, 'Notice', 'YBI', NULL),
	(2, 'Free', 20160924, NULL, 'Free', 'YBI', NULL),
	(3, 'F&Q', 20160924, NULL, 'F&Q', 'YBI', NULL),
	(4, '1:1 Q&A', 20161212, NULL, 'Q&A', 'KWJ', NULL),
	(5, 'BUG', 20161212, NULL, 'BUG', 'KWJ', NULL),
	(6, 'dd', 20161214, 20491231, 'notice', ' ddddddd', NULL),
	(7, '12345678901234567890', 20161214, 20491231, 'notice', 'dd ', NULL),
	(8, 'd', 20161214, 20491231, 'notice', ' 1234567', NULL),
	(9, 'dd', 20161214, 20491231, 'notice', ' ddddddd', NULL),
	(10, 'd', 20161214, 20491231, 'notice', '12345678', NULL),
	(11, 'ãã', 20161220, 20491231, 'notice', 'ãã', NULL),
	(12, 'ìê³µ', 20161220, 20491231, 'notice', 'ìê³µ', NULL),
	(13, 'ìê³µ', 20161220, 20491231, 'Q&A', 'ìê³µ', NULL);
/*!40000 ALTER TABLE `bulletinboard` ENABLE KEYS */;

-- 테이블 software.bulletinboardmessage 구조 내보내기
DROP TABLE IF EXISTS `bulletinboardmessage`;
CREATE TABLE IF NOT EXISTS `bulletinboardmessage` (
  `bulletinBoardNum` int(4) NOT NULL,
  `bulletinBoardMessageNum` int(8) NOT NULL,
  `bulletinBoardMessageType` varchar(10) NOT NULL,
  `bulletinBoardMessage` varchar(20) NOT NULL,
  `createDate` int(8) NOT NULL,
  `name` varchar(8) NOT NULL,
  `attachment` blob,
  `bulletinBoardMessageContent` varchar(1000) NOT NULL,
  PRIMARY KEY (`bulletinBoardNum`,`bulletinBoardMessageNum`),
  CONSTRAINT `bulletinBoardNum` FOREIGN KEY (`bulletinBoardNum`) REFERENCES `bulletinboard` (`bulletinBoardNum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.bulletinboardmessage:~7 rows (대략적) 내보내기
DELETE FROM `bulletinboardmessage`;
/*!40000 ALTER TABLE `bulletinboardmessage` DISABLE KEYS */;
INSERT INTO `bulletinboardmessage` (`bulletinBoardNum`, `bulletinBoardMessageNum`, `bulletinBoardMessageType`, `bulletinBoardMessage`, `createDate`, `name`, `attachment`, `bulletinBoardMessageContent`) VALUES
	(1, 1, 'Notify', '[20160924] 1', 20160924, 'YBI', NULL, 'HI!'),
	(1, 2, 'Notify', '[20160925] 2', 20160925, 'YBI', NULL, 'HELLO!'),
	(1, 3, 'Notify', '[20161001] 3', 20161001, 'YBI', NULL, 'WORLD!'),
	(2, 1, 'Free', 'hi~', 20160924, 'KWJ', NULL, 'zzzzzzzzzzzzzzzzzzz'),
	(4, 1, 'Q&A', '[Q&A] 1', 20161111, 'HSJ', NULL, 'hi?'),
	(4, 2, 'notice', 'ddd', 20161214, 'ddd', _binary 0x2064646464, ' ddddd'),
	(5, 1, 'Bug', '[Bug] 1', 20161111, 'LDY', NULL, 'this is bug');
/*!40000 ALTER TABLE `bulletinboardmessage` ENABLE KEYS */;

-- 테이블 software.career 구조 내보내기
DROP TABLE IF EXISTS `career`;
CREATE TABLE IF NOT EXISTS `career` (
  `careerNo` int(11) NOT NULL,
  `careerType` int(1) DEFAULT NULL,
  `career` varchar(100) DEFAULT NULL,
  `careerName` varchar(20) DEFAULT NULL,
  `memberID` varchar(8) NOT NULL,
  PRIMARY KEY (`careerNo`,`memberID`),
  KEY `memberID3` (`memberID`),
  CONSTRAINT `memberID3` FOREIGN KEY (`memberID`) REFERENCES `employeedata` (`memberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.career:~3 rows (대략적) 내보내기
DELETE FROM `career`;
/*!40000 ALTER TABLE `career` DISABLE KEYS */;
INSERT INTO `career` (`careerNo`, `careerType`, `career`, `careerName`, `memberID`) VALUES
	(1, 0, '정보처리기사', '정보처리기사', 'A0000002'),
	(2, 0, '정보처리기사', '정보처리기사', 'A0000002'),
	(3, 0, '정보처리기사', '정보처리기사', 'A0000002');
/*!40000 ALTER TABLE `career` ENABLE KEYS */;

-- 테이블 software.center 구조 내보내기
DROP TABLE IF EXISTS `center`;
CREATE TABLE IF NOT EXISTS `center` (
  `centerNo` varchar(4) NOT NULL,
  `directorMemberID` varchar(8) NOT NULL,
  `centerName` varchar(30) NOT NULL,
  `localCode` varchar(4) NOT NULL,
  PRIMARY KEY (`centerNo`),
  KEY `center_ibfk_1` (`directorMemberID`),
  CONSTRAINT `center_ibfk_1` FOREIGN KEY (`directorMemberID`) REFERENCES `memberdata` (`memberID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='센터';

-- 테이블 데이터 software.center:~6 rows (대략적) 내보내기
DELETE FROM `center`;
/*!40000 ALTER TABLE `center` DISABLE KEYS */;
INSERT INTO `center` (`centerNo`, `directorMemberID`, `centerName`, `localCode`) VALUES
	('1', 'E0000001', '알파아카데미 서울본원', '서울'),
	('2', 'E0000001', '알파아카데미 서울종로', '서울'),
	('3', 'E0000001', '알파아카데미 경기수원', '경기'),
	('4', 'E0000001', '알파아카데미 경기판교', '경기'),
	('5', 'E0000001', '알파아카데미 제주', '제주'),
	('6', 'E0000002', 'dd', 'ss');
/*!40000 ALTER TABLE `center` ENABLE KEYS */;

-- 테이블 software.certifycateissue 구조 내보내기
DROP TABLE IF EXISTS `certifycateissue`;
CREATE TABLE IF NOT EXISTS `certifycateissue` (
  `issuenum` int(3) NOT NULL,
  `processCode` varchar(10) DEFAULT NULL,
  `memberid` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`issuenum`),
  KEY `FK_certificateissue_lecture` (`processCode`),
  KEY `FK_certificateissue_lecture_2` (`memberid`),
  CONSTRAINT `FK_certificateissue_lecture` FOREIGN KEY (`processCode`) REFERENCES `lecture` (`processCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_certificateissue_lecture_2` FOREIGN KEY (`memberid`) REFERENCES `lecture` (`memberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.certifycateissue:~1 rows (대략적) 내보내기
DELETE FROM `certifycateissue`;
/*!40000 ALTER TABLE `certifycateissue` DISABLE KEYS */;
INSERT INTO `certifycateissue` (`issuenum`, `processCode`, `memberid`, `date`) VALUES
	(1, 'P004', 'E0000001', '2016/12/21');
/*!40000 ALTER TABLE `certifycateissue` ENABLE KEYS */;

-- 테이블 software.comment 구조 내보내기
DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `bulletinBoardNum` int(4) NOT NULL,
  `bulletinBoardMessageNum` int(8) NOT NULL,
  `commentNum` int(4) NOT NULL,
  `commentContent` varchar(1000) NOT NULL,
  `privacyScope` varchar(1) NOT NULL,
  `creator` varchar(8) NOT NULL,
  `attachFile` blob,
  `openingDate` int(8) NOT NULL,
  PRIMARY KEY (`commentNum`,`bulletinBoardNum`,`bulletinBoardMessageNum`),
  KEY `FK_comment_bulletinboardmessage` (`bulletinBoardNum`,`bulletinBoardMessageNum`),
  CONSTRAINT `FK_comment_bulletinboardmessage` FOREIGN KEY (`bulletinBoardNum`, `bulletinBoardMessageNum`) REFERENCES `bulletinboardmessage` (`bulletinBoardNum`, `bulletinBoardMessageNum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.comment:~4 rows (대략적) 내보내기
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`bulletinBoardNum`, `bulletinBoardMessageNum`, `commentNum`, `commentContent`, `privacyScope`, `creator`, `attachFile`, `openingDate`) VALUES
	(2, 1, 1, 'zzzzzzzzzzzz', '1', 'LJE', NULL, 20161212),
	(4, 2, 1, 'dd', '1', 'dd', NULL, 20161214),
	(5, 1, 1, 'ok', '1', 'KWJ', NULL, 20161212),
	(2, 1, 2, 'gooooooooood', '1', 'KJW', NULL, 20161212),
	(2, 1, 3, '안녕하세요 좋은글 감사합니다', '1', '윤병일', NULL, 20161214);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- 테이블 software.community 구조 내보내기
DROP TABLE IF EXISTS `community`;
CREATE TABLE IF NOT EXISTS `community` (
  `communityNo` int(8) NOT NULL,
  `communityName` varchar(20) NOT NULL,
  `openingDate` varchar(8) NOT NULL,
  `closingDate` varchar(8) DEFAULT NULL,
  `communityExplanation` varchar(1000) NOT NULL,
  PRIMARY KEY (`communityNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='모임방';

-- 테이블 데이터 software.community:~5 rows (대략적) 내보내기
DELETE FROM `community`;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` (`communityNo`, `communityName`, `openingDate`, `closingDate`, `communityExplanation`) VALUES
	(1, '데이터베이스 수강생 모임방', '20161201', NULL, '모임방설명13'),
	(2, '소공 금123분반 모임', '20161201', NULL, '모임방설명2'),
	(3, '자료구조 스터디', '20161211', NULL, '모임방설명3'),
	(4, 'PowerC++!!!', '20161211', NULL, '모임방설명4'),
	(5, '신Java', '20161221', '20161213', '모임방설명5'),
	(6, 'sss', '20161213', '20161213', 'aaa'),
	(7, '소공', '20161220', NULL, '금소공');
/*!40000 ALTER TABLE `community` ENABLE KEYS */;

-- 테이블 software.communitybulletinboard 구조 내보내기
DROP TABLE IF EXISTS `communitybulletinboard`;
CREATE TABLE IF NOT EXISTS `communitybulletinboard` (
  `communityBulletinBoardNo` int(8) NOT NULL,
  `communityBulletinBoardName` varchar(20) NOT NULL,
  `communityKindOfbulletinBoard` varchar(15) NOT NULL,
  `openingDate` int(8) NOT NULL,
  `closingDate` int(8) DEFAULT NULL,
  `creator` varchar(20) NOT NULL,
  `closer` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`communityBulletinBoardNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.communitybulletinboard:~3 rows (대략적) 내보내기
DELETE FROM `communitybulletinboard`;
/*!40000 ALTER TABLE `communitybulletinboard` DISABLE KEYS */;
INSERT INTO `communitybulletinboard` (`communityBulletinBoardNo`, `communityBulletinBoardName`, `communityKindOfbulletinBoard`, `openingDate`, `closingDate`, `creator`, `closer`) VALUES
	(1, '공지사항', 'N', 20161211, 20491231, '이지은', NULL),
	(2, '자유게시판', 'F', 20161211, 20491231, '윤병일', NULL),
	(3, '질문과 답변', 'D', 20161212, 20491231, '이도예', NULL);
/*!40000 ALTER TABLE `communitybulletinboard` ENABLE KEYS */;

-- 테이블 software.communitybulletinboardmessage 구조 내보내기
DROP TABLE IF EXISTS `communitybulletinboardmessage`;
CREATE TABLE IF NOT EXISTS `communitybulletinboardmessage` (
  `communityBulletinBoardNo` int(8) NOT NULL,
  `communityBulletinBoardMessageNo` int(8) NOT NULL,
  `communityKindOfbulletinBoardMessage` varchar(20) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `bulletinBoardMessageContentcontent` varchar(5000) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `searchContent` varchar(20) DEFAULT NULL,
  `wholeNoticeSatus` varchar(1) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`communityBulletinBoardNo`,`communityBulletinBoardMessageNo`),
  CONSTRAINT `FK_communitybulletinboardmessage_communitybulletinboard` FOREIGN KEY (`communityBulletinBoardNo`) REFERENCES `communitybulletinboard` (`communityBulletinBoardNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.communitybulletinboardmessage:~5 rows (대략적) 내보내기
DELETE FROM `communitybulletinboardmessage`;
/*!40000 ALTER TABLE `communitybulletinboardmessage` DISABLE KEYS */;
INSERT INTO `communitybulletinboardmessage` (`communityBulletinBoardNo`, `communityBulletinBoardMessageNo`, `communityKindOfbulletinBoardMessage`, `title`, `bulletinBoardMessageContentcontent`, `name`, `searchContent`, `wholeNoticeSatus`, `attachment`) VALUES
	(1, 1, '자료실', '자료실 제목', '  내용입니다 내용입니다 내용입니다 내용입니다 내용입니다 내용입니다내용입니다', '윤병일', '1234', '1', '첨부파일'),
	(1, 2, '공지사항', '공지사항 제목', ' 공지사항에 대해 알려드립니다.', '이지은\r\n', '0000', '1', '첨부파일2'),
	(1, 3, '자료실', '자료실 제목', '정보 공유를 위한 자료실입니다.', '강우진', '0000', '1', '첨부파일3'),
	(1, 4, '자유게시판', '자유게시판 제목', ' 안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕', '한성진', '0000', '0', '첨부파일4'),
	(2, 1, '공지사항', '또다른 공지사항 제목', '공지사항에 대해 알려드립니다2', '신민기', '1234', '1', '첨부파일5');
/*!40000 ALTER TABLE `communitybulletinboardmessage` ENABLE KEYS */;

-- 테이블 software.communitybulletinboardmessagecomment 구조 내보내기
DROP TABLE IF EXISTS `communitybulletinboardmessagecomment`;
CREATE TABLE IF NOT EXISTS `communitybulletinboardmessagecomment` (
  `communityBulletinBoardNo` int(8) NOT NULL,
  `communityBulletinBoardMessageNo` int(8) NOT NULL,
  `communityBulletinBoardMessageCommentNo` int(8) NOT NULL,
  `name` varchar(20) NOT NULL,
  `commentContent` varchar(500) NOT NULL,
  `openingDate` int(8) NOT NULL,
  PRIMARY KEY (`communityBulletinBoardNo`,`communityBulletinBoardMessageNo`,`communityBulletinBoardMessageCommentNo`),
  CONSTRAINT `FK_communitybulletinboardmessagecomment` FOREIGN KEY (`communityBulletinBoardNo`, `communityBulletinBoardMessageNo`) REFERENCES `communitybulletinboardmessage` (`communityBulletinBoardNo`, `communityBulletinBoardMessageNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.communitybulletinboardmessagecomment:~5 rows (대략적) 내보내기
DELETE FROM `communitybulletinboardmessagecomment`;
/*!40000 ALTER TABLE `communitybulletinboardmessagecomment` DISABLE KEYS */;
INSERT INTO `communitybulletinboardmessagecomment` (`communityBulletinBoardNo`, `communityBulletinBoardMessageNo`, `communityBulletinBoardMessageCommentNo`, `name`, `commentContent`, `openingDate`) VALUES
	(1, 1, 1, '김지원', ' 김지원은이뻐요', 20161211),
	(1, 1, 2, '김지원2', ' 김지원은 제일 이뻐요', 20161211),
	(1, 1, 3, '김지원3', ' 김지원은 엄청 이뻐요', 20161211),
	(1, 1, 4, '김지원4', '김지원은 못생겼어요', 20161211),
	(1, 1, 5, '김지원5', ' 김지원은 매일 강우진한테 당해요', 20161212),
	(1, 3, 1, 'ㅋㅋㅋ', ' 안녕하세요', 20161213);
/*!40000 ALTER TABLE `communitybulletinboardmessagecomment` ENABLE KEYS */;

-- 테이블 software.communityparticipant 구조 내보내기
DROP TABLE IF EXISTS `communityparticipant`;
CREATE TABLE IF NOT EXISTS `communityparticipant` (
  `communityNo` int(8) NOT NULL,
  `memberID` varchar(8) NOT NULL,
  `participationSeparation` int(1) DEFAULT NULL,
  PRIMARY KEY (`communityNo`,`memberID`),
  KEY `FK_communityparticipant_memberdata` (`memberID`),
  CONSTRAINT `FK_communityparticipant_community` FOREIGN KEY (`communityNo`) REFERENCES `community` (`communityNo`),
  CONSTRAINT `FK_communityparticipant_memberdata` FOREIGN KEY (`memberID`) REFERENCES `memberdata` (`memberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='모임방 참여회원';

-- 테이블 데이터 software.communityparticipant:~7 rows (대략적) 내보내기
DELETE FROM `communityparticipant`;
/*!40000 ALTER TABLE `communityparticipant` DISABLE KEYS */;
INSERT INTO `communityparticipant` (`communityNo`, `memberID`, `participationSeparation`) VALUES
	(1, 'E0000001', 0),
	(2, 'E0000002', 0),
	(3, 'A0000003', 0),
	(4, 'S0000001', 0),
	(5, 'A0000002', 0),
	(5, 'E0000001', 3),
	(6, 'A0000002', 0),
	(7, 'S0000001', 0);
/*!40000 ALTER TABLE `communityparticipant` ENABLE KEYS */;

-- 테이블 software.employeedata 구조 내보내기
DROP TABLE IF EXISTS `employeedata`;
CREATE TABLE IF NOT EXISTS `employeedata` (
  `memberID` varchar(50) NOT NULL,
  `centerDepartmentName` varchar(20) DEFAULT NULL,
  `joinedDate` varchar(50) DEFAULT NULL,
  `profilePhoto` varchar(50) DEFAULT NULL,
  `enName` varchar(20) DEFAULT NULL,
  `positionName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`memberID`),
  CONSTRAINT `meberID4` FOREIGN KEY (`memberID`) REFERENCES `memberdata` (`memberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.employeedata:~5 rows (대략적) 내보내기
DELETE FROM `employeedata`;
/*!40000 ALTER TABLE `employeedata` DISABLE KEYS */;
INSERT INTO `employeedata` (`memberID`, `centerDepartmentName`, `joinedDate`, `profilePhoto`, `enName`, `positionName`) VALUES
	('A0000002', NULL, '20161202', '4', 'kang', NULL),
	('A0000003', '대구', '20161202', '4', 'kang', '과장'),
	('E0000001', NULL, '20161202', '4', 'kangwoojin', NULL),
	('E0000002', '대전', '20161202', '4', 'kang', '과장'),
	('E10', '1', 'Mon Dec 12 03:29:42 KST 2016', '', '1', '1');
/*!40000 ALTER TABLE `employeedata` ENABLE KEYS */;

-- 테이블 software.establishprocess 구조 내보내기
DROP TABLE IF EXISTS `establishprocess`;
CREATE TABLE IF NOT EXISTS `establishprocess` (
  `processName` varchar(100) NOT NULL,
  `trainingPeriodEnd` int(15) DEFAULT NULL,
  `trainingPeriodStart` int(15) DEFAULT NULL,
  `classRoom` varchar(10) DEFAULT NULL,
  `lecturerID` varchar(10) DEFAULT NULL,
  `tuition` int(10) DEFAULT NULL,
  `isApply` int(1) NOT NULL,
  `centerName` varchar(100) NOT NULL,
  `refundSort` varchar(100) DEFAULT NULL,
  `detailLectureInfo` varchar(500) NOT NULL,
  `isAccepted` int(1) NOT NULL,
  `completeStandard` varchar(50) DEFAULT NULL,
  `processCode` varchar(10) NOT NULL,
  `subjectCode` varchar(10) NOT NULL,
  PRIMARY KEY (`processCode`),
  KEY `FK_establishprocess_operatesubject` (`subjectCode`),
  CONSTRAINT `FK_establishprocess_operatesubject` FOREIGN KEY (`subjectCode`) REFERENCES `operatesubject` (`subjectCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.establishprocess:~8 rows (대략적) 내보내기
DELETE FROM `establishprocess`;
/*!40000 ALTER TABLE `establishprocess` DISABLE KEYS */;
INSERT INTO `establishprocess` (`processName`, `trainingPeriodEnd`, `trainingPeriodStart`, `classRoom`, `lecturerID`, `tuition`, `isApply`, `centerName`, `refundSort`, `detailLectureInfo`, `isAccepted`, `completeStandard`, `processCode`, `subjectCode`) VALUES
	('c++프로그래밍', 20161130, 20160910, 'D438', 'E0000001', 80000, 1, '서울', '사업주', '        월       화        수        목       금/1주차 :문법     문법      문법      문법     문법/2주차 :포인터   포인터    포인터    포인터   포인터/3주차 :class    class     class     class    class/4주차 :상속     상속      상속      상속     상속  ', 1, '출석률80%이상', 'P001', 'S001'),
	('java프로그래밍', 20161130, 20160910, 'D438', 'E0000002', 80000, 1, '부산', '사업주', '        월       화        수        목       금/1주차 :문법     문법      문법      문법     문법/2주차 :문법     문법      문법      문법     문법/3주차 :class    class     class     class    class/4주차 :상속     상속      상속      상속     상속  ', 1, '출석률80%이상', 'P002', 'S002'),
	('C# 프로그래밍', 20161030, 20160910, 'D438', 'E0000002', 75000, 1, '부산', '일반', '        월       화        수        목       금/1주차 :문법     문법      문법      문법     문법/2주차 :문법     문법      문법      문법     문법/3주차 :class    class     class     class    class/4주차 :상속     상속      상속      상속     상속  ', 1, '출석률80%이상', 'P003', 'S003'),
	('객체지향소프트웨어공학', 20161030, 20160910, 'D438', 'E0000001', 150000, 1, '대구', '일반', '        월       화        수        목       금/1주차 :계획     계획      계획      계획     계획/2주차 :분석     분석      분석      분석     분석/3주차 :설계     설계      설계      설계     설계/4주차 :구현     구현      시험      시험     유지보수  ', 1, '출석률80%이상', 'P004', 'S004'),
	('컴퓨터네트워크', 20161030, 20160910, 'D438', 'E0000003', 75000, 1, '서울', '일반', '        월       화        수        목       금/1주차 :개념     개념      개념      개념     개념/2주차 :심화     심화      심화      심화     심화/3주차 :심화     심화      심화     심화    심화/4주차 :실습     실습      실습      실습     실습  ', 1, '출석률80%이상', 'P005', 'S005'),
	('데이터베이스', 20161030, 20160910, 'D438', 'E0000003', 150000, 0, '구미', '일반', '        월       화        수        목       금/1주차 :기초     기초      기초      기초     기초/2주차 :기초     기초      기초      기초     기초/3주차 :심화     심화      심화      심화     심화/4주차 :심화     심화      시험      시험     유지보수  ', 0, '출석률80%이상', 'P006', 'S004'),
	('전공컴퓨터', 20170131, 20161231, 'D441', 'E0000003', 24500, 0, '구미본사', '사업주', '1주차 : 기초 기초 기초 기초 기초/2주차 : 심화 심화 심화 심화 심화/3주차 : 발표 발표 발표 발표 발표/4주차 : 시험 시험 시험 시험 시험/', 0, '최종시험 80점 이상', 'P009', 's009');
/*!40000 ALTER TABLE `establishprocess` ENABLE KEYS */;

-- 테이블 software.evaluationquestionconstruction 구조 내보내기
DROP TABLE IF EXISTS `evaluationquestionconstruction`;
CREATE TABLE IF NOT EXISTS `evaluationquestionconstruction` (
  `evaluationQuestionNumber` int(3) NOT NULL,
  `fixedChoiceQuestionnaireID` int(3) NOT NULL,
  `effectiveStartDate` varchar(10) NOT NULL,
  `effectiveFinishDate` varchar(10) NOT NULL,
  PRIMARY KEY (`evaluationQuestionNumber`,`fixedChoiceQuestionnaireID`),
  KEY `fixedChoiceQuestionnaireID` (`fixedChoiceQuestionnaireID`,`evaluationQuestionNumber`),
  CONSTRAINT `FK_evaluationquestionconstruction_fixedchoicequestionnaire` FOREIGN KEY (`fixedChoiceQuestionnaireID`) REFERENCES `fixedchoicequestionnaire` (`fixedChoiceQuestionnaireID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_evaluationquestionconstruction_lectureevaluationquestion` FOREIGN KEY (`evaluationQuestionNumber`) REFERENCES `lectureevaluationquestion` (`evaluationQuestionNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.evaluationquestionconstruction:~20 rows (대략적) 내보내기
DELETE FROM `evaluationquestionconstruction`;
/*!40000 ALTER TABLE `evaluationquestionconstruction` DISABLE KEYS */;
INSERT INTO `evaluationquestionconstruction` (`evaluationQuestionNumber`, `fixedChoiceQuestionnaireID`, `effectiveStartDate`, `effectiveFinishDate`) VALUES
	(1, 3, '2016.01.01', '2016.12.31'),
	(2, 3, '2016.01.01', '2017.12.31'),
	(4, 1, '2016.01.01', '2017.12.31'),
	(5, 3, '2016.01.01', '2016.12.31'),
	(6, 4, '2016.01.01', '2016.12.31'),
	(7, 1, '2016.01.01', '2016.12.31'),
	(8, 3, '2016.01.01', '2016.12.31'),
	(9, 3, '2016.01.01', '2017.12.31'),
	(10, 3, '2016.01.01', '2017.12.31'),
	(11, 2, '2016.01.01', '2017.12.31'),
	(12, 1, '2016.01.01', '2016.12.31'),
	(13, 1, '2016.01.01', '2017.12.31'),
	(14, 4, '2016.01.01', '2016.12.31'),
	(15, 1, '2016.01.01', '2017.12.31'),
	(16, 4, '2016.01.01', '2016.12.31'),
	(17, 4, '2016.01.01', '2016.12.31'),
	(18, 2, '2016.01.01', '2017.12.31'),
	(19, 2, '2016.01.01', '2017.12.31'),
	(20, 1, '2016.01.01', '2018.12.31'),
	(21, 2, '2016.01.01', '2017.12.31'),
	(22, 6, '22', '22');
/*!40000 ALTER TABLE `evaluationquestionconstruction` ENABLE KEYS */;

-- 테이블 software.evaluationresult 구조 내보내기
DROP TABLE IF EXISTS `evaluationresult`;
CREATE TABLE IF NOT EXISTS `evaluationresult` (
  `memberId` varchar(20) NOT NULL,
  `processCode` varchar(20) NOT NULL,
  `evaluationQuestionNumber` int(3) NOT NULL,
  `fixedChoiceQuestionnaireID` int(3) NOT NULL,
  `short-answerQuestion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`memberId`,`processCode`,`evaluationQuestionNumber`,`fixedChoiceQuestionnaireID`),
  KEY `FK_evaluationresult_lectureevaluationquestion` (`evaluationQuestionNumber`),
  KEY `FK_evaluationresult_fixedchoicequestionnaire` (`fixedChoiceQuestionnaireID`),
  KEY `FK_evaluationresult_establishprocess` (`processCode`),
  CONSTRAINT `FK_evaluationresult_establishprocess` FOREIGN KEY (`processCode`) REFERENCES `establishprocess` (`processCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_evaluationresult_fixedchoicequestionnaire` FOREIGN KEY (`fixedChoiceQuestionnaireID`) REFERENCES `fixedchoicequestionnaire` (`fixedChoiceQuestionnaireID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_evaluationresult_lectureevaluationquestion` FOREIGN KEY (`evaluationQuestionNumber`) REFERENCES `lectureevaluationquestion` (`evaluationQuestionNumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_evaluationresult_memberdata` FOREIGN KEY (`memberId`) REFERENCES `memberdata` (`memberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.evaluationresult:~7 rows (대략적) 내보내기
DELETE FROM `evaluationresult`;
/*!40000 ALTER TABLE `evaluationresult` DISABLE KEYS */;
INSERT INTO `evaluationresult` (`memberId`, `processCode`, `evaluationQuestionNumber`, `fixedChoiceQuestionnaireID`, `short-answerQuestion`) VALUES
	('A0000003', 'P002', 4, 1, ''),
	('E0000001', 'P001', 1, 3, NULL),
	('E0000001', 'P002', 2, 3, NULL),
	('E0000001', 'P003', 1, 3, NULL),
	('E0000001', 'P004', 2, 3, NULL),
	('E0000002', 'P009', 4, 5, NULL),
	('S0000001', 'P002', 1, 3, '');
/*!40000 ALTER TABLE `evaluationresult` ENABLE KEYS */;

-- 테이블 software.fixedchoicequestionnaire 구조 내보내기
DROP TABLE IF EXISTS `fixedchoicequestionnaire`;
CREATE TABLE IF NOT EXISTS `fixedchoicequestionnaire` (
  `fixedChoiceQuestionnaireID` int(3) NOT NULL,
  `fixedChoiceQuestionTypeID` varchar(5) NOT NULL,
  `fixedChoiceQuestionDivision` varchar(5) DEFAULT NULL,
  `fixedChoiceQuestionnaireContent` varchar(40) NOT NULL,
  PRIMARY KEY (`fixedChoiceQuestionnaireID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.fixedchoicequestionnaire:~5 rows (대략적) 내보내기
DELETE FROM `fixedchoicequestionnaire`;
/*!40000 ALTER TABLE `fixedchoicequestionnaire` DISABLE KEYS */;
INSERT INTO `fixedchoicequestionnaire` (`fixedChoiceQuestionnaireID`, `fixedChoiceQuestionTypeID`, `fixedChoiceQuestionDivision`, `fixedChoiceQuestionnaireContent`) VALUES
	(1, '객관식', '2단계', '예/아니오'),
	(2, '객관식', '3단계', '만족/보통/불만족'),
	(3, '객관식', '5단계', '매우그렇다/그렇다/보통이다/그렇지않다/전혀그렇지않다'),
	(4, '주관식', NULL, '200자 이내로 입력해주세요.'),
	(5, '객관식', '3단계', '잘함/보통/못함'),
	(6, '객관식', '3단계', '1/2/3');
/*!40000 ALTER TABLE `fixedchoicequestionnaire` ENABLE KEYS */;

-- 테이블 software.lecture 구조 내보내기
DROP TABLE IF EXISTS `lecture`;
CREATE TABLE IF NOT EXISTS `lecture` (
  `processCode` varchar(10) NOT NULL,
  `memberID` varchar(10) NOT NULL,
  `processStep` int(5) NOT NULL,
  `personnelCardNumber` varchar(16) DEFAULT NULL,
  `processName` varchar(100) DEFAULT NULL,
  `companyName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`processCode`,`memberID`),
  KEY `FK_lecture_memberdata` (`memberID`),
  CONSTRAINT `FK_lecture_establishprocess` FOREIGN KEY (`processCode`) REFERENCES `establishprocess` (`processCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_lecture_memberdata` FOREIGN KEY (`memberID`) REFERENCES `memberdata` (`memberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.lecture:~12 rows (대략적) 내보내기
DELETE FROM `lecture`;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` (`processCode`, `memberID`, `processStep`, `personnelCardNumber`, `processName`, `companyName`) VALUES
	('P001', 'A0000002', 1, '1111222233334444', 'C++프로그래밍', '(주)KIT'),
	('P001', 'E0000001', 2, '1111222233334444', 'C++프로그래밍', NULL),
	('P002', 'A0000003', 1, '1111222255556666', 'Java프로그래밍', '(주)KIT'),
	('P002', 'E0000001', 1, NULL, 'java프로그래밍', NULL),
	('P002', 'S0000001', 1, '1111222233334444', 'java프로그래밍', NULL),
	('P003', 'E0000001', 1, '1111222233334444', 'C#프로그래밍', NULL),
	('P003', 'E0000002', 1, '1111222277773333', 'C#프로그래밍', '(주)KIT'),
	('P004', 'E0000001', 1, '1111222233334444', '객체지향소프트웨어공학', NULL),
	('P005', 'E0000001', 1, NULL, '컴퓨터네트워크', 'dd'),
	('P005', 'S0000001', 1, '9999999911113366', '객체지향소프트웨어공학', '(주)금소공'),
	('P006', 'E0000001', 1, '1111222233334444', '데이터베이스', NULL),
	('P009', 'E0000001', 2, '1111222233334444', '전공컴퓨터', NULL);
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;

-- 테이블 software.lectureevaluationquestion 구조 내보내기
DROP TABLE IF EXISTS `lectureevaluationquestion`;
CREATE TABLE IF NOT EXISTS `lectureevaluationquestion` (
  `evaluationQuestionNumber` int(3) NOT NULL,
  `effectiveStartDate` varchar(10) NOT NULL,
  `effectiveFinishDate` varchar(10) NOT NULL,
  `evaluandDivision` varchar(10) NOT NULL,
  `evaluationQuestionContent` varchar(100) NOT NULL,
  PRIMARY KEY (`evaluationQuestionNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.lectureevaluationquestion:~20 rows (대략적) 내보내기
DELETE FROM `lectureevaluationquestion`;
/*!40000 ALTER TABLE `lectureevaluationquestion` DISABLE KEYS */;
INSERT INTO `lectureevaluationquestion` (`evaluationQuestionNumber`, `effectiveStartDate`, `effectiveFinishDate`, `evaluandDivision`, `evaluationQuestionContent`) VALUES
	(1, '2016.01.01', '2016.12.31', '강의', '강의의 수업자료는 유용하였고 제시된 토픽들은 조리 있게 짜여 졌는가? '),
	(2, '2016.01.01', '2017.12.31', '강의', '강의의 시험 및 과제는 강의 내용을 잘 반영하였고 학습에 도움이 되었는가?'),
	(4, '2016.01.01', '2016.12.31', '강의', '강의는 강의 계획서의 계획을 준수 하였는가?'),
	(5, '2016.01.01', '2018.12.31', '강의', '이 강의를 전반적으로 평가 할때 우수하다고 생각되는가?'),
	(6, '2016.01.01', '2018.12.31', '강의', '강의에 대한 전반적인 평가를 기술해 주세요.'),
	(7, '2016.01.01', '2016.12.31', '강의', '이 강의의 교육시간은 강의의 내용을 이해하기에 적절한 수준인가?'),
	(8, '2016.01.01', '2016.12.31', '강사', '강사는 수업에 대한 준비를 철저하게 하였는가?'),
	(9, '2016.01.01', '2017.12.31', '강사', '강사의 수업진행 속도는 학생들이 수업을 이해하기에 적절하였는가?'),
	(10, '2016.01.01', '2018.01.01', '강사', '강사는 강의내용을 명쾌하게 설명하였는가?'),
	(11, '2016.01.01', '2018.01.01', '강사', '강사는 수업시간에 질문할 기회를 충분히 주었으며 답변에 충실하였는가?'),
	(12, '2016.01.01', '2017.12.31', '강사', '강사는 흥미와 열정을 가지고 강의를 진행하였는가?'),
	(13, '2016.01.01', '2018.12.31', '강사', '이 강사의 다른 수업을 들을 생각이 있는가?'),
	(14, '2016.01.01', '2018.12.31', '강사', '강사에 대한 전반적인 평가를 기술해 주세요.'),
	(15, '2016.01.01', '2018.12.31', '강사', '강사는 휴강이나 보강에대한 적절한 조치를 취하였다고 생각하는가?'),
	(16, '2016.01.01', '2018.01.01', '강의', '이 강의를 수강하고 난 후 수강 전과 비교하여 어느 정도 실력이 향상되었는지에 대해 기술해주세요.'),
	(17, '2016.01.01', '2018.12.31', '강사', '해당 강사에게 소감이나 개선할 점을 자유롭게 기술해 주세요.'),
	(18, '2016.01.01', '2016.12.31', '강의', '강의를 수강하는 환경은 어느정도 만족할 수준인가?'),
	(19, '2016.01.01', '2018.12.31', '강사', '강사가 학생들을 대하는 태도는 어떠한가?'),
	(20, '2016.01.01', '2017.12.31', '강의', '수강한 후에 이 강의를 다른 사람에게 추천할 의향이 있는가?'),
	(21, '2016.01.01', '2017.12.31', '강의', '강의의 일정에 대해 어느정도 만족하는가?'),
	(22, '1', '1', '강의', '아아아'),
	(23, '1', '1', '강의', 'ddd');
/*!40000 ALTER TABLE `lectureevaluationquestion` ENABLE KEYS */;

-- 테이블 software.memberdata 구조 내보내기
DROP TABLE IF EXISTS `memberdata`;
CREATE TABLE IF NOT EXISTS `memberdata` (
  `memberID` varchar(8) NOT NULL,
  `ID` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `genderStatus` int(1) unsigned DEFAULT '0',
  `truthResidence` varchar(100) DEFAULT NULL,
  `homePhoneNo` varchar(50) DEFAULT '0',
  `phoneNo` varchar(50) DEFAULT '0',
  `emergencyContact` varchar(50) DEFAULT '0',
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`memberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원정보';

-- 테이블 데이터 software.memberdata:~10 rows (대략적) 내보내기
DELETE FROM `memberdata`;
/*!40000 ALTER TABLE `memberdata` DISABLE KEYS */;
INSERT INTO `memberdata` (`memberID`, `ID`, `password`, `name`, `genderStatus`, `truthResidence`, `homePhoneNo`, `phoneNo`, `emergencyContact`, `email`, `address`) VALUES
	('A0000002', 'a0002', '1234', '한2', 1, '울산광역시', '01098114022', '01098114022', '01098114022', 'shon9812@naver.com', '울산광역시'),
	('A0000003', 'a0003', '1234', '한3', 1, '울산광역시', '01098114023', '01098114023', '01098114023', 'shon9813@naver.com', '울산광역시'),
	('E0000001', 'e0001', '1234', '강우진', 1, '울산광역시', '01098114021', '01098114021', '01098114021', 'shon9811@naver.com', '울산광역시'),
	('E0000002', 'e0002', '1234', '김2', 1, '울산광역시', '01098114022', '01098114022', '01098114022', 'shon9812@naver.com', '울산광역시'),
	('E0000003', 'e0003', '1234', '김3', 1, '울산광역시', '01098114023', '01098114023', '01098114023', 'shon9813@naver.com', '울산광역시'),
	('E10', '11', '1', '1', 0, '1', '1', '1', '1', '1', '1'),
	('S0000001', 's0001', '1234', 'qw', 1, '1', '1', '213', '1', '1qweqwe', '1'),
	('S0000003', 's0003', '1234', '강3', 1, '울산광역시', '01098114023', '01098114023', '01098114023', 'shon9813@naver.com', '울산광역시'),
	('S10', 'ddd', 'vv', 'aaa', 0, NULL, NULL, 'asdfasdf', NULL, 'vvv', 'ddd'),
	('S11', 'shon1111', '1234', '강우진', 0, NULL, NULL, '01098114021', NULL, 'shon9811@naver.com', '울산광역시 울주군 온산읍'),
	('S12', 'shon2222', '1234', '강우진', 0, NULL, NULL, '01098114021', NULL, 'shon9811@naver.com', '울산광역시');
/*!40000 ALTER TABLE `memberdata` ENABLE KEYS */;

-- 테이블 software.normalmemberdata 구조 내보내기
DROP TABLE IF EXISTS `normalmemberdata`;
CREATE TABLE IF NOT EXISTS `normalmemberdata` (
  `memberID` varchar(8) NOT NULL,
  `centerName` varchar(20) NOT NULL,
  `department` varchar(20) NOT NULL,
  `duty` varchar(20) NOT NULL,
  `position` varchar(20) NOT NULL,
  PRIMARY KEY (`memberID`),
  CONSTRAINT `memberID5` FOREIGN KEY (`memberID`) REFERENCES `memberdata` (`memberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.normalmemberdata:~4 rows (대략적) 내보내기
DELETE FROM `normalmemberdata`;
/*!40000 ALTER TABLE `normalmemberdata` DISABLE KEYS */;
INSERT INTO `normalmemberdata` (`memberID`, `centerName`, `department`, `duty`, `position`) VALUES
	('S0000001', 'SK', 'C&C', '부장', '부장'),
	('S0000003', 'LG', 'C&C', '과장', '과장'),
	('S10', 'bbb', 'ccc', 'qq', 'eee'),
	('S11', '구글', 'C&C', '연구원', '과장'),
	('S12', '구글', 'C&C', '연구원', '부장');
/*!40000 ALTER TABLE `normalmemberdata` ENABLE KEYS */;

-- 테이블 software.operatesubject 구조 내보내기
DROP TABLE IF EXISTS `operatesubject`;
CREATE TABLE IF NOT EXISTS `operatesubject` (
  `subjectProcess` varchar(10) NOT NULL,
  `target` varchar(300) DEFAULT NULL,
  `feature` varchar(300) DEFAULT NULL,
  `recruitNumber` int(4) DEFAULT NULL,
  `tuition` int(7) unsigned DEFAULT NULL,
  `subjectCode` varchar(10) NOT NULL,
  `purpose` varchar(100) DEFAULT NULL,
  `changeRecord` varchar(100) NOT NULL,
  `subjectName` varchar(20) NOT NULL,
  `totalDate` int(5) DEFAULT NULL,
  `totalHour` int(5) DEFAULT NULL,
  `lectureHour` int(5) DEFAULT NULL,
  `lectureContent` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`subjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.operatesubject:~9 rows (대략적) 내보내기
DELETE FROM `operatesubject`;
/*!40000 ALTER TABLE `operatesubject` DISABLE KEYS */;
INSERT INTO `operatesubject` (`subjectProcess`, `target`, `feature`, `recruitNumber`, `tuition`, `subjectCode`, `purpose`, `changeRecord`, `subjectName`, `totalDate`, `totalHour`, `lectureHour`, `lectureContent`) VALUES
	('SFA', 'DD', 'DD', 2, 2, 'AFDS', 'DD', '없음', 'DD', 1, 1, 2, 'DD/'),
	('afsd', 'dfs', 'sdf', 1, 11, 'asdf', 'dsf', '없음', 'aaaaaaaaaaaaaaaaa', 1, 1, 1, 'vv/'),
	('sdf', 'sdfsdf', 'fff', 2, 2, 'asdfcwq', 'sdfsdf', '없음', '일이삼사오', 2, 2, 2, 'dd/'),
	('장기', 'C++모르는사람', 'C++ 마스터에 중점', 40, 80000, 'S001', 'C++전반적이해', '과목 특장점 : C++ 마스터에 중점 ->C++ 마스터', 'C++프로그래밍', 40, 160, 4, '월       화        수        목       금/1주차 :문법     문법      문법      문법     문법/2주차 :포인터   포인터    포인터    포인터   포인터/3주차 :class    class     class     class    class/4주차 :상속     상속      상속      상속     상속 '),
	('장기', 'Java모르는사람', 'Java 프로그래밍 마스터에 중점', 40, 80000, 'S002', 'Java전반적이해', '과목명 : java -> Java 프로그래밍', 'Java프로그래밍', 40, 160, 4, '월       화        수        목       금/1주차 :문법     문법      문법      문법     문법/2주차 :포인터   포인터    포인터    포인터   포인터/3주차 :class    class     class     class    class/4주차 :상속     상속      상속      상속     상속'),
	('장기', 'C#모르는사람', 'C# 프로그래밍 마스터에 중점', 40, 80000, 'S003', 'C#전반적이해', '과목명 : C# -> C# 프로그래밍', 'C#프로그래밍', 40, 160, 4, '월       화        수        목       금/1주차 :문법     문법      문법      문법     문법/2주차 :포인터   포인터    포인터    포인터   포인터/3주차 :class    class     class     class    class/4주차 :상속     상속      상속      상속     상속 '),
	('장기', '객체지향소프트웨어공학 모르는사람', '객체지향소프트웨어공학 마스터에 중점', 40, 80000, 'S004', '객체지향소프트웨어공학 전반적이해', '과목명 : 객소공 -> 객체지향소프트웨어공학', '객체지향소프트웨어공학', 40, 160, 4, '월       화        수        목       금/1주차 :문법     문법      문법      문법     문법/2주차 :포인터   포인터    포인터    포인터   포인터/3주차 :class    class     class     class    class/4주차 :상속     상속      상속      상속     상속'),
	('장기', '컴퓨터네트워크 모르는사람', '컴퓨터네트워크 마스터에 중점', 40, 80000, 'S005', '컴퓨터네트워크전반적이해', '과목명 : 컴네 -> 컴퓨터네트워크', '컴퓨터네트워크', 40, 160, 4, '월       화        수        목       금/1주차 :문법     문법      문법      문법     문법/2주차 :포인터   포인터    포인터    포인터   포인터/3주차 :class    class     class     class    class/4주차 :상속     상속      상속      상속     상속'),
	('단기', '전공컴퓨터에 관심있는사람', '컴퓨터관련 학과 우선 모집', 24, 24500, 'S009', '컴퓨터에 대한 기초적인 이해', '과목명 : 전공컴퓨터기초 -> 전공컴퓨터', '전공컴퓨터', 30, 120, 4, '월       화        수        목       금/1주차 :기초     기초      기초      기초     문기초/2주차 :기초   기초    기초    기초   기초/3주차 :심화    심화     심화     심화    심화/4주차 :발표     발표      발표      발표    시험'),
	('asdasd', 'asd', 'asd', 1, 1, 'ㅁㅇㅁㄴㅇ', 'asd', '없음', 'asd', 1, 1, 1, 'ddd/');
/*!40000 ALTER TABLE `operatesubject` ENABLE KEYS */;

-- 테이블 software.responsibilitysubject 구조 내보내기
DROP TABLE IF EXISTS `responsibilitysubject`;
CREATE TABLE IF NOT EXISTS `responsibilitysubject` (
  `responsibilitySubject` varchar(50) NOT NULL,
  `memberID` varchar(50) NOT NULL,
  PRIMARY KEY (`responsibilitySubject`,`memberID`),
  KEY `FK_responsibilitysubject_memberdata` (`memberID`),
  CONSTRAINT `FK_responsibilitysubject_memberdata` FOREIGN KEY (`memberID`) REFERENCES `memberdata` (`memberID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_responsibilitysubject_operatesubject` FOREIGN KEY (`responsibilitySubject`) REFERENCES `operatesubject` (`subjectCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='담당과목';

-- 테이블 데이터 software.responsibilitysubject:~0 rows (대략적) 내보내기
DELETE FROM `responsibilitysubject`;
/*!40000 ALTER TABLE `responsibilitysubject` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsibilitysubject` ENABLE KEYS */;

-- 테이블 software.workresult 구조 내보내기
DROP TABLE IF EXISTS `workresult`;
CREATE TABLE IF NOT EXISTS `workresult` (
  `resultNo` int(11) NOT NULL,
  `workResult` int(3) NOT NULL,
  `workData` varchar(500) NOT NULL,
  `resultDate` varchar(50) NOT NULL,
  `memberID` varchar(8) NOT NULL,
  PRIMARY KEY (`resultNo`,`memberID`),
  KEY `memberID2` (`memberID`),
  CONSTRAINT `memberID2` FOREIGN KEY (`memberID`) REFERENCES `employeedata` (`memberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 software.workresult:~7 rows (대략적) 내보내기
DELETE FROM `workresult`;
/*!40000 ALTER TABLE `workresult` DISABLE KEYS */;
INSERT INTO `workresult` (`resultNo`, `workResult`, `workData`, `resultDate`, `memberID`) VALUES
	(0, 70, '                     \r\n                     1231232131321', '20161211', 'E0000001'),
	(1, 50, '잘했어3', '20161203', 'A0000002'),
	(1, 80, '잘했어', '20161202', 'A0000003'),
	(1, 34, '1112121                     \r\n                     ', '20161211', 'E0000001'),
	(1, 80, '잘했어5', '20161204', 'E0000002'),
	(2, 50, '123', '123122', 'A0000002'),
	(2, 70, '1231231                     \r\n                     ', '20161211', 'E0000001');
/*!40000 ALTER TABLE `workresult` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
