/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.9 : Database - smartvoting
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`smartvoting` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `smartvoting`;

/*Table structure for table `applications` */

DROP TABLE IF EXISTS `applications`;

CREATE TABLE `applications` (
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `applications` */

insert  into `applications`(`application_id`,`candidate_id`,`status`,`description`,`date`) values (1,3,'Application Accept','Application sended','2022-01-27'),(2,4,'Application Accept','Application','2022-01-28');

/*Table structure for table `candidates` */

DROP TABLE IF EXISTS `candidates`;

CREATE TABLE `candidates` (
  `candidate_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `logo_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `photo` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `candidates` */

insert  into `candidates`(`candidate_id`,`login_id`,`logo_id`,`category_id`,`fname`,`lname`,`gender`,`address`,`place`,`email`,`phone`,`photo`) values (3,5,1,1,'Bency','Baby','female','Modiyil','Alappuzha','bency@gmail.com','8978675671','static/uploads/311c9901-300c-4bb6-8e58-ca30a97da62dBency Baby.jpg'),(4,9,1,1,'Susan','Baby','female','Modiyil','Alappuzha','sus@gmail.com','8965434321','static/uploads/01d23537-12e3-46e0-bb4b-b98ae6edd861Bency Baby.jpg'),(5,12,1,1,'Blesson','Baby','male','Modiyil','Alappuzha','blesson@gmail.com','9656323075','static/uploads/f52f48fc-999f-4f0d-ab94-26c38c61ab62IMG-20200911-WA0031.jpg'),(6,13,1,1,'Anu','Elsa','female','Modiyil','Alappuzha','anu@gmail.com','8978675671','static/uploads/75607e4a-2635-4acf-b7ca-964e67997f5eIMG-20201017-WA0060.jpg'),(7,14,1,1,'Baby','Daniel','male','Modiyil Blesson Villa','Alappuzha','baby@gmail.com','9544027119','static/uploads/0e10cc78-e591-48d8-9773-9cb7b3fb76ebIMG-20200911-WA0033.jpg');

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `categories` */

insert  into `categories`(`category_id`,`cat_name`,`description`) values (1,'Category1','Election');

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `solution` varchar(50) DEFAULT NULL,
  `complaint_date` datetime DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `complaints` */

insert  into `complaints`(`complaint_id`,`id`,`description`,`solution`,`complaint_date`,`type`) values (1,2,'Hiii','Hello','2022-01-28 00:00:00','user'),(2,3,'Hey.','Hii','2022-01-28 00:00:00','candidate');

/*Table structure for table `election` */

DROP TABLE IF EXISTS `election`;

CREATE TABLE `election` (
  `election_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `election_date` date DEFAULT NULL,
  `voting_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`election_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `election` */

insert  into `election`(`election_id`,`category_id`,`title`,`election_date`,`voting_status`) values (2,1,'Title1','2022-01-27','pending');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values (1,'admin','admin','admin'),(5,'bency','bency','Candidate'),(7,'bless','bless','user'),(8,'baby','baby','user'),(9,'susan','susan','Candidate'),(10,'anu','anu','user'),(11,'libi','libi','user'),(12,'b1','b1','Candidate'),(13,'an','za','Candidate'),(14,'bb','bb','Candidate');

/*Table structure for table `logo` */

DROP TABLE IF EXISTS `logo`;

CREATE TABLE `logo` (
  `logo_id` int(11) NOT NULL AUTO_INCREMENT,
  `logo_name` varchar(50) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`logo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `logo` */

insert  into `logo`(`logo_id`,`logo_name`,`image`) values (1,'Logo1','static/uploads/1207674b-5a74-4e6e-aab6-7a52366245e4Revivel1.png');

/*Table structure for table `result` */

DROP TABLE IF EXISTS `result`;

CREATE TABLE `result` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `candidate_id` int(11) DEFAULT NULL,
  `number_of_votes` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `result` */

/*Table structure for table `rules` */

DROP TABLE IF EXISTS `rules`;

CREATE TABLE `rules` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `rules` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `rules` */

insert  into `rules`(`rule_id`,`title`,`rules`) values (1,'Rule1','1.Proper Planning');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `voterid_NO` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`login_id`,`first_name`,`last_name`,`photo`,`gender`,`address`,`phone`,`email`,`voterid_NO`) values (2,7,'Blesson','Baby','static/uploads/e53fc8cd-6c13-4440-a988-dd3d8480a667IMG-20200911-WA0033.jpg','male','Modiyil','9656323075','blesson@gmail.com','123456789'),(3,8,'Baby','Daniel','static/uploads/f29e3e3d-105c-4835-8a1f-0309e1411fefIMG-20200911-WA0033.jpg','male','Modiyil Blesson Villa','9544027119','baby@gmail.com','1234567890'),(4,10,'Anu','Elsa','static/uploads/02ba7fbe-6229-4191-a009-4040171811fbIMG-20200829-WA0013.jpeg','Female','Modiyil','8978675671','anu@gmail.com','1234567891'),(5,11,'Libin','Mathew','static/uploads/31a4b203-e851-4fbc-afcf-12f0f2f670dcIMG-20200911-WA0031.jpg','male','ABCD','9196564323','libi@gmail.com','1234567892');

/*Table structure for table `voting` */

DROP TABLE IF EXISTS `voting`;

CREATE TABLE `voting` (
  `voting_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `candidate_id` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`voting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `voting` */

insert  into `voting`(`voting_id`,`user_id`,`candidate_id`,`datetime`,`status`) values (2,2,4,'2022-01-28 00:00:00','yes'),(3,4,4,'2022-01-28 00:00:00','yes'),(4,3,3,'2022-01-28 00:00:00','yes'),(5,5,3,'2022-01-28 00:00:00','yes');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
