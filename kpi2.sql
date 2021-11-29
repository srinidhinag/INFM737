-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2021 at 02:48 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: kpi
--

-- --------------------------------------------------------

--
-- Table structure for table dataset
--
SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS dataset (
  dataset_ID int(11) NOT NULL,
  dataset_name varchar(45) DEFAULT NULL,
  dataset_owner_ID int(11) DEFAULT NULL,
  dataset_steward_ID int(11) DEFAULT NULL,
  internal_external varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table dataset
--

INSERT INTO dataset (dataset_ID, dataset_name, dataset_owner_ID, dataset_steward_ID) VALUES
(2, 'Iris dataset', 1, 1),
(3, 'Car dataset', 2, 2),
(4, 'Faces dataset', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table dataset_owner
--

DROP TABLE IF EXISTS dataset_owner;
SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS dataset_owner (
  dataset_owner_ID int(11) NOT NULL,
  dataset_owner_name varchar(45) DEFAULT NULL,
  dataset_owner_email varchar(45) DEFAULT NULL,
  dataset_owner_phone varchar(45) DEFAULT NULL,
  dataset_steward_ID int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table dataset_owner
--

INSERT INTO dataset_owner (dataset_owner_ID, dataset_owner_name, dataset_owner_email, dataset_owner_phone, dataset_steward_ID) VALUES
(1, 'Brice John', 'bj@gmail.com', '+1022883277', 1),
(2, 'Tron Meghan', 'tm@gmail.com', '+1928443884', 2),
(3, 'Steve Nice', 'sn@gmail.com', '+172349828482', 3);

-- --------------------------------------------------------

--
-- Table structure for table dataset_steward
--
DROP TABLE IF EXISTS dataset_steward;
SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS dataset_steward (
  dataset_steward_ID int(11) NOT NULL,
  dataset_steward_name varchar(45) DEFAULT NULL,
  dataset_owner_name varchar(45) DEFAULT NULL,
  dataset_steward_email varchar(45) DEFAULT NULL,
  dataset_steward_phone varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table dataset_steward
--

INSERT INTO dataset_steward (dataset_steward_ID, dataset_steward_name, dataset_owner_name, dataset_steward_email, dataset_steward_phone) VALUES
(1, 'Steve Bruce', 'Brice John', 'sb@gmail.com', '+1927377466'),
(2, 'Mike Posner', 'Tron Meghan', 'mk@gmail.com', '+18420004239'),
(3, 'Garry Barry', 'Steve Nice', 'gb@gmail.com', '+1666568836');

-- --------------------------------------------------------

--
-- Table structure for table kpi
--
DROP TABLE IF EXISTS kpi;
CREATE TABLE kpi (
  kpi_ID int(11) NOT NULL,
  kpi_name varchar(45) DEFAULT NULL,
  kpi_owner_ID int(11) DEFAULT NULL,
  kpi_description varchar(45) DEFAULT NULL,
  dataset_ID int(11) DEFAULT NULL,
  permission_status varchar(45) DEFAULT NULL,
  strat_priority_ID int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table kpi
--

INSERT INTO kpi (kpi_ID, kpi_name, kpi_owner_ID, kpi_description, dataset_ID, permission_status, strat_priority_ID) VALUES
(2, 'First KPI', 1, 'This is the first KPI description', 2, 'active', 1),
(3, 'Second KPI', 1, 'This is the second KPI description', 3, 'inactive', 2),
(4, 'Third KPI', 1, 'This is the third KPI description', 4, 'active', 3);

-- --------------------------------------------------------

--
-- Table structure for table kpi_owner
--
DROP TABLE IF EXISTS kpi_owner;
SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS kpi_owner (
  kpi_owner_ID int(11) NOT NULL,
  kpi_owner_name varchar(45) NOT NULL,
  kpi_owner_email varchar(45) NOT NULL,
  kpi_owner_phone varchar(45) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table kpi_owner
--

INSERT INTO kpi_owner (kpi_owner_ID, kpi_owner_name, kpi_owner_email, kpi_owner_phone) VALUES
(1, 'John Stewart', 'jstwt@gmail.com', '+15646646664'),
(2, 'Legend Bowie', 'lb@gmail.com', '+1628848884'),
(3, 'Brown Kepper', 'bk@gmail.com', '+12939948885');

-- --------------------------------------------------------

--
-- Table structure for table permissions
--

DROP TABLE IF EXISTS permissions;
SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS permissions (
  permission_ID int(11) NOT NULL,
  permission_status varchar(45) DEFAULT NULL,
  dataset_ID int(11) DEFAULT NULL,
  dataset_owner_ID int(11) DEFAULT NULL,
  dataset_steward_ID int(11) DEFAULT NULL,
  date_granted date DEFAULT NULL,
  date_expires date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table permissions
--

INSERT INTO permissions (permission_ID, permission_status, dataset_ID, dataset_owner_ID, dataset_steward_ID, date_granted, date_expires) VALUES
(1, 'active', 2, 1, 1, '2021-11-18', '2022-11-18'),
(2, 'inactive', 3, 2, 2, '2021-11-18', '2022-11-18'),
(3, 'pending', 4, 3, 3, '2021-11-18', '2022-11-18');

-- --------------------------------------------------------

--
-- Table structure for table strategic_priority
--

DROP TABLE IF EXISTS strategic_priority;
SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS strategic_priority (
  strat_priority_ID int(11) NOT NULL,
  strat_priority_name varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table strategic_priority
--

INSERT INTO strategic_priority (strat_priority_ID, strat_priority_name) VALUES
(1, 'Enhance Customer Experience'),
(2, 'Optimize Infrastructure'),
(3, 'Protect Our Resources'),
(4, 'Spend Customer Dollars Wisely'),
(5, 'Transform Employee Engagement');

-- --------------------------------------------------------

--
-- Table structure for table user_
--

DROP TABLE IF EXISTS data_user;
SHOW WARNINGS;

CREATE TABLE IF NOT EXISTS data_user (
  user_ID int(11) NOT NULL,
  user_name varchar(45) DEFAULT NULL,
  permission_ID int(11) DEFAULT NULL,
  user_phone varchar(45) DEFAULT NULL,
  user_email varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table user_
--

INSERT INTO data_user (user_ID, user_name, permission_ID, user_phone, user_email) VALUES
(1, 'Jack Me', 1, '+1902837374', 'jm@gmail.com'),
(2, 'Kim Sparrow', 2, '+165634884894', 'sp@gmail.com'),
(3, 'Gary Swift', 3, '+14556887874', 'gs@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table dataset
--
ALTER TABLE dataset
  ADD PRIMARY KEY (dataset_ID),
  ADD KEY dataset_owner_ID (dataset_owner_ID),
  ADD KEY dataset_steward_ID (dataset_steward_ID);

--
-- Indexes for table dataset_owner
--
ALTER TABLE dataset_owner
  ADD PRIMARY KEY (dataset_owner_ID),
  ADD KEY dataset_steward_ID (dataset_steward_ID);

--
-- Indexes for table dataset_steward
--
ALTER TABLE dataset_steward
  ADD PRIMARY KEY (dataset_steward_ID);

--
-- Indexes for table kpi
--
ALTER TABLE kpi
  ADD PRIMARY KEY (kpi_ID),
  ADD KEY kpi_owner_ID (kpi_owner_ID),
  ADD KEY dataset_ID (dataset_ID),
  ADD KEY strat_priority_ID (strat_priority_ID);

--
-- Indexes for table kpi_owner
--
ALTER TABLE kpi_owner
  ADD PRIMARY KEY (kpi_owner_ID);

--
-- Indexes for table permissions
--
ALTER TABLE permissions
  ADD PRIMARY KEY (permission_ID),
  ADD KEY dataset_owner_ID (dataset_owner_ID),
  ADD KEY dataset_steward_ID (dataset_steward_ID);

--
-- Indexes for table strategic_priority
--
ALTER TABLE strategic_priority
  ADD PRIMARY KEY (strat_priority_ID);

--
-- Indexes for table data_user
--
ALTER TABLE data_user
  ADD PRIMARY KEY (user_ID),
  ADD KEY permission_ID (permission_ID);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table dataset
--
ALTER TABLE dataset
  MODIFY dataset_ID int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table dataset_owner
--
ALTER TABLE dataset_owner
  MODIFY dataset_owner_ID int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table dataset_steward
--
ALTER TABLE dataset_steward
  MODIFY dataset_steward_ID int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table kpi
--
ALTER TABLE kpi
  MODIFY kpi_ID int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table kpi_owner
--
ALTER TABLE kpi_owner
  MODIFY kpi_owner_ID int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table permissions
--
ALTER TABLE permissions
  MODIFY permission_ID int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table strategic_priority
--
ALTER TABLE strategic_priority
  MODIFY strat_priority_ID int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table data_user
--
ALTER TABLE data_user
  MODIFY user_ID int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table dataset
--
ALTER TABLE dataset
  ADD CONSTRAINT dataset_ibfk_1 FOREIGN KEY (dataset_owner_ID) REFERENCES dataset_owner (dataset_owner_ID),
  ADD CONSTRAINT dataset_ibfk_2 FOREIGN KEY (dataset_steward_ID) REFERENCES dataset_steward (dataset_steward_ID);

--
-- Constraints for table dataset_owner
--
ALTER TABLE dataset_owner
  ADD CONSTRAINT dataset_owner_ibfk_1 FOREIGN KEY (dataset_steward_ID) REFERENCES dataset_steward (dataset_steward_ID);

--
-- Constraints for table kpi
--
ALTER TABLE kpi
  ADD CONSTRAINT kpi_ibfk_1 FOREIGN KEY (kpi_owner_ID) REFERENCES kpi_owner (kpi_owner_ID),
  ADD CONSTRAINT kpi_ibfk_2 FOREIGN KEY (dataset_ID) REFERENCES dataset (dataset_ID),
  ADD CONSTRAINT kpi_ibfk_3 FOREIGN KEY (strat_priority_ID) REFERENCES strategic_priority (strat_priority_ID);

--
-- Constraints for table permissions
--
ALTER TABLE permissions
  ADD CONSTRAINT permissions_ibfk_1 FOREIGN KEY (dataset_owner_ID) REFERENCES dataset_owner (dataset_owner_ID),
  ADD CONSTRAINT permissions_ibfk_2 FOREIGN KEY (dataset_steward_ID) REFERENCES dataset_steward (dataset_steward_ID);

--
-- Constraints for table user_
--
ALTER TABLE data_user
  ADD CONSTRAINT user__ibfk_1 FOREIGN KEY (permission_ID) REFERENCES permissions (permission_ID);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


