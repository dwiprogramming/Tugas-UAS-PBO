-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Des 2025 pada 11.20
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_wargari`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `kategori` varchar(20) NOT NULL,
  `harga` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `nama_menu`, `kategori`, `harga`, `status`) VALUES
(8, 'Es Jagung Original', 'MINUMAN', 5000, 'TERSEDIA'),
(9, 'Es Jagung Spesial', 'MINUMAN', 10000, 'TERSEDIA'),
(10, 'Es Ubi Ungu Spesial', 'MINUMAN', 10000, 'TERSEDIA'),
(11, 'Es Durian Kocok', 'MINUMAN', 15000, 'TERSEDIA'),
(12, 'Es Ubi Ungu Ori', 'MINUMAN', 9000, 'TERSEDIA'),
(13, 'Es Jagung Topping', 'MINUMAN', 7000, 'TERSEDIA'),
(14, 'Thai Tea', 'MINUMAN', 8000, 'TERSEDIA'),
(15, 'Greentea', 'MINUMAN', 8000, 'TERSEDIA'),
(16, 'Jeruk Peras', 'MINUMAN', 5000, 'TERSEDIA'),
(17, 'Kentang Goreng', 'MAKANAN', 10000, 'TERSEDIA'),
(18, 'Mozarella Corndog', 'MAKANAN', 6000, 'TERSEDIA'),
(19, 'Singkong Meledak', 'MAKANAN', 10000, 'TERSEDIA'),
(20, 'Tahu Pedas (isi 2)', 'MAKANAN', 6000, 'TERSEDIA'),
(21, 'Lumpia Ayam (isi 3)', 'MAKANAN', 6000, 'TERSEDIA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nama_menu` varchar(30) NOT NULL,
  `kategori` varchar(20) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `nama_pelanggan`, `id_menu`, `tanggal`, `nama_menu`, `kategori`, `harga`, `jumlah_beli`, `total_bayar`) VALUES
(6, 'Dwi ', 17, '2025-12-10', 'Kentang Goreng', 'MAKANAN', 10000, 2, 20000),
(7, 'Nadia', 9, '2025-12-10', 'Es Jagung Spesial', 'MINUMAN', 10000, 1, 10000),
(8, 'Amanda', 10, '2025-12-10', 'Es Ubi Ungu Spesial', 'MINUMAN', 10000, 3, 30000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nama_user` varchar(30) NOT NULL,
  `id_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama_user`, `id_level`) VALUES
(1, 'Admin', 'admin', 'dwi', 1),
(2, 'Kasir', 'kasir', 'amanda', 2),
(3, 'Owner', 'owner', 'nadia', 3),
(7, 'Pelanggan', 'pelanggan', 'abdul', 4);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
