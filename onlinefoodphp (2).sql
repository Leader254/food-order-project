-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2023 at 04:38 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinefoodphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adm_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `code` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adm_id`, `username`, `password`, `email`, `code`, `date`) VALUES
(1, 'admin', 'CAC29D7A34687EB14B37068EE4708E7B', 'admin2@mail.com', '', '2023-02-13 08:35:13');

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `d_id` int(222) NOT NULL,
  `rs_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `slogan` varchar(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`d_id`, `rs_id`, `title`, `slogan`, `price`, `img`) VALUES
(1, 1, 'Meat Balls', 'Meat Balls which melt in your mouth, and are quick and easy to make. Served hot with a crisp salad.', '300.00', 'meatballs.jpg'),
(2, 1, 'Kenyan Pilau', 'Pilau is a glorified combination of rice cooked with flavor bursting spices like cumin, cardamon, cinnamon, and cloves. The fragrant rice is fantastic to eat with a form of meat stew and a few slices of fresh tomato and on', '350.00', 'pilau.jpg'),
(3, 4, 'Kenyan Stew', 'Kenyan stew can include a number of different meats: beef stew, goat stew, chicken stew or any other animal stew. Kenyan stew dishes might also include a few other base vegetable ingredients such as carrots, peppers, peas,', '250.00', 'stew.jpg'),
(4, 1, 'Nyama Choma', 'Any Kenyan food list is not complete without a mention of nyama choma, also known as roasted meat. Goat and beef are the 2 most common forms of nyama choma, but chicken (kuku choma) and fish (samaki choma) are also valid c', '500.00', 'choma.jpg'),
(5, 2, 'Matoke', 'Plantain bananas are cooked up in a pot with some oil, tomatoes, onions, garlic, chilies, meat (optional), and lemon juice. The bananas are cooked until they become soft and begin to form a thick sauce with the other ingre', '180.00', 'matoke.jpg'),
(6, 2, 'Chapati (Flatbread)', 'Chapatis in Kenya can trace their origin from the influence of the Indian population. Kenyan style chapatis are made with a flour dough that is wound into a coil before being rolled into a flat round circle. The dough is t', '20.00', 'chapati.jpg'),
(7, 2, 'Crispy Chicken Strips', 'Fried chicken strips, served with special honey mustard sauce.', '250.00', '606d74f6ecbbb.jpg'),
(8, 2, 'Bhajias', 'Bhajias are usually served as a side dish at special occasions like weddings and parties, but they’re also great for snacking on any day of the week.', '100.00', 'bhajia.jpg'),
(9, 3, 'Masala Chips', 'The dish starts with a greasy plate of freshly deep fried french fries (chips).\r\nTomato sauce, chili sauce, herbs, cilantro, and whatever else the chef decides are all added to the fries, coating them in a luscious sauce t', '100.00', 'chips.jpg'),
(10, 3, 'Chips Mayai', 'It all begins with a plate of famous Kenyan chips that are placed in a frying pan before being covered in a generous amount of beaten egg and cooked through.Lather it up with a generous portion of chili tomato sauce and it', '150.00', 'chips-mayai.jpg'),
(11, 3, 'Spring Rolls', 'Lightly seasoned shredded cabbage, onion and carrots, wrapped in house made spring roll wrappers, deep fried to golden brown.', '200.00', '606d75ce105d0.jpg'),
(12, 3, 'Mandazi (Kenyan Doughnut)', 'They can be smelled from a kilometer down the street, that lovely familiar scent of a blob of deep frying dough.The smell is enough to entice anyone to make a mandatory mandazi stop. Mandazi’s make a great snack or a light', '20.00', 'mandazi.jpg'),
(13, 4, 'Burger', 'sandwich that typically consists of a cooked patty of ground meat (such as beef, chicken, turkey, or veggie) that is placed between two slices of bread, along with various toppings and condiments, such as cheese, lettuce, ', '150.00', 'burger.jpg'),
(14, 4, 'Samosas', 'small triangular pockets of spiced meat or vegetables put in a pastry wrapper and deep fried to a golden brown.Squeeze a sprinkle of lime juice on a samosa for ultimate enjoyment.', '30.00', 'samosa.jpg'),
(15, 4, 'Kenyan Fish(Tilapia)', 'Tilapia is widely eaten fish and very popular in Kenya because it is readily available and affordable. It is deep-fried and served with kachumbari, ugali, or pilau. This fish is rich in nutrients like vitamin A, omega-3 fa', '350.00', 'fish.jpg'),
(16, 1, 'Mukimo', 'Mukimo is a traditional Kenyan dish made from a mixture of mashed potatoes, cornmeal, green maize, and sometimes other ingredients like vegetables, spices, and legumes.', '150.00', '63fb7c338c19a.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_no` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `CheckoutRequestID` varchar(255) NOT NULL,
  `MerchantRequestID` varchar(255) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `MerchantRequestID` varchar(50) NOT NULL,
  `CheckoutRequestID` varchar(100) NOT NULL,
  `ResponseCode` int(2) NOT NULL,
  `ResponseDescription` varchar(255) NOT NULL,
  `CustomerMessage` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `remark`
--

CREATE TABLE `remark` (
  `id` int(11) NOT NULL,
  `frm_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `remark`
--

INSERT INTO `remark` (`id`, `frm_id`, `status`, `remark`, `remarkDate`) VALUES
(13, 10, 'in process', 'being delivered', '2023-02-12 11:42:30');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `rs_id` int(222) NOT NULL,
  `c_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `url` varchar(222) NOT NULL,
  `o_hr` varchar(222) NOT NULL,
  `c_hr` varchar(222) NOT NULL,
  `o_days` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `image` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`rs_id`, `c_id`, `title`, `email`, `phone`, `url`, `o_hr`, `c_hr`, `o_days`, `address`, `image`, `date`) VALUES
(1, 3, 'Leisure Palace', 'sam-orders21@mail.com', '0787654321', 'http://samuelorders.me/sam-portfolio/', '8am', '6pm', 'mon-sat', 'C74, Kutus- Kerugoya Rd, Kerugoya\r\nkutus', 'res1.jpg', '2023-02-13 05:19:46'),
(2, 2, 'My Plate', 'sam-orders21@mail.com', '0712345678', 'http://samuelorders.me/sam-portfolio/', '8am', '6pm', 'mon-sat', 'C74, Kutus- Kerugoya Rd, Kerugoya\r\nkutus', 'res2.jpg', '2023-02-13 05:19:59'),
(3, 1, 'Bobos Cafe', 'sam-orders21@mail.com', '0701234566', 'http://samuelorders.me/sam-portfolio/', '8am', '6pm', 'mon-sat', 'C74, Kutus- Kerugoya Rd, Kerugoya kutus', 'res3.jpg', '2023-02-13 05:23:38'),
(4, 4, 'Mum\'s Cafe', 'sam-orders21@mail.com', '0701234567', 'http://samuelorders.me/sam-portfolio/', '8am', '6pm', 'mon-sat', 'C74, Kutus- Kerugoya Rd, Kerugoya kutus', 'res4.jpg', '2023-02-13 05:22:50'),
(5, 3, 'One Stop', 'sam-orders21@mail.com', '0787654321', 'http://samuelorders.me/sam-portfolio/', '8am', '6pm', 'mon-sat', 'C74, Kutus- Kerugoya Rd, Kerugoya\r\nkutus', 'res5.jpg', '2023-02-13 05:20:41'),
(6, 4, 'Lagoon Place', 'sam-orders21@mail.com', '0701234567', 'http://samuelorders.me/sam-portfolio/', '8am', '6pm', 'mon-sat', 'C74, Kutus- Kerugoya Rd, Kerugoya kutus', 'res6.jpg', '2023-02-13 05:23:17');

-- --------------------------------------------------------

--
-- Table structure for table `res_category`
--

CREATE TABLE `res_category` (
  `c_id` int(222) NOT NULL,
  `c_name` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `res_category`
--

INSERT INTO `res_category` (`c_id`, `c_name`, `date`) VALUES
(1, 'Coastal\r\n', '2023-02-13 04:59:37'),
(3, 'Western', '2023-02-13 05:00:27'),
(4, 'Kikuyu Dishes', '2023-02-12 20:18:19'),
(5, 'Lake Dishes', '2023-02-12 20:07:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `f_name` varchar(222) NOT NULL,
  `l_name` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `status` int(222) NOT NULL DEFAULT 1,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `username`, `f_name`, `l_name`, `email`, `phone`, `password`, `address`, `status`, `date`) VALUES
(18, 'Samuel', 'Samuel', 'Wachira', 'samuelwachira219@gmail.com', '0705736628', 'c7cebdb9017146e16938cac1e0ff1d54', 'C74, Kutus- Kerugoya Rd, Kerugoya\r\nkutus', 1, '2023-02-20 06:54:09'),
(19, 'Samuell', 'Samuel', 'Wachira', 'samuelwachira21@gmail.com', '0705736628', '99ebccace3d2ff574a8cdbe574825cd4', 'C74, Kutus- Kerugoya Rd, Kerugoya\r\nkutus', 1, '2023-02-20 12:06:56'),
(20, 'Wachira', 'John', 'Doe', 'samuelwachira@gmail.com', '0705736628', '6e7b25c65f3b8236972268d1db95eacf', 'C74, Kutus- Kerugoya Rd, Kerugoya\r\nkutus', 1, '2023-03-13 07:28:18'),
(21, 'burt', 'joseph', 'gitau', 'crosetsw09@gmail.com', '+254724772046', 'b3ac56cdbd55e15628e6cab2918708d4', '10300, 10200\r\n10200', 1, '2023-03-13 08:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `users_orders`
--

CREATE TABLE `users_orders` (
  `o_id` int(222) NOT NULL,
  `u_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `quantity` int(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(222) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_orders`
--

INSERT INTO `users_orders` (`o_id`, `u_id`, `title`, `quantity`, `price`, `status`, `date`) VALUES
(20, 18, 'Kenyan Stew', 1, '250.00', NULL, '2023-02-20 09:04:05'),
(21, 19, 'Meat Balls', 1, '300.00', NULL, '2023-02-20 12:43:25'),
(22, 19, 'Kenyan Pilau', 3, '350.00', NULL, '2023-02-20 12:43:25'),
(23, 20, 'Meat Balls', 1, '300.00', NULL, '2023-03-13 07:35:30'),
(24, 21, 'Meat Balls', 1000001, '300.00', NULL, '2023-03-13 08:56:38'),
(25, 21, 'Meat Balls', 1, '300.00', NULL, '2023-03-13 08:59:41'),
(26, 21, 'Meat Balls', 2, '300.00', NULL, '2023-03-13 09:00:58'),
(27, 21, 'Meat Balls', 1, '300.00', NULL, '2023-03-13 09:29:29'),
(28, 21, 'Meat Balls', 2, '300.00', NULL, '2023-03-13 10:50:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `remark`
--
ALTER TABLE `remark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`rs_id`);

--
-- Indexes for table `res_category`
--
ALTER TABLE `res_category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `users_orders`
--
ALTER TABLE `users_orders`
  ADD PRIMARY KEY (`o_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `d_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `remark`
--
ALTER TABLE `remark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `rs_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `res_category`
--
ALTER TABLE `res_category`
  MODIFY `c_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users_orders`
--
ALTER TABLE `users_orders`
  MODIFY `o_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
