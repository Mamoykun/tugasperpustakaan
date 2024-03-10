-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Jan 2024 pada 16.46
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis`
--

CREATE TABLE `jenis` (
  `id` char(36) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jenis`
--

INSERT INTO `jenis` (`id`, `nama`) VALUES
('3ae10485-c68f-4a38-8b68-c97389f4b423', 'Komik'),
('3b6b631f-cefb-48b4-a983-beccba0750d4', 'Majalah'),
('ec7bcb4b-040a-44d8-992e-ea7de509c68c', 'Buku');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id` char(36) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id`, `nama`) VALUES
('1c5c9817-c7fc-491b-990f-dd429755a4ae', 'Manajemen'),
('2b17f179-5676-4938-98b7-de763a22c61f', 'Informatika'),
('864c2ca7-fc33-42d4-a919-8e68cae5bb5a', 'Sistem Informasi'),
('c6e649e0-e589-41b5-9019-27958f87557b', 'Management Informatika'),
('dd4c834f-9649-4aeb-9e14-841eca18d8cb', 'Desain Komunikasi Visual');

-- --------------------------------------------------------

--
-- Struktur dari tabel `koleksi`
--

CREATE TABLE `koleksi` (
  `id` char(36) NOT NULL,
  `penerbit_id` char(36) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `judul` text NOT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `jenis_id` char(36) NOT NULL,
  `pengarang` text NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `nomor_rak` varchar(255) NOT NULL,
  `total_halaman` int(11) NOT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `tanggal_entri` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `koleksi`
--

INSERT INTO `koleksi` (`id`, `penerbit_id`, `cover`, `judul`, `isbn`, `jenis_id`, `pengarang`, `stok`, `nomor_rak`, `total_halaman`, `tahun_terbit`, `keterangan`, `tanggal_entri`) VALUES
('17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', '80f21c51-d808-4482-bd41-8c31d03c526a', 'pemrograman sistem pakar.jpg', 'Pemrograman sistem pakar', '2143546754758', 'ec7bcb4b-040a-44d8-992e-ea7de509c68c', 'Kisame', 40, '12', 200, '2021', 'Buku Tentang Pengantar Pemrograman', '2024-01-27 14:53:02'),
('5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'a7e17721-bb4d-483b-b917-2e80265a0e9a', 'pemrograman web.jpg', 'Pemrograman Web', '22101152630106', 'ec7bcb4b-040a-44d8-992e-ea7de509c68c', 'Mamoykun', 20, '15', 300, '2023', 'Ini buku Tentang Pemrograman web', '2024-01-27 14:52:00'),
('f94b1dc0-a816-46be-8776-e0b40568f0ac', '56094068-fcf5-4583-a4f3-6fe4348291f2', 'pemrograman sistem pakar.jpg', 'Cara Buat Sistem Pakar', '9786230022609', 'ec7bcb4b-040a-44d8-992e-ea7de509c68c', 'Naruto', 10, 'BKUM-01', 204, '2021', 'cara buat Sistem Pakar', '2021-08-24 18:59:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `koleksi_pustaka`
--

CREATE TABLE `koleksi_pustaka` (
  `id` char(36) NOT NULL,
  `koleksi_id` char(36) NOT NULL,
  `konten` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `koleksi_stok`
--

CREATE TABLE `koleksi_stok` (
  `id` varchar(36) NOT NULL,
  `koleksi_id` varchar(36) NOT NULL,
  `kode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `koleksi_stok`
--

INSERT INTO `koleksi_stok` (`id`, `koleksi_id`, `kode`) VALUES
('01742ffc-5234-44b5-b5fd-291bfac01fb8', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0010'),
('0268e56f-95c6-4169-847a-e04025c49560', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0034'),
('028ed9c6-b9a5-431d-8641-ace34b7d76d6', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0019'),
('02e92753-e605-421c-ade1-c66ce49c3f71', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0030'),
('0763ed7f-aba3-4c2a-9849-5232b2da1d24', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0033'),
('09d83713-876b-4c21-bb54-c99240b0df2b', 'cb0e6dda-9717-4a1d-b10b-2637db4acae4', 'FE-02'),
('0c8e3094-daf0-4a10-a2ba-f78f9dd05315', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0012'),
('169ad6af-6157-4961-b7e2-5d801c22b571', '34e051c4-3b8f-401f-9ea2-10f39fbf458a', 'GM-02'),
('1b0f2a9b-ee9d-4776-b3fb-e2d3c53be638', '1619a750-be10-4401-a16d-5b5f0be78204', 'HT-03'),
('1cf311c8-2aea-4a55-a615-5a4cf91c044a', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0012'),
('1e4f1179-17e6-4a2c-b15e-2f7165f51cad', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0006'),
('1eabf529-7d4c-4593-b447-6683fa340042', '298ae9e0-fdd9-4a4d-b307-3b80adcce225', 'GM-03'),
('1f2c8a6b-bc50-49ab-a666-0559f16ec5cd', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0001'),
('234b7c42-0fae-4c6f-80d4-5afa405dccfb', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0023'),
('2569435e-bcab-4d4f-82e5-b3e2c0c2ab3a', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0003'),
('25cdbf41-097e-47cc-9ad3-61bcebee41da', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0003'),
('27cd2745-c827-48ef-8933-f3e25186a859', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0031'),
('2bd58f20-bbf3-444b-849f-7e490b93d884', 'd3091500-cce3-4983-8e41-97cf5feae270', 'ME-03'),
('2e8f4e1a-9ce6-4cac-b01e-2797d98f699e', '871d3a10-35db-406c-a6f8-e3c7da5c78c2', 'GAD-02'),
('300b7a95-b695-4ac2-b601-e87c55bac3c8', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0026'),
('302cdd7f-6edc-4aa4-9160-992e214445ce', 'cb0e6dda-9717-4a1d-b10b-2637db4acae4', 'FE-04'),
('30f1d614-1a6e-49b4-9274-29bc5b92a25b', 'd3091500-cce3-4983-8e41-97cf5feae270', 'ME-02'),
('34b572fd-02c5-474c-b35b-b6e82cf52a46', '11196f31-dd2c-4052-82e8-a4bbd0e90cd3', 'LPK-04'),
('3910b156-79a7-4ee0-b372-85f5c68f5c09', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0037'),
('3b5b6c3f-9b53-40f4-8c9c-50f653015fe0', 'd3091500-cce3-4983-8e41-97cf5feae270', 'ME-01'),
('3d35f4f9-6d4d-4fe6-94ae-ed274a73b115', 'df2bbfc3-80b1-4b2f-9a77-0b01e76573e1', 'CR-01'),
('3ff9f21b-3079-4209-b6c8-2ab419510faa', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0020'),
('4051682d-71cb-4dc9-a714-f2fe0a0686d2', 'c538a55d-480a-4fdd-b206-859a18044f1a', 'ATC-02'),
('43389617-ff5f-4c38-b38a-544f26676949', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0027'),
('455438a6-7984-4d3a-8467-ab92c17f9aff', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0008'),
('45bfc53c-f0ec-4c74-bf20-7e6a27d42b5d', 'f94b1dc0-a816-46be-8776-e0b40568f0ac', 'CAR-0004'),
('502d3d9f-1b7a-43a1-ae57-cb0da08b5554', 'f94b1dc0-a816-46be-8776-e0b40568f0ac', 'CAR-0001'),
('52130fef-a4b7-4aa5-91e9-19efaf0f4a8a', '1619a750-be10-4401-a16d-5b5f0be78204', 'HT-02'),
('536ea582-e9b2-43e8-98e8-439189acd117', '0ac6c983-187f-450a-8b6b-791b23dbd7d1', 'DT-02'),
('5515b9ef-30be-4da3-8417-d2ce9cf0ef67', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0018'),
('55ee0da6-c1a7-4d7f-afbc-c8c4da91de3b', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0007'),
('57a0a350-959b-4ff8-afcf-b5be1547ebd4', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0011'),
('5850e881-ebed-43f6-83b8-6221fecbb881', '1619a750-be10-4401-a16d-5b5f0be78204', 'HT-01'),
('58a5140d-971f-44b8-90c4-8af854332614', 'c538a55d-480a-4fdd-b206-859a18044f1a', 'ATC-03'),
('59ae2c4a-f101-4c87-aaa1-a8c4763e0e8e', 'f94b1dc0-a816-46be-8776-e0b40568f0ac', 'CAR-0006'),
('5df3973c-8871-4ed7-bd6a-e7e6ce64ec55', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0020'),
('5edc51b0-135a-4db7-b5b3-cb3b95dc7867', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0038'),
('6261e845-79cd-416e-b2e1-804156c76285', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0011'),
('65960e28-3f8f-4b9d-9da9-e8b730dc6540', 'f94b1dc0-a816-46be-8776-e0b40568f0ac', 'CAR-0010'),
('67f01b56-427f-4d0c-b890-1dab5029a050', '11196f31-dd2c-4052-82e8-a4bbd0e90cd3', 'LPK-03'),
('68784f3b-6b54-4797-81b9-d656b2e01b81', 'f94b1dc0-a816-46be-8776-e0b40568f0ac', 'CAR-0005'),
('6dd22b36-62d5-44f0-b726-7a5cc1dedfc2', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0004'),
('6fca02bb-1148-45cf-8c1d-06dc72d6e303', 'f94b1dc0-a816-46be-8776-e0b40568f0ac', 'CAR-0003'),
('74876a6f-0541-470b-85f4-54c44c3e8154', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0040'),
('75a2a763-8599-44e0-8f0f-5385cfab2d6b', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0013'),
('7bca3fe1-4c31-408e-b0a7-1708ff6db1ff', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0008'),
('7c08dd4f-1929-4b58-9c52-370c82fb5c6b', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0006'),
('7d768d4d-9abd-46f4-a6ce-156815a0829c', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0029'),
('7e9cef9b-050b-4047-9109-ca9790e293b0', '2397cd39-5f16-4b60-a586-98912790900a', 'BG-02'),
('82d095ac-b44d-40e8-a01d-4fc18896f4f5', '1619a750-be10-4401-a16d-5b5f0be78204', 'HT-04'),
('86b7288e-ba82-45fb-b97c-a2a7b6a8d0f2', '34e051c4-3b8f-401f-9ea2-10f39fbf458a', 'GM-01'),
('8963d7fd-1561-40d2-9d89-00e32445d452', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0004'),
('8e9b0e25-c6a3-4e79-a939-b0c0668fa7f5', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0009'),
('8eac2fdf-d4db-418c-8e4c-048afe221d6a', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0022'),
('92e595d8-ca3b-4f77-87a0-269e80360c52', '298ae9e0-fdd9-4a4d-b307-3b80adcce225', 'GM-01'),
('9a2f4b89-71f2-4b9b-801f-f75d4e5e05a8', 'f94b1dc0-a816-46be-8776-e0b40568f0ac', 'CAR-0007'),
('9af8a2b7-5614-4484-9a5c-fc41655eb3ae', '2397cd39-5f16-4b60-a586-98912790900a', 'BG-01'),
('9bddcc03-e6cb-4271-9d3a-b9e358e29490', '0ac6c983-187f-450a-8b6b-791b23dbd7d1', 'DT-01'),
('9c4faeb6-c2d5-4ede-9827-a35b9473f971', 'd3091500-cce3-4983-8e41-97cf5feae270', 'ME-04'),
('9de32a7a-1292-445d-8c99-2457b7225444', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0014'),
('9df14868-39e2-4fb6-8c72-b9df869c4186', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0025'),
('a2cf0f0e-75e8-4930-bc0f-a5d9cfff2bf4', 'cb0e6dda-9717-4a1d-b10b-2637db4acae4', 'FE-01'),
('a3277f99-4aa4-44b3-8faf-a2c8703ba7fd', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0005'),
('ac550f3e-9d2b-4465-b10c-555a235223c6', 'f94b1dc0-a816-46be-8776-e0b40568f0ac', 'CAR-0008'),
('acd650a5-643e-48b2-a926-d86f47e1e146', 'df2bbfc3-80b1-4b2f-9a77-0b01e76573e1', 'CR-03'),
('ae540bce-b396-4ed5-85e4-84d77e7c131f', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0017'),
('afd69d8e-77fe-47de-a7e8-9c228058866b', 'f94b1dc0-a816-46be-8776-e0b40568f0ac', 'CAR-0009'),
('b0e06fe5-6572-4737-bf22-b8c32df7bedc', 'f94b1dc0-a816-46be-8776-e0b40568f0ac', 'CAR-0002'),
('bac3e577-629e-45b2-a6fb-5b6e1cdf70d8', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0018'),
('bf4a268a-3a6d-4d7f-90d5-74f941cde21f', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0015'),
('c176a259-8bab-48bf-b4cf-722bc2fdd73f', '0ac6c983-187f-450a-8b6b-791b23dbd7d1', 'DT-04'),
('c2d31d47-6ef5-454d-8f54-16997a5007bf', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0001'),
('c4f3d76f-1819-456f-b5d0-4fae9b807e3e', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0015'),
('c5f0c423-0c58-4b8d-8f17-83fd105ed0d8', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0002'),
('c63f696d-91a9-4ae8-83e3-a2b72b16181e', '2397cd39-5f16-4b60-a586-98912790900a', 'BG-03'),
('c856739f-38e2-4a33-a45a-8ccb0bfb6dcf', 'c538a55d-480a-4fdd-b206-859a18044f1a', 'ATC-01'),
('cb799df7-7d2a-4a82-9c5e-ca6754ec4a91', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0013'),
('cd289a6d-efc0-4819-92d0-e8c5861b500a', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0028'),
('ce1770e0-cd60-4671-b14d-14fe773df41e', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0009'),
('cf67789e-8dbb-44ea-b822-cc18cf930f3a', 'cb0e6dda-9717-4a1d-b10b-2637db4acae4', 'FE-03'),
('d2c0e88e-277b-4fcd-b6a7-cc65843b32cb', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0019'),
('d6816070-4f08-4493-ae25-d58acd804de7', '11196f31-dd2c-4052-82e8-a4bbd0e90cd3', 'LPK-01'),
('d71eb2a1-1cbc-4653-b033-367fa7086fb5', '871d3a10-35db-406c-a6f8-e3c7da5c78c2', 'GAD-01'),
('d9592257-e803-453a-a59a-e80461911f10', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0035'),
('daf30829-2505-436d-8a70-dad82132bb1d', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0005'),
('df92e2fe-3ce7-4628-aab6-1dd2ab708b18', '298ae9e0-fdd9-4a4d-b307-3b80adcce225', 'GM-04'),
('e049b96d-f0f9-4a54-b8f4-080ac77f7641', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0036'),
('e379a3c2-339b-4cca-ae68-75f02cf0858e', '11196f31-dd2c-4052-82e8-a4bbd0e90cd3', 'LPK-02'),
('e6eade99-b429-4894-8bfc-8c7bd5bea9d1', '34e051c4-3b8f-401f-9ea2-10f39fbf458a', 'GM-03'),
('e7185ab9-c90a-42c3-9451-dfc6b6f0b7cf', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0007'),
('e89fab1f-dd93-487a-9c18-9037c395d766', 'df2bbfc3-80b1-4b2f-9a77-0b01e76573e1', 'CR-04'),
('e967edbf-fc18-4df8-907a-60f223997786', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0016'),
('e9d95253-b1d0-416f-a974-fa5442bc6343', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0017'),
('ea98030c-f10e-457e-b6fa-e66a34685d14', 'df2bbfc3-80b1-4b2f-9a77-0b01e76573e1', 'CR-02'),
('ed76b5e7-5248-44c5-b680-301d8c94b2f4', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0002'),
('ee053716-0880-46e1-8024-4d1f065ea233', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0021'),
('f2395fab-82c0-49ee-a187-784a77d154b8', '2397cd39-5f16-4b60-a586-98912790900a', 'BG-04'),
('f2696091-56c2-4692-b2bc-344bcba78505', 'c538a55d-480a-4fdd-b206-859a18044f1a', 'ATC-04'),
('f2b5fae8-c11b-4dbb-bc12-e83931bb82e3', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0014'),
('f5b58ef8-9be0-470f-a0ee-227968f8fa73', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0032'),
('f9f38c0e-0a11-4e91-a331-dae1b3d030f3', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0039'),
('fa946088-5079-4dbe-a42a-c8ffde3bc7c2', '298ae9e0-fdd9-4a4d-b307-3b80adcce225', 'GM-02'),
('fb17708d-b596-472d-aaa2-dd8454255502', '5e104716-49e3-43b1-bb5c-ceeb52a71fe6', 'PEM-0016'),
('fcb335cc-111e-4b12-a4f3-61f25e17f4bc', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0024'),
('fdfebe5c-e88f-41aa-8bdd-1c9737f29327', '17ffdcfa-1d12-4d88-a96d-f0acb0ed1f5a', 'PEM-0010'),
('feb6229a-8610-421d-92ec-8df6059da23e', '0ac6c983-187f-450a-8b6b-791b23dbd7d1', 'DT-03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kritik_saran`
--

CREATE TABLE `kritik_saran` (
  `id` char(36) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pesan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kritik_saran`
--

INSERT INTO `kritik_saran` (`id`, `nama`, `email`, `pesan`) VALUES
('888c2283-f8a0-4b04-8a5a-efc1bdb87008', 'mamoy', 'claudia@gmail.com', 'Jelek kali');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `jatuh_tempo` date DEFAULT NULL,
  `tanggal_pinjam` date NOT NULL,
  `perpanjangan` int(11) DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `status` enum('pengajuan','ditolak','dipinjam','selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `user_id`, `kode`, `jatuh_tempo`, `tanggal_pinjam`, `perpanjangan`, `tanggal_kembali`, `status`) VALUES
('20b87ff2-bd10-4f7d-8e12-f9cc12c7d5ce', '216bed44-55e5-4808-aae8-33c2dc836de2', '240124001913', '2024-01-27', '2024-01-24', 0, '2024-01-24', 'selesai'),
('2263a3ce-c435-47fd-833f-1071b6254bec', '962280f2-fdc1-4704-bf84-504955c967c3', '270124215710', '2024-01-30', '2024-01-27', 0, NULL, 'dipinjam'),
('74051482-af29-4eab-b777-a5f9c694dbfd', '962280f2-fdc1-4704-bf84-504955c967c3', '270124215729', '2024-01-30', '2024-01-27', NULL, NULL, 'pengajuan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman_detail`
--

CREATE TABLE `peminjaman_detail` (
  `id` char(36) NOT NULL,
  `peminjaman_id` char(36) NOT NULL,
  `koleksi_stok_kode` varchar(255) NOT NULL,
  `denda_terlambat` double NOT NULL DEFAULT 0,
  `denda_lainnya` double NOT NULL DEFAULT 0,
  `status` enum('tolak','pinjam','hilang','rusak','lengkap') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman_detail`
--

INSERT INTO `peminjaman_detail` (`id`, `peminjaman_id`, `koleksi_stok_kode`, `denda_terlambat`, `denda_lainnya`, `status`) VALUES
('4e4545ad-be31-4c12-a604-3939d38dafbc', '2263a3ce-c435-47fd-833f-1071b6254bec', 'CAR-0004', 0, 0, 'pinjam'),
('bf3a1bad-f8cd-4634-8f96-f2f2478f9088', '74051482-af29-4eab-b777-a5f9c694dbfd', 'PEM-0034', 0, 0, 'pinjam'),
('c237d243-c2f1-4d4f-b53c-9e2187664462', '20b87ff2-bd10-4f7d-8e12-f9cc12c7d5ce', '10-0007', 0, 0, 'pinjam'),
('fe7b5c02-4a07-4455-97af-2d771bf3e2f3', '74051482-af29-4eab-b777-a5f9c694dbfd', 'PEM-0010', 0, 0, 'pinjam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `id` char(36) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `telepon` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `alamat` text DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `tanggal_entri` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`id`, `nama`, `telepon`, `email`, `alamat`, `website`, `tanggal_entri`) VALUES
('56094068-fcf5-4583-a4f3-6fe4348291f2', 'Elex Media Komputindo', '02153650110', 'redaksi@elex.media', 'Jl. Palang Merah No 27 - 37 Jakarta Pusat', 'https://elexmedia.id/', '2021-08-27 03:04:22'),
('7138337e-6d8e-49ab-ab3f-ad55ea53c7ff', 'Andi Publisher', '027456188144', 'naskahbukuandi@gmail.com', 'Jl. Beo 38-40, Demangan, Yogyakarta', 'http://www.andipublisher.com/', '2021-08-27 03:04:59'),
('80f21c51-d808-4482-bd41-8c31d03c526a', 'Gramedia Pustaka Utama', '02153650110', 'fiksi@gramediapublisher.com', 'Jl. Palmerah Barat No. 29 â€“ 37 Jakarta Pusat', 'http://www.gpu.id/', '2021-08-24 18:57:23'),
('a7e17721-bb4d-483b-b917-2e80265a0e9a', 'Gramedia Widiasarana Indonesia (Grasindo)', '021871700656', 'red.grasindo@gramediapublishers.com', 'Jl. Pinguin Renang 18 Jakarta Pusat', 'http://www.grasindo.id/', '2021-08-27 03:03:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` char(36) NOT NULL,
  `jurusan_id` char(36) DEFAULT NULL,
  `role` enum('admin','dosen','mahasiswa') NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telepon` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `jurusan_id`, `role`, `nama`, `email`, `telepon`, `password`, `alamat`) VALUES
('216bed44-55e5-4808-aae8-33c2dc836de2', 'dd4c834f-9649-4aeb-9e14-841eca18d8cb', 'mahasiswa', 'Claudia Shiren', 'claudia@gmail.com', '081447354657', '$2a$12$DU8f5ejMrBdGyn8nN4vszuxQcdijGWqn81WaHNsSsQAo8M22RNvtO', 'Jl. Blach Hunter Regency No 3 Bali'),
('39aea0be-3401-4d1d-a727-eae1dc02cdbf', '', 'admin', 'Admin ', 'admin@gmail.com', '087847345321', '$2y$10$76s14aYiKEc98uTSwfGZ.OsPHAoMpWiX6IDskA2e9zet9FnL37UcW', 'Jl. Brighton Blok HK-2 Surabaya'),
('962280f2-fdc1-4704-bf84-504955c967c3', '2b17f179-5676-4938-98b7-de763a22c61f', 'mahasiswa', 'HAFIFUR RAHMAN', 'mamoy161001@gmail.com', '081287414628', '$2y$10$wx4krWVD1l4GdJ50TAq90u7YFmDhe8eVeL7NswdekA9L/3vw9pZnK', 'Jl dr sutomo parak karakah');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `koleksi`
--
ALTER TABLE `koleksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `koleksi_pustaka`
--
ALTER TABLE `koleksi_pustaka`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `koleksi_stok`
--
ALTER TABLE `koleksi_stok`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kritik_saran`
--
ALTER TABLE `kritik_saran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `peminjaman_detail`
--
ALTER TABLE `peminjaman_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
