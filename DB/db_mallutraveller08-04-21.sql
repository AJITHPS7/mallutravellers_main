# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_mallutraveller
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    4/8/2021 4:03:49 PM
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_mallutraveller'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_mallutraveller" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_mallutraveller";


#
# Table structure for table 'tbl_album'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_album" (
  "album_id" int(10) unsigned NOT NULL auto_increment,
  "album_tittle" varchar(50) NOT NULL,
  "album_date" varchar(50) default NULL,
  "rider_id" int(20) unsigned default NULL,
  PRIMARY KEY  ("album_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_album'
#

LOCK TABLES "tbl_album" WRITE;
/*!40000 ALTER TABLE "tbl_album" DISABLE KEYS;*/
REPLACE INTO "tbl_album" ("album_id", "album_tittle", "album_date", "rider_id") VALUES
	('2','sdfg','2021-04-01','3');
/*!40000 ALTER TABLE "tbl_album" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_albummedia'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_albummedia" (
  "albummedia_id" int(20) unsigned NOT NULL auto_increment,
  "album_id" int(20) NOT NULL,
  "albummedia_caption" varchar(50) NOT NULL,
  "albummedia_image" varchar(50) NOT NULL,
  PRIMARY KEY  ("albummedia_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_albummedia'
#

LOCK TABLES "tbl_albummedia" WRITE;
/*!40000 ALTER TABLE "tbl_albummedia" DISABLE KEYS;*/
REPLACE INTO "tbl_albummedia" ("albummedia_id", "album_id", "albummedia_caption", "albummedia_image") VALUES
	('1',2,'gallery','MediaImage1371.png');
/*!40000 ALTER TABLE "tbl_albummedia" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_club'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_club" (
  "club_id" int(20) unsigned NOT NULL auto_increment,
  "club_name" varchar(50) NOT NULL,
  "club_contact" varchar(50) NOT NULL,
  "club_email" varchar(50) NOT NULL,
  "club_address" varchar(50) NOT NULL,
  "district_id" int(20) NOT NULL,
  "club_logo" varchar(50) NOT NULL,
  "club_proof" varchar(50) NOT NULL,
  "club_licno" varchar(50) NOT NULL,
  "club_username" varchar(20) NOT NULL,
  "club_password" varchar(20) NOT NULL,
  "club_status" varchar(50) default '0',
  PRIMARY KEY  ("club_id")
) AUTO_INCREMENT=12;



#
# Dumping data for table 'tbl_club'
#

LOCK TABLES "tbl_club" WRITE;
/*!40000 ALTER TABLE "tbl_club" DISABLE KEYS;*/
REPLACE INTO "tbl_club" ("club_id", "club_name", "club_contact", "club_email", "club_address", "district_id", "club_logo", "club_proof", "club_licno", "club_username", "club_password", "club_status") VALUES
	('10','bullet lover','3467554','bulletlover@gmail.com','asdfvgbnm',5,'clublogo1430.png','clubproof1864.png','23','bullet lover','bullet lover','0');
REPLACE INTO "tbl_club" ("club_id", "club_name", "club_contact", "club_email", "club_address", "district_id", "club_logo", "club_proof", "club_licno", "club_username", "club_password", "club_status") VALUES
	('11','fast riders','23456789','riders3445@gmail.com','asdfgh',5,'clublogo1914.png','clubproof1464.png','678','fastriders','fastriders','0');
/*!40000 ALTER TABLE "tbl_club" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_clubgallery'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_clubgallery" (
  "clubgalary_id" int(20) unsigned NOT NULL auto_increment,
  "clubgalary_image" varchar(50) NOT NULL,
  "clubgalary_caption" varchar(50) NOT NULL,
  "clubgalary_update" varchar(50) default NULL,
  PRIMARY KEY  ("clubgalary_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_clubgallery'
#

LOCK TABLES "tbl_clubgallery" WRITE;
/*!40000 ALTER TABLE "tbl_clubgallery" DISABLE KEYS;*/
REPLACE INTO "tbl_clubgallery" ("clubgalary_id", "clubgalary_image", "clubgalary_caption", "clubgalary_update") VALUES
	('4','GalleryImage1891.png','gallery',NULL);
/*!40000 ALTER TABLE "tbl_clubgallery" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complainttype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complainttype" (
  "complainttype_id" int(50) NOT NULL auto_increment,
  "complainttype_name" varchar(500) default NULL,
  PRIMARY KEY  ("complainttype_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_complainttype'
#

LOCK TABLES "tbl_complainttype" WRITE;
/*!40000 ALTER TABLE "tbl_complainttype" DISABLE KEYS;*/
REPLACE INTO "tbl_complainttype" ("complainttype_id", "complainttype_name") VALUES
	(1,'sdffd');
REPLACE INTO "tbl_complainttype" ("complainttype_id", "complainttype_name") VALUES
	(7,'no customer service');
/*!40000 ALTER TABLE "tbl_complainttype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(20) unsigned NOT NULL auto_increment,
  "district_name" varchar(50) default NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=14;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('5','Ernakulam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('13','Kottayam');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_eventbook'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_eventbook" (
  "eventbook_id" int(10) unsigned NOT NULL auto_increment,
  "event_id" int(20) unsigned default NULL,
  "rider_id" date NOT NULL,
  "eventbook_date" int(20) unsigned default NULL,
  PRIMARY KEY  ("eventbook_id")
);



#
# Dumping data for table 'tbl_eventbook'
#

# No data found.



#
# Table structure for table 'tbl_eventgallary'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_eventgallary" (
  "eventgallery_id" int(20) unsigned NOT NULL auto_increment,
  "offroadevent_id" int(20) unsigned NOT NULL,
  "offroadevent_image" varchar(50) NOT NULL,
  "offroadevent_update" varchar(50) default NULL,
  "offroadevent_caption" varchar(50) NOT NULL,
  PRIMARY KEY  ("eventgallery_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_eventgallary'
#

LOCK TABLES "tbl_eventgallary" WRITE;
/*!40000 ALTER TABLE "tbl_eventgallary" DISABLE KEYS;*/
REPLACE INTO "tbl_eventgallary" ("eventgallery_id", "offroadevent_id", "offroadevent_image", "offroadevent_update", "offroadevent_caption") VALUES
	('2','3','EventImage1609.png','curdate()','gallery');
REPLACE INTO "tbl_eventgallary" ("eventgallery_id", "offroadevent_id", "offroadevent_image", "offroadevent_update", "offroadevent_caption") VALUES
	('3','5','EventImage1466.jpg','curdate()','gallery');
/*!40000 ALTER TABLE "tbl_eventgallary" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_eventprize'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_eventprize" (
  "eventprize_id" tinyint(3) unsigned NOT NULL auto_increment,
  "offroadevent_id" int(20) unsigned NOT NULL,
  "eventprize_position" varchar(50) NOT NULL,
  "eventprize_prize" varchar(50) NOT NULL,
  PRIMARY KEY  ("eventprize_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_eventprize'
#

LOCK TABLES "tbl_eventprize" WRITE;
/*!40000 ALTER TABLE "tbl_eventprize" DISABLE KEYS;*/
REPLACE INTO "tbl_eventprize" ("eventprize_id", "offroadevent_id", "eventprize_position", "eventprize_prize") VALUES
	(2,'3','3','499');
REPLACE INTO "tbl_eventprize" ("eventprize_id", "offroadevent_id", "eventprize_position", "eventprize_prize") VALUES
	(3,'5','1','499');
/*!40000 ALTER TABLE "tbl_eventprize" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_join'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_join" (
  "join_id" int(20) unsigned NOT NULL auto_increment,
  "riders_id" int(20) NOT NULL,
  "club_id" int(20) unsigned NOT NULL,
  "join_date" date default NULL,
  "join_status" varchar(50) NOT NULL,
  "join_riderregno" varchar(20) NOT NULL,
  "join_riderno" varchar(50) default NULL,
  "join_rejectstatus" varchar(50) NOT NULL,
  PRIMARY KEY  ("join_id")
);



#
# Dumping data for table 'tbl_join'
#

# No data found.



#
# Table structure for table 'tbl_offroadevents'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_offroadevents" (
  "offroadevent_id" int(20) unsigned NOT NULL auto_increment,
  "offroadevent_name" varchar(20) NOT NULL,
  "district_id" int(20) unsigned NOT NULL,
  "district_location1" varchar(50) NOT NULL,
  "district_location2" varchar(50) NOT NULL,
  "offroadevent_date" date NOT NULL,
  "offroadevent_rules" varchar(50) NOT NULL,
  "offroadevent_regfees" varchar(50) NOT NULL,
  "offroadevent_type" varchar(50) NOT NULL,
  "club_id" int(20) unsigned NOT NULL,
  "vehicletype_id" int(20) unsigned NOT NULL,
  PRIMARY KEY  ("offroadevent_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_offroadevents'
#

LOCK TABLES "tbl_offroadevents" WRITE;
/*!40000 ALTER TABLE "tbl_offroadevents" DISABLE KEYS;*/
REPLACE INTO "tbl_offroadevents" ("offroadevent_id", "offroadevent_name", "district_id", "district_location1", "district_location2", "offroadevent_date", "offroadevent_rules", "offroadevent_regfees", "offroadevent_type", "club_id", "vehicletype_id") VALUES
	('1','mud race','5','sdfdgfdgdggf','gdgr','2021-03-20','rules1036.png','4655','hff','0','0');
REPLACE INTO "tbl_offroadevents" ("offroadevent_id", "offroadevent_name", "district_id", "district_location1", "district_location2", "offroadevent_date", "offroadevent_rules", "offroadevent_regfees", "offroadevent_type", "club_id", "vehicletype_id") VALUES
	('2','gdtjfyk','5','sdfdgfdgdggf','gdgr','2021-03-20','rules1355.png','4655','dfsdfgh','0','0');
REPLACE INTO "tbl_offroadevents" ("offroadevent_id", "offroadevent_name", "district_id", "district_location1", "district_location2", "offroadevent_date", "offroadevent_rules", "offroadevent_regfees", "offroadevent_type", "club_id", "vehicletype_id") VALUES
	('3','ujyhtgr','5','ikujyhtgrf','likujy','2021-12-31','rules1445.png','424','4*4','10','7');
REPLACE INTO "tbl_offroadevents" ("offroadevent_id", "offroadevent_name", "district_id", "district_location1", "district_location2", "offroadevent_date", "offroadevent_rules", "offroadevent_regfees", "offroadevent_type", "club_id", "vehicletype_id") VALUES
	('4','offroad','5','lp school','sdls','2021-03-29','rules1828.png','6999','mud race','10','1');
REPLACE INTO "tbl_offroadevents" ("offroadevent_id", "offroadevent_name", "district_id", "district_location1", "district_location2", "offroadevent_date", "offroadevent_rules", "offroadevent_regfees", "offroadevent_type", "club_id", "vehicletype_id") VALUES
	('5','advanture zone','5','sffgh','cvb','2021-04-05','rules1072.png','3000','mud race','11','8');
/*!40000 ALTER TABLE "tbl_offroadevents" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(3) unsigned NOT NULL auto_increment,
  "district_id" int(20) unsigned default NULL,
  "place_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("place_id")
) AUTO_INCREMENT=11;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("place_id", "district_id", "place_name") VALUES
	('1','1','fff');
REPLACE INTO "tbl_place" ("place_id", "district_id", "place_name") VALUES
	('2','1','kothamangalam');
REPLACE INTO "tbl_place" ("place_id", "district_id", "place_name") VALUES
	('3','5','muvattupuzha');
REPLACE INTO "tbl_place" ("place_id", "district_id", "place_name") VALUES
	('4','5','perumbavoor');
REPLACE INTO "tbl_place" ("place_id", "district_id", "place_name") VALUES
	('5','12','kumbalam');
REPLACE INTO "tbl_place" ("place_id", "district_id", "place_name") VALUES
	('8','5','perumbavoor');
REPLACE INTO "tbl_place" ("place_id", "district_id", "place_name") VALUES
	('10','5','kumbalam');
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_products'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_products" (
  "product_id" int(10) unsigned NOT NULL auto_increment,
  "productsubtype_id" int(50) NOT NULL,
  "product_brand" varchar(50) NOT NULL,
  "product_rate" varchar(50) NOT NULL,
  "product_image" varchar(50) NOT NULL,
  "product_name" varchar(50) NOT NULL,
  "shop_id" int(20) unsigned NOT NULL,
  PRIMARY KEY  ("product_id")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tbl_products'
#

LOCK TABLES "tbl_products" WRITE;
/*!40000 ALTER TABLE "tbl_products" DISABLE KEYS;*/
REPLACE INTO "tbl_products" ("product_id", "productsubtype_id", "product_brand", "product_rate", "product_image", "product_name", "shop_id") VALUES
	('1',1,'hfas','csfdghgj','','basil','1');
REPLACE INTO "tbl_products" ("product_id", "productsubtype_id", "product_brand", "product_rate", "product_image", "product_name", "shop_id") VALUES
	('2',1,'hfas','csfdghgj','','tv','1');
REPLACE INTO "tbl_products" ("product_id", "productsubtype_id", "product_brand", "product_rate", "product_image", "product_name", "shop_id") VALUES
	('3',1,'addidas','1000','','addidas','1');
REPLACE INTO "tbl_products" ("product_id", "productsubtype_id", "product_brand", "product_rate", "product_image", "product_name", "shop_id") VALUES
	('4',1,'puma','full','','product','1');
REPLACE INTO "tbl_products" ("product_id", "productsubtype_id", "product_brand", "product_rate", "product_image", "product_name", "shop_id") VALUES
	('5',1,'nike','good','','ok','2');
REPLACE INTO "tbl_products" ("product_id", "productsubtype_id", "product_brand", "product_rate", "product_image", "product_name", "shop_id") VALUES
	('6',2,'puma','full','','kyuhtgfd','2');
REPLACE INTO "tbl_products" ("product_id", "productsubtype_id", "product_brand", "product_rate", "product_image", "product_name", "shop_id") VALUES
	('7',2,'ikujyhtgrfe`1','45678','productimage1901.jpg','htgrfdc','2');
REPLACE INTO "tbl_products" ("product_id", "productsubtype_id", "product_brand", "product_rate", "product_image", "product_name", "shop_id") VALUES
	('8',3,'addidas','4999','productimage1487.png','jack','2');
/*!40000 ALTER TABLE "tbl_products" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_productstock'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_productstock" (
  "productstock_id" int(10) unsigned NOT NULL auto_increment,
  "product_id" int(50) NOT NULL,
  "productstock_quantity" varchar(50) NOT NULL,
  "productstock_date" date NOT NULL,
  PRIMARY KEY  ("productstock_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_productstock'
#

LOCK TABLES "tbl_productstock" WRITE;
/*!40000 ALTER TABLE "tbl_productstock" DISABLE KEYS;*/
REPLACE INTO "tbl_productstock" ("productstock_id", "product_id", "productstock_quantity", "productstock_date") VALUES
	('2',1,'22','2021-03-31');
REPLACE INTO "tbl_productstock" ("productstock_id", "product_id", "productstock_quantity", "productstock_date") VALUES
	('3',8,'34','2021-04-05');
REPLACE INTO "tbl_productstock" ("productstock_id", "product_id", "productstock_quantity", "productstock_date") VALUES
	('4',8,'34','2021-04-05');
REPLACE INTO "tbl_productstock" ("productstock_id", "product_id", "productstock_quantity", "productstock_date") VALUES
	('5',8,'34','2021-04-05');
REPLACE INTO "tbl_productstock" ("productstock_id", "product_id", "productstock_quantity", "productstock_date") VALUES
	('6',1,'34','2021-04-07');
/*!40000 ALTER TABLE "tbl_productstock" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_productsubtype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_productsubtype" (
  "productsubtype_id" int(20) unsigned NOT NULL auto_increment,
  "producttype_id" int(10) unsigned NOT NULL,
  "productsubtype_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("productsubtype_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_productsubtype'
#

LOCK TABLES "tbl_productsubtype" WRITE;
/*!40000 ALTER TABLE "tbl_productsubtype" DISABLE KEYS;*/
REPLACE INTO "tbl_productsubtype" ("productsubtype_id", "producttype_id", "productsubtype_name") VALUES
	('1','2','sdfdgr');
REPLACE INTO "tbl_productsubtype" ("productsubtype_id", "producttype_id", "productsubtype_name") VALUES
	('3','7','jkkkf');
/*!40000 ALTER TABLE "tbl_productsubtype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_producttype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_producttype" (
  "producttype_id" int(10) unsigned NOT NULL auto_increment,
  "producttype_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("producttype_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_producttype'
#

LOCK TABLES "tbl_producttype" WRITE;
/*!40000 ALTER TABLE "tbl_producttype" DISABLE KEYS;*/
REPLACE INTO "tbl_producttype" ("producttype_id", "producttype_name") VALUES
	('2','bag');
REPLACE INTO "tbl_producttype" ("producttype_id", "producttype_name") VALUES
	('5','shirt');
REPLACE INTO "tbl_producttype" ("producttype_id", "producttype_name") VALUES
	('7','jacket');
/*!40000 ALTER TABLE "tbl_producttype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_riders'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_riders" (
  "riders_id" int(20) unsigned NOT NULL auto_increment,
  "riders_name" varchar(50) NOT NULL,
  "riders_contact" varchar(50) NOT NULL,
  "riders_email" varchar(50) NOT NULL,
  "place_id" int(20) unsigned NOT NULL,
  "riders_address" varchar(50) NOT NULL,
  "vehicletype_id" varchar(50) NOT NULL,
  "riders_vechiclename" varchar(50) NOT NULL,
  "riders_licno" varchar(50) NOT NULL,
  "riders_licproof" varchar(50) NOT NULL,
  "riders_username" varchar(50) NOT NULL,
  "riders_password" varchar(20) NOT NULL,
  PRIMARY KEY  ("riders_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_riders'
#

LOCK TABLES "tbl_riders" WRITE;
/*!40000 ALTER TABLE "tbl_riders" DISABLE KEYS;*/
REPLACE INTO "tbl_riders" ("riders_id", "riders_name", "riders_contact", "riders_email", "place_id", "riders_address", "vehicletype_id", "riders_vechiclename", "riders_licno", "riders_licproof", "riders_username", "riders_password") VALUES
	('1','uff','uftufut','yrsdtgh@trdytdcu','3','cutcuycut','1','iyvuyyuc','RiderLicence_1888.jpg','3456789','75','123');
REPLACE INTO "tbl_riders" ("riders_id", "riders_name", "riders_contact", "riders_email", "place_id", "riders_address", "vehicletype_id", "riders_vechiclename", "riders_licno", "riders_licproof", "riders_username", "riders_password") VALUES
	('2','elson vc','876543','jgdgs@gmail.com','3','fsgfdhfjgkhjl','7','ghyxtuc','RiderLicence_2087.png','23456789','va','');
REPLACE INTO "tbl_riders" ("riders_id", "riders_name", "riders_contact", "riders_email", "place_id", "riders_address", "vehicletype_id", "riders_vechiclename", "riders_licno", "riders_licproof", "riders_username", "riders_password") VALUES
	('3','elson vc','876543','jgdgs@gmail.com','4','dfdgfhgjh','7','ghyxtuc','RiderLicence_1458.png','23456789','valson','valson');
REPLACE INTO "tbl_riders" ("riders_id", "riders_name", "riders_contact", "riders_email", "place_id", "riders_address", "vehicletype_id", "riders_vechiclename", "riders_licno", "riders_licproof", "riders_username", "riders_password") VALUES
	('4','ajay','585739983','ajayps2344@gmail.com','3','padicfjvp','1','duke','RiderLicence_2029.png','354657','ajayps','ajayps');
REPLACE INTO "tbl_riders" ("riders_id", "riders_name", "riders_contact", "riders_email", "place_id", "riders_address", "vehicletype_id", "riders_vechiclename", "riders_licno", "riders_licproof", "riders_username", "riders_password") VALUES
	('5','motta','35467899','motta243@gmail.com','3','sdfghfv','1','cd delux','RiderLicence_1269.png','999999','motta','motta');
REPLACE INTO "tbl_riders" ("riders_id", "riders_name", "riders_contact", "riders_email", "place_id", "riders_address", "vehicletype_id", "riders_vechiclename", "riders_licno", "riders_licproof", "riders_username", "riders_password") VALUES
	('6','shon','8943935432','shon@gmail.com','3','sdfdgfh','1','R15 V3','RiderLicence_1972.png','346677','shon','shon');
/*!40000 ALTER TABLE "tbl_riders" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_shop'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_shop" (
  "shop_id" int(30) unsigned NOT NULL auto_increment,
  "shop_name" varchar(50) default NULL,
  "shop_contact" varchar(50) default NULL,
  "shop_email" varchar(50) default NULL,
  "shop_address" varchar(50) default NULL,
  "shop_logo" varchar(50) default NULL,
  "shop_proof" varchar(30) default NULL,
  "place_id" int(50) default NULL,
  "shop_username" varchar(30) default NULL,
  "shop_password" varchar(50) default NULL,
  "shop_status" int(50) unsigned default '0',
  "district_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("shop_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_shop'
#

LOCK TABLES "tbl_shop" WRITE;
/*!40000 ALTER TABLE "tbl_shop" DISABLE KEYS;*/
REPLACE INTO "tbl_shop" ("shop_id", "shop_name", "shop_contact", "shop_email", "shop_address", "shop_logo", "shop_proof", "place_id", "shop_username", "shop_password", "shop_status", "district_id") VALUES
	('1','bovas','3467554','bovas@gmail.com','pahshs','shoplogo1236.png','shopproof1806.png',4,'ajith','123','1','5');
REPLACE INTO "tbl_shop" ("shop_id", "shop_name", "shop_contact", "shop_email", "shop_address", "shop_logo", "shop_proof", "place_id", "shop_username", "shop_password", "shop_status", "district_id") VALUES
	('2','basil eldhose','3467554','basil1223@gmail.com','pahshs','shoplogo2103.png','shopproof1161.png',4,'basil','basil','1','5');
REPLACE INTO "tbl_shop" ("shop_id", "shop_name", "shop_contact", "shop_email", "shop_address", "shop_logo", "shop_proof", "place_id", "shop_username", "shop_password", "shop_status", "district_id") VALUES
	('3','ajith','3467554','ajithps67868@gmail.com','pahshs','shoplogo1247.png','shopproof1766.png',4,'ajith','ajith','2','5');
REPLACE INTO "tbl_shop" ("shop_id", "shop_name", "shop_contact", "shop_email", "shop_address", "shop_logo", "shop_proof", "place_id", "shop_username", "shop_password", "shop_status", "district_id") VALUES
	('4','xavi','77585','xavi@gmail.com','fgdhf','shoplogo1085.png','shopproof2005.png',9,'xavi','xavi','2','5');
REPLACE INTO "tbl_shop" ("shop_id", "shop_name", "shop_contact", "shop_email", "shop_address", "shop_logo", "shop_proof", "place_id", "shop_username", "shop_password", "shop_status", "district_id") VALUES
	('5','the bike shop','98765654','bikeshop@gmaul.com','okbfzad','shoplogo1161.png','shopproof1166.png',4,'bikeshop','bikeshop','0','5');
/*!40000 ALTER TABLE "tbl_shop" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_users'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_users" (
  "user_id" int(20) unsigned NOT NULL auto_increment,
  "user_name" varchar(50) NOT NULL,
  "user_contact" varchar(50) NOT NULL,
  "user_email" varchar(50) NOT NULL,
  "user_address" varchar(50) NOT NULL,
  "place_id" int(20) NOT NULL,
  "user_username" varchar(50) NOT NULL,
  "user_password" varchar(50) NOT NULL,
  "user_repassword" varchar(50) default NULL,
  "district_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("user_id")
) AUTO_INCREMENT=10;



#
# Dumping data for table 'tbl_users'
#

LOCK TABLES "tbl_users" WRITE;
/*!40000 ALTER TABLE "tbl_users" DISABLE KEYS;*/
REPLACE INTO "tbl_users" ("user_id", "user_name", "user_contact", "user_email", "user_address", "place_id", "user_username", "user_password", "user_repassword", "district_id") VALUES
	('1','ajith','3467554','jgdgs@gmail.com','fhdgj',4,'ajith','ajith','ajith','5');
REPLACE INTO "tbl_users" ("user_id", "user_name", "user_contact", "user_email", "user_address", "place_id", "user_username", "user_password", "user_repassword", "district_id") VALUES
	('2','ajith','3467554','jgdgs@gmail.com','fhdgj',4,'ajith','ajith','ajith','5');
REPLACE INTO "tbl_users" ("user_id", "user_name", "user_contact", "user_email", "user_address", "place_id", "user_username", "user_password", "user_repassword", "district_id") VALUES
	('3','ajith','3467554','jgdgs@gmail.com','fhdgj',4,'ajith','ajith','ajith','5');
REPLACE INTO "tbl_users" ("user_id", "user_name", "user_contact", "user_email", "user_address", "place_id", "user_username", "user_password", "user_repassword", "district_id") VALUES
	('4','bovas','3467554','jgdgs@gmail.com','vdfghdjd',4,'ggdh','ghf','ghf','5');
REPLACE INTO "tbl_users" ("user_id", "user_name", "user_contact", "user_email", "user_address", "place_id", "user_username", "user_password", "user_repassword", "district_id") VALUES
	('5','ajith','3467554','jgdgs@gmail.com','jfkd',9,'ajith','ajith','ajith','5');
REPLACE INTO "tbl_users" ("user_id", "user_name", "user_contact", "user_email", "user_address", "place_id", "user_username", "user_password", "user_repassword", "district_id") VALUES
	('6','ajith','3467554','jgdgs@gmail.com','fyfh',8,'ajith','ajith','ajith','5');
REPLACE INTO "tbl_users" ("user_id", "user_name", "user_contact", "user_email", "user_address", "place_id", "user_username", "user_password", "user_repassword", "district_id") VALUES
	('7','ajith','3467554','jgdgs@gmail.com','fyfh',8,'ajith','ajith','ajith','5');
REPLACE INTO "tbl_users" ("user_id", "user_name", "user_contact", "user_email", "user_address", "place_id", "user_username", "user_password", "user_repassword", "district_id") VALUES
	('8','bovas','3467554','jgdgs@gmail.com','jhfdjhs',3,'ajith','ajith','ajith','5');
REPLACE INTO "tbl_users" ("user_id", "user_name", "user_contact", "user_email", "user_address", "place_id", "user_username", "user_password", "user_repassword", "district_id") VALUES
	('9','anandhu','3467554','anandhu@gmail.com','perumbavoor',3,'anandhu','1234','1234','5');
/*!40000 ALTER TABLE "tbl_users" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_vehicletype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_vehicletype" (
  "vehicletype_id" int(20) unsigned NOT NULL auto_increment,
  "vehicletype_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("vehicletype_id")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tbl_vehicletype'
#

LOCK TABLES "tbl_vehicletype" WRITE;
/*!40000 ALTER TABLE "tbl_vehicletype" DISABLE KEYS;*/
REPLACE INTO "tbl_vehicletype" ("vehicletype_id", "vehicletype_name") VALUES
	('1','Bikess');
REPLACE INTO "tbl_vehicletype" ("vehicletype_id", "vehicletype_name") VALUES
	('7','splendors');
REPLACE INTO "tbl_vehicletype" ("vehicletype_id", "vehicletype_name") VALUES
	('8','two weeeler');
/*!40000 ALTER TABLE "tbl_vehicletype" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
