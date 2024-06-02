CREATE DATABASE  IF NOT EXISTS `littlelemondb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `littlelemondb`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `BookingDate` date DEFAULT NULL,
  `TableNumber` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `EmployeeID` int DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `staff_id_fk_idx` (`EmployeeID`),
  KEY `customer_id_fk_idx` (`CustomerID`),
  CONSTRAINT `customerid_fk` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff_id_fk` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2020-01-15',3,3,1),(2,'2020-08-25',1,4,2),(3,'2021-08-17',1,1,3),(4,'2021-08-14',4,2,4),(5,'2020-12-20',6,6,6),(6,'2020-03-01',5,5,5);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(200) DEFAULT NULL,
  `ContactNumber` int DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Vanessa McCarthy',111111),(2,'Marcos Romero',222222),(3,'Anna Iversen',333333),(4,'Joakim Iversen',444444),(5,'Diana Pinto',555555),(6,'Hiroki Yamane',666666);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `Role` varchar(100) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Contact_Number` int DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Annual_Salary` int DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Mario Gollini','Manager','724, Parsley Lane, Old Town, Chicago, IL',351258074,'Mario.g@littlelemon.com',70000),(2,'Adrian Gollini','Assistant Manager','334, Dill Square, Lincoln Park, Chicago, IL',351474048,'Adrian.g@littlelemon.com',65000),(3,'Giorgos Dioudis','Head Chef','879 Sage Street, West Loop, Chicago, IL',351970582,'Giorgos.d@littlelemon.com',50000),(4,'Fatma Kaya','Assistant Chef','132  Bay Lane, Chicago, IL',351963569,'Fatma.k@littlelemon.com',45000),(5,'Elena Salvai','Head Waiter','989 Thyme Square, EdgeWater, Chicago, IL',351074198,'Elena.s@littlelemon.com',40000),(6,'John Millar','Receptionist','245 Dill Square, Lincoln Park, Chicago, IL',351584508,'John.m@littlelemon.com',35000);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitems` (
  `MenuItemsID` int NOT NULL,
  `CourseName` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `Price` int DEFAULT NULL,
  PRIMARY KEY (`MenuItemsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitems`
--

LOCK TABLES `menuitems` WRITE;
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
INSERT INTO `menuitems` VALUES (1,'Olives','Starters',5),(2,'Flatbread','Starters',5),(3,'Minestrone','Starters',8),(4,'Tomato bread','Starters',8),(5,'Falafel','Starters',7),(6,'Hummus','Starters',5),(7,'Kabasa','Main Courses',17),(8,'Greek salad','Main Courses',15),(9,'Bean soup','Main Courses',12),(10,'Pizza','Main Courses',15),(11,'Greek yoghurt','Desserts',7),(12,'Ice cream','Desserts',6),(13,'Cheesecake','Desserts',4),(14,'Athens White wine','Drinks',25),(15,'Corfu Red Wine','Drinks',30),(16,'Turkish Coffee','Drinks',10);
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `MenuID` int NOT NULL,
  `MenuItemsID` int DEFAULT NULL,
  `Cuisine` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MenuID`),
  KEY `menu_items_id_fk_idx` (`MenuItemsID`),
  CONSTRAINT `menu_items_id_fk` FOREIGN KEY (`MenuItemsID`) REFERENCES `menuitems` (`MenuItemsID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,1,'Greek'),(2,7,'Greek'),(3,10,'Greek'),(4,13,'Greek'),(5,3,'Italian'),(6,9,'Italian'),(7,12,'Italian'),(8,15,'Italian'),(9,5,'Turkish'),(11,11,'Turkish'),(12,16,'Turkish');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `MenuID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `TotalCost` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `menuid_fk_idx` (`MenuID`),
  KEY `customer_id_fk_idx` (`CustomerID`),
  CONSTRAINT `customer_id_fk` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_id_fk` FOREIGN KEY (`MenuID`) REFERENCES `menus` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,3,6,250),(2,2,4,5,200),(3,2,1,3,100),(4,3,2,4,150),(5,1,6,2,90),(6,4,5,1,60);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-02 12:17:33
