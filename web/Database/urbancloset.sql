-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2021 at 10:43 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `urbancloset`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorydetails`
--

CREATE TABLE `categorydetails` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(50) NOT NULL,
  `CategoryDescription` varchar(250) NOT NULL,
  `catimage` varchar(255) NOT NULL,
  `CategoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categorydetails`
--

INSERT INTO `categorydetails` (`id`, `CategoryName`, `CategoryDescription`, `catimage`, `CategoryId`) VALUES
(1, 'Man Tops', 'aa', 'fifthproduct1.jpg', 6),
(2, 'Man Bottoms', 'The finest of material,  design and unbeatable style go into the making of our men’s shopping collection. Our range of online shopping men’s wear, accessories, footwear and personal care products are second to none', 'eigthproduct1.jpg', 6),
(4, 'Women Tops', 'We believe that it is a joyous activity where you get to choose a whole new lifestyle. If you would like access to a wide variety of products for women online shopping is the way to go', '1000000016.jpg', 7),
(5, 'Women Bottoms', 'We believe that it is a joyous activity where you get to choose a whole new lifestyle. If you would like access to a wide variety of products for women online shopping is the way to go', '1500000015.jpg', 7),
(6, 'Man', 'All Of Mans', 'shirt1.jpg', NULL),
(7, 'Women', 'All Of Women', '100000002737.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `orderid` int(11) NOT NULL,
  `Userid` int(11) DEFAULT NULL,
  `Addressid` int(11) DEFAULT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Statusid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`orderid`, `Userid`, `Addressid`, `Date`, `Statusid`) VALUES
(5, 2, 1, '2021-10-01 10:27:10', 3),
(12, 2, 1, '2021-10-06 07:36:26', 4),
(20, 5, 2, '2021-10-06 07:36:58', 4),
(21, 5, 2, '2021-10-06 07:37:13', 2),
(22, 5, 2, '2021-10-02 10:22:25', 2),
(24, 2, 1, '2021-10-06 07:38:14', 4),
(25, 2, 1, '2021-10-06 07:39:03', 3),
(26, 2, 1, '2021-10-06 07:39:50', 4),
(27, 10, 3, '2021-10-06 07:41:33', 4),
(28, 2, 1, '2021-10-06 07:41:59', 4),
(29, 2, 1, '2021-10-06 06:35:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderedproduct`
--

