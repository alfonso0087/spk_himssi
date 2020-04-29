-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2020 at 11:46 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spk_himmsi`
--

-- --------------------------------------------------------

--
-- Table structure for table `alternatif`
--

CREATE TABLE `alternatif` (
  `id_alternatif` int(11) NOT NULL,
  `kode_alternatif` char(3) NOT NULL,
  `nim` char(10) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `jenkel` varchar(10) NOT NULL,
  `prodi` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `foto` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alternatif`
--

INSERT INTO `alternatif` (`id_alternatif`, `kode_alternatif`, `nim`, `nama`, `jenkel`, `prodi`, `email`, `foto`) VALUES
(1, 'A1', '17.12.0087', 'Alfonso Aryando', 'Laki-laki', 'Sistem Informasi', 'alfonso.0087@students.amikom.ac.id', 'WhatsApp_Image_2020-03-15_at_20_09_20.jpeg'),
(2, 'A2', '17.02.0071', 'Indra Rasendriya', 'Laki-laki', 'Manajemen Informatika', 'indra@students.amikom.ac.id', 'WhatsApp_Image_2020-03-15_at_20_09_20.jpeg'),
(3, 'A3', '17.12.0111', 'Hesti Nur A', 'Perempuan', 'Sistem Informasi', 'hesti.a@students.amikom.ac.id', 'dps.jpg'),
(4, 'A4', '17.02.0093', 'Sabda Dwi Untoro', 'Laki-laki', 'Manajemen Informatika', 'sabda.0093@students.amikom.ac.id', '643485.jpg'),
(5, 'A5', '17.12.0103', 'Muhammad Paliya Sadana', 'Laki-laki', 'Sistem Informasi', 'sadana@students.amikom.ac.id', '522623.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kecocokan`
--

CREATE TABLE `kecocokan` (
  `id_nilai` int(11) NOT NULL,
  `id_alternatif` int(11) NOT NULL,
  `C1` double NOT NULL,
  `C2` double NOT NULL,
  `C3` double NOT NULL,
  `C4` double NOT NULL,
  `C5` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kecocokan`
--

INSERT INTO `kecocokan` (`id_nilai`, `id_alternatif`, `C1`, `C2`, `C3`, `C4`, `C5`) VALUES
(1, 1, 3, 2, 1, 3, 3),
(2, 2, 1, 3, 3, 3, 2),
(3, 3, 3, 2, 3, 3, 1),
(4, 4, 1, 2, 3, 1, 1),
(5, 5, 3, 3, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id` int(11) NOT NULL,
  `kode_kriteria` char(3) NOT NULL,
  `nama_kriteria` varchar(128) NOT NULL,
  `attribut` varchar(128) NOT NULL,
  `bobot` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id`, `kode_kriteria`, `nama_kriteria`, `attribut`, `bobot`) VALUES
(38, 'C1', 'Keaktifan', 'Benefit', 4),
(39, 'C2', 'Semester', 'Cost', 2),
(40, 'C3', 'IPK', 'Benefit', 3),
(41, 'C4', 'Riwayat Organisasi', 'Benefit', 4),
(42, 'C5', 'Prestasi', 'Benefit', 2);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_alternatif` int(11) NOT NULL,
  `C1` varchar(128) NOT NULL,
  `C2` varchar(128) NOT NULL,
  `C3` varchar(128) NOT NULL,
  `C4` varchar(128) NOT NULL,
  `C5` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `id_alternatif`, `C1`, `C2`, `C3`, `C4`, `C5`) VALUES
(1, 1, 'Bagus', 'Cukup', 'Kurang', 'Bagus', 'Bagus'),
(2, 2, 'Kurang', 'Bagus', 'Bagus', 'Bagus', 'Cukup'),
(3, 3, 'Bagus', 'Cukup', 'Bagus', 'Bagus', 'Kurang'),
(4, 4, 'Kurang', 'Cukup', 'Bagus', 'Kurang', 'Kurang'),
(5, 5, 'Bagus', 'Bagus', 'Bagus', 'Bagus', 'Bagus');

-- --------------------------------------------------------

--
-- Table structure for table `ranking`
--

CREATE TABLE `ranking` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ranking`
--

INSERT INTO `ranking` (`id`, `kode`, `nama`, `total`) VALUES
(1, 'A1', 'Alfonso Aryando', 13),
(2, 'A2', 'Indra Rasendriya', 11),
(3, 'A3', 'Hesti Nur A', 13.7),
(4, 'A4', 'Sabda Dwi Untoro', 8.3),
(5, 'A5', 'Muhammad Paliya Sadana', 14.3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `foto` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `email`, `password`, `foto`, `role_id`, `date_created`) VALUES
(1, 'Alfonso Aryando S', 'alfonso@amikom.ac.id', '$2y$10$jQTVrmYgTCVm3tNdJBiW0eRG4EIUHrauVnyLE.XJ882p0MU2kGbDm', 'WhatsApp_Image_2020-03-18_at_10_12_551.jpeg', 1, 1585623010),
(8, 'Panitia', 'sandhika@unpas.ac.id', '$2y$10$pb2I.tdli3cCFIEnVlx8FOZwlTdu1Xu3YxASC720P/aHfaWi67wHu', 'default.jpg', 2, 1585625220);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(3, 2, 2),
(4, 1, 3),
(8, 1, 7),
(13, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'Panitia'),
(3, 'Menu'),
(7, 'Alternatif'),
(8, 'Perhitungan');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Panitia');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `sub_menu` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `sub_menu`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'My Profile', 'panitia', 'fas fa-fw fa-user', 1),
(3, 2, 'Ubah Profile', 'panitia/edit', 'fas fa-fw fa-user-edit', 1),
(4, 3, 'Pengaturan Menu', 'menu', 'fas fa-fw fa-cog', 1),
(5, 3, 'Pengaturan Sub Menu', 'menu/submenu', 'fas fa-fw fa-cogs', 1),
(8, 1, 'Kelola Pengguna', 'admin/role', 'fas fa-fw fa-user-tie', 1),
(9, 2, 'Ubah Password', 'panitia/ubahpassword', 'fas fa-fw fa-key', 1),
(10, 7, 'Data Alternatif', 'Alternatif', 'fas fa-fw fa-users', 1),
(11, 1, 'Data Kriteria', 'kriteria', 'fas fa-fw fa-list-ol', 1),
(12, 7, 'Nilai Aternatif', 'nilai', 'fas fa-fw fa-calculator', 1),
(13, 8, 'Rating Kecocokan', 'perhitungan/kecocokan', 'fas fa-fw fa-equals', 1),
(14, 8, 'Normalisasi', 'perhitungan/normalisasi', 'fas fa-fw fa-divide', 1),
(15, 8, 'Hasil Perankingan', 'perhitungan/perankingan', 'fas fa-fw fa-sort-numeric-down', 1),
(16, 1, 'Laporan', 'admin/laporan', 'fas fa-fw fa-table', 1),
(17, 2, 'Hasil Perankingan', 'panitia/laporan', 'fas fa-fw fa-sort-numeric-down', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id_alternatif`);

--
-- Indexes for table `kecocokan`
--
ALTER TABLE `kecocokan`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id_alternatif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kecocokan`
--
ALTER TABLE `kecocokan`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ranking`
--
ALTER TABLE `ranking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
