-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2018 at 09:56 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `etutoringdb`
--

-- --------------------------------------------------------
CREATE DATABASE eTutoringDB;

USE eTutoringDB;
--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `userID` tinyint(255) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`userID`, `userName`, `password`) VALUES
(2, 'Sarah1', '25d55ad283aa400af464c76d713c07ad');

-- --------------------------------------------------------

--
-- Table structure for table `assign`
--

CREATE TABLE `assign` (
  `assignID` tinyint(255) NOT NULL,
  `tutorID` tinyint(255) NOT NULL,
  `studentID` tinyint(255) NOT NULL,
  `adminID` tinyint(255) NOT NULL,
  `assignmentDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentID` tinyint(255) NOT NULL,
  `document` tinyint(255) NOT NULL,
  `commentDetails` varchar(255) NOT NULL,
  `madeBy` tinyint(255) NOT NULL,
  `commentDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `courseID` tinyint(255) NOT NULL,
  `courseName` tinyint(255) NOT NULL,
  `taughtBy` tinyint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `documentID` tinyint(255) NOT NULL,
  `documentName` varchar(255) NOT NULL,
  `documentDescription` varchar(255) NOT NULL,
  `documentType` varchar(255) NOT NULL,
  `uploadedBy` tinyint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE `meeting` (
  `meetingID` tinyint(255) NOT NULL,
  `meetingHost` tinyint(255) NOT NULL,
  `meetingAttendee` tinyint(255) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `messageID` tinyint(255) NOT NULL,
  `parentID` tinyint(255) NOT NULL,
  `sender` tinyint(255) NOT NULL,
  `recipient` tinyint(255) NOT NULL,
  `contentDetails` varchar(255) NOT NULL,
  `dateOfMessages` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `positionId` tinyint(255) NOT NULL,
  `positionName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`positionId`, `positionName`) VALUES
(1, 'Administrator'),
(2, 'Student'),
(3, 'Tutor');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `userID` tinyint(255) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`userID`, `userName`, `password`) VALUES
(4, 'Peterq', '25d55ad283aa400af464c76d713c07ad');

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE `tutor` (
  `userID` tinyint(255) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tutor`
--

INSERT INTO `tutor` (`userID`, `userName`, `password`) VALUES
(5, 'jane85', '25d55ad283aa400af464c76d713c07ad'),
(3, 'stephine1', '25d55ad283aa400af464c76d713c07ad');

-- --------------------------------------------------------

--
-- Table structure for table `useraccount`
--

CREATE TABLE `useraccount` (
  `userID` tinyint(255) NOT NULL,
  `position` tinyint(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `useraccount`
--

INSERT INTO `useraccount` (`userID`, `position`, `firstName`, `lastName`, `gender`, `email`, `dateOfBirth`, `address`, `phoneNumber`) VALUES
(2, 1, 'Sarah', 'Jhonson', 'Female', 'sj@gmail.com', '1980-01-19', '#33 blue street', '3217654'),
(3, 3, 'Stephine', 'Ramdass', 'Female', 'sr@gmail.com', '1987-09-09', '#54 white street', '7755577'),
(4, 2, 'Peter', 'Quill', 'Male', 'realstarlord@gmail.com', '1997-04-02', '#67 galaxy road', '3466532'),
(5, 3, 'Jane', 'Walker', 'Female', 'jw@gmail.com', '1985-10-12', '#112 White Hart lane', '7868821');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`userName`),
  ADD UNIQUE KEY `userID` (`userID`),
  ADD UNIQUE KEY `userName` (`userName`);

--
-- Indexes for table `assign`
--
ALTER TABLE `assign`
  ADD PRIMARY KEY (`assignID`),
  ADD KEY `tutorID` (`tutorID`),
  ADD KEY `studentID` (`studentID`),
  ADD KEY `adminID` (`adminID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`),
  ADD UNIQUE KEY `commentID` (`commentID`),
  ADD KEY `madeBy` (`madeBy`),
  ADD KEY `document` (`document`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`courseID`),
  ADD KEY `taughtBy` (`taughtBy`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`documentID`),
  ADD UNIQUE KEY `documentID` (`documentID`),
  ADD KEY `uploadedBy` (`uploadedBy`);

--
-- Indexes for table `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`meetingID`),
  ADD UNIQUE KEY `meetingID` (`meetingID`),
  ADD KEY `meetingHost` (`meetingHost`),
  ADD KEY `meetingAttendee` (`meetingAttendee`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`messageID`),
  ADD UNIQUE KEY `messageID` (`messageID`),
  ADD KEY `sender` (`sender`),
  ADD KEY `recipient` (`recipient`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`positionId`),
  ADD UNIQUE KEY `positionId` (`positionId`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`userName`),
  ADD UNIQUE KEY `userID` (`userID`),
  ADD UNIQUE KEY `userName` (`userName`);

--
-- Indexes for table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`userName`),
  ADD UNIQUE KEY `userID` (`userID`),
  ADD UNIQUE KEY `userName` (`userName`);

--
-- Indexes for table `useraccount`
--
ALTER TABLE `useraccount`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `position` (`position`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assign`
--
ALTER TABLE `assign`
  MODIFY `assignID` tinyint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentID` tinyint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `courseID` tinyint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `documentID` tinyint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `meeting`
--
ALTER TABLE `meeting`
  MODIFY `meetingID` tinyint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `messageID` tinyint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `positionId` tinyint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `useraccount`
--
ALTER TABLE `useraccount`
  MODIFY `userID` tinyint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `useraccount` (`userID`);

--
-- Constraints for table `assign`
--
ALTER TABLE `assign`
  ADD CONSTRAINT `assign_ibfk_1` FOREIGN KEY (`tutorID`) REFERENCES `tutor` (`userID`),
  ADD CONSTRAINT `assign_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`userID`),
  ADD CONSTRAINT `assign_ibfk_3` FOREIGN KEY (`adminID`) REFERENCES `administrator` (`userID`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`madeBy`) REFERENCES `useraccount` (`userID`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`document`) REFERENCES `documents` (`documentID`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`taughtBy`) REFERENCES `tutor` (`userID`);

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`uploadedBy`) REFERENCES `useraccount` (`userID`);

--
-- Constraints for table `meeting`
--
ALTER TABLE `meeting`
  ADD CONSTRAINT `meeting_ibfk_1` FOREIGN KEY (`meetingHost`) REFERENCES `tutor` (`userID`),
  ADD CONSTRAINT `meeting_ibfk_2` FOREIGN KEY (`meetingAttendee`) REFERENCES `student` (`userID`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `useraccount` (`userID`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `useraccount` (`userID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `useraccount` (`userID`);

--
-- Constraints for table `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `tutor_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `useraccount` (`userID`);

--
-- Constraints for table `useraccount`
--
ALTER TABLE `useraccount`
  ADD CONSTRAINT `useraccount_ibfk_1` FOREIGN KEY (`position`) REFERENCES `position` (`positionId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;