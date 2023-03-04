-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2021 at 01:04 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab4`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(30) NOT NULL,
  `course_name` varchar(30) NOT NULL,
  `course_description` varchar(255) NOT NULL,
  `department_id` int(30) NOT NULL,
  `professor_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `course_description`, `department_id`, `professor_id`) VALUES
(1, 'database', 'learn sql and databases', 1, 1),
(2, 'operating systems', 'learn threading , mutual exculision , io mangment , disk schedualing , and vitrual memory', 1, 1),
(3, 'mechanics1', 'study of statics', 5, 3),
(4, 'mechanics2', 'study of dynamics', 5, 3),
(5, 'graph1', 'learn engineering drawing', 5, 4),
(6, 'graph2', 'contuine engineering drawing', 5, 4),
(7, 'physics1', 'learn pyshics', 5, 6),
(8, 'pyhsics2', 'contuine learning physics', 5, 7),
(9, 'math1', ' covers graphs, Systems of equations and inequalities , integration and diffentiation . and matrices', 5, 1),
(10, 'math2', 'new methods of integration and differntiaion', 5, 1),
(11, 'thermodynamics', 'study of thermodynamics which deals with the relationships between heat and other forms of energy', 2, 5),
(12, 'solid state drives', 'study and understand the operation of electric drives controlled from a power electronic\r\nconverter and to introduce the design concepts of controllers', 2, 6),
(13, 'programing 0', 'learn basics of programing', 1, 2),
(14, 'programing 1', 'learn more basics of programing', 1, 3),
(15, 'programing 2', 'learn object oriented programing', 1, 8),
(16, 'datastructures', 'learn data structures such as stacks , queues , linked lists , priority queues , trees', 1, 6),
(17, 'datastructures 2', 'learn more data structures such as red black tree ,and more search algorithms.', 1, 7),
(18, 'algorithms', 'learn divide and conquer , dynamic programing , and greedy algorithms such as huffman', 1, 8),
(19, 'analogue', 'learn modulation and demodulation of analogue signals', 1, 4),
(20, 'logic 1', 'digital logic 1', 1, 8),
(21, 'digital logic 2', 'contuine digital logic', 1, 8),
(22, 'thermodynamics 2', 'contuine learning thermodynamics', 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(30) NOT NULL,
  `department_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`) VALUES
(1, 'cce'),
(2, 'eme'),
(3, 'petro'),
(4, 'chem'),
(5, 'general'),
(6, 'arch');

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE `professor` (
  `professor_id` int(30) NOT NULL,
  `professor_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`professor_id`, `professor_name`) VALUES
(1, 'refaat'),
(2, 'riad'),
(3, 'ahmad'),
(4, 'mohamed'),
(5, 'mark'),
(6, 'ramez'),
(7, 'takla'),
(8, 'ibrahim');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `pid` (`professor_id`),
  ADD KEY `did` (`department_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`professor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `professor`
--
ALTER TABLE `professor`
  MODIFY `professor_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `did` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pid` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`professor_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
