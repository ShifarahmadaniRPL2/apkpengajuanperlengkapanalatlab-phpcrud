-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 06, 2026 at 12:59 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengajuanperlengkapanalatlab`
--

-- --------------------------------------------------------

--
-- Table structure for table `alat`
--

CREATE TABLE `alat` (
  `idalat` int NOT NULL,
  `idkategori` int NOT NULL,
  `idsuplier` int NOT NULL,
  `namaalat` varchar(50) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `spesifikasiteknis` text NOT NULL,
  `stok` int NOT NULL,
  `hargaestimasi` int NOT NULL,
  `fotoalat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alat`
--

INSERT INTO `alat` (`idalat`, `idkategori`, `idsuplier`, `namaalat`, `merk`, `spesifikasiteknis`, `stok`, `hargaestimasi`, `fotoalat`) VALUES
(1, 1, 1, 'Komputer PC', 'ASUS', '', 5, 15000000, 'pc_asus_rog.jpg'),
(2, 1, 1, 'Komputer PC', 'Lenovo', '', 5, 13500000, 'pc_lenovo_legion.jpg'),
(3, 1, 2, 'Laptop Lab', 'HP', '', 10, 11000000, 'laptop_hp_pav.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `detailpengajuan`
--

CREATE TABLE `detailpengajuan` (
  `iddetailpengajuan` int NOT NULL,
  `idpengajuan` int NOT NULL,
  `idalat` int NOT NULL,
  `jumlahdiajukan` int NOT NULL,
  `kegunaan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detailpengajuan`
--

INSERT INTO `detailpengajuan` (`iddetailpengajuan`, `idpengajuan`, `idalat`, `jumlahdiajukan`, `kegunaan`) VALUES
(1, 1, 2, 20, ''),
(2, 2, 3, 15, ''),
(3, 3, 1, 10, ''),
(4, 1, 2, 20, ''),
(5, 2, 3, 15, ''),
(6, 3, 1, 10, '');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int NOT NULL,
  `namakategori` varchar(50) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkategori`, `namakategori`, `keterangan`) VALUES
(1, 'Perangkat Keras', 'Komputer, printer, dan komponen fisik'),
(2, 'Perangkat Lunak', 'Sistem operasi, aplikasi, dan lisensi'),
(3, 'Alat Jaringan', 'Router, switch, access point, dan kabel LAN');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan`
--

CREATE TABLE `pengajuan` (
  `idpengajuan` int NOT NULL,
  `iduser` int NOT NULL,
  `nopengajuan` varchar(50) NOT NULL,
  `tanggalpengajuan` date NOT NULL,
  `catatansarana` varchar(100) NOT NULL,
  `statuspengajuan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pengajuan`
--

INSERT INTO `pengajuan` (`idpengajuan`, `iduser`, `nopengajuan`, `tanggalpengajuan`, `catatansarana`, `statuspengajuan`) VALUES
(1, 1, 'P001', '2026-09-29', 'Butuh komputer spek tinggi', 'Proses'),
(2, 2, 'P002', '2026-09-30', 'Butuh proyektor dan koneksi internet stabil', 'Disetujui'),
(3, 3, 'P003', '2026-10-01', 'Ruangan mohon dibuka 15 menit sebelum acara', 'Proses');

-- --------------------------------------------------------

--
-- Table structure for table `percobaan`
--

CREATE TABLE `percobaan` (
  `idpercobaan` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suplier`
--

CREATE TABLE `suplier` (
  `idsuplier` int NOT NULL,
  `namasuplier` varchar(50) NOT NULL,
  `nohp` char(14) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `suplier`
--

INSERT INTO `suplier` (`idsuplier`, `namasuplier`, `nohp`, `alamat`) VALUES
(1, 'Sukma Wijaya', '082398182739', 'Medan'),
(2, 'Andre Kusuma', '082145678907', 'Kisaran'),
(3, 'Acong', '081667543411', 'Kuala Simpang');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int NOT NULL,
  `namalengkap` varchar(30) NOT NULL,
  `username` varchar(50) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `role` enum('petugas','guru') NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `nohp` varchar(14) NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `namalengkap`, `username`, `Password`, `jabatan`, `role`, `alamat`, `nohp`, `foto`) VALUES
(1, 'Shifa Rahmadani', 'shifa.rmd', 'shifasecret99', 'Guru', 'petugas', 'Jl. Karang Baru No. 12', '081368104233', 'shifa_avatar_91823.jpg'),
(2, 'Nurul Hidayah', 'nurul.nrl', 'nurulpass77', 'Guru', 'petugas', 'Jl. Tamiang Raya No. 45', '085672345690', 'nurul_profile_77261.jpg'),
(3, 'Zhulaika Putri', 'zhu.laika', 'zhupassword45', 'admin ', 'petugas', 'medang ara ', '081269389167', 'zhulaika_img_45102.jpg'),
(4, ' gabrielalvaro', ' gabrielalvro', ' gab1234', ' kajur', 'petugas', ' jawatengah', ' 086276578910', ' gabriel.png'),
(5, ' gabrielalvaro', ' gabrielalvro', ' gab1234', ' kajur', 'petugas', ' jawatengah', ' 086276578910', ' gabriel.png'),
(6, ' gabrielalvaro', ' gabrielalvro', ' gab1234', ' kajur', 'petugas', ' jawatengah', ' 086276578910', ' gabriel.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alat`
--
ALTER TABLE `alat`
  ADD PRIMARY KEY (`idalat`),
  ADD KEY `idkategori` (`idkategori`),
  ADD KEY `idsuplier` (`idsuplier`);

--
-- Indexes for table `detailpengajuan`
--
ALTER TABLE `detailpengajuan`
  ADD PRIMARY KEY (`iddetailpengajuan`),
  ADD KEY `idpengajuan` (`idpengajuan`),
  ADD KEY `idalat` (`idalat`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indexes for table `pengajuan`
--
ALTER TABLE `pengajuan`
  ADD PRIMARY KEY (`idpengajuan`),
  ADD KEY `iduser` (`iduser`);

--
-- Indexes for table `suplier`
--
ALTER TABLE `suplier`
  ADD PRIMARY KEY (`idsuplier`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alat`
--
ALTER TABLE `alat`
  MODIFY `idalat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detailpengajuan`
--
ALTER TABLE `detailpengajuan`
  MODIFY `iddetailpengajuan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengajuan`
--
ALTER TABLE `pengajuan`
  MODIFY `idpengajuan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `suplier`
--
ALTER TABLE `suplier`
  MODIFY `idsuplier` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alat`
--
ALTER TABLE `alat`
  ADD CONSTRAINT `alat_ibfk_1` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `alat_ibfk_2` FOREIGN KEY (`idsuplier`) REFERENCES `suplier` (`idsuplier`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `detailpengajuan`
--
ALTER TABLE `detailpengajuan`
  ADD CONSTRAINT `detailpengajuan_ibfk_1` FOREIGN KEY (`idpengajuan`) REFERENCES `pengajuan` (`idpengajuan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detailpengajuan_ibfk_2` FOREIGN KEY (`idalat`) REFERENCES `alat` (`idalat`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `pengajuan`
--
ALTER TABLE `pengajuan`
  ADD CONSTRAINT `pengajuan_ibfk_1` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