CREATE TABLE `orderedproduct` (
  `orderedproductid` int(11) NOT NULL,
  `Productid` int(11) DEFAULT NULL,
  `Orderid` int(11) DEFAULT NULL,
  `Quantity` varchar(10) NOT NULL,
  `Size` varchar(10) NOT NULL,
  `TotalPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderedproduct`
--

INSERT INTO `orderedproduct` (`orderedproductid`, `Productid`, `Orderid`, `Quantity`, `Size`, `TotalPrice`) VALUES
(11, 9, 5, '10', 'm', 29900),
(12, 10, 5, '7', 'm', 41930),
(19, 10, 12, '7', 'm', 41930),
(22, 10, 20, '7', 'm', 41930),
(23, 9, 21, '10', 'm', 29900),
(24, 9, 22, '10', 'm', 29900),
(33, 10, 24, '7', 'm', 41930),
(35, 10, 25, '7', 'm', 41930),
(36, 9, 26, '1', 'm', 2990),
(37, 31, 26, '1', 'm', 3990),
(38, 9, 27, '1', 'm', 2990),
(39, 31, 27, '1', 'm', 3990),
(40, 5, 26, '1', 'm', 8990),
(41, 31, 28, '1', 'm', 3990),
(42, 31, 29, '1', 'm', 3990);

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE `orderstatus` (
  `statusid` int(11) NOT NULL,
  `StatusName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderstatus`
--

INSERT INTO `orderstatus` (`statusid`, `StatusName`) VALUES
(1, 'order placed'),
(2, 'In Cart'),
(3, 'out for delivery'),
(4, 'delivered');

-- --------------------------------------------------------

--
-- Table structure for table `productdetails`
--

CREATE TABLE `productdetails` (
  `productid` int(11) NOT NULL,
  `ProductName` varchar(50) NOT NULL,
  `ProductDescription` varchar(255) NOT NULL,
  `ProductPrice` int(6) NOT NULL,
  `ProductColour` varchar(20) NOT NULL,
  `ProductSize` varchar(10) NOT NULL,
  `ProductQuantity` int(6) NOT NULL,
  `Categoryid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productdetails`
--

INSERT INTO `productdetails` (`productid`, `ProductName`, `ProductDescription`, `ProductPrice`, `ProductColour`, `ProductSize`, `ProductQuantity`, `Categoryid`) VALUES
(5, 'BIRD’S-EYE SUIT BLAZER', 'REGULAR FIT BLAZER WITH A NOTCHED LAPEL COLLAR. LONG SLEEVES WITH BUTTONS ON THE CUFFS. CHEST WELT POCKET AND FLAP HIP POCKETS. INSIDE POCKET DETAIL. BACK VENT AT THE HEM. FRONT BUTTON FASTENING.\r\n', 8990, 'GREY', 'm,l,x', 100, 1),
(9, 'DIAGNOL PLAIN WEAVE SHIRT', 'SLIM FIT SHIRT FEATURING A SPREAD COLLAR, LONG SLEEVES WITH BUTTONED CUFFS AND A BUTTON-UP FRONT.\r\n', 2990, 'White ', 'm,l,x', 100, 1),
(10, 'SLIM FIT CLASSY SUIT BLAZER', 'BLAZER WITH A NOTCHED LAPEL COLLAR. LONG SLEEVES WITH BUTTON DETAIL ON THE CUFFS. WELT POCKETS AT THE CHEST AND FLAP POCKETS AT THE HIP. INSIDE POCKET DETAIL. FRONT BUTTON FASTENING.', 5990, 'Oyster ', 'm,l,x', 100, 1),
(11, 'COTTON BERMUDA SHORTS', 'BERMUDA SHORTS MADE OF STRETCHY COTTON. FEATURING FRONT POCKETS, REAR WELT POCKETS AND TURN-UP HEMS.\r\n', 1590, 'Khaki ', 'm,l,x', 100, 2),
(25, 'FORMAL FUNCTIONAL SUIT', 'SLIM FIT SHIRT FEATURING A SPREAD COLLAR, LONG SLEEVES WITH BUTTONED CUFFS AND A BUTTON-UP FRONT.\r\n', 2990, 'Navy blue', 'm,l,x', 100, 1),
(26, 'DENIM BERMUDA SHORTS', 'FADED-EFFECT BERMUDA SHORTS MADE OF STRETCHY DENIM. FEATURING A FIVE-POCKET DESIGN, A ZIP FLY AND METAL TOP BUTTON FASTENING.\r\n', 1990, 'Khaki ', 'm,l,x', 100, 2),
(27, 'SOFT DENIM BERMUDA SHORTS', 'BERMUDA SHORTS FEATURING AN ELASTIC DRAWSTRING WAISTBAND. FRONT POCKETS AND BACK POCKETS. FADED EFFECT.', 2790, 'Blue', 'm,l,xl', 100, 2),
(28, 'SKATE FIT DENIM BERMUDA SHORTS', 'FIVE-POCKET LOOSE-FIT BERMUDA SHORTS. FADED EFFECT. FRONT BUTTON FASTENING.', 2590, 'Mid-blue', 'm,l,xl', 100, 2),
(29, 'SPALDING COLOUR BLOCK SWEATSHIRT', 'OVERSIZE SWEATSHIRT WITH A ROUND NECKLINE AND LONG SLEEVES. SPALDING Â© RUSSELL BRANDS LLC 2021 SLOGAN DETAIL ON THE FRONT. RIBBED TRIMS.', 4590, 'Faded blue', 'm,l,xl', 100, 1),
(30, 'YALE UNIVERSITY SWEATSHIRT', 'LOOSE-FITTING SWEATSHIRT WITH A ROUND NECKLINE, LONG SLEEVES, â¢ YALE UNIVERSITY PRINT ON THE FRONT AND RIBBED TRIMS.', 2990, 'Navy blue', 'm,l,xl', 100, 1),
(31, 'YALE UNIVERSITY LOGO HOODIE', 'LOOSE-FITTING HOODIE WITH AN ADJUSTABLE DRAWSTRING COLLAR AND LONG SLEEVES. FEATURING A FRONT POUCH POCKET, A YALE â¢ YALE UNIVERSITY LOGO PRINT AND RIBBED TRIMS.', 3990, 'EcruÂ ', 'm,l,xl', 100, 1),
(32, 'KNIT TOP WITH HIGH COLLAR', 'SLEEVELESS TOP WITH A TURTLENECK.', 1990, 'Pastel pink', 'm,l,xl', 100, 4),
(33, 'BUTTONED JUMPSUIT', 'JUMPSUIT WITH A STRAIGHT NECKLINE AND WIDE STRAPS. PRONOUNCED SEAMS ON THE FRONT. FRONT ZIP AND METAL BUTTON FASTENING.', 4590, 'Black', 'm,l,xl', 100, 4),
(35, 'TEXTURED TROUSERS WITH TURN-UP HEMS', 'HIGH-WAIST TROUSERS WITH AN ELASTIC WAISTBAND. FEATURING SIDE IN-SEAM POCKETS AND TURN-UP HEMS.', 2990, 'Light grey', 'm,l,xl', 100, 5),
(36, 'COLLARED CROPPED WAISTCOAT', 'CROPPED WAISTCOAT WITH A COLLAR. FRONT WELT POCKETS. FRONT BUTTON FASTENING.', 2990, 'BlackÂ ', 'm,l,xl', 100, 4),
(37, 'MASCULINE WIDE-LEG TROUSERS', 'HIGH-WAIST WIDE-LEG TROUSERS WITH ELASTIC TRIM AT THE BACK OF THE WAISTBAND. FRONT POCKETS AND A FALSE REAR WELT POCKET.', 2990, 'Black', 'm,l,xl', 120, 5),
(38, 'UNIQUE TROUSERS', 'HIGH-WAIST TROUSERS WITH SIDE POCKETS AND REAR WELT POCKETS. FRONT DARTS. WIDE-LEG DESIGN. FRONT METAL HOOK, BUTTON AND ZIP FLY FASTENING.', 2791, 'Khaki', 'm,l,xl', 100, 5),
(39, 'PRINTED BLOUSE WITH PLEATS', 'COLLARED V-NECK BLOUSE FEATURING LONG CUFFED SLEEVES, FRONT PLEATS AND A BUTTON-UP FRONT.', 2990, 'LeopardÂ ', 'm,l,xl', 200, 4),
(40, 'PRINTED SHIRT', 'SEMI-SHEER COLLARED SHIRT FEATURING LONG SLEEVES WITH CUFFS AND A BUTTON-UP FRONT.', 2990, 'Black', 'm,l,xl', 100, 4),
(41, 'OXFORD SHIRT', 'COLLARED V-NECK SHIRT WITH LONG SLEEVES AND A BUTTON-UP FRONT.', 2590, 'Blue / Indigo', 'm,l,xl', 100, 4),
(42, 'EMBROIDERED ROMANTIC TOP', 'BLOUSE WITH A HIGH COLLAR AND LONG SLEEVES. LACE TRIMS. BUTTONED OPENING AT THE BACK.', 2990, '2,990.00', 'm,l,xl', 100, 4),
(44, 'ZW THE 90Â´S MOM FIT JEANS', 'MOM FIT - SLIM LEG - HIGH WAIST', 2990, 'BlueÂ ', 'm,l,xl', 100, 5),
(45, 'ZW THE SKINNY JEANS', 'FADED MID-WAIST JEANS WITH FIVE POCKETS. ZIP FLY AND METAL BUTTON FASTENING.', 2990, 'BlackÂ ', 'm,l,xl', 100, 5),
(46, 'BASIC SLIM FIT T-SHIRT', 'STRETCH COTTON T-SHIRT FEATURING A ROUND NECK AND SHORT SLEEVES.', 990, 'Navy blue', 'm,l,xl', 100, 1),
(49, 'RIPPED SKINNY JEANS', 'SKINNY FIT JEANS FEATURING A FIVE-POCKET DESIGN, FADED AND RIPPED DETAIL ON THE LEGS AND ZIP FLY AND METAL TOP BUTTON FASTENING.', 4590, 'Sky blue', 'm,l,xl', 100, 2),
(50, 'CORDUROY TROUSERS', 'RELAXED FIT TROUSERS WITH A FIVE-POCKET DESIGN, A ZIP FLY AND BUTTON FASTENING.', 2790, 'BROWN', 'm,l,xl', 100, 2),
(51, 'CLASSY TROUSERS', 'RELAXED FIT TROUSERS WITH A FIVE-POCKET DESIGN, A ZIP FLY AND BUTTON FASTENING.', 2790, 'GREY', 'm,l,xl', 100, 2),
(52, 'FLARED TROUSERS - SPECIAL EDITION', 'HIGH-WAIST TROUSERS WITH FRONT POCKETS AND FALSE REAR WELT POCKETS. FLARED HEM. FRONT FASTENING WITH METAL HOOK, INSIDE BUTTON AND ZIP FLY.', 2990, 'BROWN', 'm,l,xl', 100, 5),
(53, 'MINI FLARE LEGGINGS', 'HIGH-WAIST LEGGINGS WITH PRONOUNCED SEAM DETAIL. FLARED HEMS. ZIP FLY AND METAL HOOK FASTENING', 2590, 'Black', 'm,l,xl', 100, 5),
(54, 'NEEDLECORD TOP WITH VOLUMINOUS SLEEVES', 'CROP TOP WITH A ROUND NECKLINE AND BALLOON SLEEVES FALLING BELOW THE ELBOW WITH ELASTIC CUFFS. INVISIBLE BACK ZIP AND BUTTONED OPENING.', 2590, 'Purple', 'm,l,xl', 100, 4),
(55, 'BASIC TAPERED JEANS', 'FADED-EFFECT SKINNY JEANS WITH A FIVE-POCKET DESIGN. FRONT ZIP FLY AND TOP BUTTON FASTENING.', 2990, 'Light Blue', 'm,l,xl', 100, 2),
(56, 'BAGGY PAPERBAG JEANS', 'HIGH-WAIST JEANS WITH AN ELASTIC WAISTBAND AND GATHERING, FRONT POCKETS, REAR PATCH POCKETS AND TURN-UP HEMS. ZIP FLY AND METAL TOP BUTTON', 2790, 'Indigo', 'm,l,xl', 120, 5);

-- --------------------------------------------------------

--
-- Table structure for table `productimage`
--

CREATE TABLE `productimage` (
  `imageid` int(11) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `image2` varchar(200) DEFAULT NULL,
  `image3` varchar(200) DEFAULT NULL,
  `Productid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productimage`
--

INSERT INTO `productimage` (`imageid`, `image`, `image2`, `image3`, `Productid`) VALUES
(9, 'sixthproduct1.jpg', 'sixthproduct2.jpg', 'sixthproduct3.jpg', 9),
(14, 'eigthproduct1.jpg', 'eigthproduct2.jpg', 'eigthproduct3.jpg', 11),
(15, 'seventhproduct1.jpg', 'seventhproduct2.jpg', 'seventhproduct3.jpg', 10),
(25, 'secondproduct1.jpg', 'secondproduct2.jpg', 'secondproduct3.jpg', 5),
(26, 'fifthproduct1.jpg', 'fifthproduct2.jpg', 'fifthproduct3.jpg', 25),
(27, 'bermuda1.jpg', 'bermuda2.jpg', 'bermuda3.jpg', 26),
(28, '5862331400_6_1_1.jpg', '5862331400_6_2_1.jpg', '5862331400_6_3_1.jpg', 27),
(29, '100000001333.jpg', '100000001335.jpg', '100000001344.jpg', 28),
(30, 'shirt1.jpg', 'shirt2.jpg', 'shirt3.jpg', 29),
(31, '600000014.jpg', '600000039.jpg', '600000041.jpg', 30),
(32, '100000001493.jpg', '700000034.jpg', '100000001493.jpg', 31),
(33, '900001195.jpg', '900000020.jpg', '900001195.jpg', 32),
(34, '1000000016.jpg', '1000000033.jpg', '1000000035.jpg', 33),
(36, '100000003638.jpg', '1200000021.jpg', '100000003639.jpg', 35),
(37, '1300000016.jpg', '1300000031.jpg', '1300000035.jpg', 36),
(38, '1400000014.jpg', '1400000039.jpg', '1400000049.jpg', 37),
(39, '1500000015.jpg', '1500000032.jpg', '1500000038.jpg', 38),
(40, '100000002737.jpg', '1700000022.jpg', '1700000019.jpg', 39),
(41, '1800000010.jpg', '1800000011.jpg', '1800000019.jpg', 40),
(42, '1900000020.jpg', '1900000025.jpg', '1900000028.jpg', 41),
(43, '2000000016.jpg', '2000000018.jpg', '2000000022.jpg', 42),
(45, '2200000019.jpg', '2200000046.jpg', '100000002098.jpg', 44),
(46, '2500000014.jpg', '2500000020.jpg', '2500000023.jpg', 45),
(47, '5584400401_2_3_1.jpg', '5584400401_2_1_1.jpg', '5584400401_1_1_1.jpg', 46),
(50, '5585353436_1_1_1.jpg', '5585353436_6_1_1.jpg', '5585353436_6_3_1.jpg', 49),
(51, '8727306700_6_1_1.jpg', '8727306700_2_3_1.jpg', '8727306700_1_1_1.jpg', 50),
(52, 'tr1.jpg', 'tr2.jpg', 'tr3.jpg', 51),
(53, '9204395700_1_1_1.jpg', '9204395700_2_3_1.jpg', '9204395700_2_4_1.jpg', 52),
(54, '5427213800_1_1_1.jpg', '5427213800_2_3_1.jpg', '5427213800_6_1_1.jpg', 53),
(55, '8576910629_1_1_1.jpg', '8576910629_2_3_1.jpg', '8576910629_6_1_1.jpg', 54),
(56, '0840400406_1_1_1.jpg', '0840400406_6_1_1.jpg', '0840400406_6_3_1.jpg', 55),
(57, '5862168405_1_1_1.jpg', '5862168405_2_1_1.jpg', '5862168405_6_1_1.jpg', 56);

-- --------------------------------------------------------

--
-- Table structure for table `useraddress`
--

CREATE TABLE `useraddress` (
  `addressid` int(11) NOT NULL,
  `Userid` int(11) DEFAULT NULL,
  `Address1` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `useraddress`
--

INSERT INTO `useraddress` (`addressid`, `Userid`, `Address1`) VALUES
(1, 2, 'abc floor, abc 115'),
(2, 5, ''),
(3, 10, 'Def Appt. 2nd Floor 116, Rajkot, 361005, Gujarat.India.');

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE `userdetails` (
  `userid` int(11) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `UserPassword` varchar(255) NOT NULL,
  `UserEmail` varchar(255) NOT NULL,
  `UserPhNo` varchar(10) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`userid`, `UserName`, `UserPassword`, `UserEmail`, `UserPhNo`, `isAdmin`) VALUES
(1, 'user1', 'user1', '', '0', 0),
(2, 'user2', 'user2', 'viveksantani17@gmail.com', '1234567890', 0),
(5, 'user3', 'user3', 'user3@gmail.com', '4567891230', 0),
(6, 'Admin', 'Admin', 'urbancloset4321@gmail.com', '9090275237', 1),
(10, 'user4', 'user4', 'user4@gmail.com', '7778889991', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlistid` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `ProductId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlistid`, `UserId`, `ProductId`) VALUES
(59, 2, 5),
(61, 5, 5),
(74, 2, 10),
(75, 2, 46),
(76, 2, 55),
(77, 2, 49);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorydetails`
--
ALTER TABLE `categorydetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CategoryId` (`CategoryId`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `FK_userId1` (`Userid`),
  ADD KEY `FK_addressid1` (`Addressid`),
  ADD KEY `FK_statusid1` (`Statusid`);

--
-- Indexes for table `orderedproduct`
--
ALTER TABLE `orderedproduct`
  ADD PRIMARY KEY (`orderedproductid`),
  ADD KEY `FK_productidll` (`Productid`),
  ADD KEY `FK_orderid12` (`Orderid`);

--
-- Indexes for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`statusid`);

--
-- Indexes for table `productdetails`
--
ALTER TABLE `productdetails`
  ADD PRIMARY KEY (`productid`),
  ADD KEY `Categoryid` (`Categoryid`);

--
-- Indexes for table `productimage`
--
ALTER TABLE `productimage`
  ADD PRIMARY KEY (`imageid`),
  ADD KEY `Productid` (`Productid`);

--
-- Indexes for table `useraddress`
--
ALTER TABLE `useraddress`
  ADD PRIMARY KEY (`addressid`),
  ADD KEY `FK_userid` (`Userid`);

--
-- Indexes for table `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlistid`),
  ADD KEY `ProductId` (`ProductId`),
  ADD KEY `UserId` (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorydetails`
--
ALTER TABLE `categorydetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orderedproduct`
--
ALTER TABLE `orderedproduct`
  MODIFY `orderedproductid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `orderstatus`
--
ALTER TABLE `orderstatus`
  MODIFY `statusid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `productdetails`
--
ALTER TABLE `productdetails`
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `productimage`
--
ALTER TABLE `productimage`
  MODIFY `imageid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `useraddress`
--
ALTER TABLE `useraddress`
  MODIFY `addressid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userdetails`
--
ALTER TABLE `userdetails`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlistid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categorydetails`
--
ALTER TABLE `categorydetails`
  ADD CONSTRAINT `categorydetails_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `categorydetails` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_addressid1` FOREIGN KEY (`Addressid`) REFERENCES `useraddress` (`addressid`),
  ADD CONSTRAINT `FK_statusid1` FOREIGN KEY (`Statusid`) REFERENCES `orderstatus` (`statusid`),
  ADD CONSTRAINT `FK_userId1` FOREIGN KEY (`Userid`) REFERENCES `userdetails` (`userid`);

--
-- Constraints for table `orderedproduct`
--
ALTER TABLE `orderedproduct`
  ADD CONSTRAINT `FK_orderid12` FOREIGN KEY (`Orderid`) REFERENCES `order` (`orderid`),
  ADD CONSTRAINT `FK_productidll` FOREIGN KEY (`Productid`) REFERENCES `productdetails` (`productid`);

--
-- Constraints for table `productdetails`
--
ALTER TABLE `productdetails`
  ADD CONSTRAINT `productdetails_ibfk_1` FOREIGN KEY (`Categoryid`) REFERENCES `categorydetails` (`id`);

--
-- Constraints for table `productimage`
--
ALTER TABLE `productimage`
  ADD CONSTRAINT `productimage_ibfk_1` FOREIGN KEY (`Productid`) REFERENCES `productdetails` (`productid`);

--
-- Constraints for table `useraddress`
--
ALTER TABLE `useraddress`
  ADD CONSTRAINT `FK_userid` FOREIGN KEY (`Userid`) REFERENCES `userdetails` (`userid`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `productdetails` (`productid`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `userdetails` (`userid`),
  ADD CONSTRAINT `wishlist_ibfk_3` FOREIGN KEY (`UserId`) REFERENCES `userdetails` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
