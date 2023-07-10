-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2020 at 09:08 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adjend`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('Mandefu', '1234'),
('Thabiso', '1234'),
('Tsepo', '1260');

-- --------------------------------------------------------

--
-- Table structure for table `assessment`
--

CREATE TABLE `assessment` (
  `Assessment_id` varchar(20) NOT NULL,
  `Assessment_type` varchar(20) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `Assessment_date` date DEFAULT NULL,
  `module_id` varchar(20) DEFAULT NULL,
  `document` blob,
  `Duration` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assessment`
--

INSERT INTO `assessment` (`Assessment_id`, `Assessment_type`, `score`, `Assessment_date`, `module_id`, `document`, `Duration`) VALUES
('34-34', 'Internal Assessment', 58, '2020-04-28', 'MO-111', 0x4c65637475726520325f323032302e706466, '3hours'),
('NEW-ASS', 'End Assessement', 80, '2020-04-29', 'MO-111', 0x4c65637475726520315f323032302e706466, '60min');

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `module_id` varchar(20) NOT NULL,
  `lecture_id` varchar(20) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `Batch_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`module_id`, `lecture_id`, `student_id`, `Batch_no`) VALUES
('MO-111', '1010', '1717038', 'BATCH02');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Course_id` varchar(20) NOT NULL,
  `Course_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Course_id`, `Course_name`) VALUES
('DJS100', 'DATA STRUCTURE'),
('OCL-12', 'ORACLE');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `password`) VALUES
(123, 'Sephapo'),
(234, 'mosito'),
(1515, '100');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `enroll_no` int(11) NOT NULL,
  `Course_id` varchar(20) DEFAULT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `enrol_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `lecture_id` varchar(20) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `Grade` varchar(4) DEFAULT NULL,
  `assessment_id` varchar(20) DEFAULT NULL,
  `module_id` varchar(20) NOT NULL,
  `comment` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`lecture_id`, `student_id`, `Grade`, `assessment_id`, `module_id`, `comment`) VALUES
('1010', '1717038', 'A*', 'NEW-ASS', 'MO-111', 'VERY GOOD');

-- --------------------------------------------------------

--
-- Table structure for table `lecture`
--

CREATE TABLE `lecture` (
  `lecture_id` varchar(20) NOT NULL,
  `lecture_name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecture`
--

INSERT INTO `lecture` (`lecture_id`, `lecture_name`, `password`, `username`) VALUES
('1010', 'Tshane', '123', '1010'),
('1238', 'sephapo', '12', 'sephapo'),
('1239', 'Teboho', '123', '1239'),
('1240', 'Katiso', '123', '1240');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `Module_id` varchar(20) NOT NULL,
  `Course_id` varchar(20) DEFAULT NULL,
  `Module_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`Module_id`, `Course_id`, `Module_name`) VALUES
('MO-111', 'DJS100', 'GRAPHS');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `note_id` varchar(20) NOT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `student_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` varchar(20) NOT NULL,
  `student_name` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `student_name`, `DOB`, `password`, `username`) VALUES
('1717038', 'moshe', '2020-04-15', '1234', '1717038'),
('1717040', 'Mosito', '2020-04-07', '123', '12222');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `assessment`
--
ALTER TABLE `assessment`
  ADD PRIMARY KEY (`Assessment_id`),
  ADD KEY `fk_module` (`module_id`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`lecture_id`,`module_id`,`student_id`),
  ADD KEY `fk_lecture_idB` (`module_id`),
  ADD KEY `fk_student_idbatch` (`student_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`enroll_no`),
  ADD KEY `fk_CourseiD` (`Course_id`),
  ADD KEY `fk_stu_id` (`student_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`lecture_id`,`student_id`),
  ADD KEY `fk_assidw` (`assessment_id`),
  ADD KEY `fk_mod_id` (`module_id`);

--
-- Indexes for table `lecture`
--
ALTER TABLE `lecture`
  ADD PRIMARY KEY (`lecture_id`),
  ADD UNIQUE KEY `uniq_username1` (`username`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`Module_id`),
  ADD KEY `fk_Course_id` (`Course_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `fk_Student_id11` (`student_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `uniq_username` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessment`
--
ALTER TABLE `assessment`
  ADD CONSTRAINT `fk_module` FOREIGN KEY (`module_id`) REFERENCES `module` (`Module_id`);

--
-- Constraints for table `batch`
--
ALTER TABLE `batch`
  ADD CONSTRAINT `fk_lecture_idB` FOREIGN KEY (`module_id`) REFERENCES `module` (`Module_id`),
  ADD CONSTRAINT `fk_lecture_idbatch` FOREIGN KEY (`lecture_id`) REFERENCES `lecture` (`lecture_id`),
  ADD CONSTRAINT `fk_student_idbatch` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `fk_CourseiD` FOREIGN KEY (`Course_id`) REFERENCES `course` (`Course_id`),
  ADD CONSTRAINT `fk_stu_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `fk_assidw` FOREIGN KEY (`assessment_id`) REFERENCES `assessment` (`Assessment_id`),
  ADD CONSTRAINT `fk_lecidass` FOREIGN KEY (`lecture_id`) REFERENCES `lecture` (`lecture_id`),
  ADD CONSTRAINT `fk_mod_id` FOREIGN KEY (`module_id`) REFERENCES `module` (`Module_id`);

--
-- Constraints for table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `fk_Course_id` FOREIGN KEY (`Course_id`) REFERENCES `course` (`Course_id`);

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `fk_Student_id11` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
