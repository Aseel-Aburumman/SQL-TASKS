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
-- Database: `library_aseel_task2`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `AuthorID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`AuthorID`, `Name`, `Country`) VALUES
(1, 'F. Scott Fitzgerald', 'USA'),
(2, 'George Orwell', 'UK'),
(3, 'Isaac Asimov', 'Russia');

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
(1, '1984', 2, 'Dystopian', 14.99, '1949-06-08'),
(2, 'Foundation', 3, 'Science Fiction', 20.99, '1951-05-15'),
(4, 'The Great Gatsby', 1, 'Fiction', 15.99, '1925-04-10');

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
(1, 1, 1, '2023-01-10', '2023-02-10'),
(2, 2, 2, '2023-01-15', '2023-02-15');

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
(1, 'John', 'Doe', 'john.doe@example.com', '2020-01-15'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2021-03-22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`AuthorID`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`BookID`),
  ADD KEY `AuthorID` (`AuthorID`);

--
-- Indexes for table `borrowedbooks`
--
ALTER TABLE `borrowedbooks`
  ADD PRIMARY KEY (`BorrowID`),
  ADD KEY `BookID` (`BookID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`MemberID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `AuthorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `BookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `borrowedbooks`
--
ALTER TABLE `borrowedbooks`
  MODIFY `BorrowID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `MemberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`AuthorID`) REFERENCES `authors` (`AuthorID`);

--
-- Constraints for table `borrowedbooks`
--
ALTER TABLE `borrowedbooks`
  ADD CONSTRAINT `borrowedbooks_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`),
  ADD CONSTRAINT `borrowedbooks_ibfk_2` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
