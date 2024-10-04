-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2024 at 06:17 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elegance`
--

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `client_code` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `fullname` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = Active, 2= Inactive',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `client_code`, `password`, `fullname`, `status`, `date_created`, `date_updated`) VALUES
(1, '20210001', 'a88df23ac492e6e2782df6586a0c645f', 'Williams, Mike D', 1, '2021-11-05 13:12:15', '2021-11-05 14:58:01'),
(4, '20210002', '100af4e620024b40bbfc49214ea66509', 'Lou, Samantha Jane C', 1, '2021-11-05 14:59:58', '2021-11-05 15:19:32');

-- --------------------------------------------------------

--
-- Table structure for table `client_meta`
--

CREATE TABLE `client_meta` (
  `client_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_meta`
--

INSERT INTO `client_meta` (`client_id`, `meta_field`, `meta_value`) VALUES
(1, 'lastname', 'Williams'),
(1, 'firstname', 'Mike'),
(1, 'middlename', 'D'),
(1, 'gender', 'Male'),
(1, 'dob', '1997-06-23'),
(1, 'contact', '09223554991'),
(1, 'address', 'My Address, Here City, There Province, 2306'),
(1, 'email', 'mwilliams@sample.com'),
(1, 'cpassword', 'mwilliams'),
(1, 'cur_password', '20210001'),
(4, 'lastname', 'Lou'),
(4, 'firstname', 'Samantha Jane'),
(4, 'middlename', 'C'),
(4, 'gender', 'Female'),
(4, 'dob', '1997-10-14'),
(4, 'contact', '097876546522'),
(4, 'address', 'Sample Address Only, Anywhere, 2306'),
(4, 'email', 'sjlou@sample.com'),
(4, 'cpassword', ''),
(4, 'cur_password', '20210002');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `contact` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `message`, `contact`) VALUES
(1, 'Saleem Ustad', 'Alooo33@gmail.com', 'Thank You 123', 2147483647),
(3, 'wasu nai', 'ahmi111@gmail.com', ' wasif sheikh thanks', 1234569887),
(4, 'ustad', 'ustad@gmail.com', ' ustad', 2147483647),
(5, 'sheikh', 'samee33@gmail.com', ' g erserhtt54gergs', 20418656),
(6, 'ameer muavia', 'aaaaa@gmail.com', ' asd', 2147483647),
(8, 'dsas', 'muhammadwasif.aptech@gamil.com', ' 5645', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `ID` int(11) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `Image` varchar(255) NOT NULL,
  `sname` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`ID`, `pname`, `quantity`, `price`, `Image`, `sname`, `contact`) VALUES
(14, 'skin white', 'cream', '8000', 'favicon.png', 'waseem', '8767656476'),
(15, 'cold cream', 'cream', '6000', 'kidcut.jpg', 'kasim', '87654321987'),
(16, 'face wex', '3', '4000', 'kidstyle3.webp', 'j.', '8767656476');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_list`
--

