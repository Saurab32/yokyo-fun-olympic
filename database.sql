-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table newsportal.tbladmin
CREATE TABLE IF NOT EXISTS `tbladmin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AdminUserName` varchar(255) DEFAULT NULL,
  `AdminPassword` varchar(255) DEFAULT NULL,
  `AdminEmailId` varchar(255) DEFAULT NULL,
  `userType` int DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `AdminUserName` (`AdminUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table newsportal.tbladmin: ~3 rows (approximately)
INSERT INTO `tbladmin` (`id`, `AdminUserName`, `AdminPassword`, `AdminEmailId`, `userType`, `CreationDate`, `UpdationDate`) VALUES
	(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', 'phpgurukulofficial@gmail.com', 1, '2021-05-26 18:30:00', '2021-11-11 16:23:15'),
	(3, 'subadmin', 'f925916e2754e5e03f75dd58a5733251', 'sudamin@gmail.in', 0, '2021-11-10 18:28:11', NULL),
	(4, 'suadmin2', 'f925916e2754e5e03f75dd58a5733251', 'sbadmin@test.com', 0, '2021-11-10 18:28:32', NULL);

-- Dumping structure for table newsportal.tblcategory
CREATE TABLE IF NOT EXISTS `tblcategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(200) DEFAULT NULL,
  `Description` mediumtext,
  `PostingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Is_Active` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table newsportal.tblcategory: ~9 rows (approximately)
INSERT INTO `tblcategory` (`id`, `CategoryName`, `Description`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
	(3, 'Sports', 'Related to sports news', '2021-06-05 18:30:00', '2023-07-01 15:50:22', 0),
	(5, 'Entertainment', 'Entertainment related  News', '2021-06-13 18:30:00', '2023-07-01 15:50:21', 0),
	(6, 'Politics', 'Politics', '2021-06-21 18:30:00', '2023-07-01 15:50:14', 0),
	(7, 'Business', 'Business', '2021-06-21 18:30:00', '2023-07-01 15:50:13', 0),
	(8, 'COVID-19', 'COVID-19', '2021-11-07 18:17:28', '2023-07-01 15:50:08', 0),
	(9, 'Football', 'Football', '2023-07-01 15:52:03', NULL, 1),
	(10, 'Highlights', 'Highlights of the matches', '2023-07-03 07:31:06', NULL, 1),
	(11, 'News', 'News about the olympics', '2023-07-03 07:37:08', NULL, 1),
	(12, 'Basketball', 'Basketball game', '2023-07-03 08:19:29', NULL, 1);

-- Dumping structure for table newsportal.tblcomments
CREATE TABLE IF NOT EXISTS `tblcomments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `postId` int DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `comment` mediumtext,
  `postingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `postId` (`postId`),
  CONSTRAINT `pid` FOREIGN KEY (`postId`) REFERENCES `tblposts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table newsportal.tblcomments: ~1 rows (approximately)
INSERT INTO `tblcomments` (`id`, `postId`, `name`, `email`, `comment`, `postingDate`, `status`) VALUES
	(3, 7, 'ABC', 'abc@test.com', 'This is sample text for testing.', '2021-11-20 18:30:00', 0);

-- Dumping structure for table newsportal.tblpages
CREATE TABLE IF NOT EXISTS `tblpages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PageName` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext,
  `Description` longtext,
  `PostingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table newsportal.tblpages: ~2 rows (approximately)
INSERT INTO `tblpages` (`id`, `PageName`, `PageTitle`, `Description`, `PostingDate`, `UpdationDate`) VALUES
	(1, 'aboutus', '24 facts about the Olympics that will blow your mind', '<p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">1. The first Olympic Games took place in the 8th century B.C. in Olympia, Greece. They were held every four years for 12 centuries. Then, in the 4th century A.D., all pagan festivals were banned by Emperor Theodosius I and the Olympics were no more.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">2. However, the athletic tradition was resurrected about 1500 years later: The first modern Olympics were held in 1896 in Greece.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">3. In ancient Greece, athletes didn’t worry about sponsorship, protection, or fashion – they competed naked.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">4. Back then, the games lasted five or six months.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">5. Women have been allowed to compete in the Olympics since 1900.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">6. From 1924-1992, the Winter and the Summer Olympics took place in the same year. Now, they’re on separate cycles and alternate every two years.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">7. Only four athletes have won medals in both the Winter and the Summer Olympics. Only one of them, Christa Ludinger-Rothenburger, won medals in the same year.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">8. During the 2012 London Games, the Olympic Village required 165,000 towels for a bit more than two weeks of activity.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">9. The official languages of the games are English and French, complemented by the official language of the host country.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">10. Tarzan competed in the Olympics: Johnny Weissmuller, an athlete-turned-actor who played Tarzan in 12 movies, won five gold medals in swimming in the 1920s.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">11. From 1912-1948, artists participated in the Olympics: Painters, sculptors, architects, writers, and musicians competed for medals in their respective fields.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">12. During the 1936 Berlin Games, two Japanese pole-vaulters tied for second place. Instead of competing again, they cut the silver and bronze medals in half and fused the two different halves together so that each of them had a half-silver and half-bronze medal.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">13. The Olympic torch is lit the old-fashioned way in an ancient ceremony at the temple of Hera, in Greece: Actresses, wearing costumes of Greek priestesses, use a parabolic mirror and sun rays to kindle the torch.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">14. From there, the torch starts its relay to the host city: It is usually carried by runners, but it has traveled on a boat, on an airplane (and the Concorde), on horseback, on the back of a camel, via radio signal, underwater, and in a canoe.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">15. The unlit Olympic torch has also been taken to space several times.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px; margin-bottom: 48px;"><span style="font-weight: 700;">16. The relay torch and the Olympic flame are supposed to burn during the whole event. In case the flame goes out, it can only be reignited with a backup flame, which has been lit in Greece as well, and with never a regular lighter!</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px; margin-bottom: 48px;"><span style="font-weight: 700;"><br></span><span style="font-weight: 700;">17. The 2012 London Games were the first Olympics in which all participating countries sent female athletes.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">18. The following sports are (sadly) not part of the Olympics anymore: solo synchronized swimming, tug of war, rope climbing, hot air ballooning, dueling pistol, tandem bicycle, swimming obstacle race, and plunge for distance. Luckily, live pigeon shooting was a one-shot and only part of the 1900 Olympics in Paris.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">19. The five rings of the Olympic symbol – designed by Baron Pierre de Coubertin, co-founder of the modern Olympic Games – represent the five inhabited continents of the world.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px; margin-bottom: 48px;"><span style="font-weight: 700;">20. The six colors – blue, yellow, black, green, red, and the white background – were chosen because every nation’s flag contains at least one of them.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">21. The Olympic Games have been hosted by 23 different countries.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">22. The first official Olympic mascot was Waldi, the dachshund, at the 1972 Games in Munich.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">23. The 2016 Games in Rio will mark the first time the Olympics are held in South America.</span></p><p style="font-family: Helvetica, Arial, sans-serif; font-size: 16px;"><span style="font-weight: 700;">24. During the 17 days of the 2016 Summer Olympics, 10,500 athletes from 205 countries will represent 42 different sports and participate in 306 competitions in Rio.</span></p>', '2021-06-29 18:30:00', '2023-07-01 15:47:04'),
	(2, 'contactus', 'Contact Details', '<p><br></p><p><b>Address :&nbsp; </b>Phutung-7,Kathmandu,Nepal</p><p><b>Phone Number : </b>+977 -9869330474</p><p><b>Email -id : </b>sauravpandey450@gmail.com</p>', '2021-06-29 18:30:00', '2023-07-01 16:10:54');

-- Dumping structure for table newsportal.tblposts
CREATE TABLE IF NOT EXISTS `tblposts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PostTitle` longtext,
  `CategoryId` int DEFAULT NULL,
  `SubCategoryId` int DEFAULT NULL,
  `PostDetails` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `PostingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Is_Active` int DEFAULT NULL,
  `PostUrl` mediumtext,
  `PostImage` varchar(255) DEFAULT NULL,
  `viewCounter` int DEFAULT NULL,
  `postedBy` varchar(255) DEFAULT NULL,
  `lastUpdatedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `postcatid` (`CategoryId`),
  KEY `postsucatid` (`SubCategoryId`),
  KEY `subadmin` (`postedBy`),
  CONSTRAINT `postcatid` FOREIGN KEY (`CategoryId`) REFERENCES `tblcategory` (`id`),
  CONSTRAINT `postsucatid` FOREIGN KEY (`SubCategoryId`) REFERENCES `tblsubcategory` (`SubCategoryId`),
  CONSTRAINT `subadmin` FOREIGN KEY (`postedBy`) REFERENCES `tbladmin` (`AdminUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table newsportal.tblposts: ~10 rows (approximately)
INSERT INTO `tblposts` (`id`, `PostTitle`, `CategoryId`, `SubCategoryId`, `PostDetails`, `PostingDate`, `UpdationDate`, `Is_Active`, `PostUrl`, `PostImage`, `viewCounter`, `postedBy`, `lastUpdatedBy`) VALUES
	(7, 'Jasprit Bumrah ruled out of England T20I series due to injury', 3, 4, '<p style="margin-bottom: 15px; padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;"><span style="margin: 0px; padding: 0px; font-weight: 700;">The Indian Cricket Team has received a huge blow right ahead of the commencement of the much-awaited series against England. Star speedster Jasprit Bumrah has been ruled out of the forthcoming 3-match T20I series as he suffered an injury in his left thumb.</span></p><p style="margin-bottom: 15px; padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;">The 24-year-old pacer picked up a niggle during India’s first T20I match against Ireland played on June 27 at the Malahide cricket ground in Dublin. As per the reports, he is likely to be available for the ODI series against England scheduled to start from July 12.</p><p style="margin-bottom: 15px; padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;">In the first, Bumrah exhibited a phenomenal performance with the ball. In his quota of four overs, he conceded 19 runs and picked 2 wickets at an economy rate of 4.75.</p><p style="margin-bottom: 15px; padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;">Post his injury, he arrived at team’s optional training session on Thursday but didn’t train. Later, he was rested in the second face-off along with MS Dhoni, Shikhar Dhawan and Bhuvneshwar Kumar.</p><p style="margin-bottom: 15px; padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;">As of now, no replacement has been announced. However, Umesh Yadav may be be given chance in the team in Bumrah’s absence.</p><p style="padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;">The first T20I match between India and England will be played at Old Trafford, Manchester on July 3.</p>', '2021-07-07 18:30:00', '2023-07-01 17:02:11', 0, 'Jasprit-Bumrah-ruled-out-of-England-T20I-series-due-to-injury', '675684932472220e825128b32f7c1efb.png', 24, 'admin', NULL),
	(10, 'Tata Steel, Thyssenkrupp Finalise Landmark Steel Deal', 7, 9, '<h1 style="box-sizing: inherit; margin-top: 0px; padding: 0px; font-family: Roboto, sans-serif; font-size: 38px; line-height: normal; letter-spacing: -0.5px; color: rgb(51, 51, 51);"><span itemprop="headline" style="box-sizing: inherit;">Tata Steel, Thyssenkrupp Finalise Landmark Steel Deal</span>Tata Steel, Thyssenkrupp Finalise Landmark Steel DealTata Steel, Thyssenkrupp Finalise Landmark Steel DealTata Steel, Thyssenkrupp Finalise Landmark Steel DealTata Steel, Thyssenkrupp Finalise Landmark Steel Deal</h1>', '2021-06-30 18:30:00', '2023-07-01 17:02:17', 0, 'Tata-Steel,-Thyssenkrupp-Finalise-Landmark-Steel-Deal', '505e59c459d38ce4e740e3c9f5c6caf7.jpg', 1, 'admin', NULL),
	(11, 'UNs Jean Pierre Lacroix thanks India for contribution to peacekeeping', 6, 8, '<p>UNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeeping<br></p>', '2021-06-30 18:30:00', '2023-07-01 17:02:21', 0, 'UNs-Jean-Pierre-Lacroix-thanks-India-for-contribution-to-peacekeeping', '27095ab35ac9b89abb8f32ad3adef56a.jpg', 34, 'admin', NULL),
	(12, 'Shah holds meeting with NE states leaders in Manipur', 6, 7, '<p><span style="color: rgb(25, 25, 25); font-family: &quot;Noto Serif&quot;; font-size: 16px;">New Delhi: BJP president Amit Shah today held meetings with his party leaders who are in-charge of 11 Lok Sabha seats spread across seven northeast states as part of a drive to ensure that it wins the maximum number of these constituencies in the general election next year.</span><br style="box-sizing: inherit; color: rgb(25, 25, 25); font-family: &quot;Noto Serif&quot;; font-size: 16px;"><br style="box-sizing: inherit; color: rgb(25, 25, 25); font-family: &quot;Noto Serif&quot;; font-size: 16px;"><webviewcontentdata style="box-sizing: inherit; color: rgb(25, 25, 25); font-family: &quot;Noto Serif&quot;; font-size: 16px;">Shah held separate meetings with Lok Sabha toli (group) of Arunachal Pradesh, Tripura, Meghalaya, Mizoram, Nagaland, Sikkim and Manipur in Manipur, the partys media head Anil Baluni said.<br style="box-sizing: inherit;"><br style="box-sizing: inherit;">Baluni said that Shah was in West Bengal for two days before he arrived in Manipur. The BJP chief would reach Odisha tomorrow.</webviewcontentdata><br></p>', '2021-06-30 18:30:00', '2023-07-01 17:02:35', 0, 'Shah-holds-meeting-with-NE-states-leaders-in-Manipur', '7fdc1a630c238af0815181f9faa190f5.jpg', 22, 'admin', NULL),
	(13, 'T20 World Cup 2021: Semi-final 1, England vs New Zealand â€“ Who Said What', 3, 4, '<p style="margin-bottom: 3rem; font-size: 20px; color: rgb(41, 41, 41); line-height: 1.6; font-family: &quot;Proxima Nova&quot;;">New Zealand held their nerves admirably to make it a hat-trick of ICC event final entrances, trumping&nbsp;<a href="https://www.crictracker.com/cricket-teams/england/" target="_blank" rel="noopener" style="color: rgb(4, 93, 233);"><strong>England</strong></a>&nbsp;in a see-sawing semi-final clash in Abu Dhabi. You would feel they are too nice to believe in revenging anything, even if it is as bitter as the fateful 2019 ODI World Cup loss, so letâ€™s put it this way: the scores are settled. And in doing so, New Zealand have made it to the finals of a tournament no one counted them as the favourites of.&nbsp;</p><p style="margin-bottom: 3rem; font-size: 20px; color: rgb(41, 41, 41); line-height: 1.6; font-family: &quot;Proxima Nova&quot;;">After being inserted, a Jason Roy-less England managed 166/4 largely on the back of Dawid Malan (41 off 30), who got back his mojo at the right time, and Moeen Ali (51 off 37), who proved it for the umpteenth time what a marvellous short-format asset he is.</p>', '2021-11-10 18:50:09', '2023-07-01 17:02:27', 0, 'T20-World-Cup-2021:-Semi-final-1,-England-vs-New-Zealand-â€“-Who-Said-What', '8bc5c30be91dca9d07c1db858c60e39f.jpg', 6, 'admin', 'subadmin'),
	(14, 'Match Schedule', 9, 11, '<table style="color: rgb(32, 33, 34); font-family: sans-serif; float: left; width: 144px; table-layout: fixed; border-style: none;"><tbody><tr><td style="border-style: none;"><div style="text-align: right;">5 October 2023<br>14:00 (<a href="https://en.wikipedia.org/wiki/Day/night_cricket" title="Day/night cricket" style="color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word;">D/N</a>)<br><small style="font-size: 11.9px;"><a rel="nofollow" class="external text" href="https://www.espncricinfo.com/ci/engine/match/1384392.html" style="color: rgb(51, 102, 204); background-image: url(&quot;/w/skins/Vector/resources/common/images/link-external-small-ltr-progressive.svg?30a3a&quot;); background-position: right center; background-size: 0.857em; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word; padding-right: 1em;">Scorecard</a></small></div></td></tr></tbody></table><table style="color: rgb(32, 33, 34); font-family: sans-serif; float: left; width: 508.8px; table-layout: fixed; text-align: center; border-style: none;"><tbody><tr style="vertical-align: top;"><td style="width: 236.125px; text-align: right; border-style: none;"><b><a href="https://en.wikipedia.org/wiki/England_cricket_team" title="England cricket team" style="color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word;">England</a><span class="flagicon">&nbsp;<img alt="" src="https://upload.wikimedia.org/wikipedia/en/thumb/b/be/Flag_of_England.svg/23px-Flag_of_England.svg.png" decoding="async" width="23" height="14" class="thumbborder" srcset="//upload.wikimedia.org/wikipedia/en/thumb/b/be/Flag_of_England.svg/35px-Flag_of_England.svg.png 1.5x, //upload.wikimedia.org/wikipedia/en/thumb/b/be/Flag_of_England.svg/46px-Flag_of_England.svg.png 2x" data-file-width="800" data-file-height="480" style="border-width: 1px; border-style: solid; border-color: rgb(234, 236, 240);"></span></b><br></td><td style="border-style: none;"><b>v</b></td><td style="width: 236.125px; text-align: left; border-style: none;"><b><span class="flagicon"><img alt="" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Flag_of_New_Zealand.svg/23px-Flag_of_New_Zealand.svg.png" decoding="async" width="23" height="12" class="thumbborder" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Flag_of_New_Zealand.svg/35px-Flag_of_New_Zealand.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Flag_of_New_Zealand.svg/46px-Flag_of_New_Zealand.svg.png 2x" data-file-width="1200" data-file-height="600" style="border-width: 1px; border-style: solid; border-color: rgb(234, 236, 240);">&nbsp;</span><a href="https://en.wikipedia.org/wiki/New_Zealand_national_cricket_team" title="New Zealand national cricket team" style="color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word;">New Zealand</a></b><br></td></tr><tr style="vertical-align: top;"><td style="text-align: right; border-style: none;"><small style="font-size: 11.9px;"></small></td><td style="border-style: none;"></td><td style="text-align: left; border-style: none;"><small style="font-size: 11.9px;"></small></td></tr></tbody></table><table style="color: rgb(32, 33, 34); font-family: sans-serif; float: right; width: 307.2px; overflow: hidden; border-style: none;"><tbody><tr><td style="border-style: none;"><div><small style="font-size: 11.9px;"><a href="https://en.wikipedia.org/wiki/Narendra_Modi_Stadium" title="Narendra Modi Stadium" style="color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word;">Narendra Modi Stadium</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Ahmedabad" title="Ahmedabad" style="color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word;">Ahmedabad</a></small></div></td></tr></tbody></table>', '2023-07-01 17:01:02', '2023-07-03 07:29:55', 1, 'Match-Schedule', 'da6b07dfe0573b260af8d40225bc698a.jpg', NULL, NULL, NULL),
	(15, 'Mexico vs Brazil - Football Gold Medal Match Highlights ', 10, 12, '<p><iframe frameborder="0" src="//www.youtube.com/embed/kYIf8I1dvdo" width="640" height="360" class="note-video-clip"></iframe><br></p>', '2023-07-03 07:35:17', '2023-07-03 07:54:15', 1, 'Mexico-vs-Brazil---Football-Gold-Medal-Match-Highlights-', '663df585672d1590d3c61105603efb0b.png', NULL, NULL, NULL),
	(16, 'Indian shooting team for Asian Games 2023 - Manu Bhaker, Rudrankksh Patil make cut - full list', 11, 13, '<p style="font-family: &quot;Olympic Sans&quot;, Arial, Helvetica, sans-serif; font-size: 20px; line-height: 3.2rem; margin-left: auto; margin-right: auto; width: 600px; color: rgb(45, 45, 45);">A total of 21 shooters – 11 in pistol and 10 in rifle – will be travelling for the Hangzhou Asian Games in China, scheduled from September 23 to October 8. Olympians Manu Bhaker, Divyansh Singh Panwar as well as reigning men’s 10m air rifle champion Rudrankksh Balasaheb Patil are in the Indian shooting team.</p><p style="font-family: &quot;Olympic Sans&quot;, Arial, Helvetica, sans-serif; font-size: 20px; line-height: 3.2rem; margin-left: auto; margin-right: auto; width: 600px; color: rgb(45, 45, 45);">For the Baku world championships, to be held from August 14 to September 1 in Azerbaijan, India will be sending a 22-member rifle and pistol squad. Interestingly, Rudrankksh Balasaheb Patil has been left out of the world championships squad.</p><p style="font-family: &quot;Olympic Sans&quot;, Arial, Helvetica, sans-serif; font-size: 20px; line-height: 3.2rem; margin-left: auto; margin-right: auto; width: 600px; color: rgb(45, 45, 45);">While the pistol teams for both the Asian Games and the preceding world championships will remain the same, there will be three changes in the rifle team for the Asian Games. Each country can send a maximum of five shooters for the men’s and women’s rifle events while no such restrictions apply for the world championships.</p>', '2023-07-03 07:42:54', NULL, 1, 'Indian-shooting-team-for-Asian-Games-2023---Manu-Bhaker,-Rudrankksh-Patil-make-cut---full-list', 'c6c191ddfee9d9147a4f5bfbb5dafe84.png', NULL, NULL, NULL),
	(17, 'Italy’s long jump star Larissa Iapichino: Unleashing my artistic passion in pursuit of the Olympic dream', 11, 13, '<p style="font-family: &quot;Olympic Sans&quot;, Arial, Helvetica, sans-serif; font-size: 20px; line-height: 3.2rem; margin-left: auto; margin-right: auto; width: 600px; color: rgb(45, 45, 45);">At just 20 years old,&nbsp;<span style="font-weight: bolder; margin-top: 0px;">Larissa Iapichino</span>&nbsp;has already had a remarkable athletics journey.</p><p style="font-family: &quot;Olympic Sans&quot;, Arial, Helvetica, sans-serif; font-size: 20px; line-height: 3.2rem; margin-left: auto; margin-right: auto; width: 600px; color: rgb(45, 45, 45);">The daughter of two-time world champion – and double Olympic silver medallist -&nbsp;<a href="https://olympics.com/en/athletes/fiona-may" style="color: currentcolor; text-decoration-line: underline; font-size: 2rem; line-height: 3.2rem;"><span style="font-weight: bolder;">Fiona May</span></a>&nbsp;burst onto the global long jump scene with a sensational 6.91m leap at the Italian indoor championships in February 2021, setting a&nbsp;<span style="font-weight: bolder;">U-20 world record</span>&nbsp;that still belongs to her name.</p><p style="font-family: &quot;Olympic Sans&quot;, Arial, Helvetica, sans-serif; font-size: 20px; line-height: 3.2rem; margin-left: auto; margin-right: auto; width: 600px; color: rgb(45, 45, 45);">“I went from being a kid to reaching an enormous result that overwhelmed me,” she said in an exclusive interview with Olympics.com, as she reflected on her rapid rise.</p><p style="font-family: &quot;Olympic Sans&quot;, Arial, Helvetica, sans-serif; font-size: 20px; line-height: 3.2rem; margin-left: auto; margin-right: auto; width: 600px; color: rgb(45, 45, 45);">However, fame also brought with it the burden of heightened expectations and constant comparisons to her mother.</p><p style="font-family: &quot;Olympic Sans&quot;, Arial, Helvetica, sans-serif; font-size: 20px; line-height: 3.2rem; margin-left: auto; margin-right: auto; width: 600px; color: rgb(45, 45, 45);">And more frustration followed when an injury prevented Iapichino from making her Olympic debut just weeks before&nbsp;<a href="https://olympics.com/en/olympic-games/tokyo-2020" style="color: currentcolor; text-decoration-line: underline; font-size: 2rem; line-height: 3.2rem;"><span style="font-weight: bolder;">Tokyo 2020</span></a>.</p>', '2023-07-03 07:48:16', NULL, 1, 'Italy’s-long-jump-star-Larissa-Iapichino:-Unleashing-my-artistic-passion-in-pursuit-of-the-Olympic-dream', '45d243e29964a36314f7e3a18b7598b5.png', NULL, NULL, NULL),
	(18, 'Paris 2024 Olympic Torch Relay: Route unveiled', 11, 13, '<p style="font-family: &quot;Olympic Sans&quot;, Arial, Helvetica, sans-serif; font-size: 20px; line-height: 3.2rem; margin-left: auto; margin-right: auto; width: 600px; color: rgb(45, 45, 45);">On Friday 23 June, the Organising Committee for the&nbsp;<a href="https://olympics.com/en/olympic-games/paris-2024" target="_blank" style="color: currentcolor; text-decoration-line: underline; font-size: 2rem; line-height: 3.2rem; margin-top: 0px;">Olympic Games Paris 2024</a>&nbsp;unveiled the next Olympic Torch Relay route in a&nbsp;historical and symbolic place, at the Sorbonne University, where&nbsp;Pierre de Coubertin held the founding speech&nbsp;for the Modern Olympic Games. It will start in Olympia on&nbsp;16 April 2024&nbsp;with the arrival of the Olympic flame in&nbsp;Marseille&nbsp;on 8 May from Athens, Greece.</p><p style="font-family: &quot;Olympic Sans&quot;, Arial, Helvetica, sans-serif; font-size: 20px; line-height: 3.2rem; margin-left: auto; margin-right: auto; width: 600px; color: rgb(45, 45, 45);">Its 68-day journey will then officially begin&nbsp;taking in 65 French territories&nbsp;courtesy of&nbsp;10,000 Torch bearers&nbsp;visiting some of the most iconic and historic places in the host nation.</p><p style="font-family: &quot;Olympic Sans&quot;, Arial, Helvetica, sans-serif; font-size: 20px; line-height: 3.2rem; margin-left: auto; margin-right: auto; width: 600px; color: rgb(45, 45, 45);">Organised in close collaboration with the territories involved in the Relay and its Presenting partners for more than two months, the Olympic Torch Relay route will be a real journey across France, engaging the local population and creating excitement in the lead up to the Games.</p>', '2023-07-03 08:15:28', NULL, 1, 'Paris-2024-Olympic-Torch-Relay:-Route-unveiled', 'e52fa2a75fa12dce6af92db2d4a98825.png', NULL, NULL, NULL);

-- Dumping structure for table newsportal.tblsubcategory
CREATE TABLE IF NOT EXISTS `tblsubcategory` (
  `SubCategoryId` int NOT NULL AUTO_INCREMENT,
  `CategoryId` int DEFAULT NULL,
  `Subcategory` varchar(255) DEFAULT NULL,
  `SubCatDescription` mediumtext,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Is_Active` int DEFAULT NULL,
  PRIMARY KEY (`SubCategoryId`),
  KEY `catid` (`CategoryId`),
  CONSTRAINT `catid` FOREIGN KEY (`CategoryId`) REFERENCES `tblcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table newsportal.tblsubcategory: ~9 rows (approximately)
INSERT INTO `tblsubcategory` (`SubCategoryId`, `CategoryId`, `Subcategory`, `SubCatDescription`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
	(4, 3, 'Cricket', 'Cricket\r\n\r\n', '2021-06-29 18:30:00', '2023-07-01 15:52:29', 0),
	(7, 6, 'National', 'National', '2021-06-30 18:30:00', '2023-07-01 15:52:32', 0),
	(8, 6, 'International', 'International', '2021-06-30 18:30:00', '2023-07-01 15:52:33', 0),
	(9, 7, 'India', 'India', '2021-06-30 18:30:00', '2023-07-01 15:52:32', 0),
	(11, 9, 'Football', 'Football', '2023-07-01 15:53:34', NULL, 1),
	(12, 10, 'Football match highlight', 'Highlights', '2023-07-03 07:32:51', NULL, 1),
	(13, 11, 'News', 'Olympics update', '2023-07-03 07:37:27', NULL, 1),
	(14, 12, 'Basketball', 'Basketball update', '2023-07-03 08:19:48', NULL, 1),
	(15, 12, 'Basketball', 'Basketball update', '2023-07-03 08:22:08', NULL, 1);

-- Dumping structure for table newsportal.tbl_users
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `user_fname` varchar(100) DEFAULT '',
  `user_lname` varchar(100) DEFAULT '',
  `user_password` varchar(100) DEFAULT '',
  `user_email` varchar(50) DEFAULT NULL,
  `user_phone` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT '0',
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table newsportal.tbl_users: ~0 rows (approximately)
INSERT INTO `tbl_users` (`user_fname`, `user_lname`, `user_password`, `user_email`, `user_phone`, `gender`, `id`) VALUES
	('saurab', 'pandey', '0bcf79c17ab81e6c8fa5da50e7d08f10', 'sauravpandey450@gmail.com', '9869330474', 'on', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
