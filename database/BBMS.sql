 -- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
 

--
-- Database: `BBMS`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

 INSERT INTO `admin` (`id`, `name`, `username`, `email`, `pwd`) VALUES
 (1, 'Main Admin', 'admin', 'admin@bbms.com', '$2y$10$Tx4W5Nk4W5UZ7AvogWq.3u6QdM5j2cJZ4oGf1VzB7kLb0dD5X1vL2'), -- Password: "test"
 (2, 'Hospital Staff', 'staff', 'staff@bbms.com', '$2y$10$Tx4W5Nk4W5UZ7AvogWq.3u6QdM5j2cJZ4oGf1VzB7kLb0dD5X1vL2'); -- Password: "test"

-- --------------------------------------------------------

--
-- Table structure for table `blood`
--

CREATE TABLE `blood` (
  `id` bigint(20) NOT NULL,
  `AP` bigint(20) DEFAULT NULL,
  `AN` bigint(20) DEFAULT NULL,
  `BP` bigint(20) DEFAULT NULL,
  `BN` bigint(20) DEFAULT NULL,
  `ABP` bigint(20) DEFAULT NULL,
  `ABN` bigint(20) DEFAULT NULL,
  `OP` bigint(20) DEFAULT NULL,
  `ON` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood`
--

INSERT INTO `blood` (`id`, `AP`, `AN`, `BP`, `BN`, `ABP`, `ABN`, `OP`, `ON`) VALUES
(1, 0, 0, 0, 0, 0, 0, 0, 0);
-- --------------------------------------------------------

--
-- Table structure for table `donate`
--

CREATE TABLE `donate` (
  `id` bigint(20) NOT NULL,
  `donor_id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `disease` varchar(255) NOT NULL,
  `blood` varchar(10) NOT NULL,
  `unit` bigint(20) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donate`
--

-- INSERT INTO `donate` (`id`, `donor_id`, `username`, `disease`, `blood`, `unit`, `status`) VALUES
 -- (1, 1, 'farheen_18', 'nothing', 'B-', 1, 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `blood` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donor`
--

-- INSERT INTO `donor` (`id`, `name`, `username`, `email`, `pwd`, `blood`) VALUES
 -- (1, 'Farheen', 'farheen_18', 'farheen_18@gmail.com', '$2y$10$Kd5ykwrCfU6VIoS/0M5uEey9LgE8331ff8nwAYMnKHk2VLD678OD.', 'B-');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `blood` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

-- INSERT INTO `patient` (`id`, `name`, `username`, `email`, `pwd`, `blood`) VALUES
 -- (1, 'Farheen', 'farheen_18', 'farheen_18@gmail.com', '$2y$10$CKRsoSpPcEk7kGBNVNP7xuND9FhVLqLDdkEGCxkqO3uoghC5zz9Ha', 'B+');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` bigint(20) NOT NULL,
  `patient_id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `blood` varchar(10) NOT NULL,
  `unit` bigint(20) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request`
--

 -- INSERT INTO `request` (`id`, `patient_id`, `username`, `reason`, `blood`, `unit`, `status`) VALUES
 -- (1, 1, 'farheen_18', 'low blood levels', 'B+', 2, 'approved');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood`
--
ALTER TABLE `blood`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donate`
--
ALTER TABLE `donate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_donate_donor` (`donor_id`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_request_patient` (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2; -- Fixed merge conflict

--
-- AUTO_INCREMENT for table `blood`
--
ALTER TABLE `blood`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT for table `donate`
--
ALTER TABLE `donate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT for table `donor`
--
ALTER TABLE `donor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donate`
--
ALTER TABLE `donate`
  ADD CONSTRAINT `fk_donate_donor` FOREIGN KEY (`donor_id`) REFERENCES `donor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `fk_request_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

