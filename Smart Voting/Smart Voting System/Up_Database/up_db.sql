/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.27 : Database - evotingsystem
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`evotingsystem` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `evotingsystem`;

/*Table structure for table `applications` */

DROP TABLE IF EXISTS `applications`;

CREATE TABLE `applications` (
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `applications` */

insert  into `applications`(`application_id`,`candidate_id`,`status`,`description`,`date`) values (1,1,'Application Accept','requesting access','2022-04-13');

/*Table structure for table `candidates` */

DROP TABLE IF EXISTS `candidates`;

CREATE TABLE `candidates` (
  `candidate_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) NOT NULL,
  `logo_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `photo` varchar(500) NOT NULL,
  PRIMARY KEY (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `candidates` */

insert  into `candidates`(`candidate_id`,`login_id`,`logo_id`,`category_id`,`fname`,`lname`,`gender`,`address`,`place`,`email`,`phone`,`photo`) values (1,2,1,1,'Bency','Baby','female','Techwingsys                       \r\n              ','ekm','bency@gmail.com','1234567890','static/uploads/a7551a35-2a49-423c-b31a-1216e855122cIMG_20220403_222228_475.jpg');

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `categories` */

insert  into `categories`(`category_id`,`cat_name`,`description`) values (1,'Chairman','rep');

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `solution` varchar(50) NOT NULL,
  `complaint_date` datetime NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `complaints` */

/*Table structure for table `election` */

DROP TABLE IF EXISTS `election`;

CREATE TABLE `election` (
  `election_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `election_date` date NOT NULL,
  `voting_status` varchar(50) NOT NULL,
  PRIMARY KEY (`election_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `election` */

insert  into `election`(`election_id`,`category_id`,`title`,`election_date`,`voting_status`) values (1,1,'College Election','2022-04-13','pending');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `usertype` varchar(50) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values (1,'admin','admin','admin'),(2,'bency','bency','Candidate'),(3,'lidhiya','lidhiya','teacher'),(4,'arjun','arjun','user');

/*Table structure for table `logo` */

DROP TABLE IF EXISTS `logo`;

CREATE TABLE `logo` (
  `logo_id` int(11) NOT NULL AUTO_INCREMENT,
  `logo_name` varchar(50) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`logo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `logo` */

insert  into `logo`(`logo_id`,`logo_name`,`image`) values (1,'Revivel','static/uploads/b22a529a-2758-4eae-a636-43f587ce9ef7IMG_20220403_222228_475.jpg');

/*Table structure for table `result` */

DROP TABLE IF EXISTS `result`;

CREATE TABLE `result` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `number_of_votes` varchar(50) NOT NULL,
  PRIMARY KEY (`result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `result` */

/*Table structure for table `rules` */

DROP TABLE IF EXISTS `rules`;

CREATE TABLE `rules` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `rules` varchar(500) NOT NULL,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `rules` */

insert  into `rules`(`rule_id`,`title`,`rules`) values (1,'college','election\r\n');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `teacherid_No` varchar(50) NOT NULL,
  `photos` varchar(500) NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `teacher` */

insert  into `teacher`(`teacher_id`,`login_id`,`first_name`,`last_name`,`photo`,`gender`,`department`,`address`,`phone`,`email`,`teacherid_No`,`photos`) values (1,3,'lidhiya','chechi','static/uploads/a122982a-48d2-4eca-bf1d-21267a8e5771acer-predator-logo-abstract-v061.jpg','Female','cs','Techwingsys','7894561230','lidhiya@gmail.com','789456','static/uploads1/70a40393-c99c-43b8-8756-b54202f54a6casus-rog-red-logo-wallpaper.jpg');

/*Table structure for table `teacherapplication` */

DROP TABLE IF EXISTS `teacherapplication`;

CREATE TABLE `teacherapplication` (
  `teacherapplication_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `application` varchar(50) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`teacherapplication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `teacherapplication` */

insert  into `teacherapplication`(`teacherapplication_id`,`teacher_id`,`status`,`application`,`date`) values (1,1,'Application Accept','requesting access','2022-04-13');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `voterid_No` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`login_id`,`first_name`,`last_name`,`photo`,`gender`,`department`,`address`,`phone`,`email`,`voterid_No`) values (1,'4','arjun','j nair','static/uploads/81452abc-772c-4e95-852c-baf7e4b93a09IMG_20190310_183921_644__01.jpg','male','cs','alp','3214567650','ajuuu@gmail.com','047624');

/*Table structure for table `userapplication` */

DROP TABLE IF EXISTS `userapplication`;

CREATE TABLE `userapplication` (
  `userapplication_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `application` varchar(50) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`userapplication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `userapplication` */

insert  into `userapplication`(`userapplication_id`,`user_id`,`status`,`application`,`date`) values (1,1,'Application Accept','requesting access','2022-04-13');

/*Table structure for table `voting` */

DROP TABLE IF EXISTS `voting`;

CREATE TABLE `voting` (
  `voting_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`voting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `voting` */

insert  into `voting`(`voting_id`,`user_id`,`candidate_id`,`datetime`,`status`) values (1,1,1,'2022-04-13 00:00:00','yes');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