CREATE TABLE `invoice_list` (
  `id` int(30) NOT NULL,
  `invoice_code` varchar(50) NOT NULL,
  `client_id` int(30) NOT NULL,
  `total_amount` float NOT NULL DEFAULT 0,
  `discount_perc` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `tax_perc` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=Paid',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_services`
--

CREATE TABLE `invoice_services` (
  `invoice_id` int(30) NOT NULL,
  `service_id` int(30) NOT NULL,
  `price` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice_services`
--

INSERT INTO `invoice_services` (`invoice_id`, `service_id`, `price`) VALUES
(1, 1, 250),
(1, 3, 355),
(2, 3, 355),
(2, 1, 250),
(2, 2, 399.99),
(3, 2, 399.99),
(3, 3, 355);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pid` int(10) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `pdec` varchar(255) NOT NULL,
  `pprice` varchar(255) NOT NULL,
  `pimage` varchar(255) NOT NULL,
  `pcategory` int(255) NOT NULL,
  `paction` tinyint(1) NOT NULL,
  `pdate` datetime NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services_list`
--

CREATE TABLE `services_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services_list`
--

INSERT INTO `services_list` (`id`, `name`, `description`, `price`, `status`, `date_created`, `date_updated`) VALUES
(1, 'Device Cleaning', 'Device Cleaning', 250, 1, '2021-11-05 09:48:30', '2021-11-05 09:48:30'),
(2, 'Software Trouble Shooting', 'Software Trouble Shooting', 399.99, 1, '2021-11-05 09:50:34', '2021-11-05 09:50:34'),
(3, 'Parts Replacements', 'Parts Replacements', 355, 1, '2021-11-05 09:51:53', '2021-11-05 09:51:53');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`id`, `fname`, `lname`, `gender`, `email`, `password`) VALUES
(1, ' ameer', 'muavia', ' male', ' aaa@gmail', ''),
(2, ' shabbir', 'Sheikh', ' ', ' mubeenahmedsheikh04@gmail.com', '$2y$10$xFaPgGA5pWNDUjfBShQk0OS5Ztdj9iuZlkjQGd6.Ut.'),
(3, ' ahmed', 'aman', ' ', ' ahmi111@gmail.com', '$2y$10$gqmO8qllHdQeG8QnmsrEO.7nsR/k3HbnZIbI72PtJUY'),
(4, 'muhammad', 'wasif', 'male', '---------------*-', '111'),
(5, 'Wasif', 'muavia', 'male', 'Wasif@gmail.com', '111'),
(6, 'Muhamm', 'Wasif', 'male', 'wasif@gamil.com', '111'),
(7, 'ash', 'Yeager', 'male', 'Ash@gmail.com', '123'),
(8, 'faul', 'www', 'male', 'faul@gmail.com', '111');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `ID` int(10) NOT NULL,
  `Name` varchar(120) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Schedule` varchar(255) NOT NULL,
  `Designation` varchar(255) CHARACTER SET armscii8 COLLATE armscii8_bin NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Image` varchar(255) NOT NULL,
  `Commission` varchar(25) CHARACTER SET armscii8 COLLATE armscii8_bin NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`ID`, `Name`, `Email`, `MobileNumber`, `Schedule`, `Designation`, `Title`, `Image`, `Commission`, `CreationDate`, `UpdationDate`) VALUES
(21, 'Adam Billiyard', 'adam@gmail.com', 3316546841, '6:00 Am To 8:00 Pm', 'Senior', 'Hair Cutting', 'artist_1.png', '30', '2024-01-13 08:30:25', '2024-01-20 07:40:04'),
(26, 'Fred Macyard', 'macyard@gmail.com', 55646545649, '6:00 Am To 8:00 Pm', 'chef master', 'Beard Man', 'beard.jpg', '30', '2024-01-13 08:55:31', '2024-01-24 16:08:25'),
(27, 'Justin Stuard', 'Stuard@gmail.com', 314654541, '6:00 Am To 8:00 Pm', 'Intern', 'Hair Stylish', 'artist5.png', '15', '2024-01-16 15:26:34', '2024-01-20 07:50:04'),
(33, 'Ali', 'Ali@gmai.com', 314654541, '5:00Am To 9:00Pm', 'asd', 'sad', '6.jpeg', '15', '2024-01-24 16:05:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` char(50) DEFAULT NULL,
  `UserName` char(50) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp(),
  `Gender` varchar(200) NOT NULL,
  `Role` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`, `Gender`, `Role`) VALUES
(1, 'Admin', 'admin', 7898799798, 'tester1@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2019-07-25 06:21:50', '', 0),
(7, 'Sara Ali', 'Sara', 3234568580, 'Sara@gmail.coom', 'ac9c3b9aafeb3165e642a29e5be59032', '2024-01-25 16:31:12', 'female', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblappointment`
--

CREATE TABLE `tblappointment` (
  `ID` int(10) NOT NULL,
  `AptNumber` varchar(80) DEFAULT NULL,
  `Name` varchar(120) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `PhoneNumber` bigint(11) DEFAULT NULL,
  `AptDate` varchar(120) DEFAULT NULL,
  `AptTime` varchar(120) DEFAULT NULL,
  `Services` varchar(120) DEFAULT NULL,
  `ApplyDate` timestamp NULL DEFAULT current_timestamp(),
  `Remark` varchar(250) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `RemarkDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblappointment`
--

INSERT INTO `tblappointment` (`ID`, `AptNumber`, `Name`, `Email`, `PhoneNumber`, `AptDate`, `AptTime`, `Services`, `ApplyDate`, `Remark`, `Status`, `RemarkDate`) VALUES
(6, '730983823', 'ameer muavia', 'aaaaa@gmail.com', 3452572460, '31/12/2023', '21:02', 'Charcol Facial', '2024-01-23 16:59:22', 'yes', '1', '2024-01-26 04:42:21'),
(7, '175863979', 'Alo', 'Wasif@gmail.com', 3452572460, '10/01/2024', '22:06', 'Deluxe Pedicure', '2024-01-23 17:01:29', NULL, NULL, NULL),
(8, '324235337', 'Pika', 'Pika@gmail', 345257246, '07/12/2023', '22:16', 'Adam Billiyard', '2024-01-23 17:13:18', NULL, NULL, NULL),
(9, '797609180', 'Pika', 'Pika@gmail', 345257246, '07/12/2023', '22:16', 'Charcol Facial', '2024-01-23 17:13:24', NULL, NULL, NULL),
(11, '814155166', 'OO', 'OO@gmail.com', 1049528594, '2024-02-01', '22:43', 'Hair Cut', '2024-01-23 17:37:42', '123', '2', '2024-01-26 04:47:06'),
(20, '130675528', 'ameer muavia', 'aaaaa@gmail.com', 345257246, '2024-01-27', '06:39', 'Charcol Facial', '2024-01-23 20:39:22', NULL, NULL, NULL),
(21, '630603939', 'ameer muavia', 'Ali@gmai.com', 314657465, '18/01/2024', '03:00', 'Charcol Facial', '2024-01-23 20:56:33', NULL, NULL, NULL),
(22, '216251879', 'ameer muavia', 'Ali@gmai.com', 314657465, '18/01/2024', '03:00', 'Charcol Facial', '2024-01-23 20:58:04', NULL, NULL, NULL),
(25, '225016203', 'Muhammad Wasif', 'admin@gmail.com', 1049528594, '2024-02-09', '12:30', 'Charcol Facial', '2024-01-24 18:48:25', NULL, NULL, NULL),
(29, '987698295', 'login', 'admin@gmail.com', 1049528594, '2024-01-31', '01:26', 'Charcol Facial', '2024-01-26 03:20:33', 'ok', '1', '2024-01-26 04:57:59'),
(32, '723854197', 'ameer muavia', 'admin@gmail.com', 2131423434, '2024-01-30', '08:29', 'Deluxe Pedicure', '2024-01-26 03:23:47', NULL, NULL, NULL),
(34, '800805013', 'faiz', 'admin@gmail.com', 2131423434, '2024-01-31', '08:29', 'Normal Menicure', '2024-01-26 03:25:54', NULL, NULL, NULL),
(35, '640863148', 'faiz', 'admin@gmail.com', 2131423434, '2024-01-31', '08:29', 'Normal Menicure', '2024-01-26 03:26:28', NULL, NULL, NULL),
(36, '198778510', 'Faiz', 'admin@gmail.com', 2131423434, '2024-01-30', '08:29', 'Deluxe Pedicure', '2024-01-26 03:27:00', NULL, NULL, NULL),
(37, '229535764', 'Faiz', 'admin@gmail.com', 2131423434, '2024-01-30', '08:29', 'Deluxe Pedicure', '2024-01-26 03:28:09', NULL, NULL, NULL),
(38, '791417727', 'ameer muavia', 'wasif@gamil.com', 2131423434, '2024-02-02', '08:35', 'Charcol Facial', '2024-01-26 03:29:07', NULL, NULL, NULL),
(39, '351667080', 'ameer muavia', 'wasif@gamil.com', 2131423434, '2024-02-02', '08:35', 'Charcol Facial', '2024-01-26 03:29:33', NULL, NULL, NULL),
(40, '990504008', 'ameer muavia', 'wasif@gamil.com', 2131423434, '2024-02-02', '08:35', 'Charcol Facial', '2024-01-26 03:29:49', NULL, NULL, NULL),
(41, '415561248', 'wasif', 'wasif@gamil.com', 345257246, '2024-01-31', '08:37', 'Charcol Facial', '2024-01-26 03:31:09', 'tt', '1', '2024-01-26 04:44:50'),
(42, '319776013', 'wasif', 'Ali@gmai.com', 345257246, '2024-01-29', '08:37', 'Charcol Facial', '2024-01-26 03:32:39', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomers`
--

CREATE TABLE `tblcustomers` (
  `ID` int(10) NOT NULL,
  `Name` varchar(120) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Details` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcustomers`
--

INSERT INTO `tblcustomers` (`ID`, `Name`, `Email`, `MobileNumber`, `Details`, `CreationDate`, `UpdationDate`) VALUES
(13, 'Alo', 'Alo@gmail.com', 5645648948, 'asd', '2024-01-24 16:21:23', NULL),
(14, 'Muhammad Wasif', 'Wasif@gmail.com', 314654541, 'Ok', '2024-01-24 18:49:55', NULL),
(15, 'Ali', 'Wasif@gmail.com', 314657465, 'ok', '2024-01-25 17:43:41', NULL),
(16, 'Pika', 'Pika@gmail', 345257246, 'LOL', '2024-01-25 17:44:23', NULL),
(17, 'OO', 'OO@gmail.com', 1049528594, 'Ok', '2024-01-25 17:59:47', NULL),
(18, 'ameer muavia', 'aaaaa@gmail.com', 3452572460, 'ok', '2024-01-25 18:01:39', NULL),
(19, 'Muhammad Wasif', 'admin@gmail.com', 1049528594, 'k', '2024-01-25 18:08:59', NULL),
(20, 'login', 'admin@gmail.com', 1049528594, '88', '2024-01-26 04:58:24', '2024-01-26 05:02:43'),
(21, 'wasif', 'wasif@gamil.com', 345257246, '888', '2024-01-26 05:00:34', NULL),
(22, 'wasif', 'aaaaa@gmail.com', 3452572460, 'ttt', '2024-01-26 05:10:48', '2024-01-26 05:11:17');

-- --------------------------------------------------------

--
-- Table structure for table `tblinvoice`
--

CREATE TABLE `tblinvoice` (
  `id` int(11) NOT NULL,
  `Userid` int(11) DEFAULT NULL,
  `ServiceId` int(11) DEFAULT NULL,
  `BillingId` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblinvoice`
--

INSERT INTO `tblinvoice` (`id`, `Userid`, `ServiceId`, `BillingId`, `PostingDate`) VALUES
(1, 7, 1, 529212751, '2023-12-11 05:39:34'),
(2, 7, 3, 529212751, '2023-12-11 05:39:34'),
(3, 13, 5, 512794405, '2024-01-24 16:21:48'),
(4, 13, 6, 512794405, '2024-01-24 16:21:48'),
(5, 13, 3, 243875636, '2024-01-24 18:50:08'),
(6, 13, 5, 243875636, '2024-01-24 18:50:08'),
(7, 13, 3, 964174202, '2024-01-25 17:12:55'),
(8, 13, 5, 964174202, '2024-01-25 17:12:55'),
(9, 13, 6, 964174202, '2024-01-25 17:12:55'),
(10, 13, 9, 964174202, '2024-01-25 17:12:55'),
(11, 13, 17, 964174202, '2024-01-25 17:12:55'),
(12, 13, 26, 964174202, '2024-01-25 17:12:55'),
(13, 13, 27, 964174202, '2024-01-25 17:12:55'),
(14, 16, 3, 281842510, '2024-01-25 17:49:16'),
(15, 16, 5, 281842510, '2024-01-25 17:49:16'),
(16, 16, 6, 281842510, '2024-01-25 17:49:16'),
(17, 17, 3, 435514741, '2024-01-25 18:00:18'),
(18, 17, 5, 435514741, '2024-01-25 18:00:19'),
(19, 17, 6, 435514741, '2024-01-25 18:00:19'),
(20, 17, 9, 435514741, '2024-01-25 18:00:19'),
(21, 17, 17, 435514741, '2024-01-25 18:00:19'),
(22, 17, 26, 435514741, '2024-01-25 18:00:19'),
(23, 17, 27, 435514741, '2024-01-25 18:00:19'),
(24, 18, 27, 551432696, '2024-01-25 18:01:56'),
(25, 19, 26, 664840162, '2024-01-25 18:09:09'),
(26, 20, 3, 962139225, '2024-01-26 04:59:04'),
(27, 20, 5, 962139225, '2024-01-26 04:59:04'),
(28, 20, 6, 962139225, '2024-01-26 04:59:04'),
(29, 20, 9, 962139225, '2024-01-26 04:59:04'),
(30, 20, 17, 962139225, '2024-01-26 04:59:04'),
(31, 20, 26, 962139225, '2024-01-26 04:59:04'),
(32, 20, 27, 962139225, '2024-01-26 04:59:04'),
(33, 20, 33, 289171699, '2024-01-26 05:03:30'),
(34, 22, 3, 662586170, '2024-01-26 05:11:28'),
(35, 22, 5, 662586170, '2024-01-26 05:11:28'),
(36, 22, 6, 662586170, '2024-01-26 05:11:28'),
(37, 22, 9, 662586170, '2024-01-26 05:11:28'),
(38, 22, 17, 662586170, '2024-01-26 05:11:28'),
(39, 22, 26, 662586170, '2024-01-26 05:11:28'),
(40, 22, 27, 662586170, '2024-01-26 05:11:28'),
(41, 22, 33, 662586170, '2024-01-26 05:11:28');

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` date DEFAULT NULL,
  `Timing` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblservices`
--

CREATE TABLE `tblservices` (
  `ID` int(10) NOT NULL,
  `ServiceName` varchar(200) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `Cost` int(10) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `Image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblservices`
--

INSERT INTO `tblservices` (`ID`, `ServiceName`, `Description`, `Cost`, `CreationDate`, `Image`) VALUES
(3, 'Charcol Facial', 'The end result is skin that is clean and clear. When used as a powder, charcoal masks can reach deep in your pores and suck out impurities with them.', 1000, '2023-12-05 11:22:38', 'c.jpeg'),
(5, 'Deluxe Pedicure', 'A pedicure is a therapeutic treatment for your feet that removes dead skin, softens hard skin and shapes and treats your toenails.', 600, '2023-12-05 11:22:38', 'x.jfif'),
(6, 'Normal Menicure', 'A menicure is a therapeutic treatment for your feet that removes dead skin, softens hard skin and shapes and treats your toenails.', 300, '2023-12-05 11:22:38', 'b.jpeg'),
(9, 'Style Haircut', 'A hairstyle, hairdo, or haircut refers to the styling of hair, usually on the human scalp. Sometimes, this could also mean an editing of facial or body hair', 550, '2023-12-05 11:22:38', '3x.jpg'),
(17, 'MUSTACHE TRIM', 'A moustache trim  is a therapeutic treatment for your feet that removes dead skin, softens hard skin and shapes and treats your toenails.', 85, '2023-12-05 11:22:38', '1.jfif'),
(26, 'Foot Massage', 'A foot massage  is a therapeutic treatment for your feet that removes dead skin, softens hard skin and shapes and treats your toenails.', 50, '2024-01-13 08:01:16', 'x.jfif'),
(27, 'Hair Cut', 'After the Cut air cutting tools in order to create a shape. Trimming - removing only split ends with scissors or razor (about 1/4 to 1/2 of an inch).\n', 50, '2024-01-16 15:16:40', 'h.jpeg'),
(33, 'Full Body Massage', 'Body Feels Like Light', 1200, '2024-01-26 05:00:07', '6.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubscriber`
--

CREATE TABLE `tblsubscriber` (
  `ID` int(5) NOT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `DateofSub` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblsubscriber`
--

INSERT INTO `tblsubscriber` (`ID`, `Email`, `DateofSub`) VALUES
(5, 'osama@gmail.com', '2024-01-10 19:05:30'),
(6, 'wasif@gmail.com', '2024-01-23 16:12:25'),
(7, 'wasif@gmail.com', '2024-01-23 16:15:27'),
(8, 'Ali@gmail.com', '2024-01-23 16:15:54'),
(9, 'Pika@gmail.com', '2024-01-23 16:16:06'),
(10, 'Op@gmail.com', '2024-01-23 16:17:17'),
(11, 'Pika@gmail.com', '2024-01-23 16:17:23'),
(12, 'ppppp@gmail.com', '2024-01-23 16:18:14'),
(13, 'ppppp@gmail.com', '2024-01-23 20:21:50'),
(14, 'Op@gmail.com', '2024-01-23 20:24:17'),
(15, 'wasif@gmail.com', '2024-01-24 18:17:40'),
(16, 'Ink@gamil.com', '2024-01-24 18:46:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_meta`
--
ALTER TABLE `client_meta`
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `invoice_list`
--
ALTER TABLE `invoice_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `invoice_services`
--
ALTER TABLE `invoice_services`
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `services_list`
--
ALTER TABLE `services_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblappointment`
--
ALTER TABLE `tblappointment`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcustomers`
--
ALTER TABLE `tblcustomers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblinvoice`
--
ALTER TABLE `tblinvoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tblpage`
--
ALTER TABLE `tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblservices`
--
ALTER TABLE `tblservices`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblsubscriber`
--
ALTER TABLE `tblsubscriber`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `invoice_list`
--
ALTER TABLE `invoice_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services_list`
--
ALTER TABLE `services_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblappointment`
--
ALTER TABLE `tblappointment`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tblcustomers`
--
ALTER TABLE `tblcustomers`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tblinvoice`
--
ALTER TABLE `tblinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tblpage`
--
ALTER TABLE `tblpage`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblservices`
--
ALTER TABLE `tblservices`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tblsubscriber`
--
ALTER TABLE `tblsubscriber`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_meta`
--
ALTER TABLE `client_meta`
  ADD CONSTRAINT `client_meta_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
