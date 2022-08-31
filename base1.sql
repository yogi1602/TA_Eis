-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2022 at 05:50 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `base1`
--

-- --------------------------------------------------------

--
-- Table structure for table `am`
--

CREATE TABLE `am` (
  `id_am` int(11) NOT NULL,
  `nama_am` varchar(50) DEFAULT NULL,
  `initial_am` varchar(3) DEFAULT NULL,
  `no_hp` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `am`
--

INSERT INTO `am` (`id_am`, `nama_am`, `initial_am`, `no_hp`, `alamat`) VALUES
(1, 'rekda', 'rka', '628778564', 'BANTEN'),
(2, 'hendra', 'hdn', '877854562', 'jakarta');

-- --------------------------------------------------------

--
-- Table structure for table `aproval`
--

CREATE TABLE `aproval` (
  `id_aproval` int(11) NOT NULL,
  `tanggal_aproval` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `noted` text DEFAULT NULL,
  `id_regist` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id_event` int(11) NOT NULL,
  `nama_event` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id_event`, `nama_event`) VALUES
(1, 'SENAM'),
(2, 'MEWARNAI');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id_level` int(11) NOT NULL,
  `nama_level` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id_level`, `nama_level`) VALUES
(1, 'admin'),
(2, 'supervisor'),
(3, 'manager');

-- --------------------------------------------------------

--
-- Table structure for table `registrasi_event`
--

CREATE TABLE `registrasi_event` (
  `id_registrasi` int(11) NOT NULL,
  `tanggal_pengajuan` date DEFAULT NULL,
  `estimasi_sales` int(11) DEFAULT NULL,
  `kode_toko` varchar(4) NOT NULL,
  `id_event` int(11) NOT NULL,
  `tanggal_event` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registrasi_event`
--

INSERT INTO `registrasi_event` (`id_registrasi`, `tanggal_pengajuan`, `estimasi_sales`, `kode_toko`, `id_event`, `tanggal_event`) VALUES
(1, '2022-06-01', 123456, 't70d', 2, '2022-08-07'),
(2, '2022-08-04', 345678956, 't70d', 1, '2022-08-08');

-- --------------------------------------------------------

--
-- Table structure for table `sales_event`
--

CREATE TABLE `sales_event` (
  `id_sales_event` int(11) NOT NULL,
  `sales` int(11) DEFAULT NULL,
  `tanggal_sales` date DEFAULT NULL,
  `kode_toko` varchar(4) DEFAULT NULL,
  `id_regist` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_event`
--

INSERT INTO `sales_event` (`id_sales_event`, `sales`, `tanggal_sales`, `kode_toko`, `id_regist`) VALUES
(1, 12345678, '2022-08-06', 't70d', 1);

-- --------------------------------------------------------

--
-- Table structure for table `spv`
--

CREATE TABLE `spv` (
  `id_as` int(11) NOT NULL,
  `nama_as` varchar(50) DEFAULT NULL,
  `initial_as` varchar(3) DEFAULT NULL,
  `no_hp` int(15) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spv`
--

INSERT INTO `spv` (`id_as`, `nama_as`, `initial_as`, `no_hp`, `alamat`) VALUES
(1, 'kupret', 'krt', 8462321, 'TANGERANG'),
(2, 'petrus', 'pts', 85464523, 'CILACAP');

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `kode` varchar(4) NOT NULL,
  `nama_toko` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `subdomain` varchar(255) DEFAULT NULL,
  `id_as` int(11) DEFAULT NULL,
  `id_am` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`kode`, `nama_toko`, `domain`, `subdomain`, `id_as`, `id_am`) VALUES
('t70d', 'dc tangerang 1', 'traffic', 'residential', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_level` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `id_level`, `created_at`) VALUES
(2, 'yogi', '$2y$10$VNe4sVCAOReYaAh02sRhROTAXnA0ixf7IDomEM9ibyP7ezIItu9ba', 1, NULL),
(3, 'angga', '123456', 2, NULL),
(4, 'cipto', '123456', 3, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `am`
--
ALTER TABLE `am`
  ADD PRIMARY KEY (`id_am`);

--
-- Indexes for table `aproval`
--
ALTER TABLE `aproval`
  ADD PRIMARY KEY (`id_aproval`),
  ADD UNIQUE KEY `id_regist` (`id_regist`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id_event`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD UNIQUE KEY `id_level` (`id_level`);

--
-- Indexes for table `registrasi_event`
--
ALTER TABLE `registrasi_event`
  ADD PRIMARY KEY (`id_registrasi`,`kode_toko`),
  ADD KEY `kode_toko` (`kode_toko`);

--
-- Indexes for table `sales_event`
--
ALTER TABLE `sales_event`
  ADD PRIMARY KEY (`id_sales_event`),
  ADD UNIQUE KEY `kode_toko` (`kode_toko`),
  ADD UNIQUE KEY `id_regist` (`id_regist`);

--
-- Indexes for table `spv`
--
ALTER TABLE `spv`
  ADD PRIMARY KEY (`id_as`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`kode`),
  ADD UNIQUE KEY `id_as` (`id_as`),
  ADD UNIQUE KEY `id_am` (`id_am`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `level` (`id_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aproval`
--
ALTER TABLE `aproval`
  MODIFY `id_aproval` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `registrasi_event`
--
ALTER TABLE `registrasi_event`
  MODIFY `id_registrasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales_event`
--
ALTER TABLE `sales_event`
  MODIFY `id_sales_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aproval`
--
ALTER TABLE `aproval`
  ADD CONSTRAINT `aproval_ibfk_1` FOREIGN KEY (`id_regist`) REFERENCES `registrasi_event` (`id_registrasi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `registrasi_event`
--
ALTER TABLE `registrasi_event`
  ADD CONSTRAINT `registrasi_event_ibfk_2` FOREIGN KEY (`kode_toko`) REFERENCES `toko` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_event`
--
ALTER TABLE `sales_event`
  ADD CONSTRAINT `sales_event_ibfk_1` FOREIGN KEY (`kode_toko`) REFERENCES `toko` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_event_ibfk_3` FOREIGN KEY (`id_regist`) REFERENCES `registrasi_event` (`id_registrasi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `toko`
--
ALTER TABLE `toko`
  ADD CONSTRAINT `toko_ibfk_1` FOREIGN KEY (`id_as`) REFERENCES `spv` (`id_as`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `toko_ibfk_2` FOREIGN KEY (`id_am`) REFERENCES `am` (`id_am`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
