-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2020 at 05:36 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthcaredb`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointmentdetails`
--

CREATE TABLE `appointmentdetails` (
  `aID` int(5) NOT NULL,
  `patientId` char(10) NOT NULL,
  `doctorName` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patientdetails`
--

CREATE TABLE `patientdetails` (
  `id` int(11) NOT NULL,
  `patientID` char(10) NOT NULL,
  `firstName` char(50) NOT NULL,
  `email` char(200) NOT NULL,
  `sex` char(10) NOT NULL,
  `dob` varchar(11) NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `contactNumber` int(10) NOT NULL,
  `maritalStatus` char(10) NOT NULL,
  `streetAddL1` char(50) NOT NULL,
  `postalCode` int(10) NOT NULL,
  `password` char(20) NOT NULL,
  `emergencyCNanme` char(50) DEFAULT NULL,
  `emergencyCrelationship` char(20) DEFAULT NULL,
  `emergencynumber` int(10) DEFAULT NULL,
  `takeMedication` varchar(3) DEFAULT NULL,
  `currentMedication` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patientdetails`
--

INSERT INTO `patientdetails` (`id`, `patientID`, `firstName`, `email`, `sex`, `dob`, `height`, `weight`, `contactNumber`, `maritalStatus`, `streetAddL1`, `postalCode`, `password`, `emergencyCNanme`, `emergencyCrelationship`, `emergencynumber`, `takeMedication`, `currentMedication`) VALUES
(34, '978767556V', 'Hasith Pramodya', 'hasith@gmail.com', 'Male', '1997-06-10', 74, 5.7, 717659868, 'Single', 'Kaluthara South', 12000, 'hasith@jj', 'Nandana', 'Father', 754565666, 'No', ''),
(35, '94678766V', 'Janith Prasad', 'prasad@yahoo.com', 'Male', '1996-06-16', 56, 5.6, 118767878, 'Married', 'No:180, Ragama', 18500, 'hhhhh@123', 'Pubudu', 'Brother', 765678956, 'Yes', 'Leg pain'),
(36, '200016995V', 'Vihara Wijesinghe', 'vihara@gmail.com', 'Female', '2000-06-14', 46, 4.6, 770986578, 'Single', 'Flower Road, Colombo 04', 14000, 'vihara@78', 'Sandeepa', 'Mother', 118767826, 'Yes', 'Eye paining '),
(43, '3232', 'Pramodya', 'hasithpromodyahettirachchi@40yahoo.com', 'Male', '2020-05-03', 21, 22, 719877878, 'Married', 'sasc', 10115, 'sa', 'as', 'asda', 123121, 'Yes', 'sca');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptionpad`
--

CREATE TABLE `prescriptionpad` (
  `padID` int(10) NOT NULL,
  `patientId` char(10) NOT NULL,
  `aID` int(5) NOT NULL,
  `date` varchar(11) NOT NULL,
  `diagnosis` varchar(500) NOT NULL,
  `disabilities` varchar(200) NOT NULL,
  `surgery` varchar(100) NOT NULL,
  `bloodPressure` float(10,5) NOT NULL,
  `pulseRate` float(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointmentdetails`
--
ALTER TABLE `appointmentdetails`
  ADD PRIMARY KEY (`aID`),
  ADD KEY `patient_fk2` (`patientId`);

--
-- Indexes for table `patientdetails`
--
ALTER TABLE `patientdetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patientID` (`patientID`);

--
-- Indexes for table `prescriptionpad`
--
ALTER TABLE `prescriptionpad`
  ADD PRIMARY KEY (`padID`),
  ADD KEY `patient_fk` (`patientId`),
  ADD KEY `app_fk` (`aID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointmentdetails`
--
ALTER TABLE `appointmentdetails`
  MODIFY `aID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patientdetails`
--
ALTER TABLE `patientdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `prescriptionpad`
--
ALTER TABLE `prescriptionpad`
  MODIFY `padID` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointmentdetails`
--
ALTER TABLE `appointmentdetails`
  ADD CONSTRAINT `patient_fk2` FOREIGN KEY (`patientId`) REFERENCES `patientdetails` (`patientID`);

--
-- Constraints for table `prescriptionpad`
--
ALTER TABLE `prescriptionpad`
  ADD CONSTRAINT `app_fk` FOREIGN KEY (`aID`) REFERENCES `appointmentdetails` (`aID`),
  ADD CONSTRAINT `patient_fk` FOREIGN KEY (`patientId`) REFERENCES `patientdetails` (`patientID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
