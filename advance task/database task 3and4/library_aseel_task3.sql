-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2024 at 11:43 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_aseel_task3`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `BookID` int(11) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `AuthorID` int(11) DEFAULT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  `Price` decimal(5,2) DEFAULT NULL,
  `PublicationDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`BookID`, `Title`, `AuthorID`, `Genre`, `Price`, `PublicationDate`) VALUES
(101, 'Book A', 1, 'Fiction', 10.99, '2022-01-01'),
(102, 'Book B', 2, 'Non-Fiction', 12.99, '2021-02-01'),
(103, 'Book C', 3, 'Science Fiction', 8.99, '2020-03-01'),
(104, 'Book D', 4, 'Mystery', 15.99, '2019-04-01'),
(105, 'Book E', 1, 'Romance', 9.99, '2018-05-01'),
(106, 'Book F', 2, 'Fiction', 7.99, '2023-06-01'),
(107, 'Book G', 3, 'Thriller', 6.99, '2022-07-01'),
(108, 'Book H', 4, 'Fantasy', 11.99, '2023-08-01'),
(109, 'Book I', 1, 'Fiction', 14.99, '2021-09-01'),
(110, 'Book J', 2, 'Non-Fiction', 13.99, '2020-10-01'),
(111, 'Book K', 3, 'Science Fiction', 9.49, '2022-11-01'),
(112, 'Book L', 4, 'Mystery', 16.99, '2019-12-01');

-- --------------------------------------------------------

--
-- Table structure for table `borrowedbooks`
--

CREATE TABLE `borrowedbooks` (
  `BorrowID` int(11) NOT NULL,
  `BookID` int(11) DEFAULT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `BorrowDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowedbooks`
--

INSERT INTO `borrowedbooks` (`BorrowID`, `BookID`, `MemberID`, `BorrowDate`, `ReturnDate`) VALUES
(1, 101, 2, '2023-02-11', '2023-02-18'),
(2, 102, 2, '2023-02-20', '2023-02-27'),
(3, 103, 2, '2023-03-05', '2023-03-12'),
(4, 104, 3, '2023-03-13', '2023-03-20'),
(5, 105, 3, '2023-03-06', '2023-03-13'),
(6, 106, 3, '2023-03-20', '2023-03-27'),
(7, 107, 2, '2023-04-13', '2023-04-20'),
(8, 108, 2, '2023-04-25', '2023-05-02'),
(9, 109, 1, '2023-05-10', '2023-05-17'),
(10, 110, 4, '2023-05-20', '2023-05-27'),
(11, 111, 4, '2023-06-01', '2023-06-08'),
(12, 112, 5, '2023-06-22', '2023-06-29');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `MemberID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `JoinDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`MemberID`, `FirstName`, `LastName`, `Email`, `JoinDate`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '2022-12-15'),
(2, 'Jane', 'Smith', 'jane.smith@library.com', '2023-02-10'),
(3, 'Emily', 'Johnson', 'emily.j@example.com', '2023-03-05'),
(4, 'Michael', 'Brown', 'michael.b@library.com', '2023-04-12'),
(5, 'Sarah', 'Davis', 'sarah.d@example.com', '2023-06-21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`BookID`);

--
-- Indexes for table `borrowedbooks`
--
ALTER TABLE `borrowedbooks`
  ADD PRIMARY KEY (`BorrowID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`MemberID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrowedbooks`
--
ALTER TABLE `borrowedbooks`
  ADD CONSTRAINT `borrowedbooks_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
