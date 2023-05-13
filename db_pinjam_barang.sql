-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Bulan Mei 2023 pada 10.12
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pinjam_barang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemberitahuan`
--

CREATE TABLE `pemberitahuan` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `konten` varchar(1000) NOT NULL,
  `status` enum('terima','tolak') NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pemberitahuan`
--

INSERT INTO `pemberitahuan` (`id`, `username`, `konten`, `status`, `timestamp`) VALUES
(15, 'budi_kun', 'Permintaan Peminjaman Barang Anda Telah di Terima. 1 buah LCD. Username: budi_kun. Silahkan ke bagian Sarpras untuk mengampil barang', 'terima', '2018-11-10 15:13:01'),
(17, 'adlubagus94', 'Permintaan Peminjaman Barang Anda Telah di Terima. 1 buah LCD. Username: adlubagus94. Silahkan ke bagian Sarpras untuk mengampil barang', 'terima', '2018-11-11 01:42:05'),
(19, 'adlubagus94', 'Permintaan Peminjaman Barang Anda Telah di Terima. 2 buah Speaker kecil. Username: adlubagus94. Silahkan ke bagian Sarpras untuk mengampil barang', 'terima', '2018-11-11 01:55:54'),
(20, 'adlubagus94', 'Permintaan Pengembalian Barang Anda Telah di Terima.  buah . Username: ', '', '2018-11-11 01:56:40'),
(21, 'usertest123', 'Permintaan Peminjaman Barang Anda Telah di Terima. 1 buah LCD. Username: usertest123. Silahkan ke bagian Sarpras untuk mengampil barang', 'terima', '2018-11-11 05:30:46'),
(22, 'usertest123', 'Permintaan Pengembalian Barang Anda Telah di Terima.  buah . Username: ', '', '2018-11-11 05:31:51'),
(23, 'admin', 'Permintaan Peminjaman Barang Anda Telah di Terima. 1 buah Cikrak. Username: admin. Silahkan ke bagian Sarpras untuk mengampil barang', 'terima', '2023-05-12 06:14:20'),
(24, 'admin', 'Permintaan Pengembalian Barang Anda Telah di Terima.  buah . Username: ', '', '2023-05-12 06:23:22'),
(25, 'user', 'Permintaan Peminjaman Barang Anda Telah di Terima. 2 buah LCD. Username: user. Silahkan ke bagian Sarpras untuk mengampil barang', 'terima', '2023-05-12 12:31:03'),
(26, 'user', 'Permintaan Pengembalian Barang Anda Telah di Terima.  buah . Username: ', '', '2023-05-12 13:14:27'),
(27, 'user', 'Permintaan Peminjaman Barang Anda Telah di Terima. 3 buah Sapu. Username: user. Silahkan ke bagian Sarpras untuk mengampil barang', 'terima', '2023-05-13 08:02:50'),
(28, 'user', 'Permintaan Pengembalian Barang Anda Telah di Terima.  buah . Username: ', '', '2023-05-13 08:05:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `merk_barang` varchar(50) NOT NULL,
  `gambar_barang` varchar(100) NOT NULL,
  `tahun_barang` year(4) NOT NULL,
  `stok_barang` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_barang`
--

INSERT INTO `tbl_barang` (`id`, `nama_barang`, `merk_barang`, `gambar_barang`, `tahun_barang`, `stok_barang`) VALUES
(1, 'LCD', 'logitechh', 'projektor2.jpeg', 2021, 30),
(2, 'Sapu', 'esapu', 'sapu.jpg', 2021, 45),
(3, 'Cikrak', 'ckreak', 'cikrak.jpg', 2021, 40),
(4, 'Speaker kecil', 'votre', 'spiker.jpg', 2022, 25),
(7, 'Terminal', 'term', '5000799_0445182c-0725-49a5-81a7-trminal.jpg', 2020, 40);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pinjam`
--

CREATE TABLE `tbl_pinjam` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `merk_barang` varchar(50) NOT NULL,
  `peminjam` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL,
  `jml_barang` int(50) NOT NULL,
  `tahun_barang` year(4) NOT NULL,
  `tgl_pinjam` varchar(50) NOT NULL,
  `tgl_kembali` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_request`
--

CREATE TABLE `tbl_request` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `merk_barang` varchar(50) NOT NULL,
  `peminjam` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  `jml_barang` int(11) NOT NULL,
  `tahun_barang` year(4) NOT NULL,
  `tgl_pinjam` varchar(50) NOT NULL,
  `tgl_kembali` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_req_kembali`
--

CREATE TABLE `tbl_req_kembali` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `merk_barang` varchar(50) NOT NULL,
  `peminjam` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  `jml_barang` int(11) NOT NULL,
  `tahun_barang` year(4) NOT NULL,
  `tgl_pinjam` varchar(50) NOT NULL,
  `tgl_kembali` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `merk_barang` varchar(50) NOT NULL,
  `peminjam` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL,
  `jml_barang` int(11) NOT NULL,
  `tahun_barang` year(4) NOT NULL,
  `tgl_pinjam` varchar(50) NOT NULL,
  `tgl_kembali` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id`, `nama_barang`, `merk_barang`, `peminjam`, `level`, `jml_barang`, `tahun_barang`, `tgl_pinjam`, `tgl_kembali`) VALUES
(1, 'Terminal', '', 'budi_kun', 'XI RPL 2', 10, 0000, '12 November 2018 - 07:30 ', '12 November 2018 - 16:00 '),
(2, 'Terminal', '', 'adlubagus94', 'XII RPL 1', 2, 0000, '10 November 2018 - 15:00 ', '10 November 2018 - 16:00 '),
(3, 'Terminal', '', 'bagusi', 'X TKJ 3', 2, 0000, '12 November 2018 - 12:35 ', '12 November 2018 - 16:10 '),
(4, 'LCD', '', 'bagusi', 'X TKJ 3', 1, 0000, '14 November 2018 - 09:00 ', '14 November 2018 - 11:30 '),
(5, 'LCD', '', 'budi_kun', 'XI RPL 2', 1, 0000, '14 November 2018 - 09:00 ', '14 November 2018 - 11:30 '),
(6, 'LCD', '', 'adlubagus94', 'XII RPL 1', 1, 0000, '12 November 2018 - 07:30 ', '12 November 2018 - 10:00 '),
(7, 'Speaker kecil', '', 'adlubagus94', 'XII RPL 1', 2, 0000, '13 November 2018 - 10:00 ', '13 November 2018 - 12:00 '),
(8, 'LCD', '', 'usertest123', 'xii rpl', 1, 0000, '20 November 2018 - 16:00 ', '21 November 2018 - 13:25 '),
(9, 'Cikrak', '', 'admin', 'member', 1, 0000, '12 Mei 2023 - 13:45 ', '01 Juni 2023 - 13:00 '),
(10, 'LCD', '', 'user', 'siswa', 2, 0000, '12 Mei 2023 - 19:29 ', '13 Mei 2023 - 15:25 '),
(11, 'Sapu', 'sapu terbang', 'user', 'member', 3, 2020, '13 Mei 2023 - 14:23 ', '14 Mei 2023 - 14:20 ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `level`) VALUES
(2, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(3, 'Adlu Bagus I.', 'adlubagus94', 'a193df56eb6d42b05bfdba808eb2de35', 'XII RPL 1'),
(4, 'Budi Serizawa', 'budi_kun', 'e10adc3949ba59abbe56e057f20f883e', 'XI RPL 2'),
(5, 'Bagus Irawan', 'bagusi', 'e10adc3949ba59abbe56e057f20f883e', 'X TKJ 3'),
(6, 'user test', 'usertest123', 'e10adc3949ba59abbe56e057f20f883e', 'xii rpl '),
(7, 'user', 'user', '25d55ad283aa400af464c76d713c07ad', 'user');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_pinjam`
--
ALTER TABLE `tbl_pinjam`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_request`
--
ALTER TABLE `tbl_request`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_req_kembali`
--
ALTER TABLE `tbl_req_kembali`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tbl_pinjam`
--
ALTER TABLE `tbl_pinjam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_request`
--
ALTER TABLE `tbl_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_req_kembali`
--
ALTER TABLE `tbl_req_kembali`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
