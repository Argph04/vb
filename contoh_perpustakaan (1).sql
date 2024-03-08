-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2024 at 11:36 AM
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
-- Database: `contoh_perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `tahun_terbit` int(11) NOT NULL,
  `ketersediaan_buku` enum('Tersedia','Tidak Tersedia') NOT NULL,
  `harga` int(11) NOT NULL,
  `lokasi` varchar(30) NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `id_kategori`, `judul`, `penulis`, `penerbit`, `tahun_terbit`, `ketersediaan_buku`, `harga`, `lokasi`, `gambar`) VALUES
(1, 1, 'Solo Leveling', 'Chu-gong', 'D&C Media', 2016, 'Tersedia', 68000, 'Jakarta Pusat', 'C:\\Users\\edyli\\Documents\\Arga P\\perpus_arga\\solo.jpg'),
(2, 1, 'One piece', 'Oda Sensei', 'Weekly Shonen Jump', 1999, 'Tersedia', 36000, 'Jakarta Pusat', 'C:\\Users\\edyli\\Documents\\Arga P\\perpus_arga\\onepiece1.jpg'),
(3, 1, 'Mashle: Magic and Muscles', 'Hajime Komoto', 'Elex Media Komputind', 2022, 'Tersedia', 36000, 'Jakarta Pusat', 'C:\\Users\\edyli\\Documents\\Arga P\\perpus_arga\\mashle1.jpg'),
(4, 1, 'Jujutsu Kaisen', 'Gege Akutami', 'Shueisha', 2018, 'Tersedia', 34000, 'Jakarta Pusat', 'C:\\Users\\edyli\\Documents\\Arga P\\perpus_arga\\jjk.jpg'),
(5, 1, 'Demon Slayer: Kimetsu no Yaiba', 'Koyoharu Gotoge', 'Aniplex ', 2019, 'Tersedia', 40000, 'Jakarta Pusat', 'C:\\Users\\edyli\\Documents\\Arga P\\perpus_arga\\kny.jpg'),
(6, 1, 'Kimetsu no Yaiba - The Movie: Mugen Train', 'Koyoharu Gotouge', 'Aniplex', 2020, 'Tersedia', 60000, 'Jakarta Pusat', 'C:\\Users\\edyli\\Documents\\Arga P\\perpus_arga\\mt.jpg'),
(7, 1, 'Kimetsu no Yaiba Entertainment District Arc', 'Koyoharu Gotouge', 'Aniplex', 2022, 'Tersedia', 60000, 'Jakarta Pusat', 'C:\\Users\\edyli\\Documents\\Arga P\\perpus_arga\\s2.jpg'),
(8, 1, 'Kimetsu no Yaiba Swordsmith Village Arc', 'Koyoharu Gotouge', 'Aniplex', 2023, 'Tersedia', 65000, 'Jakarta Pusat', 'C:\\Users\\edyli\\Documents\\Arga P\\perpus_arga\\ktn.jpg'),
(9, 1, 'Ninja Kamui', 'Williams Street', 'E&H Production', 2023, 'Tersedia', 50000, 'Jakarta Pusat', 'C:\\Users\\edyli\\Documents\\Arga P\\perpus_arga\\nk.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_buku`
--

CREATE TABLE `kategori_buku` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_buku`
--

INSERT INTO `kategori_buku` (`id_kategori`, `nama_kategori`) VALUES
(1, 'fiksi'),
(2, 'legenda');

-- --------------------------------------------------------

--
-- Table structure for table `koleksi_pribadi`
--

CREATE TABLE `koleksi_pribadi` (
  `id_koleksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `koleksi_pribadi`
--

INSERT INTO `koleksi_pribadi` (`id_koleksi`, `id_user`, `id_buku`) VALUES
(5, 1, 101),
(4, 1, 102),
(2, 111, 101),
(9, 240208001, 1);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `tanggal_peminjaman` date NOT NULL,
  `jatuh_tempo` date NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `status_peminjaman` enum('dipinjam','dikembalikan') NOT NULL,
  `denda` int(11) NOT NULL,
  `dibayar` int(11) NOT NULL,
  `kembali` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_user`, `id_buku`, `tanggal_peminjaman`, `jatuh_tempo`, `tanggal_pengembalian`, `status_peminjaman`, `denda`, `dibayar`, `kembali`) VALUES
(240128001, 1, 101, '2024-01-28', '2024-02-04', '2024-01-28', 'dikembalikan', 0, 0, 0),
(240128002, 1, 101, '2024-01-28', '2024-02-04', '2024-02-21', 'dipinjam', 10000, 0, 0),
(240204001, 111, 101, '2024-02-04', '2024-02-11', '0000-00-00', 'dipinjam', 0, 0, 0),
(240211001, 240208001, 1, '2024-02-11', '2024-02-18', '2024-02-11', 'dikembalikan', 0, 0, 0),
(240211002, 240208001, 1, '2024-02-11', '2024-02-01', '2024-02-11', 'dikembalikan', 50000, 0, 0),
(240211003, 240208001, 123, '2024-02-11', '2024-02-18', '2024-02-11', 'dikembalikan', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ulasan_buku`
--

CREATE TABLE `ulasan_buku` (
  `id_ulasan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `ulasan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ulasan_buku`
--

INSERT INTO `ulasan_buku` (`id_ulasan`, `id_user`, `id_buku`, `ulasan`) VALUES
(2, 240208001, 101, 'coba ulasan'),
(3, 240208001, 1, 'tes ulasan'),
(4, 240208001, 1, 'coba ulasan');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('admin','petugas','peminjam') NOT NULL,
  `email` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `no_telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_lengkap`, `password`, `status`, `email`, `alamat`, `no_telepon`) VALUES
(1, 'Arga Phurwanto', '123', 'admin', 'arga@gmail.com', 'ujung harapan', '088223990651'),
(2, 'Andi', '123', 'admin', 'andi@gmail.com', 'marakash', '085723238257'),
(3, 'Abbas', '123', 'petugas', 'abbas@gmail.com', 'vip', '088520170619'),
(4, 'Rum', '123', 'petugas', 'rum@gmail.com', 'pup', '08896343799'),
(5, 'Ibnu', '123', 'peminjam', 'ibnu@gmail.com', 'sektor 5', '08827729368'),
(6, 'fadli', '123', 'peminjam', 'fadli@gmail.com', 'Glodok Plaza', '0828003703447');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `kategori_buku`
--
ALTER TABLE `kategori_buku`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `koleksi_pribadi`
--
ALTER TABLE `koleksi_pribadi`
  ADD PRIMARY KEY (`id_koleksi`),
  ADD KEY `id_user` (`id_user`,`id_buku`),
  ADD KEY `koleksi_pribadi_ibfk_1` (`id_buku`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_user` (`id_user`,`id_buku`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `ulasan_buku`
--
ALTER TABLE `ulasan_buku`
  ADD PRIMARY KEY (`id_ulasan`),
  ADD KEY `id_user` (`id_user`,`id_buku`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `kategori_buku`
--
ALTER TABLE `kategori_buku`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `koleksi_pribadi`
--
ALTER TABLE `koleksi_pribadi`
  MODIFY `id_koleksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240211004;

--
-- AUTO_INCREMENT for table `ulasan_buku`
--
ALTER TABLE `ulasan_buku`
  MODIFY `id_ulasan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240305002;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
