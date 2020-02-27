-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: webstore
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `bill_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `noti` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45466342 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,1,9000000,'Bank transfer ','vinh','2018-06-12 22:38:41',3,NULL,1),(2,1,11000000,'Bank transfer ','aaaa','2018-06-12 22:38:41',3,NULL,1),(45466335,1,27500000,'Thanh toán khi nhận hàng','test','2018-06-12 22:38:41',3,NULL,1),(45466336,1,21000000,'Thanh toán khi nhận hàng','fsdg','2018-06-12 23:42:43',3,'01652335156',1),(45466337,4,12000000,'Thanh toán khi nhận hàng','saddad','2018-06-13 00:40:48',3,'24235523532355',1),(45466338,4,12000000,'Thanh toán khi nhận hàng','gffgd','2018-06-13 00:44:14',3,'hhdfdh',NULL),(45466339,4,28000000,'Thanh toán khi nhận hàng','dssfsf','2018-06-13 00:49:13',3,'325255',1),(45466340,4,41100000,'Thanh toán khi nhận hàng','gfdgdg','2018-06-13 00:52:12',1,'120112112',1),(45466341,4,894888888,'Thanh toán khi nhận hàng','test','2018-11-12 21:42:04',3,'123123123',1);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_detail`
--

DROP TABLE IF EXISTS `bill_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_detail` (
  `bill_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bill_id` bigint(11) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`bill_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_detail`
--

LOCK TABLES `bill_detail` WRITE;
/*!40000 ALTER TABLE `bill_detail` DISABLE KEYS */;
INSERT INTO `bill_detail` VALUES (1,1,1,9000000,1),(2,2,1,11000000,1),(3,3,2,7000000,1),(8,45466335,3,12000000,2),(9,45466335,8,3500000,1),(10,45466336,9,4800000,2),(11,45466336,15,5000000,2),(12,45466336,2,9000000,1),(13,45466336,3,12000000,1),(14,45466337,3,12000000,1),(15,45466338,3,12000000,1),(16,45466339,2,9000000,1),(17,45466339,3,12000000,1),(18,45466339,4,7000000,1),(19,45466340,8,3500000,1),(20,45466340,9,4800000,2),(21,45466340,10,14000000,2),(22,45466341,1484425983254,888888888,1),(23,45466341,6,6000000,1);
/*!40000 ALTER TABLE `bill_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Sofa'),(2,'Bàn ăn'),(3,'Ghế tựa'),(5,'test tét65');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_price` double DEFAULT NULL,
  `product_description` text CHARACTER SET utf8,
  `product_quantity` int(11) DEFAULT NULL,
  `product_provider` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_buy` double DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1484425983255 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,1,'Sofa dài hiện đại','/resources/images/anh2.jpg',9000000,'                                                                      Sofa giường là một mẫu sofa đa năng, vừa làm chức năng một bộ ghế sofa đẹp cho phòng khách nhưng cũng đồng thời có thể trở thành một chiếc giường êm ái.\nSofa giường mã S29 đa năng và cao cấp. \nChiếc ghế sofa giường này có chức năng 2 trong 1, chỉ cần thao tác đơn giản kéo nhẹ nhàng bạn có thể biến chiếc sofa này thành chiếc giường đôi rộng rãi. \nĐược bọc bằng chất liệu da Nhật cao cấp và sử dụng đệm K40 nên bạn có thể hoàn toàn yên tâm tận hưởng những giấc ngủ sâu trên chiếc ghế này.\n                                \n                                ',24,'test',5000000),(3,1,'Sofa đôi da','/resources/images/anh3.jpg',12000000,'Sofa giường là một mẫu sofa đa năng, vừa làm chức năng một bộ ghế sofa đẹp cho phòng khách nhưng cũng đồng thời có thể trở thành một chiếc giường êm ái.\r\nSofa giường mã S29 đa năng và cao cấp. \r\nChiếc ghế sofa giường này có chức năng 2 trong 1, chỉ cần thao tác đơn giản kéo nhẹ nhàng bạn có thể biến chiếc sofa này thành chiếc giường đôi rộng rãi. \r\nĐược bọc bằng chất liệu da Nhật cao cấp và sử dụng đệm K40 nên bạn có thể hoàn toàn yên tâm tận hưởng những giấc ngủ sâu trên chiếc ghế này.',5,NULL,90000),(4,1,'Giường ngủ sang cổ điển','/resources/images/anh4.jpg',7000000,'Sofa giường là một mẫu sofa đa năng, vừa làm chức năng một bộ ghế sofa đẹp cho phòng khách nhưng cũng đồng thời có thể trở thành một chiếc giường êm ái.\r\nSofa giường mã S29 đa năng và cao cấp. \r\nChiếc ghế sofa giường này có chức năng 2 trong 1, chỉ cần thao tác đơn giản kéo nhẹ nhàng bạn có thể biến chiếc sofa này thành chiếc giường đôi rộng rãi. \r\nĐược bọc bằng chất liệu da Nhật cao cấp và sử dụng đệm K40 nên bạn có thể hoàn toàn yên tâm tận hưởng những giấc ngủ sâu trên chiếc ghế này.',8,NULL,90000),(5,1,'Sofa phòng khách AX','/resources/images/anh5.jpg',11000000,'Sofa giường là một mẫu sofa đa năng, vừa làm chức năng một bộ ghế sofa đẹp cho phòng khách nhưng cũng đồng thời có thể trở thành một chiếc giường êm ái.\r\nSofa giường mã S29 đa năng và cao cấp. \r\nChiếc ghế sofa giường này có chức năng 2 trong 1, chỉ cần thao tác đơn giản kéo nhẹ nhàng bạn có thể biến chiếc sofa này thành chiếc giường đôi rộng rãi. \r\nĐược bọc bằng chất liệu da Nhật cao cấp và sử dụng đệm K40 nên bạn có thể hoàn toàn yên tâm tận hưởng những giấc ngủ sâu trên chiếc ghế này.',9,NULL,90000),(6,1,'Sofa VIETHOMECODER DO','/resources/images/sofa-viethomecoder-do.png',6000000,'Sofa giường là một mẫu sofa đa năng, vừa làm chức năng một bộ ghế sofa đẹp cho phòng khách nhưng cũng đồng thời có thể trở thành một chiếc giường êm ái.\r\nSofa giường mã S29 đa năng và cao cấp. \r\nChiếc ghế sofa giường này có chức năng 2 trong 1, chỉ cần thao tác đơn giản kéo nhẹ nhàng bạn có thể biến chiếc sofa này thành chiếc giường đôi rộng rãi. \r\nĐược bọc bằng chất liệu da Nhật cao cấp và sử dụng đệm K40 nên bạn có thể hoàn toàn yên tâm tận hưởng những giấc ngủ sâu trên chiếc ghế này.',8,NULL,90000),(7,1,'Sofa giường đẹp hiện đại','/resources/images/sofa-giuong-dep-hiendai1.jpg',8000000,'Sofa giường là một mẫu sofa đa năng, vừa làm chức năng một bộ ghế sofa đẹp cho phòng khách nhưng cũng đồng thời có thể trở thành một chiếc giường êm ái.\r\nSofa giường mã S29 đa năng và cao cấp. \r\nChiếc ghế sofa giường này có chức năng 2 trong 1, chỉ cần thao tác đơn giản kéo nhẹ nhàng bạn có thể biến chiếc sofa này thành chiếc giường đôi rộng rãi. \r\nĐược bọc bằng chất liệu da Nhật cao cấp và sử dụng đệm K40 nên bạn có thể hoàn toàn yên tâm tận hưởng những giấc ngủ sâu trên chiếc ghế này.',9,NULL,90000),(8,2,'Bàn ăn 6 ghế','/resources/images/ban-an-6-ghe.jpg',3500000,'Bàn ăn chính là đồ dùng quan trọng nhất trong nội thất nhà bếp. Nguyên liệu gỗ tự nhiên xoan đào. Bền đẹp với thời gian, dễ dàng vệ sinh và làm mới sau thời gian dài sử dụng.\r\nChất liệu: gỗ xoan đào. Màu sắc: màu trắng. Thiết kế sang trọng',9,NULL,90000),(9,2,'Bàn ăn tròn ZIMBA','/resources/images/ban-an-tron-zimba.jpg',4800000,'Bàn ăn chính là đồ dùng quan trọng nhất trong nội thất nhà bếp. Nguyên liệu gỗ tự nhiên xoan đào. Bền đẹp với thời gian, dễ dàng vệ sinh và làm mới sau thời gian dài sử dụng.\r\nChất liệu: gỗ xoan đào. Màu sắc: màu trắng. Thiết kế sang trọng',9,NULL,90000),(10,2,'Bàn ăn ZALO VIETHOMEDECOR','/resources/images/bo-ban-an-zalo-viethomedecor.jpg',14000000,'Bàn ăn chính là đồ dùng quan trọng nhất trong nội thất nhà bếp. Nguyên liệu gỗ tự nhiên xoan đào. Bền đẹp với thời gian, dễ dàng vệ sinh và làm mới sau thời gian dài sử dụng.\r\nChất liệu: gỗ xoan đào. Màu sắc: màu trắng. Thiết kế sang trọng',9,NULL,90000),(11,2,'Bàn ăn Cafe tròn gỗ Venner','/resources/images/ban-cafe-tron-go-veneer1.jpg',5000000,'Bàn ăn chính là đồ dùng quan trọng nhất trong nội thất nhà bếp. Nguyên liệu gỗ tự nhiên xoan đào. Bền đẹp với thời gian, dễ dàng vệ sinh và làm mới sau thời gian dài sử dụng.\r\nChất liệu: gỗ xoan đào. Màu sắc: màu trắng. Thiết kế sang trọng',9,NULL,90000),(12,2,'Bàn ăn MUMBAI','/resources/images/bo-ban-an-mumbai.jpg',7000000,'Bàn ăn chính là đồ dùng quan trọng nhất trong nội thất nhà bếp. Nguyên liệu gỗ tự nhiên xoan đào. Bền đẹp với thời gian, dễ dàng vệ sinh và làm mới sau thời gian dài sử dụng.\r\nChất liệu: gỗ xoan đào. Màu sắc: màu trắng. Thiết kế sang trọng',9,NULL,90000),(14,3,'Ghế đôn vuông Bella Sofa','/resources/images/ghe-donvuong-bellasofa.png',3500000,'Mẫu ghế sofa đơn đẹp ấn tượng. Sofa đơn mã 069 sẽ giúp bạn tạo nên nét tươi mới, quý phái cho không gian phòng khách của bạn trong những ngày xuân ấm áp này. \r\nKhung gỗ : tự nhiên cao cấp. Chân ghế : tự chọn ( chân inox - chân gỗ). Đệm mút : Cứng hoặc mềm - bông mút ( tùy chọn ). Kích thước sofa văng: 1800 * 800',9,NULL,90000),(15,3,'Ghế Sofa đơn đen','/resources/images/ghe-sofa-don-den.png',5000000,'Mẫu ghế sofa đơn đẹp ấn tượng. Sofa đơn mã 069 sẽ giúp bạn tạo nên nét tươi mới, quý phái cho không gian phòng khách của bạn trong những ngày xuân ấm áp này. \r\nKhung gỗ : tự nhiên cao cấp. Chân ghế : tự chọn ( chân inox - chân gỗ). Đệm mút : Cứng hoặc mềm - bông mút ( tùy chọn ). Kích thước sofa văng: 1800 * 800',9,NULL,90000),(16,3,'Ghế Sofa đơn nâu','/resources/images/ghe-sofa-don-nau.png',6000000,'Mẫu ghế sofa đơn đẹp ấn tượng. Sofa đơn mã 069 sẽ giúp bạn tạo nên nét tươi mới, quý phái cho không gian phòng khách của bạn trong những ngày xuân ấm áp này. \r\nKhung gỗ : tự nhiên cao cấp. Chân ghế : tự chọn ( chân inox - chân gỗ). Đệm mút : Cứng hoặc mềm - bông mút ( tùy chọn ). Kích thước sofa văng: 1800 * 800',9,NULL,90000),(17,3,'Ghế thư giãn bập bênh','/resources/images/ghe-thugian-bapbenh.png',8000000,'Mẫu ghế sofa đơn đẹp ấn tượng. Sofa đơn mã 069 sẽ giúp bạn tạo nên nét tươi mới, quý phái cho không gian phòng khách của bạn trong những ngày xuân ấm áp này. \r\nKhung gỗ : tự nhiên cao cấp. Chân ghế : tự chọn ( chân inox - chân gỗ). Đệm mút : Cứng hoặc mềm - bông mút ( tùy chọn ). Kích thước sofa văng: 1800 * 800',9,NULL,90000),(18,1,'Sofa văng','/resources/images/sofa-vang.jpg',3400000,'Sofa giường là một mẫu sofa đa năng, vừa làm chức năng một bộ ghế sofa đẹp cho phòng khách nhưng cũng đồng thời có thể trở thành một chiếc giường êm ái.\r\nSofa giường mã S29 đa năng và cao cấp. \r\nChiếc ghế sofa giường này có chức năng 2 trong 1, chỉ cần thao tác đơn giản kéo nhẹ nhàng bạn có thể biến chiếc sofa này thành chiếc giường đôi rộng rãi. \r\nĐược bọc bằng chất liệu da Nhật cao cấp và sử dụng đệm K40 nên bạn có thể hoàn toàn yên tâm tận hưởng những giấc ngủ sâu trên chiếc ghế này.',9,NULL,90000),(19,1,'Sofa cao cấp KLOSSO','/resources/images/sofa-cao-cap-klosso.jpg',9000000,'Sofa giường là một mẫu sofa đa năng, vừa làm chức năng một bộ ghế sofa đẹp cho phòng khách nhưng cũng đồng thời có thể trở thành một chiếc giường êm ái.\r\nSofa giường mã S29 đa năng và cao cấp. \r\nChiếc ghế sofa giường này có chức năng 2 trong 1, chỉ cần thao tác đơn giản kéo nhẹ nhàng bạn có thể biến chiếc sofa này thành chiếc giường đôi rộng rãi. \r\nĐược bọc bằng chất liệu da Nhật cao cấp và sử dụng đệm K40 nên bạn có thể hoàn toàn yên tâm tận hưởng những giấc ngủ sâu trên chiếc ghế này.',9,NULL,90000),(1484425978795,0,'huhuhu','/resources/images/ghe-sofa-don-nau.png',9000000,'<p>Sofa giường l&agrave; một mẫu sofa đa năng, vừa l&agrave;m chức năng một bộ ghế sofa đẹp cho ph&ograve;ng kh&aacute;ch nhưng cũng đồng thời c&oacute; thể trở th&agrave;nh một chiếc giường &ecirc;m &aacute;i.Sofa giường m&atilde; S29 đa năng v&agrave; cao cấp. Chiếc ghế sofa giường n&agrave;y c&oacute; chức năng 2 trong 1, chỉ cần thao t&aacute;c đơn giản k&eacute;o nhẹ nh&agrave;ng bạn c&oacute; thể biến chiếc sofa n&agrave;y th&agrave;nh chiếc giường đ&ocirc;i rộng r&atilde;i. Được bọc bằng chất liệu da Nhật cao cấp v&agrave; sử dụng đệm K40 n&ecirc;n bạn c&oacute; thể ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m tận hưởng những giấc ngủ s&acirc;u tr&ecirc;n chiếc ghế n&agrave;y.</p>\r\n\r\n<p><canvas :netbeans_generated=\"true\" height=\"300\" id=\"netbeans_glasspane\" style=\"position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;\" width=\"500\"></canvas></p>\r\n',9,NULL,90000),(1484425983253,0,'huhuhu','/resources/images/ghe-sofa-don-nau.png',9000000,'<p>Sofa giường l&agrave; một mẫu sofa đa năng, vừa l&agrave;m chức năng một bộ ghế sofa đẹp cho ph&ograve;ng kh&aacute;ch nhưng cũng đồng thời c&oacute; thể trở th&agrave;nh một chiếc giường &ecirc;m &aacute;i.Sofa giường m&atilde; S29 đa năng v&agrave; cao cấp. Chiếc ghế sofa giường n&agrave;y c&oacute; chức năng 2 trong 1, chỉ cần thao t&aacute;c đơn giản k&eacute;o nhẹ nh&agrave;ng bạn c&oacute; thể biến chiếc sofa n&agrave;y th&agrave;nh chiếc giường đ&ocirc;i rộng r&atilde;i. Được bọc bằng chất liệu da Nhật cao cấp v&agrave; sử dụng đệm K40 n&ecirc;n bạn c&oacute; thể ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m tận hưởng những giấc ngủ s&acirc;u tr&ecirc;n chiếc ghế n&agrave;y.</p>\r\n\r\n<p><canvas :netbeans_generated=\"true\" height=\"300\" id=\"netbeans_glasspane\" style=\"position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;\" width=\"500\"></canvas></p>\r\n',9,NULL,90000),(1484425983254,2,'test234','/resources/images/ban-an-6-ghe.jpg',888888888,'sdffffffffffffffffffffffffffffffffffdfsdf',22,'testsd',44444444);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup` (
  `usergroup_id` int(11) NOT NULL,
  `usergroup_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`usergroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup`
--

LOCK TABLES `usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
INSERT INTO `usergroup` VALUES (1,'customer'),(2,'admin');
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) DEFAULT NULL,
  `user_pass` varchar(255) DEFAULT NULL,
  `user_role` bit(1) NOT NULL,
  `usergroup_id` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user@email.com','123456',_binary '\0',1,NULL),(2,'admin@email.com','123456',_binary '\0',2,NULL),(3,'user1@email.com','123123',_binary '\0',1,'01652335156'),(4,'user2@email.com','123123',_binary '\0',1,'123121212');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-13  9:16:15
