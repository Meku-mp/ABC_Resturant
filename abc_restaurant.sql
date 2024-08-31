-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2024 at 03:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abc_restaurant`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddCustomer` (IN `p_FullName` VARCHAR(255), IN `p_Email` VARCHAR(255), IN `p_Phone` VARCHAR(15), IN `p_Username` VARCHAR(50), IN `p_Password` VARCHAR(255))   BEGIN
    INSERT INTO customers (FullName, Email, Phone, Username, Password)
    VALUES (p_FullName, p_Email, p_Phone, p_Username, p_Password);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddFacility` (IN `p_Name` VARCHAR(255), IN `p_Description` TEXT, IN `p_RestaurantId` INT, IN `p_ImagePath` VARCHAR(255), IN `p_CreateBy` INT)   BEGIN
    INSERT INTO facilities (Name, Description, RestaurantId, ImagePath, CreateBy, CreateDate)
    VALUES (p_Name, p_Description, p_RestaurantId, p_ImagePath, p_CreateBy, NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddQuery` (IN `p_QueryText` TEXT, IN `p_QueryDate` DATE, IN `p_CustomerName` VARCHAR(255), IN `p_CustomerEmail` VARCHAR(255), IN `p_RestaurantId` INT)   BEGIN
    INSERT INTO queries (QueryText, QueryDate, CustomerName, CustomerEmail, RestaurantId)
    VALUES (p_QueryText, p_QueryDate, p_CustomerName, p_CustomerEmail, p_RestaurantId);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCustomer` (IN `p_Id` BIGINT)   BEGIN
    DELETE FROM customers WHERE Id = p_Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFacility` (IN `p_Id` BIGINT)   BEGIN
    DELETE FROM facilities WHERE Id = p_Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteQuery` (IN `p_Id` INT)   BEGIN
    DELETE FROM queries
    WHERE Id = p_Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteStaff` (IN `p_id` INT)   BEGIN
    DELETE FROM staff
    WHERE Id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCustomers` ()   BEGIN
    SELECT * FROM customers;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFacilities` ()   BEGIN
    SELECT * FROM facilities;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFacilitiesByName` (IN `p_Name` VARCHAR(255))   BEGIN
    SELECT * FROM facilities WHERE Name LIKE CONCAT('%', p_Name, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFacilitiesByRestaurantId` (IN `p_RestaurantId` INT)   BEGIN
    SELECT * FROM facilities WHERE RestaurantId = p_RestaurantId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertReservation` (IN `p_ReservationDate` DATETIME, IN `p_NumberOfGuests` INT, IN `p_CustomerId` INT, IN `p_RestaurantId` INT, IN `p_type` INT(50), IN `p_price` DECIMAL(10,2), IN `p_foodId` INT)   BEGIN
    INSERT INTO reservations (ReservationDate, NumberOfGuests, CustomerId, RestaurantId, type, price, foodId, status)
    VALUES (p_ReservationDate, p_NumberOfGuests, p_CustomerId, p_RestaurantId, p_type, p_price, p_foodId, 0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertRestaurant` (IN `p_name` VARCHAR(255), IN `p_location` VARCHAR(255), IN `p_rate` DECIMAL(5,2), IN `p_createBy` INT)   BEGIN
    INSERT INTO restaurants (Name, Location, Rate, CreateBy, CreateDate)
    VALUES (p_name, p_location, p_rate, p_createBy, NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertStaff` (IN `p_name` VARCHAR(255), IN `p_position` VARCHAR(255), IN `p_salary` DECIMAL(10,2), IN `p_restaurantId` INT, IN `p_username` VARCHAR(255), IN `p_password` VARCHAR(255), IN `p_createBy` INT(255))   BEGIN
    INSERT INTO staff (Name, Position, Salary, RestaurantId, Username, Password, CreateBy, CreateDate)
    VALUES (p_name, p_position, p_salary, p_restaurantId, p_username, p_password, p_createBy, NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateCustomer` (IN `p_Id` BIGINT, IN `p_FullName` VARCHAR(255), IN `p_Email` VARCHAR(255), IN `p_Phone` VARCHAR(15), IN `p_Username` VARCHAR(50), IN `p_Password` VARCHAR(255))   BEGIN
    UPDATE customers
    SET FullName = p_FullName,
        Email = p_Email,
        Phone = p_Phone,
        Username = p_Username,
        Password = p_Password
    WHERE Id = p_Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateFacility` (IN `p_Id` BIGINT, IN `p_Name` VARCHAR(255), IN `p_Description` TEXT, IN `p_RestaurantId` INT, IN `p_ImagePath` VARCHAR(255), IN `p_CreateBy` INT, IN `p_CreateDate` DATETIME)   BEGIN
    UPDATE facilities
    SET Name = p_Name,
        Description = p_Description,
        RestaurantId = p_RestaurantId,
        ImagePath = p_ImagePath,
        CreateBy = p_CreateBy,
        CreateDate = p_CreateDate
    WHERE Id = p_Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateQuery` (IN `p_Id` INT, IN `p_QueryText` TEXT, IN `p_QueryDate` DATE, IN `p_CustomerName` VARCHAR(255), IN `p_CustomerEmail` VARCHAR(255), IN `p_RestaurantId` INT)   BEGIN
    UPDATE queries
    SET QueryText = p_QueryText,
        QueryDate = p_QueryDate,
        CustomerName = p_CustomerName,
        CustomerEmail = p_CustomerEmail,
        RestaurantId = p_RestaurantId
    WHERE Id = p_Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStaff` (IN `p_id` INT, IN `p_name` VARCHAR(255), IN `p_position` VARCHAR(255), IN `p_salary` DECIMAL(10,2), IN `p_restaurantId` INT, IN `p_username` VARCHAR(255), IN `p_password` VARCHAR(255))   BEGIN
    UPDATE staff
    SET 
        Name = p_name,
        Position = p_position,
        Salary = p_salary,
        RestaurantId = p_restaurantId,
        Username = p_username,
        Password = p_password
    WHERE 
        Id = p_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Id` int(11) NOT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Id`, `FullName`, `Email`, `Username`, `Password`) VALUES
(1, 'Emma Davis', 'emma.davis@example.com', 'emmadavis', 'adminpass123'),
(2, 'Liam Johnson', 'liam.johnson@example.com', 'liamjohnson', 'adminpass456'),
(3, 'Olivia Smith', 'olivia.smith@example.com', 'oliviasmith', 'adminpass789'),
(4, 'Test Admin', 'testadmin@gmail.com', 'testadmin', '597f5441e7d174b607873874ed54b974674986ad543e7458e28a038671c9f64c');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `Id` int(11) NOT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`Id`, `FullName`, `Email`, `Phone`, `Username`, `Password`) VALUES
(1, 'John Doe', 'john.doe@example.com', '123-456-7890', 'johndoe', 'newpassword123'),
(2, 'Bob Williams', 'bob.williams@example.com', '555-5678', 'bobwilliams', 'password456'),
(3, 'Charlie Brown', 'charlie.brown@example.com', '555-9101', 'charliebrown', 'password789'),
(4, 'Batman', 'batman@gmail.com', '1234567890', 'batman123', 'batman751'),
(5, 'dhanu', 'dhanu@gmail.com', '1234567890', 'dhanu123', 'dhanu751'),
(6, 'Dhanushka', 'Dhanushka@gmail.com', '0710101773', 'dhanu123', '887ecc3f07b83f2e0e84f62b89b9bf5a1a7d582d43bc24f349229e4219bd5adf'),
(9, 'ravindu dhanushka', 'ravindu@gmail.com', '123456789', 'ravindu123', '26a75a3c86a1321c0125b3318814fefe73296779a095af48df2b8ff4afe15763');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `Id` bigint(20) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `RestaurantId` int(11) DEFAULT NULL,
  `ImagePath` varchar(255) DEFAULT NULL,
  `CreateBy` int(11) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`Id`, `Name`, `Description`, `RestaurantId`, `ImagePath`, `CreateBy`, `CreateDate`) VALUES
(1, 'Free WiFi updated', 'High-speed internet access available throughout the restaurant. updated\r\nNEW', 3, 'https://picsum.photos/id/237/200/300', 4, '2024-08-19 10:45:00'),
(3, 'Private Dining Room', 'Book our private room for special occasions.', 3, 'https://picsum.photos/id/237/200/300', 1, '2024-08-19 12:45:00'),
(5, 'asdas', 'asdas', 2, 'https://picsum.photos/id/237/200/300', 4, '2024-08-27 22:23:20'),
(10, 'New Fac', 'New desc', 3, 'https://picsum.photos/id/237/200/300', 1, '2024-08-29 00:10:49'),
(11, 'hello world', 'dasd', 3, 'https://picsum.photos/id/237/200/300', 4, '2024-08-29 20:21:19'),
(14, 'Michael Brown', 'asd', 2, 'https://picsum.photos/id/237/200/300', 1, '2024-08-31 00:52:55'),
(15, 'Michael Brown', '12', 2, 'https://picsum.photos/id/237/200/300', 4, '2024-08-31 02:02:18'),
(16, 'Amantha Keshan', 'fvds', 2, 'https://picsum.photos/id/237/200/300', 4, '2024-08-31 02:08:02'),
(18, 'Michael Brown', 'aa', 2, 'https://picsum.photos/id/237/200/300', 4, '2024-08-31 02:57:09');

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL CHECK (`Price` > 0),
  `RestaurantId` int(11) NOT NULL,
  `ImagePath` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`Id`, `Name`, `Description`, `Price`, `RestaurantId`, `ImagePath`) VALUES
(2, 'Margherita Pizza', 'Traditional pizza with tomatoes, mozzarella, and basil', 10.00, 1, 'https://media.cnn.com/api/v1/images/stellar/prod/140430115517-06-comfort-foods.jpg?q=x_0,y_0,h_720,w_1280,c_fill/w_800'),
(3, 'Cheeseburger', 'Juicy beef patty with cheddar cheese, lettuce, and tomato', 8.99, 2, 'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?quality=90&resize=556,505'),
(4, 'Caesar Salad', 'Crisp romaine lettuce with Caesar dressing and croutons', 7.50, 2, 'https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Corndogs-7832ef6.jpg?quality=90&resize=556,505'),
(5, 'Sushi Platter', 'Assorted sushi rolls with fresh fish and vegetables', 15.00, 3, 'https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Corndogs-7832ef6.jpg?quality=90&resize=556,505'),
(6, 'Tacos al Pastor', 'Tacos with marinated pork, pineapple, and cilantro', 9.00, 3, 'https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Corndogs-7832ef6.jpg?quality=90&resize=556,505'),
(10, 'Hello food', 'hello desc', 123.45, 3, 'https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Corndogs-7832ef6.jpg?quality=90&resize=556,505'),
(11, 'Michael Brown', 'asd', 12.00, 2, 'https://picsum.photos/id/237/200/300'),
(12, 'asdas', 'asd', 1.00, 1, 'https://picsum.photos/id/237/200/300');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `Id` int(11) NOT NULL,
  `Amount` decimal(10,2) NOT NULL CHECK (`Amount` > 0),
  `PaymentDate` datetime NOT NULL DEFAULT current_timestamp(),
  `PaymentMethod` varchar(50) NOT NULL,
  `ReservationId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE `queries` (
  `Id` int(11) NOT NULL,
  `QueryText` text NOT NULL,
  `QueryDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CustomerName` varchar(255) NOT NULL,
  `CustomerEmail` varchar(255) DEFAULT NULL,
  `RestaurantId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `queries`
--

INSERT INTO `queries` (`Id`, `QueryText`, `QueryDate`, `CustomerName`, `CustomerEmail`, `RestaurantId`) VALUES
(1, 'Query text example', '2024-08-28 00:00:00', 'John Doe', 'john.doe@example.com', 1),
(2, 'This is the texxt', '2024-08-28 00:00:00', 'Dhanushka', 'dhanu@gmail.com', 1),
(3, 'dsadas', '2024-08-29 00:00:00', 'dasdas', 'test@gmail.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `Id` int(11) NOT NULL,
  `ReservationDate` datetime NOT NULL,
  `NumberOfGuests` int(11) NOT NULL CHECK (`NumberOfGuests` > 0),
  `CustomerId` int(11) NOT NULL,
  `RestaurantId` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `foodId` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`Id`, `ReservationDate`, `NumberOfGuests`, `CustomerId`, `RestaurantId`, `type`, `price`, `foodId`, `status`) VALUES
(1, '2024-09-01 19:30:00', 4, 2, 1, 1, 100, 5, 2),
(2, '2024-08-10 00:00:00', 3, 6, 3, 2, 0, 0, 0),
(3, '2024-08-08 00:00:00', 1, 6, 2, 1, 2000, 1, 1),
(4, '2024-08-14 00:00:00', 1, 6, 2, 1, 2000, 1, 1),
(5, '2024-08-23 00:00:00', 2, 6, 2, 2, 0, 0, 0),
(6, '2024-08-23 00:00:00', 1, 6, 1, 1, 2000, 1, 1),
(7, '2024-08-30 00:00:00', 1, 6, 2, 1, 2000, 1, 1),
(8, '2024-08-30 00:00:00', 1, 6, 2, 1, 2000, 1, 1),
(9, '2024-08-31 00:00:00', 2, 6, 3, 2, 0, 0, 0),
(10, '2024-08-10 00:00:00', 2, 6, 5, 2, 0, 0, 0),
(11, '2024-08-10 00:00:00', 2, 6, 5, 2, 0, 0, 0),
(12, '2024-08-10 00:00:00', 2, 6, 5, 2, 0, 0, 0),
(13, '2024-08-10 00:00:00', 2, 6, 5, 2, 0, 0, 0),
(14, '2024-08-06 00:00:00', 1, 6, 1, 2, 0, 0, 0),
(15, '2024-08-07 00:00:00', 1, 6, 1, 2, 0, 0, 0),
(16, '2024-08-31 00:00:00', 1, 6, 2, 1, 2000, 1, 0),
(17, '2024-08-31 00:00:00', 1, 6, 1, 1, 2000, 1, 0),
(18, '2024-08-08 00:00:00', 1, 6, 1, 1, 2000, 1, 0),
(19, '2024-08-15 00:00:00', 3, 6, 1, 2, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Rate` decimal(5,2) NOT NULL,
  `CreateBy` int(11) NOT NULL,
  `CreateDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`Id`, `Name`, `Location`, `Rate`, `CreateBy`, `CreateDate`) VALUES
(1, 'The Gourmet Kitchen updated', '123 Main St, Foodville updated', 5.12, 1, '2024-08-19 10:00:00'),
(2, 'Bistro Delight', '456 Elm St, Cooktown', 1.00, 1, '2024-08-19 11:00:00'),
(3, 'Seafood Haven', '789 Ocean Ave, Seaside', 1.00, 1, '2024-08-19 12:00:00'),
(4, 'sadsa', 'asdas', 1.00, 1, '2024-08-27 01:54:51'),
(5, 'New one', 'homagama', 1.00, 4, '2024-08-27 02:08:29'),
(10, 'abc', 'abc', 12.00, 4, '2024-08-30 00:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Position` varchar(255) NOT NULL,
  `Salary` decimal(10,2) NOT NULL CHECK (`Salary` >= 0),
  `RestaurantId` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `CreateBy` int(11) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Id`, `Name`, `Position`, `Salary`, `RestaurantId`, `Username`, `Password`, `CreateBy`, `CreateDate`) VALUES
(10, 'Emily Davis', 'Hostess', 30001.00, 3, 'edavis', '92487158918c22db6f91270a8796d65bbf0068e13342c758033f9ebe07e86203', 1, '2024-08-27 00:41:42'),
(11, 'Robert Wilson', 'Bartender', 35000.00, 2, 'rwilson', 'password654', 1, '2024-08-27 00:41:42'),
(12, 'Linda Johnson', 'Sous Chef', 40000.00, 1, 'ljohnson', 'password987', 1, '2024-08-27 00:41:42'),
(15, 'Robat', 'Waiter', 1000.00, 1, 'testadmin', '597f5441e7d174b607873874ed54b974674986ad543e7458e28a038671c9f64c', 4, '2024-08-30 00:09:59'),
(16, 'Amantha', 'Waiter', 100.00, 2, 'amantha123', 'f9910b1dc79892dab285aa75407bdbd2b8846ca0acb0845bb45f0c999b2c030b', 4, '2024-08-30 22:12:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `RestaurantId` (`RestaurantId`),
  ADD KEY `CreateBy` (`CreateBy`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `RestaurantId` (`RestaurantId`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ReservationId` (`ReservationId`);

--
-- Indexes for table `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `RestaurantId` (`RestaurantId`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CustomerId` (`CustomerId`),
  ADD KEY `RestaurantId` (`RestaurantId`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CreateBy` (`CreateBy`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD KEY `RestaurantId` (`RestaurantId`),
  ADD KEY `CreateBy` (`CreateBy`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `facilities`
--
ALTER TABLE `facilities`
  ADD CONSTRAINT `facilities_ibfk_1` FOREIGN KEY (`RestaurantId`) REFERENCES `restaurants` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facilities_ibfk_2` FOREIGN KEY (`CreateBy`) REFERENCES `admin` (`Id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`RestaurantId`) REFERENCES `restaurants` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`ReservationId`) REFERENCES `reservations` (`Id`);

--
-- Constraints for table `queries`
--
ALTER TABLE `queries`
  ADD CONSTRAINT `queries_ibfk_1` FOREIGN KEY (`RestaurantId`) REFERENCES `restaurants` (`Id`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`RestaurantId`) REFERENCES `restaurants` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD CONSTRAINT `restaurants_ibfk_1` FOREIGN KEY (`CreateBy`) REFERENCES `admin` (`Id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`RestaurantId`) REFERENCES `restaurants` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`CreateBy`) REFERENCES `admin` (`Id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
