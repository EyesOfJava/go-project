-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Nov 2026 pada 09.51
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
-- Database: `kopiku_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('user','kasir','admin') NOT NULL DEFAULT 'user',
  `points` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `phone`, `email`, `password_hash`, `role`, `points`, `is_active`, `last_login_at`, `created_at`, `updated_at`) VALUES
('u1', 'Administrator', 'admin', '08111111111', 'admin@kopiku.id', '$2a$12$hqsacyy1c3YEX7/gW/t6y.vbUBSU1.UxaVvyby0hZpY5YmwBf4ZRK', 'admin', 0, 1, NULL, '2026-11-08 08:26:35', '2026-11-08 08:26:35'),
('u2', 'Kasir Sudirman', 'kasir', '08222222222', 'kasir@kopiku.id', '$2a$12$2C1CpFmWYs78nmi2SwCo1eZlXQ6GysdWsNJUsF.ure5qKBaBE66Ya', 'kasir', 0, 1, NULL, '2026-11-08 08:26:35', '2026-11-08 08:26:35'),
('u3', 'Budi Santoso', 'user1', '08333333333', 'budi@email.com', '$2a$12$6DMkNaccvUpweNv4RLpuiu1.ExU2WLNw9enywQoTyCg.heQwWzICO', 'user', 350, 1, NULL, '2026-11-08 08:26:35', '2026-11-08 08:26:35'),
('u4', 'Siti Rahayu', 'user2', '08444444444', 'siti@email.com', '$2a$12$4/dMVpEZEtWIzk/WdsUKo.45dF0gEqjV2cdyoPRecQWQb4noko4qO', 'user', 1200, 1, NULL, '2026-11-08 08:26:35', '2026-11-08 08:26:35');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_users_username` (`username`),
  ADD UNIQUE KEY `uq_users_email` (`email`),
  ADD KEY `idx_users_role_active` (`role`,`is_active`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
