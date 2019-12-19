-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 17 déc. 2019 à 11:22
-- Version du serveur :  10.1.34-MariaDB
-- Version de PHP :  7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `spotfit#01`
--

-- --------------------------------------------------------

--
-- Structure de la table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disabled` smallint(6) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `email`, `email_verified_at`, `password`, `disabled`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'contact@spotfit.com', '2019-12-12 09:17:33', '$2y$10$CwNYVgkgDcZrE40YPTEcg.nGY2LSRE8W82Vt.FPtsyNuvFjKGSwzK', 0, '2019-12-12 09:17:33', '2019-12-12 09:17:33'),
(2, 'wdaugherty', 'thomas.okuneva@example.net', '2019-12-12 09:17:33', '$2y$10$3S8sQFFlXugxnlpZvEB1mungHx7I7cbvTn6aTP1v2Eba6Ey7DBI82', 0, '2019-12-12 09:17:34', '2019-12-12 09:17:34'),
(3, 'mertz.muhammad', 'frederique23@example.org', '2019-12-12 09:17:34', '$2y$10$VCf55VNLwG62wdERvKY50eJHFa3SbDTBuegxrqxtes0i4.VpGsXGy', 1, '2019-12-12 09:17:34', '2019-12-12 09:17:34'),
(4, 'lorenz.torp', 'joanny79@example.org', '2019-12-12 09:17:34', '$2y$10$i1zQh3REPR3a9oW.vrsou.h2r.Xzbv0G.JwBNxn4TxijwZWKj194O', 1, '2019-12-12 09:17:34', '2019-12-12 09:35:02'),
(5, 'reese.hane', 'crunolfsdottir@example.com', '2019-12-12 09:17:34', '$2y$10$GyoDOP5sRBUaOnwAqq3myuyoMf52U.wlc8ATt8t/1l896MbbLS6QK', 0, '2019-12-12 09:17:35', '2019-12-12 09:17:35'),
(6, 'xschultz', 'ikunde@example.org', '2019-12-12 09:17:35', '$2y$10$hrmiRd.SzhGO9ivg1pas8.NYASvzmEfwD5xqW6LLfQpYFBL47maHS', 1, '2019-12-12 09:17:35', '2019-12-12 09:17:35'),
(7, 'hane.kelsi', 'hklein@example.net', '2019-12-12 09:17:35', '$2y$10$kc3oTmhpzqW8Ypf7AndeCeJcqVCgg854FK7430.eGSHfvrtPZw.PS', 0, '2019-12-12 09:17:35', '2019-12-12 09:17:35'),
(8, 'borer.makenna', 'kris.connie@example.net', '2019-12-12 09:17:36', '$2y$10$Z11zPnPA.TzDqPmAEINrEOvP5LXfA4Ky1UQsTFpUT3UPh0kpFNH2O', 1, '2019-12-12 09:17:36', '2019-12-12 09:17:36'),
(9, 'fkuvalis', 'cicero24@example.com', '2019-12-12 09:17:36', '$2y$10$ShMJe49W//oVZ/31WPuVu.N502q.pTjmk4mYKSenGb.LkJixGbTQe', 1, '2019-12-12 09:17:36', '2019-12-12 09:17:36'),
(10, 'tgrant', 'nellie17@example.net', '2019-12-12 09:17:36', '$2y$10$oHoJ4YrMsIi3op0TE2MT/eRiRRveFx/G2yzqkjK4qmamWnNWlznUK', 0, '2019-12-12 09:17:36', '2019-12-12 09:17:36'),
(11, 'fatima30', 'yundt.orrin@example.com', '2019-12-12 09:17:36', '$2y$10$hC/ctsyDJG2/EdQW4CjPK.qmGLdDlnPdH.NIoLe.Za5Ac5Q/.iQr.', 0, '2019-12-12 09:17:37', '2019-12-12 09:17:37'),
(12, 'ygottlieb', 'mskiles@example.net', '2019-12-12 09:17:37', '$2y$10$S04YhowIb0yEtQehCBQtiOcIW9lyfTaQ0yLfQ4xOIKLiKQPjQ8.Um', 0, '2019-12-12 09:17:37', '2019-12-12 09:17:37'),
(13, 'quitzon.junius', 'miguel.brown@example.org', '2019-12-12 09:17:37', '$2y$10$pqUNaEj00ss9rWWUJitKiu1L/QVCoV18/VojDMvUWZNGAWAOBaQF.', 1, '2019-12-12 09:17:37', '2019-12-12 09:17:37'),
(14, 'eden.fay', 'wrussel@example.net', '2019-12-12 09:17:37', '$2y$10$6I2kbA.tDVeguORzz7g7m./uZJlpbEbI/lSugPFIJCMNZa.eB4Es.', 1, '2019-12-12 09:17:38', '2019-12-12 09:17:38'),
(15, 'meghan29', 'cassidy.ortiz@example.net', '2019-12-12 09:17:38', '$2y$10$MvutvqFt90MWkoG74XsF6uT0JNmJAk2tgcOITrhIQqSnyL5puGcvK', 1, '2019-12-12 09:17:38', '2019-12-12 09:17:38'),
(16, 'umurphy', 'josefa.pfeffer@example.net', '2019-12-12 09:17:38', '$2y$10$S.aG.jskhTJE8eAXMHGQgugVgbC50rOouxBA7ggU0sQloAkJGAfCG', 1, '2019-12-12 09:17:39', '2019-12-12 09:17:39'),
(17, 'virgil61', 'howell.ford@example.net', '2019-12-12 09:17:39', '$2y$10$eGjVIsqJpDR90/lLpAuYY.E3eL6XYJ3v4wRkReuwVZm3pZTPTEedW', 0, '2019-12-12 09:17:39', '2019-12-12 09:17:39'),
(18, 'treutel.rebeka', 'willms.brant@example.net', '2019-12-12 09:17:39', '$2y$10$ED/RqCQYXmKv2nFMxiNPZeuAF5WMU.AKswKZBHqI/mD.l.sZAPDuy', 1, '2019-12-12 09:17:39', '2019-12-12 09:17:39'),
(19, 'dkilback', 'lang.heloise@example.net', '2019-12-12 09:17:39', '$2y$10$K5nxF6g90bnjrKl3HFMbROscy3VG.csJkB//DHrYdSGMWXLNHeFZS', 1, '2019-12-12 09:17:40', '2019-12-12 09:17:40'),
(20, 'lesley.ullrich', 'jed57@example.net', '2019-12-12 09:17:40', '$2y$10$WOn1kVQbAaZd4Utkv3Cz8en2W9uSc4ycsSOu.WSQgOYaEriFYJRAi', 1, '2019-12-12 09:17:40', '2019-12-12 09:17:40'),
(21, 'liana27', 'marjorie.oconnell@example.net', '2019-12-12 09:17:40', '$2y$10$sj9.pQO5DwBp8DCMCiYQCuqi30fkzRTogIxEMbBI7ZQT2XX4Pbdwq', 1, '2019-12-12 09:17:40', '2019-12-12 09:17:40'),
(22, 'hassan.jerde', 'dayne88@example.com', '2019-12-12 09:17:40', '$2y$10$X.eHuAG/o1XJyk41eaiF3e6crb1H79oTVPDCIM8LJpj5Z5PNirvGO', 0, '2019-12-12 09:17:41', '2019-12-12 09:17:41'),
(23, 'mgislason', 'jstroman@example.net', '2019-12-12 09:17:41', '$2y$10$HtvRLG9/OZvkToe27ESVsOxFmF3uJOCvjgEXKAwwmpzBNPTn.Mmce', 0, '2019-12-12 09:17:41', '2019-12-12 09:17:41'),
(24, 'lesch.trey', 'lilla.armstrong@example.org', '2019-12-12 09:17:41', '$2y$10$egJLVtBvKe6voJFKOq9Ig.hLglH168SHgdxfRUtk3CW6Alzatg/B6', 1, '2019-12-12 09:17:41', '2019-12-12 09:17:41'),
(25, 'streich.shawna', 'jedediah.nienow@example.net', '2019-12-12 09:17:41', '$2y$10$3UY/N3cN8qIhv44DibKA6.O1iMxSDW/B0PH8R.hSPyy3OsK5NYxRK', 0, '2019-12-12 09:17:42', '2019-12-12 09:17:42'),
(26, 'ratke.paolo', 'sschiller@example.net', '2019-12-12 09:17:42', '$2y$10$vYYN8jU9yRNjqr.dhPlyYO7cnqYlaaB/8qjoUS4HC05MiMJJVmPji', 0, '2019-12-12 09:17:42', '2019-12-12 09:17:42'),
(27, 'thora.funk', 'schimmel.susanna@example.net', '2019-12-12 09:17:42', '$2y$10$/sFjdxcwpexoJqUF8Knu/.I8U2DeCKZWGRjyZxEk/mu1XoixPZbPq', 0, '2019-12-12 09:17:42', '2019-12-12 09:17:42'),
(28, 'gusikowski.marvin', 'ifeil@example.net', '2019-12-12 09:17:42', '$2y$10$oCdZj.ZmM2n5l9pXD.P05uKTfftEURJE5qUwlgmdP14o.Mjo4WAjK', 1, '2019-12-12 09:17:43', '2019-12-12 09:17:43'),
(29, 'kaci74', 'purdy.dolly@example.com', '2019-12-12 09:17:43', '$2y$10$/feMDrutYycreLoXJTapwOEnqfXFkvBR81UVeOntpppNbcHJZjKbu', 0, '2019-12-12 09:17:43', '2019-12-12 09:17:43'),
(30, 'zmurphy', 'kutch.concepcion@example.com', '2019-12-12 09:17:43', '$2y$10$9jGi3IvxTCWwx.h8LeCgnem0mqpVYKEj/.Bw0Xw0mMvOP3P2Cjx1a', 1, '2019-12-12 09:17:43', '2019-12-12 09:17:43'),
(31, 'miguel.anderson', 'barrett47@example.net', '2019-12-12 09:17:43', '$2y$10$/LUqHH/.qCScK.7/9mU85u.kXQInhubSlxJb35ZDIMYIn6b1VXyae', 1, '2019-12-12 09:17:43', '2019-12-12 09:17:43'),
(32, 'minnie05', 'corene.lueilwitz@example.org', '2019-12-12 09:17:44', '$2y$10$BTJbNlfevwaOvyEAcDPVLeXTLvV2EUrfBfDWVAuisb5Qnyyv3Bp.G', 0, '2019-12-12 09:17:44', '2019-12-12 09:17:44'),
(33, 'ofelia.lynch', 'ruthie06@example.org', '2019-12-12 09:17:44', '$2y$10$aKp5Wl2PTOMkEs03gUBjduofWVht7ArltJ2i5i.81gPCILCNEXZ1S', 1, '2019-12-12 09:17:44', '2019-12-12 09:17:44'),
(34, 'gibson.merlin', 'turcotte.lexus@example.net', '2019-12-12 09:17:44', '$2y$10$PM26jJQAY.eq4w0LitElCu2mStpHsA6d2Y6zMg3MmodoeXI0zxsvS', 1, '2019-12-12 09:17:44', '2019-12-12 09:17:44'),
(35, 'eldridge.breitenberg', 'vada75@example.org', '2019-12-12 09:17:44', '$2y$10$LyWpNkNk6La3KhVerqw7cuq5XJHrp2vZW9IBKzY.Q1/nWV9OAKlUi', 1, '2019-12-12 09:17:45', '2019-12-12 09:17:45'),
(36, 'champlin.lula', 'lindgren.beulah@example.com', '2019-12-12 09:17:45', '$2y$10$NVXUst7hOETc42GoG1CfReMCsU6EEUi2HaGpZFcxolqoiROJTk7Iy', 1, '2019-12-12 09:17:45', '2019-12-12 09:17:45'),
(37, 'bechtelar.jimmie', 'maye19@example.org', '2019-12-12 09:17:45', '$2y$10$8OOcrnNp9oaaWkRgv3dfq.N0ITOSlSrdQ2op8zNuuQ7YbNVFzs10G', 0, '2019-12-12 09:17:45', '2019-12-12 09:17:45'),
(38, 'ana.russel', 'demarco.spinka@example.net', '2019-12-12 09:17:45', '$2y$10$hRdwLQh6zkiDFvX88erYBerIzxARM3FEsWzN/3SDHTNoX1ntHut8G', 1, '2019-12-12 09:17:46', '2019-12-12 09:17:46'),
(39, 'pconsidine', 'brisa34@example.net', '2019-12-12 09:17:46', '$2y$10$PXxAR2jrsxKTs/u0MBKQ3OnoNfu9AL3htDOIjEgI4QVvEsTwG9BOe', 1, '2019-12-12 09:17:46', '2019-12-12 09:17:46'),
(40, 'braxton71', 'larkin.abbey@example.org', '2019-12-12 09:17:46', '$2y$10$wriBiLGjLXEY/usI0mvxKeFepMtO9TQKebwZP/c6OZg1WI1hbV57S', 0, '2019-12-12 09:17:46', '2019-12-12 09:17:46'),
(41, 'elisha51', 'klakin@example.org', '2019-12-12 09:17:46', '$2y$10$xZCdF0e3kPVZ71.jNgAKk.xkduuqZNQCF4KaHj4BoU6fQ8wRDgAeO', 0, '2019-12-12 09:17:47', '2019-12-12 09:17:47'),
(42, 'rowland.murazik', 'pouros.kaylie@example.net', '2019-12-12 09:17:47', '$2y$10$p75j6HQuH3tSVec72l5AOuZQxwJc4zewhjijxO9wmRjwOFkYeR0vG', 1, '2019-12-12 09:17:47', '2019-12-12 09:17:47'),
(43, 'pfunk', 'waufderhar@example.net', '2019-12-12 09:17:47', '$2y$10$wb//d1wsTp.yXvxTNPJkSOBfuNX7s5OX66vU6SjT5NMZ0idiaHxTW', 0, '2019-12-12 09:17:47', '2019-12-12 09:17:47'),
(44, 'maeve64', 'estevan31@example.net', '2019-12-12 09:17:48', '$2y$10$lSsMNfofVu9w8mO0XOvpROqso30YoIyJMxcL/LJF3w16zZ6NMw2PC', 0, '2019-12-12 09:17:48', '2019-12-12 09:17:48'),
(45, 'fbernier', 'erin06@example.net', '2019-12-12 09:17:48', '$2y$10$DeUDI1gf2eW0Lv1QRR77nODyeos9hrJOf2jWVszUeKKHYcNpcSd6C', 0, '2019-12-12 09:17:48', '2019-12-12 09:17:48'),
(46, 'mya57', 'gutkowski.armani@example.org', '2019-12-12 09:17:48', '$2y$10$6WFzIBPer/sNIkdrO8EwFOKRLReMDF5jaozd91dkCQE6Tq0nVMZH.', 1, '2019-12-12 09:17:48', '2019-12-12 09:17:48'),
(47, 'asia.waelchi', 'kleannon@example.net', '2019-12-12 09:17:49', '$2y$10$6R21r4oEEMeltZmdItOb2.3grN32I2balcmSD3PQTl.C1QWHcm/oq', 1, '2019-12-12 09:17:49', '2019-12-12 09:17:49'),
(48, 'heathcote.dannie', 'leonardo.gerhold@example.net', '2019-12-12 09:17:49', '$2y$10$/yRkT1HgCKhNpg2LfRVmaeTWI6NX9l5SGgsbdXS6swq5QihY8p.Ee', 0, '2019-12-12 09:17:49', '2019-12-12 09:17:49'),
(49, 'bschamberger', 'qreilly@example.com', '2019-12-12 09:17:49', '$2y$10$BPJG1fGYhGJyhaG9CedU7.FHn5tDlkqeujZs.85hHD9pd.MmjtkCG', 1, '2019-12-12 09:17:49', '2019-12-12 09:17:49'),
(50, 'klehner', 'kattie14@example.net', '2019-12-12 09:17:50', '$2y$10$A97wqJFTbtgX7/UVPXJLLuf2DXjc8rfpoWipy2lRcVK5vY5ar1J2S', 1, '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(51, 'dayna91', 'crooks.zelda@example.com', '2019-12-12 09:17:52', '$2y$10$1YGE2217NeqRas4Pmw1Wv.t39D0qGpcZgGyTnTUKB4JsACGkGwhKS', 0, '2019-12-12 09:17:52', '2019-12-12 09:17:52'),
(52, 'marks.wilma', 'johnson.marvin@example.net', '2019-12-12 09:17:52', '$2y$10$rv5oGQG/hQEE0MYKSatvGOlP3dKYFZjQ8YD/VbUB4q86dtiqh9XuG', 0, '2019-12-12 09:17:52', '2019-12-12 09:17:52'),
(53, 'douglas.eliseo', 'winfield.lebsack@example.com', '2019-12-12 09:17:53', '$2y$10$PA8E55iU/L/8EBG/SUzL/.MkmcNydfEEiSr44dTyBS4tirDUdwJI6', 1, '2019-12-12 09:17:53', '2019-12-12 09:17:53'),
(54, 'gerald13', 'armani06@example.net', '2019-12-12 09:17:53', '$2y$10$PFtG1DkZJG/IUdaktd8AbuN7znn9g8CGZ8XMioNG1F6QbwzMjZiNa', 0, '2019-12-12 09:17:53', '2019-12-12 09:17:53'),
(55, 'joesph30', 'odell59@example.net', '2019-12-12 09:17:54', '$2y$10$wO3LvANyTwxSbdFBkRuFT.9Xf7JhpKU.RyuzxCryeSRP42RMWEPcS', 0, '2019-12-12 09:17:54', '2019-12-12 09:35:07'),
(56, 'ebert.rogelio', 'carrie47@example.net', '2019-12-12 09:17:54', '$2y$10$lY79JdbnzTtLcJOzYJ9XbOKpTlaf69NAu6o.EJZ3ECsSlzjHrsTsa', 1, '2019-12-12 09:17:54', '2019-12-12 09:17:54'),
(57, 'vonrueden.brian', 'mallie46@example.com', '2019-12-12 09:17:54', '$2y$10$gn4wDjdj9d3tuj7/EcbYIOPCkqNfK.vHv11uW5Y9JZQXIeVxV6xgm', 1, '2019-12-12 09:17:54', '2019-12-12 09:17:54'),
(58, 'dina.murray', 'wstreich@example.org', '2019-12-12 09:17:54', '$2y$10$BqpiYhiRtiZXXyiPvYTdVu5Gd4jnP6Uds3UlA794es69SXJOZe4rO', 1, '2019-12-12 09:17:55', '2019-12-12 09:17:55'),
(59, 'zdonnelly', 'dell13@example.net', '2019-12-12 09:17:55', '$2y$10$IVd9Kqm0NnfeeEDuxmFgWudk4IN0BlChGat8AuGb6uCfya1pxES8K', 0, '2019-12-12 09:17:55', '2019-12-12 09:17:55'),
(60, 'hermiston.vincenzo', 'roma62@example.com', '2019-12-12 09:17:55', '$2y$10$iyDQPi9Kbr5.5MdjZ8Qd0e2KTcOmmrSrhuM3Nl9DzqHaWiMNCzx6i', 0, '2019-12-12 09:17:55', '2019-12-12 09:17:55'),
(61, 'wunsch.florine', 'donato93@example.net', '2019-12-12 09:17:55', '$2y$10$dA/X5rWJIOrgtn9WQZUSLek/n/HgvpY6OuzxYdr4X/HW22k.8S376', 0, '2019-12-12 09:17:56', '2019-12-12 09:17:56'),
(62, 'diana.stracke', 'amelia65@example.net', '2019-12-12 09:17:56', '$2y$10$ATtAOOtpQbqnj0VKvp4N3.MnrQM/v9v/xFAgHOR4Xl8J9Nrg8IdM6', 1, '2019-12-12 09:17:56', '2019-12-12 09:17:56'),
(63, 'batz.stone', 'arden.considine@example.net', '2019-12-12 09:17:56', '$2y$10$YShJIZfuCUUNw5M1uRXCJOWEnoDEp702OfMEMIMIWNVTOZv8IqVLW', 0, '2019-12-12 09:17:56', '2019-12-12 09:17:56'),
(64, 'amani.huel', 'kozey.zander@example.net', '2019-12-12 09:17:56', '$2y$10$UrSOjb0OUKmnKRSrnL.1ROsQFo1ZFid4MtXUtprddloAaK37OW6DC', 1, '2019-12-12 09:17:57', '2019-12-12 09:17:57'),
(65, 'simonis.henderson', 'berge.bernard@example.com', '2019-12-12 09:17:57', '$2y$10$5YQrjCoYtJzpIyiEQgOL7uAyAZOWWKJ5q0P5z5WIsrpt8nD3./.kS', 1, '2019-12-12 09:17:57', '2019-12-12 09:17:57'),
(66, 'runte.cheyenne', 'blanca97@example.net', '2019-12-12 09:17:57', '$2y$10$ekmy8Hx6H23PaNOY5EpiV.CTRNPrB6ho2np.elslYL28nfH6RW2oi', 1, '2019-12-12 09:17:57', '2019-12-12 09:17:57'),
(67, 'srobel', 'tressie.sauer@example.net', '2019-12-12 09:17:57', '$2y$10$i1uEI9WhJaG9.ZrnW3AV6e.dqHWXqgI7McjFKjIiqj5xN6xKvtSve', 1, '2019-12-12 09:17:57', '2019-12-12 09:17:57'),
(68, 'kris.doug', 'felicia65@example.org', '2019-12-12 09:17:58', '$2y$10$Tz/zGMQ0GnfinSb0zJhLNOneufjhqeH/B/Z07RmoigBAIL0u5jk8y', 0, '2019-12-12 09:17:58', '2019-12-12 09:17:58'),
(69, 'maurice95', 'mbergnaum@example.net', '2019-12-12 09:17:58', '$2y$10$8mP4LtLWdSB3Q/N.cRo1eup6tkGGha2otH6GrNOyJcvE3Eic1pmgG', 0, '2019-12-12 09:17:58', '2019-12-12 09:17:58'),
(70, 'salma60', 'adams.michaela@example.com', '2019-12-12 09:17:58', '$2y$10$jF7d/4jk.k/Va6jczxTAY.phBfWga4Z/CBXr6djsyh5JbvrIcGjgK', 0, '2019-12-12 09:17:58', '2019-12-12 09:17:58'),
(71, 'tquitzon', 'abbott.wiley@example.org', '2019-12-12 09:17:59', '$2y$10$gCYkBXJKdw3blg/Xg0xyI.HtOdgYhtrNR0206y2UvNQnOHbHJo9FW', 0, '2019-12-12 09:17:59', '2019-12-12 09:17:59'),
(72, 'tressa88', 'leonel71@example.com', '2019-12-12 09:17:59', '$2y$10$H6MguiHHWF9ytZeFFdjFnOFFAnfrrC0HbL7ywLgaBx0li/BJVZ.L2', 0, '2019-12-12 09:17:59', '2019-12-12 09:17:59'),
(73, 'alberta.conroy', 'gleason.agustina@example.org', '2019-12-12 09:17:59', '$2y$10$jWL8gSAg62i7eisweMeOtee7TMw5nqprL1EViI2QswSPVsZwhrjou', 0, '2019-12-12 09:17:59', '2019-12-12 09:17:59'),
(74, 'bettie.bailey', 'joanny.pacocha@example.net', '2019-12-12 09:18:00', '$2y$10$K84YgcAb2RhOPjtSBFp8Aufd4tryGj9b4jZaVK3LQSHa4EOCbpOKS', 0, '2019-12-12 09:18:00', '2019-12-12 09:18:00'),
(75, 'anne.torphy', 'isidro.boehm@example.org', '2019-12-12 09:18:00', '$2y$10$vo/IcNzmtLFgeTKdHH33SObKObPKk7LDfz6V0F2AmEN5.RIXdDWxq', 0, '2019-12-12 09:18:00', '2019-12-12 09:18:00'),
(76, 'maddison70', 'madge.johns@example.org', '2019-12-12 09:18:00', '$2y$10$VoaxDgqFA4UUQNAMfXfGZeSwuCMxKtOySWAIVXE9TGSR0q6qyaalG', 1, '2019-12-12 09:18:00', '2019-12-12 09:18:00'),
(77, 'miller.kieran', 'mills.cooper@example.org', '2019-12-12 09:18:01', '$2y$10$ZCL.dUrim.a8vberZdlnCurug/3TQwieIW2kVg9.hFX2KOVnUjmsy', 1, '2019-12-12 09:18:01', '2019-12-12 09:18:01'),
(78, 'swolf', 'vdaniel@example.com', '2019-12-12 09:18:01', '$2y$10$l54sFEo2HoTkLmePbC29I.SMQe3Hr/f90ahm9K4lxVqpnaUceG4Oy', 0, '2019-12-12 09:18:01', '2019-12-12 09:18:01'),
(79, 'dimitri.ratke', 'randi.predovic@example.org', '2019-12-12 09:18:01', '$2y$10$YV0DhTJ3/TMUSywx2VIq8eEuSUXmFzQYyySh88TTz2.PktAsCZzNS', 0, '2019-12-12 09:18:01', '2019-12-12 09:18:01'),
(80, 'claudia.mcclure', 'donald.donnelly@example.com', '2019-12-12 09:18:02', '$2y$10$TyLOqMKDOqjd6FFzkJw/FO/dBx1fEgCSdr3KN/.9HRcCwRwWpZ9NG', 0, '2019-12-12 09:18:02', '2019-12-12 09:18:02'),
(81, 'bayer.judah', 'naomie.gottlieb@example.org', '2019-12-12 09:18:02', '$2y$10$X0vqqiN9iqmQqrRG5Q8j6elPg1M3PbuUv49LFhY6KnY6HHt2aCO8a', 0, '2019-12-12 09:18:02', '2019-12-12 09:18:02'),
(82, 'okeefe.ettie', 'gnader@example.org', '2019-12-12 09:18:02', '$2y$10$REFbgDJr0iyrWLTQHX2b0ebLu3ZIsq0EFUtc7BNWo3RCZkuHZpKxW', 0, '2019-12-12 09:18:03', '2019-12-12 09:18:03'),
(83, 'grace.kohler', 'imante@example.com', '2019-12-12 09:18:03', '$2y$10$P5kIPxulo7Ru8WwIc.KcSOzoe7mhcM4BKAIZwEh9QNbhCzo2KQt7m', 1, '2019-12-12 09:18:03', '2019-12-12 09:18:03'),
(84, 'xjakubowski', 'wprohaska@example.com', '2019-12-12 09:18:03', '$2y$10$P7ve6zqFvKFOmSIrKtZQt.dx5HnXyOMoGrTnA7iWpZ0pvNvkeQOg.', 0, '2019-12-12 09:18:03', '2019-12-12 09:18:03'),
(85, 'lorenzo01', 'cheyanne52@example.org', '2019-12-12 09:18:04', '$2y$10$fsZgObTBL1JD2YYS62alyupci69BL9/nGYFlfYHl5qvnbaOQwwmai', 0, '2019-12-12 09:18:04', '2019-12-12 09:18:04'),
(86, 'pmann', 'cjohnson@example.net', '2019-12-12 09:18:04', '$2y$10$R1/sG3pbmhfyjigG2Q9gt.zPEXCgTFiMwibQXBUJs4hxf2o7Aq3Me', 0, '2019-12-12 09:18:04', '2019-12-12 09:18:04'),
(87, 'elenor45', 'littel.abigale@example.com', '2019-12-12 09:18:04', '$2y$10$.1yWGJRC8PQmFTIzWmwy.uF5eOOXuaPvwpjyF4Gej2.fLet7jNQ2S', 1, '2019-12-12 09:18:04', '2019-12-12 09:18:04'),
(88, 'deshawn99', 'kassulke.constantin@example.org', '2019-12-12 09:18:04', '$2y$10$uEoXqkqg20D.q6.pmLdLHuDgtiOSPRjxkyC1gJrQ2smNPpNMHh0JC', 1, '2019-12-12 09:18:05', '2019-12-12 09:18:05'),
(89, 'uweber', 'oda.cormier@example.com', '2019-12-12 09:18:05', '$2y$10$J59JqEiMb.7rmOzFt2I4ZeF03LyaqHmFFiVBWrvOokSpDNSXjp7oK', 1, '2019-12-12 09:18:05', '2019-12-12 09:18:05'),
(90, 'daren15', 'rhoda.schmidt@example.net', '2019-12-12 09:18:05', '$2y$10$7.xzwPf4gE/AH1A.tkpk9eyk6sOU/uWcRAdw/e4NlcFcRKVJJiO0i', 0, '2019-12-12 09:18:05', '2019-12-12 09:18:05'),
(91, 'jtreutel', 'franecki.darryl@example.com', '2019-12-12 09:18:05', '$2y$10$HuBe3DIMRiJLObsorjFUU.QKHlpAbHWB.PS/TEsX0KcfUTPACn5oG', 0, '2019-12-12 09:18:06', '2019-12-12 09:18:06'),
(92, 'aufderhar.crawford', 'joy.johnson@example.com', '2019-12-12 09:18:06', '$2y$10$dK6ndttvIPsTTpqqIoXvS.ZQkTo27m4fjF/gCMMVjgsKHWCTTiO0e', 0, '2019-12-12 09:18:06', '2019-12-12 09:18:06'),
(93, 'carlotta.powlowski', 'alaina06@example.com', '2019-12-12 09:18:06', '$2y$10$2X5Bt/U6W9cEpAoZliSB5OM3pcK3GZqC.qSLjdzxwQO1zWLSFQ7YC', 0, '2019-12-12 09:18:06', '2019-12-12 09:18:06'),
(94, 'amalia.nicolas', 'stan98@example.com', '2019-12-12 09:18:06', '$2y$10$C25s9VyC9NH1WfSoaodalewEt8Qsb6hZNPpDtQ775hhAd6l1PEVBS', 0, '2019-12-12 09:18:07', '2019-12-12 09:18:07'),
(95, 'kurtis.bogan', 'charity99@example.com', '2019-12-12 09:18:07', '$2y$10$rGJtb5QfBwwgo6uwHzPZW.TkbvZAXYQkuRqhmHysqYtCYXEFaVwuK', 0, '2019-12-12 09:18:07', '2019-12-12 09:18:07'),
(96, 'bernier.imani', 'astrid.daugherty@example.com', '2019-12-12 09:18:07', '$2y$10$Zn3h9Fpb/HwR6tuQnBTsPOI4zpfZrbVcVaD0IssrPNvLRX03ImXta', 1, '2019-12-12 09:18:07', '2019-12-12 09:18:07'),
(97, 'emmerich.joannie', 'streich.watson@example.net', '2019-12-12 09:18:07', '$2y$10$edsNrwD1KBBwJMVfJ5Nozetw.WzqP8/TRkn502XDc5Pn.BpdTulSG', 1, '2019-12-12 09:18:08', '2019-12-12 09:18:08'),
(98, 'newell.balistreri', 'maryam99@example.com', '2019-12-12 09:18:08', '$2y$10$m4i/rGNEJaOOXfdug/j0OeyAXXstlzdWz6CQ4ZTECMr/Ulmhy/DI2', 0, '2019-12-12 09:18:08', '2019-12-12 09:18:08'),
(99, 'vaughn74', 'ahmad52@example.org', '2019-12-12 09:18:08', '$2y$10$gEpaCNHrevj3aT6AZpPHZeIbwWtHc6XJsxceYf7ClJ3Zjlen6N562', 0, '2019-12-12 09:18:08', '2019-12-12 09:18:08'),
(100, 'waelchi.cathrine', 'zulauf.elliot@example.org', '2019-12-12 09:18:08', '$2y$10$FCaNWe2VaEmt6rY6FAhEKuxK.SBXXWMTpO0t1MNkt5u3XLDkdKkGK', 0, '2019-12-12 09:18:09', '2019-12-12 09:18:09'),
(101, 'balistreri.modesta', 'lisa.kuhlman@example.com', '2019-12-12 09:18:13', '$2y$10$.mro491JL./Md5XL.JHNOeTqNOBCHpvqyDPUvAIsNgha4qsPoXb1C', 0, '2019-12-12 09:18:13', '2019-12-12 09:18:13'),
(102, 'nona59', 'jordi.friesen@example.com', '2019-12-12 09:18:13', '$2y$10$Ia5feNqJx7ExwHDZ/QdYp.9fu2EbbMW44lClZiV4a6YUr8TlEFiXq', 0, '2019-12-12 09:18:13', '2019-12-12 09:18:13'),
(103, 'bernie14', 'xpouros@example.com', '2019-12-12 09:18:14', '$2y$10$0nIIStpgg3OgmGAS.kinTOHUqunBdWPVcTmLjjhDf3RNYCGmFUlD.', 1, '2019-12-12 09:18:14', '2019-12-12 09:18:14'),
(104, 'cruickshank.kadin', 'nrogahn@example.org', '2019-12-12 09:18:14', '$2y$10$RLkX3njY0MTR.xpjK7nvDuH88W0suHEO7tDgQ0/L.IHi6EfdmKkh6', 0, '2019-12-12 09:18:14', '2019-12-12 09:18:14'),
(105, 'hallie86', 'nikki.weissnat@example.org', '2019-12-12 09:18:15', '$2y$10$T94Fwr6vD/slvCQgZFvEGeMavIcHwRRVRM3ZFgcnYKrWRJVD9dCKW', 1, '2019-12-12 09:18:15', '2019-12-12 09:18:15'),
(106, 'phand', 'fredy.anderson@example.org', '2019-12-12 09:18:15', '$2y$10$7tyL/mpWesMLoqas0ybmNeKYx.SvAFJUEcfAA1fbGQUHRIBVA.PJy', 1, '2019-12-12 09:18:15', '2019-12-12 09:18:15'),
(107, 'marquardt.caden', 'larson.marilyne@example.net', '2019-12-12 09:18:15', '$2y$10$JI42OK0EzcwNGMd2N8xa3uU0KJ2ehb8dzfeVjLeKSIgcx/XOeoa62', 0, '2019-12-12 09:18:16', '2019-12-12 09:18:16'),
(108, 'rupert73', 'sonny66@example.net', '2019-12-12 09:18:16', '$2y$10$6Thld7qnfNnZUqD9xts7Y.Ei7OFm9XY2w.iI8KY9XoXDP9m9ZjIGq', 0, '2019-12-12 09:18:16', '2019-12-12 09:18:16'),
(109, 'arlo50', 'witting.hollis@example.net', '2019-12-12 09:18:16', '$2y$10$lU/5iM0EwW.n2FPDTKWdhe0dNTBxUqA/BxykTw5VP2WJmoF7tu8Im', 0, '2019-12-12 09:18:16', '2019-12-12 09:18:16'),
(110, 'labadie.marisa', 'prosacco.kris@example.org', '2019-12-12 09:18:16', '$2y$10$Aq6UQoR/RD5Za.4OPptxMuumtjL7eFF8GlR14Au6vMfTj3Y/4lBqO', 1, '2019-12-12 09:18:16', '2019-12-12 09:18:16'),
(111, 'paucek.billy', 'lgreenfelder@example.org', '2019-12-12 09:18:17', '$2y$10$TIw1Q0BX2ATucF3JWChzc.Lf3dMRbW2ONhdIbykMvw3E3oIRs1ZLi', 1, '2019-12-12 09:18:17', '2019-12-12 09:18:17'),
(112, 'darion.koss', 'drake.corwin@example.net', '2019-12-12 09:18:17', '$2y$10$JblcPMK.kQAad7fA8q8CPeVL.lk6kbFRnzrw7gGLr02m32R1KVjii', 1, '2019-12-12 09:18:17', '2019-12-12 09:18:17'),
(113, 'berry.prohaska', 'jared14@example.net', '2019-12-12 09:18:17', '$2y$10$TqFzd1wVAxPQdrDHW18wDe8Vop3XAvE8d4Zdna8q0bLrEyC9pzFeq', 1, '2019-12-12 09:18:18', '2019-12-12 09:18:18'),
(114, 'wisoky.baron', 'dovie.olson@example.net', '2019-12-12 09:18:18', '$2y$10$XCr7PRu6vN.7nxoNaU4tZ.YOVPPdowo930KngpdN3ASbMKGSl01X2', 0, '2019-12-12 09:18:18', '2019-12-12 09:18:18'),
(115, 'devyn.leannon', 'keven98@example.net', '2019-12-12 09:18:18', '$2y$10$0feluCtN3YB.KxKS7Bt45urqq1Emy5TpnIY3YG2fgvaYpt3LNjHmO', 1, '2019-12-12 09:18:18', '2019-12-12 09:18:18'),
(116, 'matilde06', 'leonie20@example.com', '2019-12-12 09:18:18', '$2y$10$NX7mxYB.pMfrcQ/uwdVO5.WuMjTizJJuNHoOUH8b/Nshlla0yeFey', 1, '2019-12-12 09:18:18', '2019-12-12 09:18:18'),
(117, 'madelynn.rohan', 'lemke.kian@example.com', '2019-12-12 09:18:19', '$2y$10$FjNsz5EO2vziP2swwlCZnONNZFrro2r4vAfhNQM8YRZx8jYrG0zDu', 1, '2019-12-12 09:18:19', '2019-12-12 09:18:19'),
(118, 'lora.sawayn', 'katarina27@example.org', '2019-12-12 09:18:19', '$2y$10$MJlXq2SXcIs2p5UYXB9iLO9TLuQe1.2DF8J9Iu4uS8R32AJes7dbe', 1, '2019-12-12 09:18:19', '2019-12-12 09:18:19'),
(119, 'miracle09', 'sokeefe@example.net', '2019-12-12 09:18:19', '$2y$10$lT04vQpiP4L/ic.iQx/cX.HEboSaiDFnpOsCc1eHJVzr4xUUn4o4O', 0, '2019-12-12 09:18:19', '2019-12-12 09:18:19'),
(120, 'deontae.collier', 'xvolkman@example.com', '2019-12-12 09:18:20', '$2y$10$kN4XtcLhZPisbFcB9XgKfuvslc7b/N8CZ9wmlk515iM6ovbuS0z3m', 1, '2019-12-12 09:18:20', '2019-12-12 09:18:20'),
(121, 'eli00', 'macejkovic.rigoberto@example.net', '2019-12-12 09:18:20', '$2y$10$AS9Yg.XmxDG6.sVToTx5Nu6Qs2qQEMFkPbYrq5Trs./WdLrbxXs0e', 1, '2019-12-12 09:18:20', '2019-12-12 09:18:20'),
(122, 'amosciski', 'crau@example.com', '2019-12-12 09:18:20', '$2y$10$.w/o27OUgKbLEwttRm.TW.eBFXKsmv4NLIZFzPOvERJkMvNyId71y', 0, '2019-12-12 09:18:20', '2019-12-12 09:18:20'),
(123, 'ondricka.annie', 'halvorson.dawson@example.org', '2019-12-12 09:18:21', '$2y$10$SMjbXQCGY5JkcZTeB8FnveM6N3HhqcUaJYyA1hv5HFOOMA0rO5Nr.', 1, '2019-12-12 09:18:21', '2019-12-12 09:18:21'),
(124, 'marlon19', 'qkonopelski@example.com', '2019-12-12 09:18:21', '$2y$10$31XVog0ru.BF.n5L3ffan.ER7CWtBibH0vRXMk5sqzZG7x5I6vDg.', 1, '2019-12-12 09:18:21', '2019-12-12 09:18:21'),
(125, 'lbatz', 'khamill@example.org', '2019-12-12 09:18:21', '$2y$10$Un51AM9NRoRPpUKSwa/HgOLZdvNb1CoN7t3ZzZLho7R611qxXrgRa', 1, '2019-12-12 09:18:21', '2019-12-12 09:18:21'),
(126, 'oschmeler', 'xanderson@example.org', '2019-12-12 09:18:22', '$2y$10$VR0udJBuADmafS9LfyDdxOvVbG9cDruX6KcHUAdrW6sjfiKnPjUPa', 0, '2019-12-12 09:18:22', '2019-12-12 09:18:22'),
(127, 'keely54', 'bernier.warren@example.com', '2019-12-12 09:18:22', '$2y$10$m8cZW4jy9jZ5wjEukg.67.22VRtx7gCNQM9czTHXN0J4RbhMGm6BW', 0, '2019-12-12 09:18:22', '2019-12-12 09:18:22'),
(128, 'ervin15', 'corbin.huel@example.net', '2019-12-12 09:18:22', '$2y$10$7gi3ZXk7P9HSiTOwsTc5QeaDl6ieDExC8uKqRU804W/G1/1v2pRIW', 1, '2019-12-12 09:18:22', '2019-12-12 09:18:22'),
(129, 'satterfield.imani', 'rhea.schowalter@example.net', '2019-12-12 09:18:23', '$2y$10$E5bMbXDjMkWSK.t3.00Jve9GWuWJJFbiLYYkeknww4wyp5C7zYdV6', 0, '2019-12-12 09:18:23', '2019-12-12 09:18:23'),
(130, 'lois.zieme', 'mia92@example.org', '2019-12-12 09:18:23', '$2y$10$NQ2pcxWaF9y5rzZV08Nk4OlBbabGcsbXiOEN5rSicD.zbignnaQaW', 0, '2019-12-12 09:18:23', '2019-12-12 09:18:23'),
(131, 'nhagenes', 'jhodkiewicz@example.org', '2019-12-12 09:18:23', '$2y$10$qxBwYCmQiBVzTIzRj7egbOpc.H0fnuv9KKxPrVseAWHxgNlCDJVpm', 0, '2019-12-12 09:18:24', '2019-12-12 09:18:24'),
(132, 'rrenner', 'ova.crona@example.net', '2019-12-12 09:18:24', '$2y$10$47FeW.qoDEkZb2zs0NfK9uki7J829dOI2jI/wRogTerrwbiq4c3om', 0, '2019-12-12 09:18:24', '2019-12-12 09:18:24'),
(133, 'ezequiel.hansen', 'harvey.cathryn@example.net', '2019-12-12 09:18:24', '$2y$10$J0u7fJdHEet5Rw/G8OmlFO0EqN4nC0h0w7edw/lsANiKLiGoZS9ue', 0, '2019-12-12 09:18:24', '2019-12-12 09:18:24'),
(134, 'herbert17', 'xolson@example.com', '2019-12-12 09:18:24', '$2y$10$Ho8t8P1i60nHr7bZZnpHFuaE4oiOURLbq8ZFo4P08Q79vsGb63veW', 1, '2019-12-12 09:18:25', '2019-12-12 09:18:25'),
(135, 'flossie.turcotte', 'ihagenes@example.net', '2019-12-12 09:18:25', '$2y$10$iMSyVZ3ntfSFgIZBY2CpT.DmmH83sL4qF7Wshvop2OWvn5MqR92Ay', 0, '2019-12-12 09:18:25', '2019-12-12 09:18:25'),
(136, 'hrippin', 'goldner.emmanuelle@example.net', '2019-12-12 09:18:25', '$2y$10$epJD.wyrIpHdXINNSMdVre.onID6rrCD9WYoAeUrAYSHj/hl3HhM.', 0, '2019-12-12 09:18:25', '2019-12-12 09:18:25'),
(137, 'jreynolds', 'leonardo.nienow@example.com', '2019-12-12 09:18:25', '$2y$10$G.5eu7OzoLpSvLlEeEIRNuPORssHV42MoWgk6k1Tnk5WkSFTYFHUS', 1, '2019-12-12 09:18:26', '2019-12-12 09:18:26'),
(138, 'mayert.raphaelle', 'merritt.champlin@example.com', '2019-12-12 09:18:26', '$2y$10$uGw/QKPuH5oHAMbWCSzQvOH8L60FNUVm25bfMWim4qQQNp9C5/u/S', 1, '2019-12-12 09:18:26', '2019-12-12 09:18:26'),
(139, 'emely.pouros', 'uhills@example.org', '2019-12-12 09:18:26', '$2y$10$fz/5ixK5rZ3xyTisnSbuV.M1C9FpaFdMHMNP7uNgBfOBpFQ7aXWNa', 1, '2019-12-12 09:18:26', '2019-12-12 09:18:26'),
(140, 'marcelina.denesik', 'xrunolfsson@example.net', '2019-12-12 09:18:26', '$2y$10$Qly5Vtun9leL7AcXtnWlRuqGUjl5A7U1U7aWWt.N7Wek6/GFutgsS', 0, '2019-12-12 09:18:27', '2019-12-12 09:18:27'),
(141, 'huel.isom', 'henderson.daniel@example.net', '2019-12-12 09:18:27', '$2y$10$DueNuQqs.nDNQemmzUJGL.DNwxxDaEstwXRc4cpZuS3.L08xNwLfW', 0, '2019-12-12 09:18:27', '2019-12-12 09:18:27'),
(142, 'gkuvalis', 'jaida57@example.org', '2019-12-12 09:18:27', '$2y$10$gcKH.i30yp46yGkDGXCbJuoSf1iU.aNyvTG.K1hn1qRMD2bVggyZ.', 1, '2019-12-12 09:18:27', '2019-12-12 09:18:27'),
(143, 'darrick80', 'heathcote.hipolito@example.net', '2019-12-12 09:18:28', '$2y$10$JGHdmF/4fUfmuGrEwPa2Weuqre5AIaiS5LzzycUXZPvD0NgEqL8eS', 0, '2019-12-12 09:18:28', '2019-12-12 09:18:28'),
(144, 'maudie.kunde', 'leola84@example.org', '2019-12-12 09:18:28', '$2y$10$0coMMRe89GkMybpbALY28.bSMENeBXZZtU5ZMdS9JU6MVd.5OmKQC', 0, '2019-12-12 09:18:28', '2019-12-12 09:18:28'),
(145, 'orlando.krajcik', 'ova81@example.com', '2019-12-12 09:18:28', '$2y$10$ehqTP1hgTX9UbpwDNGpiruQeDZD/zXV6dv00z15giFVVDWGMS6zla', 1, '2019-12-12 09:18:28', '2019-12-12 09:18:28'),
(146, 'arianna71', 'jamaal.pfannerstill@example.net', '2019-12-12 09:18:29', '$2y$10$IpLkh4fNKqW4fdh6syIMmOEL4fh5TZKuZ5mTiIVw7d/aFppAguEBy', 1, '2019-12-12 09:18:29', '2019-12-12 09:18:29'),
(147, 'kbogan', 'veronica.steuber@example.net', '2019-12-12 09:18:29', '$2y$10$nV/yrsfW3g/ZSskF3q5CDeWumAVFvsFQ7Kg7DREwQNSmiXnZiYgJy', 1, '2019-12-12 09:18:29', '2019-12-12 09:18:29'),
(148, 'judson.waelchi', 'bins.keshaun@example.org', '2019-12-12 09:18:30', '$2y$10$qlth4Hl79eEhWzflZ7nkH.nIJC7VyT30mZvigS8OYGFEctv3VUwWC', 1, '2019-12-12 09:18:30', '2019-12-12 09:18:30'),
(149, 'ohartmann', 'anahi.smith@example.net', '2019-12-12 09:18:30', '$2y$10$11K8RRJ3hTC9fc9CXPCXo.14sc/hIAKo6yrvIkrXfPwaHcm5oM2Bq', 1, '2019-12-12 09:18:30', '2019-12-12 09:18:30'),
(150, 'mondricka', 'iweber@example.com', '2019-12-12 09:18:30', '$2y$10$2aZcNHOJoct8LiKAZFW8uuRQ7zBs6Sf6opxtEPkCouuYN73JuBreS', 0, '2019-12-12 09:18:30', '2019-12-12 09:18:30'),
(151, 'mhoppe', 'zander.mante@example.org', '2019-12-12 09:18:32', '$2y$10$.c6inxKiPCRRp/QLd25ul.A9RSmn0oiYbHvit/o9Vi30Uz39rcUnW', 1, '2019-12-12 09:18:33', '2019-12-12 09:18:33'),
(152, 'weimann.kaylah', 'lfisher@example.net', '2019-12-12 09:18:33', '$2y$10$d2dWXROqOAK.P7oWSv2hcOIujzp/jI.71EO4Y.1zTWeyWndMXoYl6', 1, '2019-12-12 09:18:33', '2019-12-12 09:18:33'),
(153, 'arnaldo.bartoletti', 'jewel.walter@example.net', '2019-12-12 09:18:33', '$2y$10$yxMu5tIFb5tc0vGEGDOvY.PB8OtIY0k9jGqLGV5Z/GtKilksVaIMu', 1, '2019-12-12 09:18:33', '2019-12-12 09:18:33'),
(154, 'monica.feest', 'reese33@example.com', '2019-12-12 09:18:33', '$2y$10$Lm.obI9GWowevTW3OmR9YOEibE/ScJMpvCE3WRwgvKYTxb5OYeIKK', 1, '2019-12-12 09:18:33', '2019-12-12 09:18:33'),
(155, 'rgleason', 'alba99@example.com', '2019-12-12 09:18:33', '$2y$10$2dngQ034yIQaOqrUtdTVWe0X31H7wpg7Vdb0xP261qBEKqkQI0Vta', 0, '2019-12-12 09:18:34', '2019-12-12 09:18:34'),
(156, 'ksanford', 'ukulas@example.com', '2019-12-12 09:18:34', '$2y$10$WpPfp99kS/CeqeNuSTTEEud.3Xhczy2ZXgaYgk.qW4XuKkBNEsbfu', 1, '2019-12-12 09:18:34', '2019-12-12 09:18:34'),
(157, 'gerdman', 'ynikolaus@example.net', '2019-12-12 09:18:34', '$2y$10$9OJctzxyWYgOEjRamDIO3uMmnXUQAZBJuOP.Xlwt38jfV1XDQWb2K', 0, '2019-12-12 09:18:34', '2019-12-12 09:18:34'),
(158, 'ehermiston', 'skyla01@example.org', '2019-12-12 09:18:34', '$2y$10$whkgZ4hprEotPOqFgoDLaurqBkKJ1jTyzJPKUObbyUzK6XgJPQJVC', 0, '2019-12-12 09:18:35', '2019-12-12 09:18:35'),
(159, 'jermey96', 'ferry.ervin@example.net', '2019-12-12 09:18:35', '$2y$10$7U3UNJ637o/y.smGQ1AcVOdxSrkEIpPGrT7cubILIHgaAijzwiNQ6', 1, '2019-12-12 09:18:35', '2019-12-12 09:18:35'),
(160, 'eziemann', 'jovani38@example.org', '2019-12-12 09:18:35', '$2y$10$p..4j1bjilgVFrdAAKl84.ebJ/VtBswjfqqCpnIMkx7ux6tgy6Jpy', 0, '2019-12-12 09:18:36', '2019-12-12 09:18:36'),
(161, 'aboyle', 'zoe13@example.org', '2019-12-12 09:18:36', '$2y$10$qpYrBUVPNSIuZH1uwXjR4uuLoeLADbaFPOvTW7p9WX/FILZif8M62', 1, '2019-12-12 09:18:36', '2019-12-12 09:18:36'),
(162, 'rosenbaum.ahmed', 'lrath@example.org', '2019-12-12 09:18:36', '$2y$10$5KDBBTcPueGWF9aCb9HWyeIr4435u9nFNMif9ZCqfVGVi2aPQ/COC', 1, '2019-12-12 09:18:36', '2019-12-12 09:18:36'),
(163, 'gerhold.rodrick', 'madonna.hickle@example.org', '2019-12-12 09:18:36', '$2y$10$YzmR1gR9ZLmBqYTkzaaMlOQPd/hL2NB7tvBbaJfg.0CQ5uKgDRugu', 1, '2019-12-12 09:18:36', '2019-12-12 09:18:36'),
(164, 'demetrius62', 'dturner@example.com', '2019-12-12 09:18:37', '$2y$10$OcPK7w9frCxxhzUHMsobxuDoEOsit7bOKf3h65EkoUrydRXhr9YZy', 1, '2019-12-12 09:18:37', '2019-12-12 09:18:37'),
(165, 'ohara.julian', 'quincy.quitzon@example.net', '2019-12-12 09:18:37', '$2y$10$bKcFrt.9ZnpFJHXTlQXpBux91BjKGbb0QgdlnYYMOfwnE1bvBm5Cq', 1, '2019-12-12 09:18:37', '2019-12-12 09:18:37'),
(166, 'neal79', 'qkoelpin@example.com', '2019-12-12 09:18:37', '$2y$10$mHTfvHq.0lsUkTiR6R3kmevYjexRxFJR1zXBXKjWKHhZE/1gsSZfG', 1, '2019-12-12 09:18:38', '2019-12-12 09:18:38'),
(167, 'rquigley', 'rau.bernadine@example.com', '2019-12-12 09:18:38', '$2y$10$SmbXscG62JQUnRbcIC0XL.BF4ikXCruc.vDgfMh3LkfBJUXN36RCu', 0, '2019-12-12 09:18:38', '2019-12-12 09:18:38'),
(168, 'payton88', 'felipe.simonis@example.com', '2019-12-12 09:18:38', '$2y$10$LWOJQwZ0UmoUEsRxz91Ok.jhaeXyLCxiNHMRfesAwuHEI0Fi.nGL6', 1, '2019-12-12 09:18:38', '2019-12-12 09:18:38'),
(169, 'francesco92', 'vhauck@example.com', '2019-12-12 09:18:38', '$2y$10$z0BVQ6Tswi3R.A0DHVlRPOIuWaSRQdpHu8XS/8nCQdR1744l9c5GO', 0, '2019-12-12 09:18:39', '2019-12-12 09:18:39'),
(170, 'hester.brekke', 'phill@example.net', '2019-12-12 09:18:39', '$2y$10$dNPFdShD26FIRt5ASqd3P.MbhObQ/f4DXbwdqPrcS454nTP09vOFK', 0, '2019-12-12 09:18:39', '2019-12-12 09:18:39'),
(171, 'luna41', 'fanny31@example.com', '2019-12-12 09:18:39', '$2y$10$Q7It9rcqTBKFWIyfUPszQO0Xearc.aih9MGt8aq6mx6oU4JV3EDWG', 0, '2019-12-12 09:18:39', '2019-12-12 09:18:39'),
(172, 'stracke.danny', 'padams@example.org', '2019-12-12 09:18:39', '$2y$10$a4TDYgHizbAQu1Qpej4AouvHYIpMCqp9hm4ee8wEiO2gFlB3o8ekO', 0, '2019-12-12 09:18:39', '2019-12-12 09:18:39'),
(173, 'hosea79', 'fjacobs@example.net', '2019-12-12 09:18:39', '$2y$10$mgpX0LJdbDrrutywracAe.hyU8zyuvrfFE2qqflIB.7jOgo.6sbJm', 1, '2019-12-12 09:18:40', '2019-12-12 09:18:40'),
(174, 'joseph13', 'xstrosin@example.net', '2019-12-12 09:18:40', '$2y$10$ESoyrDpvWLwAibCdnZI.G.2Y77L..0qyZ/pUW7m3jHd3.f6wqR6bG', 1, '2019-12-12 09:18:40', '2019-12-12 09:18:40'),
(175, 'rowe.ocie', 'dwight.toy@example.org', '2019-12-12 09:18:40', '$2y$10$o.hK5GPNpS/cNaIuTcVrNOJo8/iRCAYbUQKN.wkoyhA75f8JVTKAe', 1, '2019-12-12 09:18:40', '2019-12-12 09:18:40'),
(176, 'johnson.jacey', 'margarita.price@example.net', '2019-12-12 09:18:40', '$2y$10$qdWiSIt2x1mvNZvaPA3/yudQqT4Vjxvc2n5WEdyAK4.q6xvbR/geO', 1, '2019-12-12 09:18:41', '2019-12-12 09:18:41'),
(177, 'brown.clement', 'edyth91@example.org', '2019-12-12 09:18:41', '$2y$10$V7iJmSltZlQmBqHZSh734.f07XrFkJzkNeiyX5jv/GAsao2VQ.mRO', 1, '2019-12-12 09:18:41', '2019-12-12 09:18:41'),
(178, 'rocio.will', 'napoleon19@example.com', '2019-12-12 09:18:41', '$2y$10$SBt2IbTp1rdTa9YOm.Df3.BHOJUZ3A9WorxP76.pqxIXmPv9165B.', 1, '2019-12-12 09:18:41', '2019-12-12 09:18:41'),
(179, 'gino02', 'wnienow@example.org', '2019-12-12 09:18:41', '$2y$10$q86c9wr67IyWMBvXa9IIqOdJ.Sh5N3Zu8eIwI2OOSDwUU3slD73ES', 0, '2019-12-12 09:18:41', '2019-12-12 09:18:41'),
(180, 'lbecker', 'schroeder.emely@example.net', '2019-12-12 09:18:42', '$2y$10$tUkDQfN/akTJJPNyV5OkJ.wwy6eHDlIgnDyeSqe/zO1qgIjVnVLxi', 0, '2019-12-12 09:18:42', '2019-12-12 09:18:42'),
(181, 'cstoltenberg', 'ricardo53@example.org', '2019-12-12 09:18:42', '$2y$10$ePGI2cOReaubjwpeQkhqd.U/VLIaq1WYa7OCsUuzKQMcmWGHoJ3UO', 0, '2019-12-12 09:18:42', '2019-12-12 09:18:42'),
(182, 'frederik.murray', 'ankunding.elmo@example.net', '2019-12-12 09:18:42', '$2y$10$wUQEuNt4wfzYGrLbiStEWOcdjZbDg5LUIPFhmQ/li9kkxpJi6hdne', 0, '2019-12-12 09:18:42', '2019-12-12 09:18:42'),
(183, 'jaskolski.kamren', 'yhansen@example.com', '2019-12-12 09:18:42', '$2y$10$daHkFB5LOZVgK6MXWBkR4e/YKm/XHO57cVxLNzW6tUdv540fJl6rK', 0, '2019-12-12 09:18:43', '2019-12-12 09:18:43'),
(184, 'kendra.raynor', 'danika22@example.net', '2019-12-12 09:18:43', '$2y$10$UYjYtJxAFWAop/lrXhW5xOGiWxsc7Em.STJJQ5uAdVR2Dd1uprIsS', 0, '2019-12-12 09:18:43', '2019-12-12 09:18:43'),
(185, 'braulio34', 'nova84@example.org', '2019-12-12 09:18:44', '$2y$10$QdG8Uqtcivi.2aB/j2aW0Ohu.cUXMIvnEAc5wVu.e4H3KKzMz53Wy', 1, '2019-12-12 09:18:44', '2019-12-12 09:18:44'),
(186, 'sibyl.davis', 'zwiza@example.com', '2019-12-12 09:18:44', '$2y$10$nhVBBrfplIA9mMVb1l.Rbut.NiHv0EAdaiodmVRPJPI/fy1MPr/ka', 0, '2019-12-12 09:18:44', '2019-12-12 09:18:44'),
(187, 'orlando14', 'shields.electa@example.net', '2019-12-12 09:18:44', '$2y$10$G4fbOxO/sA9oOtoGjgVB8.5Nk1xEaA2FRFw1jxsVN58m6u1LLtazy', 1, '2019-12-12 09:18:44', '2019-12-12 09:18:44'),
(188, 'tfeest', 'roxanne.nitzsche@example.com', '2019-12-12 09:18:44', '$2y$10$oB3ATcIAMvFFqq1o9scAquuziu7FADa5mCsG.mmbG8nEoBhMuM3JG', 1, '2019-12-12 09:18:45', '2019-12-12 09:18:45'),
(189, 'shills', 'hrosenbaum@example.org', '2019-12-12 09:18:45', '$2y$10$vk6KiLXgOM6oxAGt3oPvYeKfcEEle8vmKt8WdOW3Z1Tx/upFhDMtC', 1, '2019-12-12 09:18:45', '2019-12-12 09:18:45'),
(190, 'jeffery29', 'hmayert@example.com', '2019-12-12 09:18:46', '$2y$10$vOqL2p5x0q58VoHq4enykeBKjVYY5TLYVqPgF9Hoauf0WnKVq6ZMy', 0, '2019-12-12 09:18:46', '2019-12-12 09:18:46'),
(191, 'wiley84', 'elisha94@example.net', '2019-12-12 09:18:46', '$2y$10$beqJYDyOIVqWJnZsUzgaE.0bG819ZgESVDHEciUyCS3NKubjRz5Yu', 0, '2019-12-12 09:18:46', '2019-12-12 09:18:46'),
(192, 'judy28', 'eli.monahan@example.org', '2019-12-12 09:18:46', '$2y$10$lktdfNc1qQobcQSU4oT3ju.3zI5rNWc2pVzi5zgzA3hNJDXWcRzk.', 1, '2019-12-12 09:18:46', '2019-12-12 09:18:46'),
(193, 'wilhelm25', 'willms.hattie@example.com', '2019-12-12 09:18:47', '$2y$10$BbmkwrczqzKO9rkFS4j6xu7QbujfsuFEKDuTW9WwyktFjK1qfszwW', 0, '2019-12-12 09:18:47', '2019-12-12 09:18:47'),
(194, 'yesenia.gleichner', 'pablo.cronin@example.net', '2019-12-12 09:18:47', '$2y$10$9IbvaHC.4gUeyIehieVziekYWLgZsB/C1OyHOZy8B2Am79NYborrK', 0, '2019-12-12 09:18:47', '2019-12-12 09:18:47'),
(195, 'kessler.joana', 'ophelia.deckow@example.net', '2019-12-12 09:18:47', '$2y$10$JMsMPhMUxFXzyBCb4GPGhuimMB.EVisKWyGuXhjR9q6Whzdw/FMtC', 1, '2019-12-12 09:18:47', '2019-12-12 09:18:47'),
(196, 'margarita.grant', 'xstehr@example.net', '2019-12-12 09:18:48', '$2y$10$.uWgro350Hh5bEquhD602.p1cbHBFfFETwJTP.R/wt.s14lqA7VS2', 0, '2019-12-12 09:18:48', '2019-12-12 09:18:48'),
(197, 'homenick.marianna', 'bcremin@example.com', '2019-12-12 09:18:48', '$2y$10$NqQK27XgDuCWMOC99qVlne0F5KBuaBRFUYVPju.vnJqT0g6yEZOFW', 1, '2019-12-12 09:18:48', '2019-12-12 09:18:48'),
(198, 'oconner.lea', 'claire.kuhn@example.com', '2019-12-12 09:18:49', '$2y$10$laYPmgM3KX.s92GNCpKoVefmoRbHxVJgJF7fpI0I5HDk2n8oSZdyC', 1, '2019-12-12 09:18:49', '2019-12-12 09:18:49'),
(199, 'kris.stewart', 'edwardo.stokes@example.com', '2019-12-12 09:18:49', '$2y$10$W7fgdgwimGTWLqul8CXD9uJlLGivC1gBSTwF5l5Jn/5W/NAqUMTTi', 0, '2019-12-12 09:18:49', '2019-12-12 09:18:49'),
(200, 'dena.wyman', 'towne.vance@example.net', '2019-12-12 09:18:49', '$2y$10$w7ZOhJKRaM6Kbd0kgRXZmumkthyngwXVpM/5ONixegIT3BZDJxXey', 1, '2019-12-12 09:18:49', '2019-12-12 09:18:49'),
(201, 'hkhkhkhk', 'ghjkhk@mail.com', NULL, '$2y$10$z.4KvuFN6LkyISQg0OsTAOsxoAWY09d9f4EW0eItPDrqlYHSfuuLm', 0, '2019-12-13 07:37:08', '2019-12-13 07:37:08');

-- --------------------------------------------------------

--
-- Structure de la table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formattedAddress` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buildingNumber` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `addresses`
--

INSERT INTO `addresses` (`id`, `street`, `formattedAddress`, `province`, `state`, `region`, `city`, `country`, `postcode`, `latitude`, `longitude`, `buildingNumber`, `created_at`, `updated_at`) VALUES
(1, '665 Marvin Summit Apt. 752', '18056 Hammes Meadow Apt. 714', 'Oklahoma', 'NC', 'Virginia', 'Trevahaven', 'Turkey', '22869', '58.193345', '168.280098', 58785, '2019-12-12 09:17:33', '2019-12-12 09:17:33'),
(2, '16894 Jaquelin Place Suite 026', '642 Pearlie Fords Apt. 408', 'Kentucky', 'SD', 'New Jersey', 'Jettchester', 'Georgia', '38258-5470', '-42.944411', '29.846383', 487, '2019-12-12 09:17:33', '2019-12-12 09:17:33'),
(3, '155 Jones Station', '4015 Mariela Junction', 'Wyoming', 'ME', 'Connecticut', 'Raufort', 'Tajikistan', '23045-0871', '-86.212713', '-8.155178', 552, '2019-12-12 09:17:34', '2019-12-12 09:17:34'),
(4, '91655 Oberbrunner Overpass', '4730 Reynolds Harbor Apt. 950', 'Alaska', 'TX', 'Kansas', 'New Delia', 'Ghana', '86805-4773', '-60.332837', '-66.724142', 5171, '2019-12-12 09:17:34', '2019-12-12 09:17:34'),
(5, '72173 Bertrand Glen', '21200 Keebler Knoll Apt. 729', 'New York', 'WI', 'Nevada', 'Lake Judy', 'Northern Mariana Islands', '80157', '-33.450905', '159.504585', 7596, '2019-12-12 09:17:34', '2019-12-12 09:17:34'),
(6, '136 Roxanne Route', '540 McCullough Knoll', 'Maryland', 'NH', 'Kansas', 'New Gunnar', 'Heard Island and McDonald Islands', '53512-3667', '69.391682', '-11.224738', 214, '2019-12-12 09:17:35', '2019-12-12 09:17:35'),
(7, '983 Miguel Park Apt. 567', '89242 Lindgren Crescent Suite 442', 'South Carolina', 'MO', 'Delaware', 'Isaiahburgh', 'Trinidad and Tobago', '22094-2789', '-37.218643', '-156.457807', 7777, '2019-12-12 09:17:35', '2019-12-12 09:17:35'),
(8, '221 Melany Summit Suite 015', '240 Keebler Plains Suite 979', 'Arizona', 'ID', 'Alabama', 'Creminchester', 'Uruguay', '75834', '-3.421654', '-1.270368', 8495, '2019-12-12 09:17:36', '2019-12-12 09:17:36'),
(9, '3011 Gottlieb Harbor', '482 Terry Creek Apt. 105', 'Massachusetts', 'TN', 'California', 'Magaliport', 'Dominica', '76589', '80.122573', '132.482022', 26748, '2019-12-12 09:17:36', '2019-12-12 09:17:36'),
(10, '2785 Ewell Fords Suite 461', '447 Leila Gateway', 'Pennsylvania', 'ID', 'Minnesota', 'Dachside', 'Djibouti', '08348-5556', '-52.84517', '96.660517', 884, '2019-12-12 09:17:36', '2019-12-12 09:17:36'),
(11, '13563 Lazaro Vista', '44401 Sammy Common Suite 386', 'Utah', 'AZ', 'Alaska', 'Lavonneside', 'Denmark', '58677', '-42.904429', '-21.967445', 475, '2019-12-12 09:17:36', '2019-12-12 09:17:36'),
(12, '100 Princess Gateway', '94823 Renner Forge', 'Michigan', 'MS', 'Indiana', 'Andersonport', 'United States Minor Outlying Islands', '75764', '1.096034', '123.963947', 1794, '2019-12-12 09:17:37', '2019-12-12 09:17:37'),
(13, '685 Colten Keys Apt. 010', '4328 Erika Estates', 'Idaho', 'MI', 'Tennessee', 'North Skylamouth', 'Austria', '42209', '-0.561194', '-141.436142', 2549, '2019-12-12 09:17:37', '2019-12-12 09:17:37'),
(14, '83586 Konopelski Station', '80998 O\'Conner Point Apt. 862', 'Montana', 'MS', 'Arkansas', 'West Flavietown', 'Timor-Leste', '19120', '34.531282', '178.318407', 8482, '2019-12-12 09:17:37', '2019-12-12 09:17:37'),
(15, '3553 Schaefer Viaduct', '16431 Candida Mews', 'Kentucky', 'MN', 'Tennessee', 'Nienowland', 'Australia', '11536-8214', '76.512135', '88.530532', 62276, '2019-12-12 09:17:38', '2019-12-12 09:17:38'),
(16, '3224 Dario Isle Apt. 726', '27188 Kessler Motorway', 'Mississippi', 'NV', 'Kansas', 'West Kristofferburgh', 'Belgium', '65878-9687', '-37.064963', '-174.251083', 7775, '2019-12-12 09:17:38', '2019-12-12 09:17:38'),
(17, '95863 Ahmad Viaduct Apt. 292', '38621 Daniel Knolls', 'Idaho', 'MO', 'Minnesota', 'North Chasityshire', 'Argentina', '99127', '-45.803377', '22.059371', 7531, '2019-12-12 09:17:39', '2019-12-12 09:17:39'),
(18, '214 Feil Lakes', '33432 Rolfson Passage', 'Maryland', 'TN', 'Hawaii', 'Blickshire', 'Iraq', '18948-0125', '50.230761', '-62.060343', 112, '2019-12-12 09:17:39', '2019-12-12 09:17:39'),
(19, '702 Lela Junctions Apt. 018', '70576 Casper Run Apt. 469', 'West Virginia', 'WV', 'Idaho', 'Torranceport', 'Djibouti', '81643-4636', '-74.023095', '27.48987', 1560, '2019-12-12 09:17:39', '2019-12-12 09:17:39'),
(20, '7648 Gia Roads', '431 Mercedes Road', 'North Dakota', 'TX', 'New Hampshire', 'South Jacey', 'Saudi Arabia', '48760-9617', '-83.228165', '1.215556', 20152, '2019-12-12 09:17:40', '2019-12-12 09:17:40'),
(21, '28875 Emely Plaza', '93668 Grayce Way Suite 278', 'Oregon', 'WA', 'West Virginia', 'Port Cordie', 'Taiwan', '00237', '51.491707', '104.087784', 5314, '2019-12-12 09:17:40', '2019-12-12 09:17:40'),
(22, '72439 Olson Valley Apt. 955', '96220 Glennie Knolls', 'Alaska', 'VT', 'North Carolina', 'New Krystel', 'Faroe Islands', '04146-6149', '37.691718', '-163.693216', 7251, '2019-12-12 09:17:40', '2019-12-12 09:17:40'),
(23, '74603 Kemmer Port Suite 735', '3152 Imelda Points', 'Maine', 'TX', 'Colorado', 'East Gertrude', 'Israel', '52614', '-53.505566', '-65.981107', 18529, '2019-12-12 09:17:41', '2019-12-12 09:17:41'),
(24, '17165 Heather Alley', '154 Labadie Vista Suite 200', 'Nevada', 'IL', 'Kentucky', 'Murrayshire', 'Sri Lanka', '02116', '89.14597', '-103.512201', 44797, '2019-12-12 09:17:41', '2019-12-12 09:17:41'),
(25, '991 Shane Greens Suite 896', '789 Deckow Orchard Suite 469', 'Illinois', 'IA', 'North Dakota', 'North Raina', 'Isle of Man', '34797', '5.350328', '-43.160971', 66251, '2019-12-12 09:17:41', '2019-12-12 09:17:41'),
(26, '182 Kody Grove Apt. 294', '5663 Maud Summit', 'Ohio', 'MS', 'California', 'East Joelle', 'Spain', '23533-0631', '64.213091', '-75.040526', 690, '2019-12-12 09:17:42', '2019-12-12 09:17:42'),
(27, '6596 Marks Mountains Apt. 532', '2853 Emilio Viaduct', 'Kentucky', 'NH', 'Kansas', 'Port Hunter', 'Svalbard & Jan Mayen Islands', '40770', '74.159404', '5.029551', 21992, '2019-12-12 09:17:42', '2019-12-12 09:17:42'),
(28, '39867 Donnelly Land Suite 922', '8467 Keegan Ports', 'Kansas', 'MS', 'Vermont', 'Balistreriberg', 'Northern Mariana Islands', '95019-2035', '72.095337', '-90.496856', 23030, '2019-12-12 09:17:42', '2019-12-12 09:17:42'),
(29, '473 Reinger Ridge', '1112 Lakin Walks', 'Nevada', 'TX', 'Wisconsin', 'Mosesfurt', 'Jamaica', '34569-2356', '-23.686855', '178.01368', 91679, '2019-12-12 09:17:43', '2019-12-12 09:17:43'),
(30, '634 Tod Street Suite 761', '491 Lakin Islands', 'District of Columbia', 'NJ', 'Missouri', 'Wainofurt', 'Turkmenistan', '31045-2217', '76.571413', '-152.564769', 1629, '2019-12-12 09:17:43', '2019-12-12 09:17:43'),
(31, '7269 Schultz Ridges Suite 554', '7529 Schmidt Port', 'Pennsylvania', 'LA', 'Minnesota', 'South Roosevelthaven', 'Haiti', '96302-6846', '-87.472854', '19.216672', 679, '2019-12-12 09:17:43', '2019-12-12 09:17:43'),
(32, '727 Moore Spring', '857 Conroy Highway Apt. 439', 'Delaware', 'AR', 'New York', 'New Cathrynhaven', 'Norway', '57447-8562', '48.356681', '13.604182', 934, '2019-12-12 09:17:44', '2019-12-12 09:17:44'),
(33, '7938 Kris Spurs Suite 896', '78907 Lakin Island Suite 733', 'Ohio', 'IN', 'Pennsylvania', 'Weimannbury', 'Lao People\'s Democratic Republic', '00211-2753', '-1.254748', '-27.715133', 96159, '2019-12-12 09:17:44', '2019-12-12 09:17:44'),
(34, '853 Koch Manors Apt. 798', '48128 Evalyn Cape', 'Delaware', 'AL', 'Florida', 'Amayaville', 'United Kingdom', '68382-5514', '14.203078', '42.492771', 99437, '2019-12-12 09:17:44', '2019-12-12 09:17:44'),
(35, '66666 Justine Pines', '14237 Haleigh Burg', 'Vermont', 'LA', 'Virginia', 'Darrenfort', 'Kenya', '24308', '8.617025', '-143.288954', 984, '2019-12-12 09:17:44', '2019-12-12 09:17:44'),
(36, '47670 Catalina Road', '1220 Pascale Unions Apt. 574', 'Ohio', 'VT', 'Arizona', 'East Abeburgh', 'Colombia', '48964-7803', '7.828971', '151.048765', 4693, '2019-12-12 09:17:45', '2019-12-12 09:17:45'),
(37, '324 Alda Path', '325 Lamont Neck Suite 042', 'Washington', 'ND', 'West Virginia', 'Santamouth', 'Macedonia', '34006', '-85.597212', '58.976626', 83625, '2019-12-12 09:17:45', '2019-12-12 09:17:45'),
(38, '6684 Ortiz Lakes Apt. 372', '786 Zoie Inlet', 'Wisconsin', 'HI', 'New Mexico', 'Lake Lessiefurt', 'Cocos (Keeling) Islands', '65933', '70.668913', '20.130058', 8779, '2019-12-12 09:17:45', '2019-12-12 09:17:45'),
(39, '23210 Ashly Key', '53877 Flatley Common Suite 203', 'South Carolina', 'TX', 'North Carolina', 'Janietown', 'Pitcairn Islands', '42111-3652', '22.438755', '-37.415224', 95396, '2019-12-12 09:17:46', '2019-12-12 09:17:46'),
(40, '895 Nitzsche Union Apt. 111', '61061 Art Shore Apt. 801', 'New York', 'DC', 'Florida', 'Beahanbury', 'Haiti', '63210', '-58.140784', '-133.866894', 323, '2019-12-12 09:17:46', '2019-12-12 09:17:46'),
(41, '521 Sedrick Overpass Apt. 402', '88560 Lubowitz Cape', 'Vermont', 'AZ', 'New York', 'Aylinchester', 'Barbados', '31657', '-47.607418', '146.706555', 7342, '2019-12-12 09:17:46', '2019-12-12 09:17:46'),
(42, '9214 Ledner Junction Apt. 528', '804 DuBuque Flats', 'New Jersey', 'IN', 'Georgia', 'Lamarland', 'Jersey', '41935-4940', '46.047956', '55.325753', 358, '2019-12-12 09:17:47', '2019-12-12 09:17:47'),
(43, '80826 Delphine Shore', '92309 Lindgren Station Apt. 490', 'Missouri', 'WV', 'Minnesota', 'Dietrichhaven', 'Georgia', '22919-1094', '61.932397', '-26.22052', 3913, '2019-12-12 09:17:47', '2019-12-12 09:17:47'),
(44, '19061 Spinka Camp Suite 063', '83869 Mckayla Manors', 'New Hampshire', 'AL', 'Alabama', 'New Fernandomouth', 'Jersey', '86628-5537', '-78.20156', '-137.233004', 5114, '2019-12-12 09:17:48', '2019-12-12 09:17:48'),
(45, '28213 Kaylin Flats Suite 952', '292 Salma Key', 'Iowa', 'CA', 'Minnesota', 'Fletahaven', 'Belgium', '09748-2503', '88.261013', '-173.959931', 64784, '2019-12-12 09:17:48', '2019-12-12 09:17:48'),
(46, '209 Mable Locks Suite 235', '4372 Eli Brooks Apt. 092', 'Alaska', 'MO', 'Illinois', 'Thielmouth', 'Germany', '75459', '1.997197', '-66.214544', 67144, '2019-12-12 09:17:48', '2019-12-12 09:17:48'),
(47, '688 Brekke Mills', '11309 Heathcote Pike Suite 638', 'Nebraska', 'IN', 'Wisconsin', 'North Maribelside', 'Vanuatu', '69407', '-30.412712', '-96.799288', 365, '2019-12-12 09:17:48', '2019-12-12 09:17:48'),
(48, '952 Pierce Lake Apt. 726', '1027 Ray Well', 'Ohio', 'AZ', 'Virginia', 'Boylehaven', 'Tajikistan', '62483', '-35.383787', '71.568178', 7435, '2019-12-12 09:17:49', '2019-12-12 09:17:49'),
(49, '31082 Mayer Hollow Suite 171', '79472 Kulas Motorway Suite 315', 'Hawaii', 'PA', 'South Carolina', 'Lake Emilieview', 'Morocco', '17652', '83.940172', '161.624719', 5976, '2019-12-12 09:17:49', '2019-12-12 09:17:49'),
(50, '8159 Sporer Tunnel', '3738 Dietrich Mountain Suite 619', 'Alaska', 'TN', 'Wyoming', 'North Josiah', 'Namibia', '02008', '9.909356', '127.966672', 2640, '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(51, '59495 Vada Centers', '130 Heaney Crossing', 'Virginia', 'NY', 'Colorado', 'East Cordell', 'Iraq', '89731-2875', '-47.082499', '0.907153', 594, '2019-12-12 09:17:52', '2019-12-12 09:17:52'),
(52, '952 Myra Lodge Suite 978', '342 Lexus Ford', 'Alaska', 'NC', 'Hawaii', 'Humbertoshire', 'Lithuania', '23721', '-11.134404', '-54.771638', 8497, '2019-12-12 09:17:52', '2019-12-12 09:17:52'),
(53, '53932 Mante Groves', '534 Reina Crossing Apt. 036', 'Connecticut', 'ID', 'South Carolina', 'South Elliot', 'Seychelles', '73819', '-73.29386', '161.106344', 9284, '2019-12-12 09:17:53', '2019-12-12 09:17:53'),
(54, '18483 Libby Stravenue Apt. 356', '35296 Purdy Falls', 'Louisiana', 'VA', 'Minnesota', 'North Vern', 'Malawi', '99739-6831', '-48.592863', '-162.579989', 8447, '2019-12-12 09:17:53', '2019-12-12 09:17:53'),
(55, '9297 Ewald Pike Suite 708', '13171 Eva Ports', 'Missouri', 'DE', 'Kansas', 'New Berneice', 'Niue', '84420', '-50.383574', '-65.844651', 8429, '2019-12-12 09:17:53', '2019-12-12 09:17:53'),
(56, '9955 Felipa Extensions Apt. 308', '8185 Adriel Bridge', 'New York', 'AR', 'Tennessee', 'New Juliachester', 'Saint Kitts and Nevis', '11445', '30.855455', '-42.145287', 78029, '2019-12-12 09:17:54', '2019-12-12 09:17:54'),
(57, '6821 Jacobi Burgs', '5027 Vella Gateway', 'Louisiana', 'MA', 'New York', 'Predovichaven', 'Guatemala', '31046', '49.316736', '148.639805', 344, '2019-12-12 09:17:54', '2019-12-12 09:17:54'),
(58, '16018 Bailey Path', '926 Gaylord Ranch', 'Nebraska', 'GA', 'Alaska', 'South Kaydenburgh', 'Zimbabwe', '83522', '-48.359617', '155.418342', 860, '2019-12-12 09:17:54', '2019-12-12 09:17:54'),
(59, '8120 O\'Reilly Common Apt. 855', '13802 Bechtelar Lodge', 'Alaska', 'AL', 'Montana', 'West Shannyside', 'Libyan Arab Jamahiriya', '16887-1648', '-11.362551', '54.651455', 1444, '2019-12-12 09:17:55', '2019-12-12 09:17:55'),
(60, '91374 Reta Shore Suite 213', '427 Heaney Lakes Apt. 031', 'Maine', 'MI', 'Florida', 'Parisianside', 'Mozambique', '27993', '-7.637234', '-22.022053', 39326, '2019-12-12 09:17:55', '2019-12-12 09:17:55'),
(61, '741 Camryn Tunnel Suite 463', '27554 Jacobi Vista', 'Delaware', 'KS', 'Iowa', 'Gaylordbury', 'Cook Islands', '85618-2835', '66.29605', '-70.416939', 212, '2019-12-12 09:17:55', '2019-12-12 09:17:55'),
(62, '9297 Marjolaine Turnpike', '269 Leuschke Ridges Suite 126', 'South Dakota', 'ID', 'New Hampshire', 'Elianland', 'Hungary', '18092-2955', '-65.378348', '116.299469', 556, '2019-12-12 09:17:56', '2019-12-12 09:17:56'),
(63, '429 Kayley Circle', '696 Mohr Union Suite 082', 'Maryland', 'NM', 'Maine', 'Goyetteland', 'Bangladesh', '37639', '49.993623', '-61.30149', 569, '2019-12-12 09:17:56', '2019-12-12 09:17:56'),
(64, '5172 Glenna Fort Suite 841', '2388 Barton Islands Suite 996', 'South Dakota', 'MT', 'Oklahoma', 'Alexaneberg', 'Kyrgyz Republic', '57964-5222', '-85.218573', '151.067275', 48628, '2019-12-12 09:17:56', '2019-12-12 09:17:56'),
(65, '94263 Stanley Bypass', '396 Halvorson Burg', 'Rhode Island', 'HI', 'Alabama', 'Kshlerinport', 'Guatemala', '40161', '-38.341142', '-172.298024', 39786, '2019-12-12 09:17:57', '2019-12-12 09:17:57'),
(66, '8491 Reinger Trail Suite 944', '85295 Goodwin Common', 'Minnesota', 'ND', 'New Jersey', 'Wilkinsonview', 'Tanzania', '86288-6518', '-45.337446', '3.393221', 4034, '2019-12-12 09:17:57', '2019-12-12 09:17:57'),
(67, '96858 Reinhold Row', '27898 Swaniawski Islands', 'Illinois', 'ND', 'North Carolina', 'West Carmen', 'Dominica', '60435', '36.01008', '133.70095', 785, '2019-12-12 09:17:57', '2019-12-12 09:17:57'),
(68, '951 Kirlin Mount', '1411 Florence Garden', 'New Hampshire', 'IL', 'New Jersey', 'Naomiestad', 'Barbados', '60730-5352', '31.769432', '-124.780588', 22978, '2019-12-12 09:17:58', '2019-12-12 09:17:58'),
(69, '2818 Feeney Mills', '1803 Satterfield Rest Apt. 469', 'Florida', 'PA', 'Tennessee', 'Francescoberg', 'Kuwait', '06373-4001', '-40.464115', '115.408281', 6245, '2019-12-12 09:17:58', '2019-12-12 09:17:58'),
(70, '92574 Wunsch Points', '534 Gislason Stravenue Apt. 517', 'Minnesota', 'MO', 'Arizona', 'Tiffanymouth', 'Chile', '27694', '33.900249', '171.396747', 71646, '2019-12-12 09:17:58', '2019-12-12 09:17:58'),
(71, '2739 Payton Islands', '4717 Schaefer Trafficway', 'South Carolina', 'DE', 'Mississippi', 'Port Roycefurt', 'Argentina', '43003', '82.111101', '-12.204696', 566, '2019-12-12 09:17:58', '2019-12-12 09:17:58'),
(72, '4383 Marco Garden Apt. 235', '466 Raynor Valleys Apt. 070', 'Indiana', 'ME', 'Rhode Island', 'Feilborough', 'Guadeloupe', '15048-7507', '13.861417', '-130.864705', 48501, '2019-12-12 09:17:59', '2019-12-12 09:17:59'),
(73, '39091 Emory Alley Apt. 451', '454 Ortiz Knoll Suite 759', 'Wisconsin', 'DC', 'Georgia', 'Mitchellburgh', 'Jersey', '01121', '-75.439383', '-65.417933', 354, '2019-12-12 09:17:59', '2019-12-12 09:17:59'),
(74, '480 Schulist Extension', '15566 Jolie Heights', 'Vermont', 'IN', 'South Dakota', 'New Yadira', 'American Samoa', '68268', '4.888553', '-152.259683', 40562, '2019-12-12 09:17:59', '2019-12-12 09:17:59'),
(75, '968 Tommie Trail', '606 Cummerata Spur', 'Minnesota', 'CA', 'California', 'Dillonchester', 'Dominican Republic', '94948', '-50.643921', '-91.419038', 6076, '2019-12-12 09:18:00', '2019-12-12 09:18:00'),
(76, '12313 Wyman Village Suite 807', '516 Brennan Turnpike Suite 432', 'Hawaii', 'NJ', 'Tennessee', 'Blickton', 'Cameroon', '14228-7138', '-82.042323', '101.266261', 4783, '2019-12-12 09:18:00', '2019-12-12 09:18:00'),
(77, '415 Zemlak Trail Apt. 338', '71058 Abdul Isle', 'Massachusetts', 'MT', 'Kentucky', 'Breitenbergburgh', 'Tonga', '60212', '-39.259835', '-49.23317', 184, '2019-12-12 09:18:00', '2019-12-12 09:18:00'),
(78, '58637 Kamron Gardens', '10216 Kerluke Plains Suite 460', 'Louisiana', 'VT', 'Tennessee', 'Port Willard', 'Vanuatu', '53228-4743', '8.064874', '177.163212', 8655, '2019-12-12 09:18:01', '2019-12-12 09:18:01'),
(79, '3321 Jaiden Underpass', '88848 Jamey Rest Suite 118', 'Pennsylvania', 'WI', 'Illinois', 'South Haven', 'Bouvet Island (Bouvetoya)', '69915-4931', '-38.974956', '173.889957', 475, '2019-12-12 09:18:01', '2019-12-12 09:18:01'),
(80, '8936 Ruecker Overpass', '65021 Schmidt Throughway Apt. 656', 'New Mexico', 'NJ', 'Vermont', 'New Lavinia', 'Mozambique', '80773', '16.383731', '-91.570156', 651, '2019-12-12 09:18:02', '2019-12-12 09:18:02'),
(81, '74895 Watsica Ramp', '6323 Gerlach Mill Apt. 470', 'Utah', 'RI', 'Rhode Island', 'Wilfordhaven', 'Bahrain', '50691', '35.414905', '16.685851', 236, '2019-12-12 09:18:02', '2019-12-12 09:18:02'),
(82, '28816 Sporer Key Apt. 215', '95936 Jules Loop', 'Alaska', 'AL', 'Massachusetts', 'Boehmshire', 'Taiwan', '11683-9725', '89.276178', '24.615322', 25127, '2019-12-12 09:18:02', '2019-12-12 09:18:02'),
(83, '451 Leone Causeway', '744 Ruecker Flats Apt. 070', 'Ohio', 'RI', 'Oregon', 'Cummingsport', 'British Indian Ocean Territory (Chagos Archipelago)', '60675', '3.10701', '-101.886347', 4161, '2019-12-12 09:18:03', '2019-12-12 09:18:03'),
(84, '770 Bayer Walks', '559 Katelin Drive Suite 336', 'Utah', 'OR', 'Delaware', 'Port Sarah', 'Bulgaria', '85361-5867', '-47.041702', '75.190131', 236, '2019-12-12 09:18:03', '2019-12-12 09:18:03'),
(85, '84450 Nicolette Place', '60325 Lind View', 'Idaho', 'MI', 'Utah', 'South Ethelyn', 'Lithuania', '14525', '79.840123', '43.32789', 26670, '2019-12-12 09:18:03', '2019-12-12 09:18:03'),
(86, '440 Gia Forks Apt. 790', '55817 Dooley Station', 'Wisconsin', 'CO', 'Missouri', 'West Julie', 'Sudan', '20596-3614', '-73.300083', '164.5929', 53639, '2019-12-12 09:18:04', '2019-12-12 09:18:04'),
(87, '24510 Elsie Pass', '46386 Kylie Crescent', 'Illinois', 'OR', 'Kentucky', 'Prohaskastad', 'Solomon Islands', '20307', '-40.538521', '-106.59189', 4376, '2019-12-12 09:18:04', '2019-12-12 09:18:04'),
(88, '53319 Gerlach Mount', '45082 Carmella Ranch Apt. 664', 'South Carolina', 'DE', 'Alabama', 'Eladiostad', 'Egypt', '76275-4928', '58.003426', '-159.485507', 42280, '2019-12-12 09:18:04', '2019-12-12 09:18:04'),
(89, '44639 Willy Hills', '25953 Tillman Trail', 'Michigan', 'NV', 'Illinois', 'Port Alfbury', 'Vanuatu', '61718', '83.961254', '-114.995083', 2693, '2019-12-12 09:18:05', '2019-12-12 09:18:05'),
(90, '28798 Hegmann Gardens', '6811 Willow Row Apt. 007', 'Kentucky', 'MA', 'Wyoming', 'West Arielle', 'Guinea', '23831-2149', '-22.015741', '116.675228', 4273, '2019-12-12 09:18:05', '2019-12-12 09:18:05'),
(91, '72646 Kessler Land Apt. 392', '32720 Turcotte Locks Apt. 735', 'Iowa', 'VT', 'Indiana', 'South Dawson', 'Mauritius', '35941-7848', '-79.930526', '27.549746', 85145, '2019-12-12 09:18:05', '2019-12-12 09:18:05'),
(92, '197 Langosh Plaza Apt. 918', '6666 Mossie Station Apt. 386', 'South Carolina', 'MI', 'Virginia', 'South Rettaview', 'Namibia', '85265-7874', '61.079702', '70.767911', 9333, '2019-12-12 09:18:06', '2019-12-12 09:18:06'),
(93, '9119 Hagenes Plain Apt. 214', '3901 Okey Estate Suite 726', 'Texas', 'VA', 'Minnesota', 'North Estebanshire', 'Niue', '33966-7383', '-12.387955', '94.923133', 2201, '2019-12-12 09:18:06', '2019-12-12 09:18:06'),
(94, '72962 Daniel Bridge', '368 McKenzie Locks', 'Vermont', 'MO', 'Colorado', 'Schimmelside', 'Somalia', '55463-7203', '7.080446', '101.596989', 534, '2019-12-12 09:18:06', '2019-12-12 09:18:06'),
(95, '1746 Shields Ranch', '9249 Kohler Forest Apt. 794', 'New Mexico', 'MD', 'California', 'Haneport', 'Singapore', '34251-0708', '-88.688773', '169.847392', 388, '2019-12-12 09:18:07', '2019-12-12 09:18:07'),
(96, '88573 Conroy Cliff', '81872 Tromp Isle Suite 846', 'Oregon', 'ID', 'Rhode Island', 'Ilenefort', 'Timor-Leste', '95888-7261', '86.43264', '2.007636', 3963, '2019-12-12 09:18:07', '2019-12-12 09:18:07'),
(97, '3343 Greenfelder Ranch', '5153 Batz Spur', 'Mississippi', 'OR', 'Indiana', 'Lake Damionberg', 'Macao', '79917-5084', '82.588791', '-11.6304', 8099, '2019-12-12 09:18:07', '2019-12-12 09:18:07'),
(98, '2083 Aglae Key', '12593 Nora Islands Apt. 797', 'Arizona', 'VT', 'New Hampshire', 'North Marion', 'Bahamas', '22992', '-71.395395', '170.55349', 59838, '2019-12-12 09:18:08', '2019-12-12 09:18:08'),
(99, '50728 Caroline Way Apt. 962', '5553 Kasey Brooks Suite 295', 'Nebraska', 'ID', 'Mississippi', 'Bradberg', 'Philippines', '74600-0261', '-44.130992', '-89.456838', 798, '2019-12-12 09:18:08', '2019-12-12 09:18:08'),
(100, '6783 Kozey Mills', '7006 Liliane Walk', 'Wyoming', 'TN', 'North Carolina', 'Cummingsfort', 'Lao People\'s Democratic Republic', '50401', '-68.703474', '147.24817', 2780, '2019-12-12 09:18:08', '2019-12-12 09:18:08'),
(101, '774 Altenwerth Underpass', '527 Lamar Plain', 'North Dakota', 'OH', 'New Hampshire', 'Alyssonborough', 'Burundi', '30272', '24.152925', '-4.081721', 4857, '2019-12-12 09:18:13', '2019-12-12 09:18:13'),
(102, '242 Anika Ville', '9359 Rhoda Lake Suite 208', 'Ohio', 'ME', 'Florida', 'Ottoport', 'American Samoa', '42924-6263', '37.2971', '137.226705', 97299, '2019-12-12 09:18:13', '2019-12-12 09:18:13'),
(103, '56289 Gorczany Crossroad Suite 756', '555 Devyn Pines Suite 004', 'Ohio', 'OK', 'Wyoming', 'Kaileymouth', 'Ukraine', '82005-5065', '-60.906636', '50.007249', 1832, '2019-12-12 09:18:14', '2019-12-12 09:18:14'),
(104, '95906 Purdy Common', '6568 Prudence Unions', 'Montana', 'WI', 'Idaho', 'Lake Angelaborough', 'El Salvador', '02947', '-85.851409', '100.042605', 4746, '2019-12-12 09:18:14', '2019-12-12 09:18:14'),
(105, '3978 Funk Center Suite 964', '4221 Edward Parks Apt. 404', 'Ohio', 'MI', 'Vermont', 'South Clarkmouth', 'Argentina', '48304-4286', '-14.58175', '-160.299229', 5343, '2019-12-12 09:18:14', '2019-12-12 09:18:14'),
(106, '2835 Koepp Oval', '66060 Lacy Mountain Suite 479', 'Mississippi', 'MS', 'Pennsylvania', 'Port Nicoborough', 'Afghanistan', '11260', '-75.611504', '-73.592808', 2072, '2019-12-12 09:18:15', '2019-12-12 09:18:15'),
(107, '5339 Kuhic View Suite 355', '3716 Dedrick Ford Apt. 009', 'Kansas', 'TN', 'West Virginia', 'Leoview', 'Qatar', '22529-9151', '64.141857', '162.449385', 21244, '2019-12-12 09:18:15', '2019-12-12 09:18:15'),
(108, '75221 Kristofer Rue Apt. 898', '549 Moore Knolls', 'Washington', 'IL', 'North Carolina', 'Priscillamouth', 'Cyprus', '98763', '-8.117071', '101.110564', 40914, '2019-12-12 09:18:16', '2019-12-12 09:18:16'),
(109, '4583 Steuber Vista', '9808 Casey Port', 'New Hampshire', 'VA', 'Minnesota', 'Odastad', 'Liechtenstein', '46451', '26.617384', '-130.819816', 72781, '2019-12-12 09:18:16', '2019-12-12 09:18:16'),
(110, '38695 Demond Ford Suite 115', '690 Dickens Prairie Suite 389', 'Rhode Island', 'TX', 'Colorado', 'South Carrollstad', 'Nauru', '52391-0404', '79.418234', '77.705559', 4985, '2019-12-12 09:18:16', '2019-12-12 09:18:16'),
(111, '667 Aidan Mall', '70466 Finn Tunnel', 'Ohio', 'NJ', 'Alaska', 'Aaronmouth', 'Palau', '15913-5819', '82.937782', '56.17529', 599, '2019-12-12 09:18:16', '2019-12-12 09:18:16'),
(112, '191 Pollich Course', '320 Lueilwitz Courts', 'Vermont', 'SC', 'Alaska', 'Greenfelderfurt', 'Falkland Islands (Malvinas)', '32398', '-27.422196', '-124.038848', 6501, '2019-12-12 09:18:17', '2019-12-12 09:18:17'),
(113, '80535 Homenick Forges', '63403 Gleichner Islands Apt. 089', 'Missouri', 'SC', 'Virginia', 'Hilmamouth', 'Malta', '75343', '83.506523', '117.761719', 343, '2019-12-12 09:18:17', '2019-12-12 09:18:17'),
(114, '839 Diego Ramp Apt. 238', '8490 Vern Forge', 'North Carolina', 'FL', 'Oklahoma', 'West Janis', 'Gibraltar', '10350-8932', '-14.27428', '-24.614078', 22046, '2019-12-12 09:18:18', '2019-12-12 09:18:18'),
(115, '2809 Charity Mountain Apt. 579', '81738 Laura Parkways', 'Louisiana', 'DE', 'Kentucky', 'Lake Yasmine', 'Bahrain', '03056-1783', '-35.629565', '157.545768', 38298, '2019-12-12 09:18:18', '2019-12-12 09:18:18'),
(116, '2193 Vena Viaduct', '604 Armani Shores Apt. 154', 'West Virginia', 'WI', 'North Carolina', 'Port Erika', 'Serbia', '90887-6360', '-45.332141', '40.234675', 97456, '2019-12-12 09:18:18', '2019-12-12 09:18:18'),
(117, '727 Prohaska Mews Apt. 866', '43373 Aurelie Shoals', 'Hawaii', 'WY', 'Hawaii', 'East Alexane', 'Micronesia', '54773-4789', '52.579655', '171.950836', 727, '2019-12-12 09:18:19', '2019-12-12 09:18:19'),
(118, '55833 Marks Inlet', '63052 Anderson Walks Apt. 072', 'Illinois', 'DC', 'Alabama', 'East Mittieton', 'Wallis and Futuna', '75716', '31.966718', '-17.107423', 288, '2019-12-12 09:18:19', '2019-12-12 09:18:19'),
(119, '4547 Chance Islands', '72519 Daphne Radial Apt. 700', 'North Dakota', 'AR', 'Georgia', 'Lake Dejonport', 'Maldives', '33180', '-26.010486', '123.986791', 49055, '2019-12-12 09:18:19', '2019-12-12 09:18:19'),
(120, '3009 Monte Place', '97066 Irma Manor Apt. 513', 'Oklahoma', 'NJ', 'New Hampshire', 'Stromanburgh', 'Somalia', '76294-4529', '65.404709', '-140.127372', 611, '2019-12-12 09:18:20', '2019-12-12 09:18:20'),
(121, '611 Jayde Extension Apt. 941', '41762 Alana Radial', 'Pennsylvania', 'MS', 'Minnesota', 'North Noeberg', 'Trinidad and Tobago', '60348', '-62.39289', '-80.346821', 313, '2019-12-12 09:18:20', '2019-12-12 09:18:20'),
(122, '5827 Monahan Orchard', '978 Dare Motorway Suite 260', 'New Mexico', 'UT', 'Colorado', 'New Ginostad', 'Bulgaria', '85007-8508', '15.667412', '-21.931579', 131, '2019-12-12 09:18:20', '2019-12-12 09:18:20'),
(123, '76429 Jerde Mall Suite 842', '7171 Macejkovic Gardens Apt. 965', 'Colorado', 'ME', 'Idaho', 'New Rogerfort', 'Romania', '81320', '18.235905', '107.929685', 37729, '2019-12-12 09:18:21', '2019-12-12 09:18:21'),
(124, '694 Marks Mill', '8887 Darren Island', 'Utah', 'ND', 'West Virginia', 'East Gretaview', 'Honduras', '95044-8021', '54.113503', '-156.685162', 7373, '2019-12-12 09:18:21', '2019-12-12 09:18:21'),
(125, '753 Adele Hills Apt. 809', '4402 Smith Mission', 'Delaware', 'AK', 'Ohio', 'East Iciefurt', 'Spain', '18021-4302', '61.661833', '142.83912', 145, '2019-12-12 09:18:21', '2019-12-12 09:18:21'),
(126, '3962 Wilderman Lock', '24143 Mitchell Forks Suite 150', 'Oklahoma', 'FL', 'New Hampshire', 'Mayermouth', 'Mayotte', '47998-8205', '29.397826', '113.601122', 4205, '2019-12-12 09:18:22', '2019-12-12 09:18:22'),
(127, '42849 Jayde Ports Suite 251', '51887 Ed Fields Apt. 698', 'North Dakota', 'NH', 'Alabama', 'Barrymouth', 'Mauritania', '71891', '89.121279', '61.996036', 23175, '2019-12-12 09:18:22', '2019-12-12 09:18:22'),
(128, '60137 Grady Field', '9943 Elvera Wells', 'Hawaii', 'SD', 'Minnesota', 'Jennyfershire', 'Bolivia', '29727', '-24.171972', '-141.096053', 4768, '2019-12-12 09:18:22', '2019-12-12 09:18:22'),
(129, '517 Vincenzo Walks', '51278 Mills Hills Suite 027', 'South Dakota', 'MD', 'Minnesota', 'New Groverberg', 'Iraq', '35267-2140', '84.83819', '160.784317', 1602, '2019-12-12 09:18:23', '2019-12-12 09:18:23'),
(130, '154 Lera Prairie', '872 Dean Mission', 'Texas', 'CO', 'Nevada', 'North Muhammadtown', 'Ukraine', '52050-2782', '32.995924', '-172.717542', 79931, '2019-12-12 09:18:23', '2019-12-12 09:18:23'),
(131, '106 Maggio Causeway', '634 Predovic Centers', 'South Carolina', 'AK', 'Michigan', 'Satterfieldfort', 'Cayman Islands', '69082-7180', '11.391294', '-35.489071', 3487, '2019-12-12 09:18:23', '2019-12-12 09:18:23'),
(132, '3369 Sandra Meadow', '72184 Dach Orchard', 'Arkansas', 'VT', 'Oregon', 'Kennithchester', 'Madagascar', '11380', '10.823005', '-70.693491', 70283, '2019-12-12 09:18:24', '2019-12-12 09:18:24'),
(133, '35276 Tillman Ranch Apt. 415', '420 Sanford Lodge Suite 971', 'Maryland', 'DE', 'California', 'Port Vladimir', 'Cayman Islands', '75637-6935', '-3.281763', '90.800143', 288, '2019-12-12 09:18:24', '2019-12-12 09:18:24'),
(134, '48440 Rosenbaum Cape', '5477 Schmidt Path Apt. 954', 'South Carolina', 'CT', 'Maryland', 'South Loiston', 'Nigeria', '87045', '-24.03699', '162.259572', 4412, '2019-12-12 09:18:24', '2019-12-12 09:18:24'),
(135, '9012 Hand Isle Suite 529', '9128 Astrid Lock Apt. 462', 'North Dakota', 'MD', 'Virginia', 'Starkfort', 'Bosnia and Herzegovina', '03956', '-49.314828', '-98.770882', 309, '2019-12-12 09:18:25', '2019-12-12 09:18:25'),
(136, '42263 Lukas Isle', '565 Abshire Shoal', 'Kansas', 'ID', 'Idaho', 'South Petemouth', 'Andorra', '14133', '-13.106486', '78.901571', 137, '2019-12-12 09:18:25', '2019-12-12 09:18:25'),
(137, '33282 Sunny Burg Suite 557', '787 Koepp Locks', 'Colorado', 'ID', 'Vermont', 'New Deangelo', 'Montenegro', '34898-0277', '-16.10073', '170.875079', 264, '2019-12-12 09:18:25', '2019-12-12 09:18:25'),
(138, '15520 Murphy Squares Suite 503', '9998 Hirthe Run', 'Georgia', 'NJ', 'Hawaii', 'Hoegerton', 'Saint Barthelemy', '58674', '62.756145', '21.737693', 36092, '2019-12-12 09:18:26', '2019-12-12 09:18:26'),
(139, '98115 Brady Expressway Suite 456', '89868 Kaya Isle Suite 586', 'California', 'NM', 'Maine', 'West Gerald', 'Namibia', '75956-7903', '0.37103', '174.928796', 7297, '2019-12-12 09:18:26', '2019-12-12 09:18:26'),
(140, '7136 Hane Harbor', '4653 Herzog Union', 'Georgia', 'MN', 'Nevada', 'South Raheem', 'Dominica', '83557-8401', '-43.47859', '-73.878158', 123, '2019-12-12 09:18:26', '2019-12-12 09:18:26'),
(141, '56206 Gerlach Rapids Suite 035', '86335 Fisher Place', 'Connecticut', 'SD', 'Alaska', 'Terryberg', 'Faroe Islands', '33729-2237', '-19.894324', '-142.116966', 34622, '2019-12-12 09:18:27', '2019-12-12 09:18:27'),
(142, '820 Kole Estates Suite 934', '5478 Dare Valley Suite 788', 'Kansas', 'HI', 'Idaho', 'Marquardtbury', 'Barbados', '36952-1734', '-84.767182', '-142.425704', 84227, '2019-12-12 09:18:27', '2019-12-12 09:18:27'),
(143, '44976 Lorine Pines Suite 797', '3858 Grant Viaduct Suite 762', 'New York', 'MO', 'Pennsylvania', 'Emilianomouth', 'Cambodia', '61075-2237', '-46.735232', '51.344059', 150, '2019-12-12 09:18:27', '2019-12-12 09:18:27'),
(144, '783 Nina Orchard', '262 Cremin Lake', 'Louisiana', 'SC', 'Nevada', 'Port Odie', 'Reunion', '34791', '79.673019', '-36.658889', 9842, '2019-12-12 09:18:28', '2019-12-12 09:18:28'),
(145, '877 Jena Streets', '127 Barrows Mountains', 'Connecticut', 'WI', 'New Jersey', 'Maximillianville', 'Wallis and Futuna', '13496', '-82.154904', '129.948802', 5767, '2019-12-12 09:18:28', '2019-12-12 09:18:28'),
(146, '929 Cartwright Groves Apt. 057', '357 Prosacco Dale', 'Utah', 'ME', 'New Mexico', 'South Genoveva', 'Spain', '24423', '59.836361', '127.630763', 97734, '2019-12-12 09:18:29', '2019-12-12 09:18:29'),
(147, '4334 Cara Track Apt. 736', '75953 Wolf Run', 'Minnesota', 'KY', 'South Carolina', 'Barrowshaven', 'Vanuatu', '66594-9738', '17.327926', '111.624469', 1293, '2019-12-12 09:18:29', '2019-12-12 09:18:29'),
(148, '465 Alysha Rest Suite 625', '7277 Cummings Bridge Apt. 768', 'Minnesota', 'SC', 'South Carolina', 'Hermanberg', 'Serbia', '33321-8893', '14.437742', '55.279887', 27497, '2019-12-12 09:18:30', '2019-12-12 09:18:30'),
(149, '553 Green Path', '216 Deron Turnpike', 'Missouri', 'SC', 'Kansas', 'Lake Amieland', 'Eritrea', '51058', '69.306438', '-50.191504', 2134, '2019-12-12 09:18:30', '2019-12-12 09:18:30'),
(150, '6382 Yadira Lodge Apt. 927', '6029 Verla Estates', 'California', 'TX', 'Georgia', 'East Mario', 'Antarctica (the territory South of 60 deg S)', '26887', '-18.588486', '173.274992', 332, '2019-12-12 09:18:30', '2019-12-12 09:18:30'),
(151, '405 Donnelly Gardens', '3906 Aubrey Villages Suite 218', 'North Carolina', 'UT', 'New Jersey', 'Schambergerburgh', 'Ghana', '65883', '70.17921', '-146.078676', 1341, '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(152, '49397 Nader Turnpike Suite 547', '9080 Emmalee Springs Suite 365', 'Wisconsin', 'ME', 'Michigan', 'Torptown', 'Cayman Islands', '97982', '5.219053', '-155.16398', 4112, '2019-12-12 09:18:33', '2019-12-12 09:18:33'),
(153, '41847 Schulist Summit', '2802 Hills Estate Apt. 459', 'Ohio', 'TN', 'Maine', 'Adamsport', 'Namibia', '31720-5690', '20.589534', '-135.914244', 34901, '2019-12-12 09:18:33', '2019-12-12 09:18:33'),
(154, '59023 Mertz Extension Suite 142', '304 Hegmann Landing', 'Pennsylvania', 'OK', 'Tennessee', 'Hageneston', 'Martinique', '47017', '-51.632025', '-70.69772', 4646, '2019-12-12 09:18:33', '2019-12-12 09:18:33'),
(155, '2501 Orn Shoals Apt. 089', '9584 Hegmann Estate Apt. 501', 'Nebraska', 'UT', 'Nebraska', 'South Adriel', 'Venezuela', '19560', '72.254689', '179.075788', 630, '2019-12-12 09:18:33', '2019-12-12 09:18:33'),
(156, '2197 Pansy Rue', '9668 Veronica Valley Suite 547', 'Alaska', 'CO', 'Wisconsin', 'North Justinaview', 'Antarctica (the territory South of 60 deg S)', '28387-4867', '-45.887064', '-92.539038', 6157, '2019-12-12 09:18:34', '2019-12-12 09:18:34'),
(157, '3317 Jerod Springs', '58398 Viviane Mountain', 'Maine', 'MN', 'Rhode Island', 'New Alyciashire', 'British Indian Ocean Territory (Chagos Archipelago)', '01958-7082', '17.542583', '-73.842895', 390, '2019-12-12 09:18:34', '2019-12-12 09:18:34'),
(158, '8281 Josie View', '356 Weber Plaza Suite 270', 'Ohio', 'OH', 'Utah', 'New Britneyview', 'Lithuania', '56385', '-54.549542', '-169.523378', 1719, '2019-12-12 09:18:34', '2019-12-12 09:18:34'),
(159, '294 Berge Club', '3243 Tressa Summit Apt. 259', 'Washington', 'NY', 'New Hampshire', 'Marcstad', 'Saint Helena', '46128', '-57.315391', '-122.529815', 27688, '2019-12-12 09:18:35', '2019-12-12 09:18:35'),
(160, '35178 Sanford Ports Apt. 322', '3183 Geovanni Crest Apt. 380', 'Virginia', 'TN', 'District of Columbia', 'New Emmanuelton', 'Angola', '30953-0887', '28.719953', '-61.651258', 5455, '2019-12-12 09:18:35', '2019-12-12 09:18:35'),
(161, '857 Marielle Ville Apt. 545', '5092 Aufderhar Mountain Suite 678', 'Idaho', 'HI', 'Utah', 'New Kraigchester', 'Sao Tome and Principe', '03854', '-69.579767', '-123.604042', 944, '2019-12-12 09:18:36', '2019-12-12 09:18:36'),
(162, '4744 Friesen Extensions', '476 Willis Viaduct Suite 222', 'South Carolina', 'NC', 'Kentucky', 'Lake Gayleton', 'United Arab Emirates', '84706', '55.108789', '174.606005', 226, '2019-12-12 09:18:36', '2019-12-12 09:18:36'),
(163, '24267 Feeney Landing', '57377 Edwin Lodge Suite 470', 'Idaho', 'CT', 'Washington', 'Schummborough', 'Kiribati', '23941', '75.612483', '55.018527', 8238, '2019-12-12 09:18:36', '2019-12-12 09:18:36'),
(164, '404 Jordon Station', '536 Ali Club Suite 937', 'Idaho', 'MS', 'New York', 'North Aliberg', 'Angola', '24014-7033', '84.113772', '111.407682', 668, '2019-12-12 09:18:37', '2019-12-12 09:18:37'),
(165, '6714 Blake Cove', '9541 Deshaun Heights', 'Missouri', 'AK', 'Kansas', 'Tyriqueport', 'French Guiana', '37797', '87.162275', '-151.94143', 80819, '2019-12-12 09:18:37', '2019-12-12 09:18:37'),
(166, '70451 Dicki Light Apt. 892', '9392 Howell Islands', 'Minnesota', 'NY', 'Wisconsin', 'Mantehaven', 'Faroe Islands', '63938-3066', '-24.286882', '-146.316364', 77562, '2019-12-12 09:18:37', '2019-12-12 09:18:37'),
(167, '72312 Katlynn Fort Suite 262', '7213 Littel Mountains', 'Maryland', 'MA', 'Nebraska', 'Orvalburgh', 'Guadeloupe', '66380', '-79.258334', '178.167131', 76542, '2019-12-12 09:18:38', '2019-12-12 09:18:38'),
(168, '494 Torphy Station Apt. 731', '9186 Wilton Burg', 'Nebraska', 'NM', 'North Dakota', 'West Nathen', 'Montenegro', '33836-8316', '-83.820093', '-145.300292', 64428, '2019-12-12 09:18:38', '2019-12-12 09:18:38'),
(169, '66938 Hoppe Point', '445 Meredith Expressway', 'Connecticut', 'NY', 'North Dakota', 'Emardborough', 'Sudan', '96946', '3.515203', '59.886682', 4868, '2019-12-12 09:18:38', '2019-12-12 09:18:38'),
(170, '53745 Carlotta Cape', '8799 Lillian Court Apt. 474', 'South Carolina', 'GA', 'Mississippi', 'Gloverside', 'Montserrat', '35099-6430', '-22.240085', '-58.077824', 189, '2019-12-12 09:18:39', '2019-12-12 09:18:39'),
(171, '7647 Janis Park Apt. 059', '18252 Karine Avenue', 'Louisiana', 'LA', 'Arkansas', 'Port Anastacio', 'Chile', '13890', '-71.991661', '99.319892', 710, '2019-12-12 09:18:39', '2019-12-12 09:18:39'),
(172, '4296 Price Neck', '75629 Gina Overpass Apt. 229', 'Washington', 'AK', 'Mississippi', 'Doyleton', 'Heard Island and McDonald Islands', '76725', '69.969821', '-51.37543', 626, '2019-12-12 09:18:39', '2019-12-12 09:18:39'),
(173, '274 Alan Ridges', '35540 Schowalter Orchard', 'Kansas', 'DE', 'Wyoming', 'New Demetriusfort', 'Senegal', '38078-1199', '-78.701904', '-106.00644', 15154, '2019-12-12 09:18:39', '2019-12-12 09:18:39'),
(174, '578 Evalyn Harbors Apt. 018', '5330 Gutmann Green Suite 313', 'Rhode Island', 'NH', 'Colorado', 'New Angelica', 'Saudi Arabia', '41986', '47.79304', '-101.074575', 638, '2019-12-12 09:18:40', '2019-12-12 09:18:40'),
(175, '91382 Thalia Camp', '82225 Nader Canyon', 'Ohio', 'MS', 'Tennessee', 'New Serenity', 'Haiti', '83113-3634', '-69.477532', '89.916933', 739, '2019-12-12 09:18:40', '2019-12-12 09:18:40'),
(176, '512 Luettgen Circle Suite 066', '18644 Fabiola Dam Apt. 861', 'Alaska', 'VT', 'Oklahoma', 'South Nilsville', 'Bulgaria', '12722-8022', '-12.741432', '-9.354487', 465, '2019-12-12 09:18:40', '2019-12-12 09:18:40'),
(177, '9231 Conroy Field Suite 783', '18132 Kessler Land Suite 032', 'New Hampshire', 'VT', 'District of Columbia', 'Cummingsberg', 'Luxembourg', '75696', '-5.592062', '34.607168', 3411, '2019-12-12 09:18:41', '2019-12-12 09:18:41'),
(178, '159 Kaitlyn Circles Suite 668', '242 Whitney Ford', 'New Jersey', 'NC', 'New Jersey', 'Jackelineshire', 'Mali', '41991-3763', '-72.904249', '-178.865946', 575, '2019-12-12 09:18:41', '2019-12-12 09:18:41'),
(179, '8942 Hartmann Gateway', '57848 Jaqueline Locks', 'Vermont', 'SD', 'Delaware', 'East Jessika', 'Puerto Rico', '19595-7919', '-47.45265', '-156.738476', 70719, '2019-12-12 09:18:41', '2019-12-12 09:18:41'),
(180, '323 Janae Trace', '2942 Jan Branch', 'Tennessee', 'MA', 'New Jersey', 'East Nikolashaven', 'Hungary', '13671-1623', '65.938319', '-151.346862', 8543, '2019-12-12 09:18:41', '2019-12-12 09:18:41'),
(181, '2217 Sporer Fork Suite 422', '513 Wallace Center Suite 142', 'New York', 'WY', 'Louisiana', 'New Noechester', 'Swaziland', '81795-8207', '-16.227448', '-55.750188', 48944, '2019-12-12 09:18:42', '2019-12-12 09:18:42'),
(182, '473 Shyanne Isle Apt. 299', '6741 Labadie Shore Apt. 066', 'Vermont', 'ND', 'Virginia', 'Romagueraton', 'Martinique', '40807-0823', '-50.05965', '5.239028', 72148, '2019-12-12 09:18:42', '2019-12-12 09:18:42'),
(183, '6129 Russel Stream', '91159 Larson Highway Suite 246', 'Georgia', 'KY', 'South Carolina', 'West Anya', 'Ecuador', '66303', '-85.521286', '17.305509', 9678, '2019-12-12 09:18:42', '2019-12-12 09:18:42'),
(184, '373 Jimmy Tunnel Apt. 797', '4718 Milan Flat', 'North Dakota', 'MA', 'North Carolina', 'West Emanuel', 'Andorra', '21244-9705', '-15.380503', '-163.4612', 77997, '2019-12-12 09:18:43', '2019-12-12 09:18:43'),
(185, '5704 Gislason Land Apt. 803', '686 Bernhard Drives', 'South Carolina', 'IN', 'Illinois', 'Russellhaven', 'India', '55623-8979', '-73.806486', '155.311845', 333, '2019-12-12 09:18:44', '2019-12-12 09:18:44'),
(186, '521 Israel Cliff Suite 839', '4379 Hagenes Divide', 'Arizona', 'WA', 'Maine', 'Hesselport', 'Equatorial Guinea', '75732-1988', '-64.886528', '171.762268', 14479, '2019-12-12 09:18:44', '2019-12-12 09:18:44'),
(187, '24271 Mosciski Ramp Apt. 586', '12187 Madilyn Views', 'Colorado', 'NH', 'Vermont', 'West Mathiasside', 'Qatar', '58537-7475', '0.234074', '-23.350913', 30918, '2019-12-12 09:18:44', '2019-12-12 09:18:44'),
(188, '619 Ericka Causeway', '11007 Lawson Turnpike', 'Texas', 'AZ', 'Idaho', 'North Gregside', 'Austria', '39404-7498', '39.812754', '-47.931551', 29848, '2019-12-12 09:18:44', '2019-12-12 09:18:44'),
(189, '4346 Hegmann Green', '41196 Lind Rapids Apt. 568', 'Georgia', 'MA', 'Rhode Island', 'Vonside', 'Ethiopia', '34475-6062', '-61.54826', '32.467138', 94683, '2019-12-12 09:18:45', '2019-12-12 09:18:45'),
(190, '77058 Nels Extensions Suite 957', '9264 Greta Turnpike Suite 692', 'South Dakota', 'NM', 'Maine', 'Evieshire', 'Qatar', '13907-6382', '-88.0498', '7.073826', 229, '2019-12-12 09:18:45', '2019-12-12 09:18:45'),
(191, '1806 Emard Path', '811 Lenore Glen Apt. 858', 'Arizona', 'CO', 'South Dakota', 'South Andy', 'Burundi', '12186', '33.167436', '141.463942', 970, '2019-12-12 09:18:46', '2019-12-12 09:18:46'),
(192, '330 Everette Common Apt. 216', '24587 Little Springs Apt. 248', 'Kentucky', 'AZ', 'Oklahoma', 'Metatown', 'Uzbekistan', '98604-9923', '-21.432889', '29.517554', 357, '2019-12-12 09:18:46', '2019-12-12 09:18:46'),
(193, '1637 Ernser Lights', '98308 Balistreri Heights', 'Pennsylvania', 'VA', 'North Carolina', 'Lake Savanah', 'Kyrgyz Republic', '97330-1844', '-19.243181', '-127.039614', 57416, '2019-12-12 09:18:47', '2019-12-12 09:18:47'),
(194, '75501 Cortez Harbors Suite 296', '271 Eliseo Summit Suite 658', 'West Virginia', 'MA', 'Michigan', 'Kristinaberg', 'Kuwait', '11416-4901', '57.616301', '42.457575', 3491, '2019-12-12 09:18:47', '2019-12-12 09:18:47'),
(195, '9131 Keeling Ford', '172 Shane Park', 'Wyoming', 'MO', 'Hawaii', 'Myrtiechester', 'Macedonia', '08469-5146', '19.591864', '154.914281', 22325, '2019-12-12 09:18:47', '2019-12-12 09:18:47'),
(196, '858 Macejkovic Hollow Suite 420', '536 Rolfson Trail', 'New Mexico', 'IA', 'Virginia', 'Jevonmouth', 'Palau', '50350-7275', '-87.010167', '-149.494639', 6546, '2019-12-12 09:18:48', '2019-12-12 09:18:48'),
(197, '4827 Keshawn Grove Apt. 865', '148 Yost Cliffs', 'California', 'TX', 'Michigan', 'Schoenfort', 'Lao People\'s Democratic Republic', '59813-3849', '-25.829945', '-125.129397', 53733, '2019-12-12 09:18:48', '2019-12-12 09:18:48'),
(198, '40667 Bridget Village', '6705 Cormier Canyon', 'Mississippi', 'MD', 'Alaska', 'Medaville', 'Saint Helena', '42846-1980', '42.396372', '132.403383', 233, '2019-12-12 09:18:49', '2019-12-12 09:18:49'),
(199, '63871 Bogisich Causeway', '2782 Romaguera Expressway', 'Maryland', 'VT', 'Maryland', 'East Cleta', 'Zambia', '55970', '4.730849', '-120.782376', 7866, '2019-12-12 09:18:49', '2019-12-12 09:18:49'),
(200, '868 Jana Row Apt. 957', '36574 Kyle Loop', 'Maryland', 'VA', 'Indiana', 'West Yeseniaport', 'Qatar', '43257', '89.626928', '97.987942', 69541, '2019-12-12 09:18:49', '2019-12-12 09:18:49'),
(201, NULL, 'fhf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-13 07:37:09', '2019-12-13 07:37:09');

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `firstName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('m','f') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthDay` date DEFAULT NULL,
  `phoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobTitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`id`, `account_id`, `address_id`, `firstName`, `lastName`, `gender`, `birthDay`, `phoneNumber`, `cin`, `jobTitle`, `avatar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 51, 51, 'Jordyn', 'Reynolds', 'f', '1980-11-15', '921-826-1079 x13382', 'saepe', 'Medical Assistant', 'https://lorempixel.com/640/480/?55074', '2019-12-12 09:18:09', '2019-12-12 09:18:09', NULL),
(2, 52, 52, 'Domenico', 'Kunde', 'm', '2013-03-13', '479-892-0126', 'omnis', 'Preschool Education Administrators', 'https://lorempixel.com/640/480/?49804', '2019-12-12 09:18:09', '2019-12-12 09:18:09', NULL),
(3, 53, 53, 'Emory', 'Cronin', 'm', '2011-01-22', '(878) 613-8522', 'mollitia', 'Septic Tank Servicer', 'https://lorempixel.com/640/480/?99328', '2019-12-12 09:18:09', '2019-12-12 09:18:09', NULL),
(4, 54, 54, 'Amparo', 'Rau', 'm', '1998-05-05', '+1-435-998-7423', 'sequi', 'HVAC Mechanic', 'https://lorempixel.com/640/480/?58865', '2019-12-12 09:18:09', '2019-12-12 09:18:09', NULL),
(5, 55, 55, 'Misael', 'Champlin', 'f', '1979-01-29', '735.750.7298 x81374', 'officia', 'Tire Changer', 'https://lorempixel.com/640/480/?80926', '2019-12-12 09:18:09', '2019-12-12 09:18:09', NULL),
(6, 56, 56, 'Bailey', 'Dickinson', 'm', '1984-08-16', '+12498603060', 'tenetur', 'Production Planner', 'https://lorempixel.com/640/480/?10498', '2019-12-12 09:18:09', '2019-12-12 09:18:09', NULL),
(7, 57, 57, 'Fredrick', 'Wisozk', 'm', '1981-01-11', '796.622.9453 x544', 'quas', 'Typesetting Machine Operator', 'https://lorempixel.com/640/480/?93144', '2019-12-12 09:18:09', '2019-12-12 09:18:09', NULL),
(8, 58, 58, 'Craig', 'Schiller', 'f', '1992-05-26', '1-447-445-9242', 'et', 'Fiberglass Laminator and Fabricator', 'https://lorempixel.com/640/480/?33729', '2019-12-12 09:18:09', '2019-12-12 09:18:09', NULL),
(9, 59, 59, 'Mitchel', 'Mertz', 'f', '1970-03-26', '(832) 812-5256', 'minus', 'Electrical Engineering Technician', 'https://lorempixel.com/640/480/?97526', '2019-12-12 09:18:09', '2019-12-12 09:18:09', NULL),
(10, 60, 60, 'Ricardo', 'Luettgen', 'f', '1970-05-16', '1-250-455-8525 x8163', 'quos', 'Multiple Machine Tool Setter', 'https://lorempixel.com/640/480/?28919', '2019-12-12 09:18:09', '2019-12-12 09:18:09', NULL),
(11, 61, 61, 'Coleman', 'Gorczany', 'm', '1976-08-07', '1-785-932-2247 x486', 'dolores', 'Welder', 'https://lorempixel.com/640/480/?77130', '2019-12-12 09:18:09', '2019-12-12 09:18:09', NULL),
(12, 62, 62, 'Damon', 'Price', 'm', '1973-11-09', '331-892-0037', 'ea', 'Janitor', 'https://lorempixel.com/640/480/?20586', '2019-12-12 09:18:09', '2019-12-12 09:18:09', NULL),
(13, 63, 63, 'Eli', 'Ankunding', 'm', '1988-07-15', '686-874-7857 x725', 'quasi', 'Police Detective', 'https://lorempixel.com/640/480/?18310', '2019-12-12 09:18:09', '2019-12-12 09:18:09', NULL),
(14, 64, 64, 'Enid', 'Pfeffer', 'm', '1991-02-27', '+18306713540', 'voluptatem', 'Forest and Conservation Technician', 'https://lorempixel.com/640/480/?64454', '2019-12-12 09:18:09', '2019-12-12 09:18:09', NULL),
(15, 65, 65, 'Olen', 'Murray', 'm', '1997-04-20', '+1-832-881-8724', 'aut', 'Park Naturalist', 'https://lorempixel.com/640/480/?47977', '2019-12-12 09:18:09', '2019-12-12 09:18:09', NULL),
(16, 66, 66, 'Johan', 'Kuhic', 'm', '2010-04-18', '1-776-529-9991', 'eligendi', 'Ship Pilot', 'https://lorempixel.com/640/480/?45661', '2019-12-12 09:18:09', '2019-12-12 09:18:09', NULL),
(17, 67, 67, 'Fritz', 'Roob', 'm', '2002-04-04', '(754) 686-6787 x79972', 'sunt', 'Sailor', 'https://lorempixel.com/640/480/?49990', '2019-12-12 09:18:09', '2019-12-12 09:18:09', NULL),
(18, 68, 68, 'Moshe', 'Zieme', 'm', '1971-01-11', '750.289.9971 x94233', 'a', 'Psychologist', 'https://lorempixel.com/640/480/?79095', '2019-12-12 09:18:10', '2019-12-12 09:18:10', NULL),
(19, 69, 69, 'Kiel', 'Satterfield', 'm', '2013-12-25', '+1 (345) 572-9438', 'expedita', 'Utility Meter Reader', 'https://lorempixel.com/640/480/?19534', '2019-12-12 09:18:10', '2019-12-12 09:18:10', NULL),
(20, 70, 70, 'Pete', 'Maggio', 'f', '2015-11-13', '+13393022790', 'esse', 'Bill and Account Collector', 'https://lorempixel.com/640/480/?63992', '2019-12-12 09:18:10', '2019-12-12 09:18:10', NULL),
(21, 71, 71, 'Soledad', 'Hyatt', 'm', '1994-03-15', '(313) 771-1864 x857', 'minus', 'Stone Cutter', 'https://lorempixel.com/640/480/?93757', '2019-12-12 09:18:10', '2019-12-12 09:18:10', NULL),
(22, 72, 72, 'Saul', 'Crooks', 'm', '1982-01-29', '1-995-607-2384 x6902', 'provident', 'Music Composer', 'https://lorempixel.com/640/480/?93651', '2019-12-12 09:18:10', '2019-12-12 09:18:10', NULL),
(23, 73, 73, 'Tre', 'Yundt', 'm', '1984-10-03', '1-830-510-0367 x26883', 'quis', 'Welder-Fitter', 'https://lorempixel.com/640/480/?42510', '2019-12-12 09:18:10', '2019-12-12 09:18:10', NULL),
(24, 74, 74, 'Gerald', 'Kuhn', 'm', '1996-02-27', '+1-948-801-0429', 'odit', 'Locker Room Attendant', 'https://lorempixel.com/640/480/?97982', '2019-12-12 09:18:10', '2019-12-12 09:18:10', NULL),
(25, 75, 75, 'Marlon', 'Murazik', 'm', '1972-01-04', '(365) 242-9760', 'consequuntur', 'Brazing Machine Operator', 'https://lorempixel.com/640/480/?15868', '2019-12-12 09:18:11', '2019-12-12 09:18:11', NULL),
(26, 76, 76, 'Garrett', 'Kohler', 'f', '1982-05-08', '(743) 354-4754 x391', 'rerum', 'University', 'https://lorempixel.com/640/480/?55292', '2019-12-12 09:18:11', '2019-12-12 09:18:11', NULL),
(27, 77, 77, 'Ed', 'Hettinger', 'f', '1986-04-21', '(803) 891-3530', 'ad', 'Mining Engineer OR Geological Engineer', 'https://lorempixel.com/640/480/?45560', '2019-12-12 09:18:11', '2019-12-12 09:18:11', NULL),
(28, 78, 78, 'Caden', 'Schultz', 'm', '2013-12-05', '478-300-3292 x66207', 'quibusdam', 'Housekeeping Supervisor', 'https://lorempixel.com/640/480/?84816', '2019-12-12 09:18:11', '2019-12-12 09:18:11', NULL),
(29, 79, 79, 'Jared', 'Smith', 'm', '1997-06-06', '463-610-4745 x14166', 'earum', 'Able Seamen', 'https://lorempixel.com/640/480/?74161', '2019-12-12 09:18:11', '2019-12-12 09:18:11', NULL),
(30, 80, 80, 'Delbert', 'Braun', 'f', '1980-09-02', '621-542-2292 x232', 'enim', 'Order Filler', 'https://lorempixel.com/640/480/?99208', '2019-12-12 09:18:11', '2019-12-12 09:18:11', NULL),
(31, 81, 81, 'Randi', 'Goodwin', 'm', '2011-02-16', '+1.661.531.5258', 'cumque', 'Lathe Operator', 'https://lorempixel.com/640/480/?32311', '2019-12-12 09:18:11', '2019-12-12 09:18:11', NULL),
(32, 82, 82, 'Jean', 'Cummerata', 'f', '2006-10-19', '+1-353-817-9168', 'et', 'CEO', 'https://lorempixel.com/640/480/?76585', '2019-12-12 09:18:11', '2019-12-12 09:18:11', NULL),
(33, 83, 83, 'Winfield', 'Swaniawski', 'm', '1978-01-13', '773-753-8822 x490', 'exercitationem', 'Forming Machine Operator', 'https://lorempixel.com/640/480/?85832', '2019-12-12 09:18:11', '2019-12-12 09:18:11', NULL),
(34, 84, 84, 'Larue', 'Quitzon', 'f', '2017-03-22', '750.431.2968 x3899', 'a', 'Gas Pumping Station Operator', 'https://lorempixel.com/640/480/?61922', '2019-12-12 09:18:11', '2019-12-12 09:18:11', NULL),
(35, 85, 85, 'Beau', 'Lesch', 'm', '1990-11-04', '(554) 241-0025', 'cupiditate', 'Bellhop', 'https://lorempixel.com/640/480/?85102', '2019-12-12 09:18:11', '2019-12-12 09:18:11', NULL),
(36, 86, 86, 'Derrick', 'Mertz', 'f', '2000-07-01', '919-889-9928', 'quam', 'Sculptor', 'https://lorempixel.com/640/480/?43897', '2019-12-12 09:18:11', '2019-12-12 09:18:11', NULL),
(37, 87, 87, 'Cruz', 'Hoppe', 'm', '1999-10-05', '(785) 496-1675', 'eos', 'Commercial Diver', 'https://lorempixel.com/640/480/?38661', '2019-12-12 09:18:11', '2019-12-12 09:18:11', NULL),
(38, 88, 88, 'Deshaun', 'Grimes', 'm', '1977-03-25', '990.398.4630', 'et', 'Geologist', 'https://lorempixel.com/640/480/?27925', '2019-12-12 09:18:11', '2019-12-12 09:18:11', NULL),
(39, 89, 89, 'Emerson', 'Leffler', 'm', '1977-10-27', '+13678008961', 'saepe', 'Fast Food Cook', 'https://lorempixel.com/640/480/?49738', '2019-12-12 09:18:11', '2019-12-12 09:18:11', NULL),
(40, 90, 90, 'Sean', 'Mante', 'f', '1981-06-12', '+18045090239', 'assumenda', 'Terrazzo Workes and Finisher', 'https://lorempixel.com/640/480/?56247', '2019-12-12 09:18:12', '2019-12-12 09:18:12', NULL),
(41, 91, 91, 'Alphonso', 'Mertz', 'm', '2018-01-09', '524.654.7631', 'quis', 'Metal Fabricator', 'https://lorempixel.com/640/480/?79233', '2019-12-12 09:18:12', '2019-12-12 09:18:12', NULL),
(42, 92, 92, 'Tre', 'Hermiston', 'm', '2007-09-10', '(524) 486-0672', 'incidunt', 'Rail Transportation Worker', 'https://lorempixel.com/640/480/?69670', '2019-12-12 09:18:12', '2019-12-12 09:18:12', NULL),
(43, 93, 93, 'Dillan', 'Runte', 'm', '2004-04-11', '523-324-4078 x1825', 'nihil', 'Electronics Engineer', 'https://lorempixel.com/640/480/?75274', '2019-12-12 09:18:12', '2019-12-12 09:18:12', NULL),
(44, 94, 94, 'Jimmy', 'Senger', 'f', '2015-07-22', '1-501-429-5536', 'dolores', 'Legislator', 'https://lorempixel.com/640/480/?96774', '2019-12-12 09:18:12', '2019-12-12 09:18:12', NULL),
(45, 95, 95, 'Bud', 'Stiedemann', 'f', '2010-10-26', '+1-826-415-1479', 'ut', 'Transit Police OR Railroad Police', 'https://lorempixel.com/640/480/?39990', '2019-12-12 09:18:12', '2019-12-12 09:18:12', NULL),
(46, 96, 96, 'Dewayne', 'Walsh', 'm', '1993-02-19', '(625) 495-1674', 'et', 'Mathematical Science Teacher', 'https://lorempixel.com/640/480/?64601', '2019-12-12 09:18:12', '2019-12-12 09:18:12', NULL),
(47, 97, 97, 'Clair', 'Altenwerth', 'm', '1985-11-05', '365-850-1119 x331', 'molestiae', 'Gaming Service Worker', 'https://lorempixel.com/640/480/?82437', '2019-12-12 09:18:12', '2019-12-12 09:18:12', NULL),
(48, 98, 98, 'Bailey', 'Moore', 'm', '1978-06-17', '(394) 479-6143 x59230', 'nihil', 'Letterpress Setters Operator', 'https://lorempixel.com/640/480/?93193', '2019-12-12 09:18:12', '2019-12-12 09:18:12', NULL),
(49, 99, 99, 'Foster', 'Kirlin', 'm', '2000-06-08', '(402) 918-6913', 'est', 'Electronic Equipment Assembler', 'https://lorempixel.com/640/480/?44029', '2019-12-12 09:18:12', '2019-12-12 09:18:12', NULL),
(50, 100, 100, 'Clemens', 'Boyle', 'm', '1980-10-24', '563.478.9747 x44642', 'sunt', 'Furniture Finisher', 'https://lorempixel.com/640/480/?16592', '2019-12-12 09:18:13', '2019-12-12 09:18:13', NULL),
(51, 201, 201, 'contact@spotfit.com', 'cfjg', 'm', '2019-12-04', '064646464646', '464646', NULL, NULL, '2019-12-13 07:37:09', '2019-12-13 07:37:09', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

CREATE TABLE `avis` (
  `id` int(11) NOT NULL,
  `avis` varchar(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_gym` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `avis`
--

INSERT INTO `avis` (`id`, `avis`, `comment`, `id_user`, `id_gym`) VALUES
(1, '3', 'City Club m\'a déçu -_- (y)', 0, 1),
(2, '4', 'Miami Fitness Club était agréable ... merci', 0, 2),
(1, '3', 'City Club m\'a déçu -_- (y)', 0, 1),
(2, '4', 'Miami Fitness Club était agréable ... merci', 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `taux` int(11) NOT NULL,
  `duree_depart` varchar(20) NOT NULL,
  `duree_fin` varchar(20) NOT NULL,
  `validite_depart` varchar(20) NOT NULL,
  `validite_fin` varchar(20) NOT NULL,
  `id_gym` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `coupons`
--

INSERT INTO `coupons` (`id`, `nom`, `taux`, `duree_depart`, `duree_fin`, `validite_depart`, `validite_fin`, `id_gym`, `created_at`, `updated_at`) VALUES
(2, 'Coupon Cadeau Fidélité', 20, '2019-11-15', '2019-11-17', '2019-11-15', '2019-11-30', 2, '2019-11-15 10:57:25', '2019-11-15 09:57:09'),
(4, '24254', 15, '2019-11-13', '2019-11-17', '2019-11-18', '2019-11-30', 2, '2019-11-15 12:23:29', '2019-11-15 12:23:29'),
(5, '24254', 15, '2019-11-13', '2019-11-17', '2019-11-18', '2019-11-30', 2, '2019-11-15 12:24:13', '2019-11-15 12:24:13'),
(6, 'cp 1', 50, '2019-11-06', '2019-11-17', '2019-11-13', '2019-11-22', 2, '2019-11-15 15:27:02', '2019-11-15 15:27:02'),
(2, 'Coupon Cadeau Fidélité', 20, '2019-11-15', '2019-11-17', '2019-11-15', '2019-11-30', 2, '2019-11-15 10:57:25', '2019-11-15 09:57:09'),
(4, '24254', 15, '2019-11-13', '2019-11-17', '2019-11-18', '2019-11-30', 2, '2019-11-15 12:23:29', '2019-11-15 12:23:29'),
(5, '24254', 15, '2019-11-13', '2019-11-17', '2019-11-18', '2019-11-30', 2, '2019-11-15 12:24:13', '2019-11-15 12:24:13'),
(6, 'cp 1', 50, '2019-11-06', '2019-11-17', '2019-11-13', '2019-11-22', 2, '2019-11-15 15:27:02', '2019-11-15 15:27:02');

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `qrcode` text COLLATE utf8mb4_unicode_ci,
  `firstName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('m','f') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthDay` datetime DEFAULT NULL,
  `phoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobTitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`id`, `account_id`, `address_id`, `qrcode`, `firstName`, `lastName`, `gender`, `birthDay`, `phoneNumber`, `cin`, `jobTitle`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1ab931433a41f6ea6962c93b717cd328', 'Gaetano', 'Hessel', 'f', '1990-04-16 00:00:00', '(352) 895-7320', 'quia', 'Slot Key Person', 'https://lorempixel.com/640/480/?72692', '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(2, 2, 2, 'bd60601b1c48d6beca98fb4f048003e5', 'Delmer', 'Wunsch', 'm', '1976-09-27 00:00:00', '1-867-309-2863 x39616', 'velit', 'Dentist', 'https://lorempixel.com/640/480/?50599', '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(3, 3, 3, '45aede69f174a16ed7f8fc22d936e4ba', 'Leland', 'Bauch', 'f', '1970-10-15 00:00:00', '(487) 334-1209 x471', 'sed', 'Tool Sharpener', 'https://lorempixel.com/640/480/?27935', '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(4, 4, 4, '3e10940033e69a9af2c6368b3fc63548', 'Jakob', 'Fay', 'f', '2017-09-28 00:00:00', '(662) 644-9134', 'assumenda', 'Procurement Clerk', 'https://lorempixel.com/640/480/?42320', '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(5, 5, 5, '4b76cf4e5f46ac45ea4b4b1f215de550', 'Giovanny', 'Weimann', 'm', '2005-01-19 00:00:00', '+1-960-397-3548', 'nemo', 'Home Entertainment Equipment Installer', 'https://lorempixel.com/640/480/?80638', '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(6, 6, 6, 'cc2b2270a9cafd579035605195addf9b', 'Oral', 'Pfeffer', 'm', '1970-10-18 00:00:00', '(624) 944-5795 x8193', 'rerum', 'Wind Instrument Repairer', 'https://lorempixel.com/640/480/?70099', '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(7, 7, 7, 'd947e1b46c82f54c0d219897a44504b1', 'Gunner', 'Schamberger', 'f', '1984-01-13 00:00:00', '1-641-667-7998', 'est', 'Fence Erector', 'https://lorempixel.com/640/480/?10818', '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(8, 8, 8, '3fb617806627b421c2cc2d39cc665370', 'Triston', 'Kuvalis', 'm', '2017-08-21 00:00:00', '324-806-8896 x171', 'dolore', 'Foundry Mold and Coremaker', 'https://lorempixel.com/640/480/?80585', '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(9, 9, 9, '85e45aea8d99d2d7e210a9813be867c1', 'Miller', 'Miller', 'f', '2008-04-29 00:00:00', '+13698532845', 'illo', 'Social Sciences Teacher', 'https://lorempixel.com/640/480/?28607', '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(10, 10, 10, '2b805af2df94cbfc4c8f990e512479cb', 'Darren', 'Corwin', 'f', '2016-06-10 00:00:00', '(727) 260-7601 x33824', 'et', 'Paperhanger', 'https://lorempixel.com/640/480/?80090', '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(11, 11, 11, '0a22a1be3ee535650c762423dd78276e', 'Kayden', 'Strosin', 'm', '2013-04-28 00:00:00', '+1.379.641.5222', 'est', 'Agricultural Science Technician', 'https://lorempixel.com/640/480/?71095', '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(12, 12, 12, '0edcd8a947514100fd414654f777886b', 'Llewellyn', 'Funk', 'f', '1991-03-30 00:00:00', '893.828.1326', 'dolor', 'Respiratory Therapy Technician', 'https://lorempixel.com/640/480/?56814', '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(13, 13, 13, '40f90456ec016b1e09fb60e03eb3e0ca', 'Abelardo', 'Monahan', 'f', '2010-12-11 00:00:00', '1-281-900-5616 x101', 'impedit', 'Weapons Specialists', 'https://lorempixel.com/640/480/?78299', '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(14, 14, 14, 'ef5f57035831a4a70b079fdadfda4a1e', 'Hugh', 'Borer', 'm', '2002-01-08 00:00:00', '871.459.4562', 'et', 'Mechanical Drafter', 'https://lorempixel.com/640/480/?85465', '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(15, 15, 15, '73993a9fb7b50d39ecdba017f266d034', 'Keenan', 'Bosco', 'f', '1993-11-30 00:00:00', '+1-805-240-9180', 'dolorem', 'Electronics Engineer', 'https://lorempixel.com/640/480/?44618', '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(16, 16, 16, 'a118024f7f857b0a1e5f000fdbe3f5aa', 'Linwood', 'Grant', 'm', '1971-05-04 00:00:00', '769-269-2087', 'unde', 'Hairdresser OR Cosmetologist', 'https://lorempixel.com/640/480/?57509', '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(17, 17, 17, '395e72c7a1d3d80a64645413f4a92f6b', 'Wilford', 'Ruecker', 'f', '1979-05-24 00:00:00', '973.639.5655', 'odit', 'Commercial Pilot', 'https://lorempixel.com/640/480/?59547', '2019-12-12 09:17:50', '2019-12-12 09:17:50'),
(18, 18, 18, '44d61327e04fad6f626d880678e3addb', 'Lazaro', 'Gulgowski', 'm', '1980-08-30 00:00:00', '+1 (485) 830-6568', 'autem', 'Web Developer', 'https://lorempixel.com/640/480/?51076', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(19, 19, 19, '11dd889ec58ab933f223389ae33c7eb5', 'Wilhelm', 'Schinner', 'f', '2009-05-15 00:00:00', '545-980-8780 x547', 'dicta', 'Punching Machine Setters', 'https://lorempixel.com/640/480/?32587', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(20, 20, 20, 'fab2563c6ba86f4942d37abee79e3f5a', 'Ewald', 'Nicolas', 'f', '2019-05-11 00:00:00', '+1-786-485-1675', 'labore', 'Textile Cutting Machine Operator', 'https://lorempixel.com/640/480/?61586', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(21, 21, 21, '619e6dd6ce17727b3922014237896da2', 'Bobbie', 'Emard', 'f', '1986-11-20 00:00:00', '(482) 907-2864 x3834', 'aut', 'Funeral Director', 'https://lorempixel.com/640/480/?84316', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(22, 22, 22, '869f122905151e45d46cd791e219c5e4', 'Elliot', 'Barton', 'f', '1973-10-29 00:00:00', '1-767-823-3682', 'laudantium', 'Stock Broker', 'https://lorempixel.com/640/480/?62567', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(23, 23, 23, 'f94551d6304958eb4fdd04371e65cc87', 'Chad', 'Schulist', 'm', '1975-08-21 00:00:00', '+1 (247) 884-9315', 'quia', 'Musical Instrument Tuner', 'https://lorempixel.com/640/480/?16725', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(24, 24, 24, 'fb8c609958a6c598b8023d595b7f110f', 'Randy', 'Bradtke', 'f', '1989-04-17 00:00:00', '597-840-2841 x664', 'a', 'Dental Hygienist', 'https://lorempixel.com/640/480/?86116', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(25, 25, 25, '3622e7079fa32639a3f7f9a5182bf1ca', 'Ubaldo', 'Bergstrom', 'f', '2003-12-02 00:00:00', '(837) 952-5884 x83452', 'ab', 'Manufacturing Sales Representative', 'https://lorempixel.com/640/480/?30200', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(26, 26, 26, 'b259e6c8dd7eacfcf1a2ec4cac72a903', 'Clark', 'Barrows', 'f', '1986-12-23 00:00:00', '1-440-894-0580 x429', 'aliquam', 'Teacher Assistant', 'https://lorempixel.com/640/480/?56633', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(27, 27, 27, 'eb7512dcb409b042b598151bf7533024', 'Jettie', 'Erdman', 'm', '2013-12-11 00:00:00', '(797) 744-1954', 'temporibus', 'Photographic Process Worker', 'https://lorempixel.com/640/480/?31169', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(28, 28, 28, 'bd6806306887535ed077d827a6fc5664', 'Trey', 'Bailey', 'f', '1990-10-08 00:00:00', '+16647636767', 'est', 'Scanner Operator', 'https://lorempixel.com/640/480/?49260', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(29, 29, 29, '97a224fa7090478536cc1182f7c67179', 'Arnold', 'Connelly', 'f', '2013-05-05 00:00:00', '(681) 674-7709', 'voluptatibus', 'System Administrator', 'https://lorempixel.com/640/480/?82824', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(30, 30, 30, '197afdc3e5247d4604368359ea65c93c', 'Brennon', 'Marks', 'f', '2005-02-07 00:00:00', '1-481-357-2674', 'facere', 'Insurance Sales Agent', 'https://lorempixel.com/640/480/?58029', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(31, 31, 31, '842e4d61d027fb725cec240329267f67', 'Jaeden', 'Borer', 'm', '2011-08-08 00:00:00', '(213) 323-4533', 'et', 'Spotters', 'https://lorempixel.com/640/480/?76767', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(32, 32, 32, 'e12540b5818df6f4f72103787300e6be', 'Adonis', 'Williamson', 'm', '2010-11-27 00:00:00', '230.327.8105', 'consectetur', 'Plumber', 'https://lorempixel.com/640/480/?39919', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(33, 33, 33, '00a1958bc1a47f160cc436af4f2c9e26', 'Trenton', 'Bednar', 'm', '2015-01-19 00:00:00', '(448) 369-7300 x4834', 'placeat', 'Education Administrator', 'https://lorempixel.com/640/480/?51206', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(34, 34, 34, '598d5d4b97340d4d6509a07707b041fa', 'Laurel', 'Bahringer', 'm', '1996-10-04 00:00:00', '595.486.1507 x425', 'nisi', 'Rail Car Repairer', 'https://lorempixel.com/640/480/?66364', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(35, 35, 35, '8858e83e469895dcd970657d4fc141ff', 'Brayan', 'Abernathy', 'f', '1997-07-31 00:00:00', '1-713-227-9039', 'culpa', 'Home Health Aide', 'https://lorempixel.com/640/480/?88686', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(36, 36, 36, '7332ca3efe72f3ae4176de2eb81e4b8e', 'Darwin', 'Veum', 'f', '2003-05-26 00:00:00', '1-649-453-8919 x7399', 'reprehenderit', 'Tailor', 'https://lorempixel.com/640/480/?68717', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(37, 37, 37, 'abb21703cabf68a36b4a0a448bb19c21', 'Raphael', 'Moore', 'f', '1993-06-17 00:00:00', '(804) 276-3920 x967', 'quia', 'Sewing Machine Operator', 'https://lorempixel.com/640/480/?64099', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(38, 38, 38, 'daa4f619d319fbb82e8e250aec93e088', 'Isom', 'Ryan', 'f', '1990-06-27 00:00:00', '+1 (563) 585-0662', 'natus', 'Buffing and Polishing Operator', 'https://lorempixel.com/640/480/?28129', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(39, 39, 39, 'bf5f763b574bd641ed8c5eead2eef55b', 'Leon', 'Kreiger', 'f', '2005-07-11 00:00:00', '672-444-8693 x9382', 'repellendus', 'Chemist', 'https://lorempixel.com/640/480/?62617', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(40, 40, 40, 'b6ac382d0c4b4a7c2a05959f27e7035e', 'Frederik', 'Jerde', 'f', '1995-06-21 00:00:00', '1-949-790-3553 x2668', 'saepe', 'Social and Human Service Assistant', 'https://lorempixel.com/640/480/?69317', '2019-12-12 09:17:51', '2019-12-12 09:17:51'),
(41, 41, 41, '8953ee45f4eee3af5871ef90d5ca816a', 'Muhammad', 'Sipes', 'f', '2013-12-13 00:00:00', '512-835-7534 x8423', 'ab', 'Hoist and Winch Operator', 'https://lorempixel.com/640/480/?60502', '2019-12-12 09:17:52', '2019-12-12 09:17:52'),
(42, 42, 42, 'fe54367b2f63bbddc01fd7039a124532', 'Tad', 'O\'Keefe', 'm', '2014-06-29 00:00:00', '537.470.7557', 'a', 'Drywall Ceiling Tile Installer', 'https://lorempixel.com/640/480/?22492', '2019-12-12 09:17:52', '2019-12-12 09:17:52'),
(43, 43, 43, '4ca360ced5d8c79b7df13f06be2cd920', 'Isidro', 'Anderson', 'm', '1998-11-14 00:00:00', '+1.573.796.4593', 'sint', 'Anesthesiologist', 'https://lorempixel.com/640/480/?10823', '2019-12-12 09:17:52', '2019-12-12 09:17:52'),
(44, 44, 44, '9a9d288dec34159defff4577401cfa85', 'Nico', 'Zemlak', 'm', '1992-11-07 00:00:00', '292.520.2416 x98327', 'odio', 'Airfield Operations Specialist', 'https://lorempixel.com/640/480/?69514', '2019-12-12 09:17:52', '2019-12-12 09:17:52'),
(45, 45, 45, '7b19aeb6d29f3d5b95058156844dc66e', 'Milo', 'Morissette', 'f', '1981-09-23 00:00:00', '1-648-454-8056', 'et', 'Clinical Psychologist', 'https://lorempixel.com/640/480/?19098', '2019-12-12 09:17:52', '2019-12-12 09:17:52'),
(46, 46, 46, '2e51ae2f3e2804c4c0b19f8e9351c0b9', 'Royal', 'Reinger', 'f', '2018-06-17 00:00:00', '735.902.8227', 'voluptatem', 'Social Scientists', 'https://lorempixel.com/640/480/?31173', '2019-12-12 09:17:52', '2019-12-12 09:17:52'),
(47, 47, 47, '88172a49b1e34360f780084037f9120f', 'Ryleigh', 'Streich', 'm', '1986-08-21 00:00:00', '302.637.2843', 'temporibus', 'Credit Checker', 'https://lorempixel.com/640/480/?73032', '2019-12-12 09:17:52', '2019-12-12 09:17:52'),
(48, 48, 48, '035c61e915e0bcb9f4306dc7656cfd9b', 'Van', 'Beier', 'm', '1999-01-05 00:00:00', '646-371-6060 x25234', 'atque', 'Economics Teacher', 'https://lorempixel.com/640/480/?14399', '2019-12-12 09:17:52', '2019-12-12 09:17:52'),
(49, 49, 49, '4f336a26d5392ce621d8065260a29f7d', 'Lonzo', 'Rogahn', 'f', '2007-03-24 00:00:00', '817.255.9990', 'doloremque', 'Dispatcher', 'https://lorempixel.com/640/480/?59451', '2019-12-12 09:17:52', '2019-12-12 09:17:52'),
(50, 50, 50, '21c57462404c17af3ff166c1874443d7', 'Simeon', 'Smith', 'm', '1999-08-17 00:00:00', '208-943-2639', 'sunt', 'Farm Equipment Mechanic', 'https://lorempixel.com/640/480/?46307', '2019-12-12 09:17:52', '2019-12-12 09:17:52');

-- --------------------------------------------------------

--
-- Structure de la table `email_verfications`
--

CREATE TABLE `email_verfications` (
  `id` int(11) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `verifcation_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `email_verfications`
--

INSERT INTO `email_verfications` (`id`, `email`, `token`, `verifcation_date`, `created_at`) VALUES
(31, 'ma7.tadfsdfhir.77@gmail.com', 'Dx43GH5RwbLEK42ewC4puj9KDZ9iA6SRXJuAaMsK8Z6md85otWXgkJG6JvxJIR0cxOkLZA', '2019-03-28 05:07:44', '2019-03-28 17:06:31'),
(35, 'o.adrouj@opentech.ma', 'WB9JCYP6k8CRh9g819PD2OLNK1zcREfh8qG3KT5iJ38J4HkVRwbrZLJ0tgCkHiHIP1Hdkt', '2019-03-29 05:12:58', '2019-03-29 17:10:48'),
(36, 'info@opentech.ma', 'VwChfDXdw30auHkI72dcfHvHFnmnO1UUWiBTYTBWjgApqFz86W9RkDHkesMmoYKkjIQCoH', '2019-03-29 05:34:27', '2019-03-29 17:33:19'),
(37, 'a.hadrioui@opentech.ma', 'IXeTISJyPae75TyoKkdN3hgYjD0Vh4370Gw4huFmeOAYvygFnzOfB0pSztRErdj0TMixqw', '2019-05-10 05:13:15', '2019-05-08 09:30:00'),
(38, 'vakiw@cyber-host.net', 'DSc3MN0s0fK8RUjuXaBtt8BXK1gtXPkQx5H1LJ7nYtHSlT1K0jqRRyNxeKpaVdapytSDOR', '2019-05-09 01:57:20', '2019-05-09 13:56:00'),
(39, 'haytem@cyber-host.net', 'yJM5zChglZCmAUyksfXDEkjoyWQJwzRxllaHfvjeuC1VsrJw0YnBMlJXMgQ5DbhkqcUkDc', '2019-05-09 02:03:38', '2019-05-09 14:03:23'),
(41, 'h.eythrib@opentech.ma', '8VWKW2TLmTGGIbugJ4Jpbo8rl3xy085TJxQ0H68D7ZKvv6a3Kt4a8AewEq5mFVY3zygQAP', '2019-05-10 10:20:33', '2019-05-10 10:15:18'),
(45, 'hamza@leadgen.ma', 'Z44D0Ogz4ltVip1zZvX3p1zmzqhtQtLbSVoFKppAmyMUu4zEOgHPJ0KfOpH2lPSnPc6iae', NULL, '2019-05-14 12:03:46'),
(46, 'test@gmail.com', 'jNaqN1volxgh4LXZcfr4ZpzeJTItBRTuaoysTH42sB1H7gblTESLUnbPEgVJt0tLRIO1Tw', NULL, '2019-06-04 12:32:32'),
(47, 'iohded@leadgen.ma', 'T0JGQsu9xarsgaRtd6tFQpP0BptcJ1vkwTYxq5vaqRnpKtT2VUxe4EvyyvsMO5d2rlq4Jt', NULL, '2019-06-21 18:53:08'),
(48, 'lefdaoui.hamza@gmail.com', 'G169ryQ9OpZKpMqBhKsfxi47qev5ZMmfkxAlh1EI6YRoHP2Q0H8ffLQDH1sKeGNFkXvZZU', NULL, '2019-11-02 21:54:34');

-- --------------------------------------------------------

--
-- Structure de la table `equipements`
--

CREATE TABLE `equipements` (
  `id` int(11) NOT NULL,
  `libelle` varchar(70) NOT NULL,
  `code_barre` varchar(70) NOT NULL,
  `gamme` varchar(50) NOT NULL,
  `etat` varchar(30) NOT NULL,
  `image` varchar(50) NOT NULL,
  `created_at` varchar(20) NOT NULL,
  `updated_at` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `equipements`
--

INSERT INTO `equipements` (`id`, `libelle`, `code_barre`, `gamme`, `etat`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Sac de box VENOMzaefze', 'FF1555587', 'Hight', '4.5', 'sac.jpeg', '', '2019-12-13 09:16:24'),
(3, 'Tapis roulant REEBOK', '2F154Y003', 'Medium', '2', 'materiel1.jpg', '', '2019-11-22 19:14:12'),
(4, 'Sac de box VENOM', 'FF1555587', 'Hight', '4.5', 'sac.jpeg', '', ''),
(5, 'Sac de box VENOMzaefze', 'FF1555587', 'Hight', '4.5', 'sac.jpeg', '', '2019-12-13 09:16:24'),
(6, 'Tapis roulant REEBOK', '2F154Y003', 'Medium', '2', 'materiel1.jpg', '', '2019-11-22 19:14:12'),
(7, 'Sac de box VENOM', 'FF1555587', 'Hight', '4.5', 'sac.jpeg', '', ''),
(8, 'Sac de box VENOMzaefze', 'FF1555587', 'Hight', '4.5', 'sac.jpeg', '', '2019-12-13 09:16:24'),
(9, 'Tapis roulant REEBOK', '2F154Y003', 'Medium', '2', 'materiel1.jpg', '', '2019-11-22 19:14:12'),
(10, 'Sac de box VENOM', 'FF1555587', 'Hight', '4.5', 'sac.jpeg', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `files`
--

CREATE TABLE `files` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploaded_by` int(10) UNSIGNED NOT NULL,
  `file_group_id` int(10) UNSIGNED NOT NULL,
  `file_type` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` double NOT NULL,
  `path` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `file_groups`
--

CREATE TABLE `file_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gyms`
--

CREATE TABLE `gyms` (
  `id` int(11) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `gamme` varchar(30) NOT NULL,
  `avis` varchar(5) NOT NULL,
  `qrcode` varchar(255) NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `gyms`
--

INSERT INTO `gyms` (`id`, `logo`, `name`, `adress`, `tel`, `gamme`, `avis`, `qrcode`, `updated_at`, `created_at`) VALUES
(1, 'cityclub.png', 'City Club', '12, Rue Ali Abderrazak, Casablanca, Maroc', '(+212)0665544', 'Medium', '2', 'sfs4f65d4ffgfg', '2019-12-17', '0000-00-00'),
(2, 'miamifitness.png', 'Miami Fitness Club', ' Impasse Route De La Corniche, Casablanca 20250', '(+212)077887', 'Hight', '4', 'AAA', '0000-00-00', '0000-00-00'),
(3, 'pachafitness.png', 'Pacha Fitness', 'rue Ourika Marrakech ', '(+212)066776', 'Low', '5', '87gf8b7ty4g35trn85', '0000-00-00', '0000-00-00'),
(6, 'test.jpg', 'Pacha Fitness', 'rue Ourika Marrakech', '(+212)066776', 'Low', '1', '87gf8b7', '2019-12-15', '0000-00-00'),
(11, 'test.jpg', 'test', 'test', '33', 'Low', '2', 'sfsd', '2019-12-15', '2019-12-15'),
(12, 'test.jpg', 'Miami Fitness Club', 'Impasse Route De La Corniche, Casablanca 20250', '(+212)077887', 'Hight', '4', 'sf', '2019-12-15', '0000-00-00'),
(13, 'test.jpg', 'Pacha Fitness', 'rue Ourika Marrakech', '(+212)066776', 'Low', '5', 'sfs', '2019-12-15', '0000-00-00'),
(14, 'test.jpg', 'City Club', '12, Rue Ali Abderrazak, Casablanca, Maroc', '(+212)066554', 'Medium', '3.5', 'sfsd4f5', '2019-12-15', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(17, '2014_10_12_100000_create_password_resets_table', 1),
(18, '2019_08_19_000000_create_failed_jobs_table', 1),
(19, '2019_12_06_141413_create_admins_table', 1),
(20, '2019_12_06_141506_create_partners_table', 1),
(21, '2019_12_06_141524_create_customers_table', 1),
(22, '2019_12_06_141533_create_accounts_table', 1),
(23, '2019_12_09_081057_create_addresses_table', 1),
(24, '2019_12_09_082927_create_trainers_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `parrainages`
--

CREATE TABLE `parrainages` (
  `id` int(11) NOT NULL,
  `taux` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_cible` int(11) NOT NULL,
  `date_parrainage` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_gym` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `parrainages`
--

INSERT INTO `parrainages` (`id`, `taux`, `id_user`, `id_cible`, `date_parrainage`, `id_gym`) VALUES
(1, 30, 1, 55, '2019-11-12 00:00:00', 2),
(2, 25, 1, 10, '2019-11-14 00:31:46', 2);

-- --------------------------------------------------------

--
-- Structure de la table `parrainages_taux`
--

CREATE TABLE `parrainages_taux` (
  `id` int(11) NOT NULL,
  `id_gym` int(11) NOT NULL,
  `id_current_user` int(11) NOT NULL,
  `taux` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `parrainages_taux`
--

INSERT INTO `parrainages_taux` (`id`, `id_gym`, `id_current_user`, `taux`, `updated_at`, `created_at`) VALUES
(1, 2, 1, 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, 1, 40, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 2, 1, 40, '2019-11-13 09:09:32', '2019-11-13 09:09:32'),
(4, 2, 1, 44, '2019-11-13 09:28:56', '2019-11-13 09:28:56'),
(5, 2, 1, 45, '2019-11-14 00:02:39', '2019-11-14 00:02:39'),
(6, 2, 1, 50, '2019-11-14 00:03:26', '2019-11-14 00:03:26'),
(7, 2, 1, 50, '2019-11-14 00:04:27', '2019-11-14 00:04:27'),
(8, 2, 1, 50, '2019-11-14 00:05:11', '2019-11-14 00:05:11'),
(9, 2, 1, 55, '2019-11-14 00:05:28', '2019-11-14 00:05:28'),
(10, 2, 1, 42, '2019-11-14 08:19:40', '2019-11-14 08:19:40'),
(11, 2, 1, 55, '2019-11-14 08:39:32', '2019-11-14 08:39:32'),
(12, 2, 1, 50, '2019-11-14 09:50:51', '2019-11-14 09:50:51'),
(13, 2, 1, 50, '2019-11-14 09:51:03', '2019-11-14 09:51:03'),
(14, 2, 1, 50, '2019-11-14 09:51:08', '2019-11-14 09:51:08'),
(15, 2, 1, 50, '2019-11-14 09:52:00', '2019-11-14 09:52:00'),
(16, 2, 1, 50, '2019-11-14 09:52:21', '2019-11-14 09:52:21'),
(17, 2, 1, 55, '2019-11-14 12:08:59', '2019-11-14 12:08:59'),
(18, 2, 1, 40, '2019-11-14 13:00:13', '2019-11-14 13:00:13'),
(19, 2, 1, 41, '2019-11-15 10:00:00', '2019-11-15 10:00:00'),
(20, 2, 1, 77, '2019-11-15 16:26:12', '2019-11-15 16:26:12'),
(21, 2, 1, 80, '2019-11-16 08:02:43', '2019-11-16 08:02:43'),
(22, 2, 1, 12, '2019-12-02 10:26:03', '2019-12-02 10:26:03');

-- --------------------------------------------------------

--
-- Structure de la table `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `firstName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('m','f') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthDay` datetime DEFAULT NULL,
  `phoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobTitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `partners`
--

INSERT INTO `partners` (`id`, `account_id`, `address_id`, `firstName`, `lastName`, `gender`, `birthDay`, `phoneNumber`, `jobTitle`, `cin`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 101, 101, 'Dedrick', 'Dicki', 'f', '1974-10-14 00:00:00', '327-817-4494 x0706', 'Law Teacher', 'aut', 'https://lorempixel.com/640/480/?19857', '2019-12-12 09:18:30', '2019-12-12 09:18:30'),
(2, 102, 102, 'Alex', 'Kilback', 'm', '1977-04-08 00:00:00', '1-906-278-6579', 'GED Teacher', 'ullam', 'https://lorempixel.com/640/480/?12716', '2019-12-12 09:18:30', '2019-12-12 09:18:30'),
(3, 103, 103, 'Carmelo', 'Oberbrunner', 'f', '1996-01-09 00:00:00', '(580) 358-9342', 'Metal Pourer and Caster', 'vero', 'https://lorempixel.com/640/480/?69125', '2019-12-12 09:18:30', '2019-12-12 09:18:30'),
(4, 104, 104, 'Kyler', 'Conn', 'm', '1984-02-23 00:00:00', '+1-937-959-0517', 'Bindery Machine Operator', 'eos', 'https://lorempixel.com/640/480/?51373', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(5, 105, 105, 'Jan', 'Bruen', 'f', '2009-06-08 00:00:00', '+1.994.991.0270', 'Landscaper', 'cupiditate', 'https://lorempixel.com/640/480/?70047', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(6, 106, 106, 'Marco', 'Rogahn', 'm', '2000-10-10 00:00:00', '+19383841304', 'Child Care', 'animi', 'https://lorempixel.com/640/480/?94510', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(7, 107, 107, 'Olin', 'Langosh', 'm', '2005-03-03 00:00:00', '519-867-1717 x9272', 'Industrial Machinery Mechanic', 'id', 'https://lorempixel.com/640/480/?35697', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(8, 108, 108, 'Jasper', 'Bergnaum', 'm', '1978-11-18 00:00:00', '+19148993034', 'Production Worker', 'deserunt', 'https://lorempixel.com/640/480/?38940', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(9, 109, 109, 'Myles', 'Reilly', 'm', '1983-11-18 00:00:00', '1-717-710-0466', 'Construction Laborer', 'dignissimos', 'https://lorempixel.com/640/480/?18825', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(10, 110, 110, 'Stewart', 'Krajcik', 'f', '2002-07-10 00:00:00', '412-572-4356 x077', 'Pastry Chef', 'nesciunt', 'https://lorempixel.com/640/480/?82346', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(11, 111, 111, 'Ubaldo', 'Schroeder', 'm', '2008-09-29 00:00:00', '962.686.6889 x561', 'Gaming Manager', 'ut', 'https://lorempixel.com/640/480/?56526', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(12, 112, 112, 'Giovani', 'Breitenberg', 'm', '1996-11-16 00:00:00', '384-700-5171 x2770', 'Financial Examiner', 'cupiditate', 'https://lorempixel.com/640/480/?76434', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(13, 113, 113, 'Brock', 'Lesch', 'f', '2008-04-08 00:00:00', '+1.595.225.8266', 'Gas Pumping Station Operator', 'non', 'https://lorempixel.com/640/480/?74819', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(14, 114, 114, 'Rupert', 'Carroll', 'm', '1984-06-22 00:00:00', '364.808.4587 x3321', 'Short Order Cook', 'modi', 'https://lorempixel.com/640/480/?79524', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(15, 115, 115, 'Alexys', 'Schoen', 'f', '2004-09-23 00:00:00', '326-886-2934 x4423', 'Airframe Mechanic', 'ullam', 'https://lorempixel.com/640/480/?59515', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(16, 116, 116, 'Santos', 'Metz', 'f', '1976-12-19 00:00:00', '(769) 475-1586', 'Secondary School Teacher', 'illo', 'https://lorempixel.com/640/480/?36689', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(17, 117, 117, 'Nicholaus', 'Abernathy', 'f', '1973-04-12 00:00:00', '(550) 305-0909', 'Meter Mechanic', 'maiores', 'https://lorempixel.com/640/480/?92272', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(18, 118, 118, 'Eduardo', 'Kulas', 'm', '1972-08-01 00:00:00', '439.268.2982 x90009', 'House Cleaner', 'qui', 'https://lorempixel.com/640/480/?46341', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(19, 119, 119, 'Marlin', 'VonRueden', 'f', '1999-11-25 00:00:00', '+1-859-862-8273', 'Geography Teacher', 'laboriosam', 'https://lorempixel.com/640/480/?48043', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(20, 120, 120, 'Nicola', 'Feeney', 'm', '2014-03-16 00:00:00', '(365) 385-1168 x51982', 'Precious Stone Worker', 'dolorem', 'https://lorempixel.com/640/480/?47609', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(21, 121, 121, 'Mitchell', 'Sawayn', 'f', '1987-06-30 00:00:00', '(583) 418-1687 x60429', 'Project Manager', 'nobis', 'https://lorempixel.com/640/480/?49206', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(22, 122, 122, 'Dorcas', 'Fay', 'f', '1987-12-14 00:00:00', '1-919-778-3652', 'Foundry Mold and Coremaker', 'inventore', 'https://lorempixel.com/640/480/?32392', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(23, 123, 123, 'Dino', 'Rippin', 'm', '1991-04-20 00:00:00', '(447) 949-7559 x8185', 'Travel Guide', 'architecto', 'https://lorempixel.com/640/480/?29031', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(24, 124, 124, 'Cullen', 'Smitham', 'f', '1976-02-14 00:00:00', '(420) 269-2843', 'Extruding Machine Operator', 'aspernatur', 'https://lorempixel.com/640/480/?72553', '2019-12-12 09:18:31', '2019-12-12 09:18:31'),
(25, 125, 125, 'Wilburn', 'Turner', 'm', '1976-10-14 00:00:00', '581.929.2318', 'General Practitioner', 'mollitia', 'https://lorempixel.com/640/480/?21232', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(26, 126, 126, 'Merritt', 'Lindgren', 'm', '1996-12-06 00:00:00', '786-949-1871 x3193', 'Cartographer', 'quo', 'https://lorempixel.com/640/480/?57168', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(27, 127, 127, 'Bernard', 'Murazik', 'm', '1984-10-14 00:00:00', '+1.735.409.4465', 'Nonfarm Animal Caretaker', 'quo', 'https://lorempixel.com/640/480/?77091', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(28, 128, 128, 'Dillan', 'Kutch', 'm', '1980-02-05 00:00:00', '818.979.8242', 'Answering Service', 'ea', 'https://lorempixel.com/640/480/?38954', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(29, 129, 129, 'Leonardo', 'Schultz', 'm', '1978-10-30 00:00:00', '+19606685670', 'Infantry', 'nihil', 'https://lorempixel.com/640/480/?21705', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(30, 130, 130, 'Caleb', 'Smith', 'm', '2001-04-02 00:00:00', '(567) 735-7228', 'Substance Abuse Counselor', 'ea', 'https://lorempixel.com/640/480/?37761', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(31, 131, 131, 'Julian', 'Orn', 'f', '2019-08-18 00:00:00', '+14503351274', 'Locksmith', 'qui', 'https://lorempixel.com/640/480/?75916', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(32, 132, 132, 'Lowell', 'Orn', 'f', '2011-09-20 00:00:00', '(307) 815-4117 x4466', 'Library Assistant', 'nisi', 'https://lorempixel.com/640/480/?21067', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(33, 133, 133, 'Trent', 'Rutherford', 'f', '2006-10-23 00:00:00', '598-298-7813 x526', 'Transportation Equipment Painters', 'ut', 'https://lorempixel.com/640/480/?94023', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(34, 134, 134, 'Evan', 'Howell', 'f', '1999-07-30 00:00:00', '(604) 824-9211', 'Farm and Home Management Advisor', 'et', 'https://lorempixel.com/640/480/?69934', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(35, 135, 135, 'Furman', 'Hartmann', 'm', '2011-07-23 00:00:00', '(259) 300-7331 x74789', 'Radio Operator', 'qui', 'https://lorempixel.com/640/480/?19488', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(36, 136, 136, 'Brennon', 'Mueller', 'f', '2002-11-29 00:00:00', '(930) 726-0928', 'Tank Car', 'asperiores', 'https://lorempixel.com/640/480/?77848', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(37, 137, 137, 'Sid', 'Labadie', 'm', '2007-09-02 00:00:00', '517-725-7209 x7074', 'Printing Press Machine Operator', 'tempora', 'https://lorempixel.com/640/480/?34351', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(38, 138, 138, 'Gennaro', 'Effertz', 'm', '1981-07-22 00:00:00', '+1 (532) 720-6993', 'Welder and Cutter', 'expedita', 'https://lorempixel.com/640/480/?17591', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(39, 139, 139, 'Ahmed', 'Pfeffer', 'm', '1990-06-10 00:00:00', '+1-646-632-7138', 'Physician Assistant', 'voluptates', 'https://lorempixel.com/640/480/?88172', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(40, 140, 140, 'Scottie', 'Brown', 'f', '1974-11-08 00:00:00', '+1-628-515-7196', 'Veterinary Technician', 'aut', 'https://lorempixel.com/640/480/?92599', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(41, 141, 141, 'Cody', 'Simonis', 'f', '1980-11-23 00:00:00', '271.516.3408', 'Fitness Trainer', 'facere', 'https://lorempixel.com/640/480/?92926', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(42, 142, 142, 'Rey', 'Mertz', 'f', '1988-05-21 00:00:00', '+1-553-406-0025', 'Plasterer OR Stucco Mason', 'ullam', 'https://lorempixel.com/640/480/?24622', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(43, 143, 143, 'Philip', 'Lesch', 'f', '2015-02-26 00:00:00', '703-255-6834 x8575', 'Stonemason', 'ex', 'https://lorempixel.com/640/480/?96493', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(44, 144, 144, 'Gus', 'Balistreri', 'f', '1983-12-20 00:00:00', '927-356-4256 x39340', 'Chiropractor', 'ut', 'https://lorempixel.com/640/480/?36332', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(45, 145, 145, 'Mckenzie', 'Deckow', 'm', '2006-02-06 00:00:00', '1-259-620-8541 x840', 'Insurance Underwriter', 'eligendi', 'https://lorempixel.com/640/480/?86053', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(46, 146, 146, 'Jeremie', 'Marquardt', 'f', '1971-11-27 00:00:00', '1-383-293-9579', 'Air Crew Member', 'aliquam', 'https://lorempixel.com/640/480/?76496', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(47, 147, 147, 'Kelton', 'Thompson', 'f', '2006-06-30 00:00:00', '686-945-5389 x484', 'Telephone Operator', 'assumenda', 'https://lorempixel.com/640/480/?72936', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(48, 148, 148, 'Darrion', 'Nienow', 'm', '1980-06-01 00:00:00', '(568) 365-0627', 'Choreographer', 'et', 'https://lorempixel.com/640/480/?44353', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(49, 149, 149, 'Jeramie', 'Gerlach', 'f', '1985-09-16 00:00:00', '975.747.6140', 'Nursery Manager', 'accusantium', 'https://lorempixel.com/640/480/?31713', '2019-12-12 09:18:32', '2019-12-12 09:18:32'),
(50, 150, 150, 'Ted', 'Jakubowski', 'm', '2004-03-07 00:00:00', '1-694-221-1557 x7255', 'CEO', 'qui', 'https://lorempixel.com/640/480/?22063', '2019-12-12 09:18:32', '2019-12-12 09:18:32');

-- --------------------------------------------------------

--
-- Structure de la table `passpartout`
--

CREATE TABLE `passpartout` (
  `id` int(11) NOT NULL,
  `class` varchar(30) NOT NULL,
  `prix` int(11) NOT NULL,
  `id_gym` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `passpartout`
--

INSERT INTO `passpartout` (`id`, `class`, `prix`, `id_gym`, `created_at`, `updated_at`) VALUES
(1, 'silver', 200, 2, '2019-11-15 14:37:40', '2019-11-15 14:37:40'),
(2, 'gold', 500, 2, '2019-11-15 14:51:56', '2019-11-15 14:51:56'),
(3, 'platinum', 2500, 2, '2019-11-15 15:12:59', '2019-11-15 15:12:59'),
(4, 'bronze', 50, 2, '2019-11-15 15:13:46', '2019-11-15 15:13:46'),
(5, 'platinum', 5555, 2, '2019-11-15 15:25:35', '2019-11-15 15:25:35');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rights`
--

CREATE TABLE `rights` (
  `id` int(11) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `right_name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rights`
--

INSERT INTO `rights` (`id`, `module_id`, `right_name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'consulter', 'Consulter le module utilisateur en lecture', '2019-03-25 14:55:03', '2019-03-25 14:55:03', NULL),
(2, 1, 'ajouter et modifier un utilisateur', 'L\'ajout d\'un nouvel utilisateur', '2019-03-25 14:55:03', '2019-03-25 14:55:03', NULL),
(3, 1, 'supprimer un utilisateur', 'Supprimer un utilisateur', '2019-03-25 14:55:03', '2019-03-25 14:55:03', NULL),
(6, 1, 'supprimer un rôle', 'Supprimer un rôle', '2019-03-25 14:55:03', '2019-03-25 14:55:03', NULL),
(8, 1, 'ajouter et modifier un rôle', 'Ajouter et modifier un rôle', '2019-03-25 14:55:03', '2019-03-25 14:55:03', NULL),
(9, 1, 'supprimer une departement', 'Supprimer une departement', '2019-03-25 14:55:03', '2019-03-25 14:55:03', NULL),
(10, 1, 'ajouter et modifier une departement', 'Ajouter et modifier une departement', '2019-03-25 14:55:03', '2019-03-25 14:55:03', NULL),
(12, 4, 'consulter', 'Consulter le module en lecture', '2019-05-06 14:21:05', '2019-05-06 14:21:05', NULL),
(13, 4, 'créer', 'Créer une commande', '2019-05-06 14:21:05', '2019-05-06 14:21:05', NULL),
(14, 4, 'modifier', 'Modifier une commande', '2019-05-06 14:21:05', '2019-05-06 14:21:05', NULL),
(15, 4, 'importer', 'Importer un fichier de stock', '2019-05-06 14:21:05', '2019-05-06 14:21:05', NULL),
(16, 4, 'supprimer', 'Supprimer une commande', '2019-05-06 14:21:05', '2019-05-06 14:21:05', NULL),
(17, 4, 'exporter', 'Exporter les fichiers', '2019-05-06 14:21:05', '2019-05-06 14:21:05', NULL),
(18, 6, 'consulter', 'Consulter le module en lecture', '2019-05-06 16:43:46', '2019-05-06 16:43:46', NULL),
(19, 6, 'ajouter', 'Ajouter un article', '2019-05-06 16:43:46', '2019-05-06 16:43:46', NULL),
(20, 6, 'affecter', 'Affecter un article', '2019-05-06 16:43:46', '2019-05-06 16:43:46', NULL),
(21, 6, 'transférer', 'Transférer un article', '2019-05-06 16:43:46', '2019-05-06 16:43:46', NULL),
(22, 6, 'libérer', 'Libérer un article', '2019-05-06 16:43:46', '2019-05-06 16:43:46', NULL),
(23, 6, 'activer', 'Activer une carte', '2019-05-06 16:43:46', '2019-05-06 16:43:46', NULL),
(24, 6, 'effectuer', 'Effectuer un retour', '2019-05-06 16:43:46', '2019-05-06 16:43:46', NULL),
(25, 6, 'bloquer/débloquer', 'Bloquer / débloquer un article', '2019-05-06 16:43:46', '2019-05-06 16:43:46', NULL),
(26, 6, 'consulter_affectation', 'Consulter la vue des affectations', '2019-05-06 16:43:46', '2019-05-06 16:43:46', NULL),
(27, 6, 'exporter', 'Exporter les documents', '2019-05-06 16:43:46', '2019-05-06 16:43:46', NULL),
(28, 5, 'consulter', 'Consulter le module en lecture', '2019-05-07 12:29:37', '2019-05-07 12:29:37', NULL),
(29, 5, 'créer et modifier un modèle', 'Créer ou modifier un modèle de véhicule', '2019-05-07 12:29:37', '2019-05-07 12:29:37', NULL),
(30, 5, 'editer les véhicules', 'Editer les donnnées d\'un véhicules client', '2019-05-07 12:29:37', '2019-05-07 12:29:37', NULL),
(31, 5, 'créer ou modifier une FI', 'Créer ou modifier une FI', '2019-05-07 12:29:37', '2019-05-07 12:29:37', NULL),
(32, 5, 'créer ou modifier une FI d\'un autre membre', 'Créer ou modifier une FI d\'un autre membre', '2019-05-07 12:29:37', '2019-05-07 12:29:37', NULL),
(33, 5, 'supprimer une FI', 'Supprimer une FI', '2019-05-07 12:29:37', '2019-05-07 12:29:37', NULL),
(34, 5, 'valider ou refuser une FI', 'Valider ou refuser une FI', '2019-05-07 12:29:37', '2019-05-07 12:29:37', NULL),
(35, 5, 'export des tables', 'Export des tables', '2019-05-07 12:29:37', '2019-05-07 12:29:37', NULL),
(36, 7, 'consulter', 'Consulter les tiers', '2019-05-08 23:00:00', '2019-05-08 23:00:00', NULL),
(37, 7, 'ajouter', 'Ajouter un tier', '2019-05-08 23:00:00', '2019-05-08 23:00:00', NULL),
(38, 7, 'modifier', 'Modifier un tier', '2019-05-08 23:00:00', '2019-05-08 23:00:00', NULL),
(39, 7, 'supprimer', 'Supprimer un tier', NULL, NULL, NULL),
(40, 8, 'consulter', 'Consulter les produits', '2019-05-08 23:00:00', '2019-05-08 23:00:00', NULL),
(41, 8, 'creer', 'Créer les produits', '2019-05-08 23:00:00', '2019-05-08 23:00:00', NULL),
(42, 8, 'modifier', 'Modifier les produits', '2019-05-08 23:00:00', '2019-05-08 23:00:00', NULL),
(43, 8, 'supprimer', 'Supprimer les produits', '2019-05-08 23:00:00', '2019-05-08 23:00:00', NULL),
(44, 9, 'consulter', 'Consulter un service', '2019-05-09 23:00:00', '2019-05-09 23:00:00', NULL),
(45, 9, 'creer', 'Créer un service ', '2019-05-09 23:00:00', '2019-05-09 23:00:00', NULL),
(46, 9, 'modifier', 'Modifier un service', '2019-05-09 23:00:00', '2019-05-09 23:00:00', NULL),
(47, 9, 'supprimer', 'Supprimer un service', '2019-05-09 23:00:00', '2019-05-09 23:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `right_module`
--

CREATE TABLE `right_module` (
  `id` int(11) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `right_module`
--

INSERT INTO `right_module` (`id`, `module_name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Utilisateurs', NULL, '2019-03-24 23:00:00', '2019-03-24 23:00:00', NULL),
(2, 'Departements', NULL, '2019-03-28 05:20:21', '2019-03-27 23:32:32', NULL),
(3, 'Rôles', NULL, '2019-03-28 11:20:21', '2019-03-28 11:32:32', NULL),
(4, 'Commande', NULL, '2019-05-06 06:19:19', '2019-05-06 06:19:19', NULL),
(5, 'Technique', NULL, '2019-05-06 15:45:19', '2019-05-06 15:45:19', NULL),
(6, 'Stock', NULL, '2019-05-05 23:00:00', '2019-05-05 23:00:00', NULL),
(7, 'Tiers', NULL, '2019-05-08 23:00:00', '2019-05-08 23:00:00', NULL),
(8, 'Produits', NULL, '2019-05-01 22:00:00', '2019-05-08 23:00:00', NULL),
(9, 'Services', NULL, '2019-05-08 23:00:00', '2019-05-08 23:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `trainers`
--

CREATE TABLE `trainers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `length` double(8,2) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `firstName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('m','f') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthDay` datetime DEFAULT NULL,
  `phoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobTitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trainers`
--

INSERT INTO `trainers` (`id`, `weight`, `length`, `account_id`, `address_id`, `firstName`, `lastName`, `gender`, `birthDay`, `phoneNumber`, `cin`, `jobTitle`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 244.00, 4.00, 151, 151, 'Noble', 'Erdman', 'm', '1995-12-01 00:00:00', '1-612-560-5266 x31935', 'et', 'Computer Support Specialist', 'https://lorempixel.com/640/480/?51663', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(2, 36.00, 3.30, 152, 152, 'Enid', 'Osinski', 'm', '1973-01-28 00:00:00', '+1.485.265.9762', 'enim', 'Transit Police OR Railroad Police', 'https://lorempixel.com/640/480/?73757', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(3, 176.00, 3.00, 153, 153, 'Kristopher', 'Mayer', 'f', '1988-05-08 00:00:00', '1-702-976-2336 x262', 'non', 'MARCOM Director', 'https://lorempixel.com/640/480/?52443', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(4, 58.00, 1.30, 154, 154, 'Deontae', 'Rowe', 'm', '1976-02-29 00:00:00', '676-515-5233', 'tempore', 'Entertainment Attendant', 'https://lorempixel.com/640/480/?24099', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(5, 155.00, 2.00, 155, 155, 'Nick', 'Cormier', 'f', '1973-11-04 00:00:00', '981-863-6193', 'vitae', 'Musician OR Singer', 'https://lorempixel.com/640/480/?61099', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(6, 275.00, 2.10, 156, 156, 'Monserrat', 'Sawayn', 'm', '2011-05-24 00:00:00', '1-498-712-7397 x0540', 'voluptatum', 'Nursery Manager', 'https://lorempixel.com/640/480/?60452', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(7, 262.00, 1.40, 157, 157, 'Roman', 'Bernier', 'm', '1975-08-11 00:00:00', '797-269-2080 x60503', 'consequatur', 'Electrical Parts Reconditioner', 'https://lorempixel.com/640/480/?71408', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(8, 245.00, 2.10, 158, 158, 'Fausto', 'Kunde', 'm', '2009-07-13 00:00:00', '639.752.8622', 'dolores', 'Typesetting Machine Operator', 'https://lorempixel.com/640/480/?87320', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(9, 75.00, 3.00, 159, 159, 'Loyal', 'Kub', 'm', '2005-10-18 00:00:00', '484-372-6133', 'asperiores', 'Precision Lens Grinders and Polisher', 'https://lorempixel.com/640/480/?84181', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(10, 97.00, 1.20, 160, 160, 'Brent', 'Labadie', 'm', '2014-09-12 00:00:00', '+1-392-478-0248', 'qui', 'Geological Sample Test Technician', 'https://lorempixel.com/640/480/?19864', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(11, 258.00, 1.50, 161, 161, 'Fredrick', 'Murray', 'm', '1996-04-01 00:00:00', '(281) 763-9823 x66810', 'ipsam', 'City Planning Aide', 'https://lorempixel.com/640/480/?56797', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(12, 167.00, 2.50, 162, 162, 'Avery', 'Baumbach', 'f', '2005-03-21 00:00:00', '859.328.9719 x383', 'laudantium', 'CSI', 'https://lorempixel.com/640/480/?57903', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(13, 140.00, 2.80, 163, 163, 'Amari', 'Runolfsdottir', 'm', '2006-01-11 00:00:00', '1-991-536-9844 x458', 'tempora', 'Network Systems Analyst', 'https://lorempixel.com/640/480/?82160', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(14, 270.00, 1.00, 164, 164, 'Jaden', 'Klocko', 'f', '1985-10-04 00:00:00', '(362) 262-8881', 'tempore', 'Video Editor', 'https://lorempixel.com/640/480/?22431', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(15, 63.00, 2.10, 165, 165, 'Gage', 'Wisoky', 'm', '2003-06-12 00:00:00', '825.431.2129 x32138', 'quia', 'Airfield Operations Specialist', 'https://lorempixel.com/640/480/?87319', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(16, 161.00, 3.20, 166, 166, 'Lafayette', 'Hermann', 'm', '2007-01-31 00:00:00', '(875) 254-9612', 'voluptatem', 'Building Inspector', 'https://lorempixel.com/640/480/?87913', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(17, 298.00, 1.90, 167, 167, 'Odell', 'Mann', 'm', '1974-10-16 00:00:00', '1-497-881-5584 x324', 'officia', 'Brattice Builder', 'https://lorempixel.com/640/480/?88733', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(18, 185.00, 1.70, 168, 168, 'Buford', 'Conn', 'm', '1980-03-09 00:00:00', '438.203.8708 x947', 'nulla', 'Command Control Center Specialist', 'https://lorempixel.com/640/480/?57876', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(19, 300.00, 3.80, 169, 169, 'Marty', 'Keebler', 'm', '1971-12-06 00:00:00', '534-815-0736 x7889', 'et', 'Gaming Dealer', 'https://lorempixel.com/640/480/?35772', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(20, 151.00, 2.80, 170, 170, 'Travon', 'Keeling', 'f', '1989-01-12 00:00:00', '1-641-977-3650 x4330', 'at', 'Private Detective and Investigator', 'https://lorempixel.com/640/480/?88133', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(21, 70.00, 2.70, 171, 171, 'Cory', 'Kilback', 'f', '1984-05-29 00:00:00', '960.803.3220', 'placeat', 'Dentist', 'https://lorempixel.com/640/480/?55737', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(22, 289.00, 2.80, 172, 172, 'Lukas', 'Cremin', 'm', '1976-02-14 00:00:00', '(648) 736-1404 x2595', 'sint', 'Plating Operator OR Coating Machine Operator', 'https://lorempixel.com/640/480/?14504', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(23, 230.00, 1.50, 173, 173, 'Darwin', 'Waelchi', 'f', '2009-07-08 00:00:00', '1-363-332-0140 x8493', 'dolores', 'Computer Systems Analyst', 'https://lorempixel.com/640/480/?13684', '2019-12-12 09:18:50', '2019-12-12 09:18:50'),
(24, 128.00, 3.80, 174, 174, 'Diamond', 'Fisher', 'm', '2000-10-19 00:00:00', '958-278-3400', 'nisi', 'Industrial Machinery Mechanic', 'https://lorempixel.com/640/480/?67976', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(25, 132.00, 1.60, 175, 175, 'Johathan', 'Leffler', 'm', '1985-12-07 00:00:00', '676-509-0659', 'veritatis', 'Machine Operator', 'https://lorempixel.com/640/480/?14792', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(26, 205.00, 3.40, 176, 176, 'Henry', 'Simonis', 'f', '1973-10-10 00:00:00', '(530) 825-3967 x5473', 'eveniet', 'Physical Therapist', 'https://lorempixel.com/640/480/?89054', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(27, 151.00, 2.70, 177, 177, 'Oren', 'Mante', 'f', '1976-05-15 00:00:00', '(719) 241-2311 x4919', 'excepturi', 'Watch Repairer', 'https://lorempixel.com/640/480/?52662', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(28, 206.00, 1.90, 178, 178, 'Lee', 'Waelchi', 'm', '2006-01-25 00:00:00', '837.549.5103', 'architecto', 'Movers', 'https://lorempixel.com/640/480/?26602', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(29, 203.00, 3.90, 179, 179, 'Kamryn', 'Hayes', 'm', '2007-09-21 00:00:00', '(378) 826-9267 x15620', 'et', 'Forming Machine Operator', 'https://lorempixel.com/640/480/?11044', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(30, 97.00, 2.80, 180, 180, 'Ray', 'Boyer', 'f', '2014-11-24 00:00:00', '(219) 444-7717 x221', 'saepe', 'Agricultural Crop Farm Manager', 'https://lorempixel.com/640/480/?46063', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(31, 98.00, 1.60, 181, 181, 'Matt', 'Schimmel', 'f', '1991-02-01 00:00:00', '865.510.2779 x77978', 'sapiente', 'User Experience Researcher', 'https://lorempixel.com/640/480/?21324', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(32, 116.00, 3.40, 182, 182, 'Murray', 'Dooley', 'm', '2008-04-17 00:00:00', '1-362-566-1986', 'omnis', 'Travel Guide', 'https://lorempixel.com/640/480/?68240', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(33, 253.00, 2.80, 183, 183, 'Florencio', 'Bauch', 'f', '1978-09-07 00:00:00', '665.892.3221 x741', 'corporis', 'University', 'https://lorempixel.com/640/480/?36399', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(34, 200.00, 3.80, 184, 184, 'Lemuel', 'Stiedemann', 'f', '2002-01-16 00:00:00', '260.954.1085 x8266', 'mollitia', 'Bicycle Repairer', 'https://lorempixel.com/640/480/?64261', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(35, 186.00, 2.40, 185, 185, 'Steve', 'Robel', 'm', '1988-08-29 00:00:00', '462.656.1798 x961', 'nemo', 'Multi-Media Artist', 'https://lorempixel.com/640/480/?39917', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(36, 184.00, 1.00, 186, 186, 'Franco', 'Wilkinson', 'f', '1977-03-23 00:00:00', '+1-358-825-3200', 'magni', 'Portable Power Tool Repairer', 'https://lorempixel.com/640/480/?84903', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(37, 103.00, 3.30, 187, 187, 'Dagmar', 'Kunde', 'f', '2002-04-17 00:00:00', '902-936-0428 x804', 'quia', 'Stonemason', 'https://lorempixel.com/640/480/?93170', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(38, 103.00, 1.70, 188, 188, 'Brennon', 'Medhurst', 'f', '1983-05-10 00:00:00', '+1 (721) 766-9188', 'dolor', 'License Clerk', 'https://lorempixel.com/640/480/?54190', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(39, 124.00, 3.50, 189, 189, 'Pierre', 'Howe', 'm', '1970-08-23 00:00:00', '(861) 644-9940 x1168', 'illo', 'Athletic Trainer', 'https://lorempixel.com/640/480/?49973', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(40, 125.00, 2.90, 190, 190, 'Israel', 'Rath', 'm', '1999-12-30 00:00:00', '949.975.1757 x47927', 'nisi', 'Crossing Guard', 'https://lorempixel.com/640/480/?15325', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(41, 164.00, 3.00, 191, 191, 'Regan', 'Willms', 'f', '1995-08-11 00:00:00', '352-448-8965 x8604', 'ab', 'Sociologist', 'https://lorempixel.com/640/480/?43223', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(42, 188.00, 2.10, 192, 192, 'Emery', 'Nitzsche', 'f', '1974-03-26 00:00:00', '284-272-7150 x9138', 'repellendus', 'Space Sciences Teacher', 'https://lorempixel.com/640/480/?62850', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(43, 251.00, 2.80, 193, 193, 'Lafayette', 'Stokes', 'f', '2005-04-27 00:00:00', '+1-891-446-1540', 'voluptatem', 'Music Arranger and Orchestrator', 'https://lorempixel.com/640/480/?97739', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(44, 40.00, 3.40, 194, 194, 'Jesse', 'Hill', 'm', '2003-03-04 00:00:00', '1-531-724-5914 x17901', 'libero', 'Physical Scientist', 'https://lorempixel.com/640/480/?15147', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(45, 229.00, 1.40, 195, 195, 'Randy', 'Hilpert', 'f', '2002-10-27 00:00:00', '990.528.3078', 'illum', 'Manager of Air Crew', 'https://lorempixel.com/640/480/?15926', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(46, 53.00, 3.70, 196, 196, 'Barry', 'Wolf', 'm', '1978-06-13 00:00:00', '1-483-946-0991 x4973', 'facere', 'Electrical and Electronic Inspector and Tester', 'https://lorempixel.com/640/480/?34957', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(47, 185.00, 2.20, 197, 197, 'Jack', 'Ankunding', 'm', '1970-10-13 00:00:00', '664-657-7393 x908', 'officiis', 'Home Appliance Installer', 'https://lorempixel.com/640/480/?96845', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(48, 244.00, 1.90, 198, 198, 'Coty', 'Doyle', 'f', '1998-05-18 00:00:00', '(816) 543-9635 x694', 'numquam', 'Mental Health Counselor', 'https://lorempixel.com/640/480/?15121', '2019-12-12 09:18:51', '2019-12-12 09:18:51'),
(49, 42.00, 3.00, 199, 199, 'Marco', 'Sipes', 'f', '2002-06-29 00:00:00', '1-667-602-4111', 'id', 'Electrolytic Plating Machine Operator', 'https://lorempixel.com/640/480/?13980', '2019-12-12 09:18:52', '2019-12-12 09:18:52'),
(50, 42.00, 3.30, 200, 200, 'Vinnie', 'Borer', 'f', '1973-10-19 00:00:00', '892-741-6004', 'vitae', 'Industrial Equipment Maintenance', 'https://lorempixel.com/640/480/?58852', '2019-12-12 09:18:52', '2019-12-12 09:18:52');

-- --------------------------------------------------------

--
-- Structure de la table `upload_images`
--

CREATE TABLE `upload_images` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `content` longblob NOT NULL,
  `id_equipement` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `upload_images`
--

INSERT INTO `upload_images` (`id`, `nom`, `content`, `id_equipement`, `created_at`, `updated_at`) VALUES
(2, 'Test', 0x253246396a25324634516952525868705a674141545530414b674141414167414277455341414d41414141424141454141414561414155414141414241414141596745624141554141414142414141416167456f41414d41414141424141494141414578414149414141416941414141636745794141494141414155414141416c49647041415141414141424141414171414141414e5141437679414141416e4541414b2532464941414143635151575276596d5567554768766447397a6147397749454e44494449774d5467674b466470626d527664334d70414449774d546b364d5441364d6a49674d5451364d6a67364e44514141414f6741514144414141414151414241414367416741454141414141514141414643674177414541414141415141414146414141414141414141414267454441414d41414141424141594141414561414155414141414241414142496745624141554141414142414141424b67456f41414d414141414241414941414149424141514141414142414141424d67494341415141414141424141414856774141414141414141424941414141415141414145674141414142253246396a2532463751414d51575276596d566651303041416625324675414135425a4739695a51426b6741414141414825324632774345414177494341674a4341774a4351775243776f4c45525550444177504652675445785554457867524441774d4441774d4551774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d444177424451734c4451344e4541344f4542514f446734554641344f446734554551774d4441774d4552454d4441774d444177524441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d445025324641414245494146414155414d4249674143455145444551482532463351414541415825324678414525324641414142425145424151454241514141414141414141414441414543424155474277674a4367734241414546415145424151454241414141414141414141454141674d454251594843416b4b43784141415151424177494541675548426767464177777a4151414345514d45495249784255465259524d6963594579426853526f62464349795156557346694d7a5279677446444279575355253246446838574e7a4e526169736f4d6d524a4e555a4558436f33513246394a56346d5879733454443033586a3830596e6c4b5346744a5845314f54307062584631655831566d5a326870616d74736257357659335231646e64346558703766483125324266334551414341674543424151444241554742776347425455424141495241794578456752425557467849684d464d6f4752464b477851695042557448774d79526934584b436b6b4e5446574e7a4e50456c42686169736f4d484a6a5843306b5354564b4d585a4556564e6e526c34764b7a684d50546465507a5270536b68625356784e546b394b57317864586c39565a6d646f615770726247317562324a7a6448563264336835656e7438662532463267414d4177454141684544455141253246415056556b6b6b6c4b535748396176724b336f474c57356c5872354f51347470724a6761527665253242506437647a566a4e25324273482532424d423751357652366f4f6f6c6a7766756465464a48444b55654c514137635234574f575749504471535033526232715371394d794d724a774b62737967343253357636616b396e4452323356337364394a694c6c57325534317474565a75735930755a55336c7a6750617766316b79746125324269253242394c53704c697a31253246774478676a58396a3152253246566366253246414859576c395666725325324672547238544c6f2532427935324c725a574a6769646a766125324633736378253246746578796b6c686b496d576841333454784c426c69534271436475495539456b6b6b6f6d52253246394431564a4a4476757278364c4c3754747171613537336377316f334f4f6e386c4a547858313839333167364777366a31427038624b6c334b3449327525324274763172784d724372662532427a4f6d6c7066653845427a6d753961503762746a4e6e253246584633716d7a61527878507a52427364754973574c57553544596e51253242536b6b6b6c4379715844644339762532424d58716a526f4379795225324661706375355844645746333163253242754837657471665a30334c62737473594a32467a577363442532466272625a2532464c553244586a6a316c41695069574c4e70775336526b4c386e75556b44437a6366507861387a4664766f7547356a69434a45783946337552314352526f7375372532463948315651747172757166546130507273615750616543317732756170704a4b65437936476656623633344c656e463157443148613237486b6c737564364c76706675797978693731634e3966595a31376f646a74476977533774705a5553753555326257474f52334d545a253246756c6978615379524777496f66336c4a4a4a4b466c557546366730253246574c36376e704f55397836646774334768704944693172584f33626633724c4e762532464142613770634e30483325324634784f7175627131724c415434454f70617073476e755336786761505973576258676a304d6862326d4c6934253242486a7378735a67717071454d594f414f55564a4a5173722532464150253246533952253242305562746e714d33544733634a6c45584a3946364a3072715633575835754d79353436686577504d68776249507463306a3935564d507225324264683950784d4b6d7a643675526b56553562325076496f6f4c646862565437375865253246616b7033253246724c39584d667225324249326d78357075704a645463424d45364f6135756d356a314436733945366a306975396d626e4f7a685a73394c635848594737747762366a6e25324653334b6a54395975724e7078386e4b59473056356e32584b65616e3168395667486f5a62473365253242726125324625324263554d6e367a3952626a325a4e515a3657546d2532465a4d4678593525324232746d3457354a5a562532426b763375622532426a72616e253242354c67344c394b33676a786364657036707a3273457649614f4a4a685358456454366e6e5a33534d696e4d6158444879636230736e306e3043787233612532466f722532466476726331614f52316a72647836706c5954714b7362704c33734e566a43353170714725324233645948743950253246673078633650316936586e3955773255594f5937427362594875736158416c75317a646e364e7a50336c57253242724831567036433232783170796376496a314c694945443362574358666e6654566476562532427464537a6d30394f737078717a68315a59467243386b32442532426263344f6274565a3331747a736d6e7037614133467379716e323357656c5a6b52366233556261716166667465253242763835503841636c7763462532426b72654350467856366e72306c7972657639637947394d70725a586a354f5a5a665461627133687039494e6379396c62746c72647a4475324a576466366e58314b79724c765a675631332532426c58585a6a574f62597951475725324661326e597a31767a557863253246253246302532423673253242715854624c723766567957444a736462645579357a574f633879253242574d56712532466f48544c73576a46465a705a696d635a314c6978395a50306a5859303776662532426574464a4a546e253246735446643032337074396c325254664a6536367732503766527366253242377339715425324268644e663032727072717a396e7839707049635139726d25324652745a5932484e732532466c4c515353553554767137687678485974313254665739374c43627258506344575a5a7463253246364c5532583957656d5a655262652532467742577637524279617172484d72746a253246545674507557736b6b70774d6a36724d797572575a543748553468783255563130574f726637507a4837527439485a2532464b5679373675394d73707836713276787a694e4c63657968377137477450306d2532426f30376e62253246774355744e4a4a546e4d364a694e6668324f6664625a674f7364532532423277766354614e72253246556325324677436e2532464a51386a36755957566b47374974794c4b7a594c546a4f75636164774f372532425a253246724c565353552532467744253246326625324674454935516147393062334e6f623341674d79347741446843535530454a51414141414141454141414141414141414141414141414141414141414134516b6c4e42446f4141414141414f5541414141514141414141514141414141414333427961573530543356306348563041414141425141414141425163335254596d39766241454141414141535735305a5756756457304141414141535735305a5141414141424462484a7441414141443342796157353055326c346447566c626b4a7064474a76623277414141414143334279615735305a584a4f5957316c5645565956414141414145414141414141413977636d6c75644642796232396d5532563064584250596d706a4141414144414251414849416277427641475941494142544147554164414231414841414141414141417077636d39765a6c4e6c64485677414141414151414141414243624852755a573531625141414141786964576c7364476c7555484a76623259414141414a63484a7662325a4454566c4c41446843535530454f774141414141434c5141414142414141414142414141414141415363484a70626e52506458527764585250634852706232357a41414141467741414141424463485275596d3976624141414141414151327869636d4a76623277414141414141464a6e63303169623239734141414141414244636d3544596d397662414141414141415132353051324a7662327741414141414145786962484e6962323973414141414141424f5a335232596d397662414141414141415257317352474a76623277414141414141456c7564484a696232397341414141414142435932746e54324a715977414141414541414141414141425352304a444141414141774141414142535a4341675a473931596b4276344141414141414141414141414564796269426b62335669514725324667414141414141414141414141516d77674947527664574a41622532424141414141414141414141414243636d52555657353052694e536248514141414141414141414141414141414243624751675657353052694e536248514141414141414141414141414141414253633278305657353052694e5165477841556741414141414141414141414170325a574e3062334a4559585268596d39766241454141414141554764516332567564573041414141415547645163774141414142515a314244414141414145786c5a6e5256626e524749314a73644141414141414141414141414141414146527663434256626e524749314a736441414141414141414141414141414141464e6a62434256626e5247493142795930425a41414141414141414141414145474e79623342586147567555484a70626e5270626d646962323973414141414141356a636d3977556d566a64454a766448527662577876626d6341414141414141414144474e79623342535a574e305447566d64477876626d6341414141414141414144574e79623342535a574e30556d6c6e614852736232356e41414141414141414141746a636d3977556d566a6446527663477876626d63414141414141446843535530443751414141414141454142494141414141514142414567414141414241414534516b6c4e42435941414141414141344141414141414141414141414150344141414468435355304544514141414141414241414141466f34516b6c4e42426b414141414141415141414141654f454a4a5451507a414141414141414a414141414141414141414142414468435355306e454141414141414143674142414141414141414141414534516b6c4e41253246554141414141414567414c325a6d4141454162475a6d4141594141414141414145414c325a6d414145416f5a6d614141594141414141414145414d67414141414541576741414141594141414141414145414e514141414145414c514141414159414141414141414534516b6c4e412532466741414141414148414141502532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532463844364141414141442532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532464125324267414141414125324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324677506f4141414141502532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532463844364141414f454a4a54515141414141414141414341414134516b6c4e42414941414141414141494141446843535530454d41414141414141415145414f454a4a54515174414141414141414741414541414141464f454a4a5451514941414141414141514141414141514141416b414141414a4141414141414468435355304548674141414141414241414141414134516b6c4e42426f414141414141306b414141414741414141414141414141414141414251414141415541414141416f41565142754148514161514230414777415a51426b414330414f4141414141454141414141414141414141414141414141414141414141414141514141414141414141414141414141554141414146414141414141414141414141414141414141414141414151414141414141414141414141414141414141414141414141415141414141415141414141414141473531624777414141414341414141426d4a766457356b63303969616d4d41414141424141414141414141556d4e304d51414141415141414141415647397749477876626d634141414141414141414145786c5a6e52736232356e41414141414141414141424364473974624739755a7741414146414141414141556d646f64477876626d63414141425141414141426e4e7361574e6c63315a7354484d414141414254324a715977414141414541414141414141567a62476c6a5a5141414142494141414148633278705932564a52477876626d634141414141414141414232647962335677535552736232356e414141414141414141415a76636d6c6e6157356c626e5674414141414445565462476c6a5a55397961576470626741414141316864585276523256755a584a686447566b41414141414652356347566c626e567441414141436b565462476c6a5a56523563475541414141415357316e4941414141415a69623356755a484e50596d706a41414141415141414141414141464a6a64444541414141454141414141465276634342736232356e41414141414141414141424d5a575a30624739755a7741414141414141414141516e527662577876626d6341414142514141414141464a6e614852736232356e414141415541414141414e31636d7855525668554141414141514141414141414147353162477855525668554141414141514141414141414145317a5a32565552566855414141414151414141414141426d4673644652685a3152465746514141414142414141414141414f593256736246526c6548524a633068555455786962323973415141414141686a5a57787356475634644652465746514141414142414141414141414a61473979656b4673615764755a5735316251414141413946553278705932564962334a36515778705a323441414141485a47566d595856736441414141416c325a584a30515778705a32356c626e5674414141414430565462476c6a5a565a6c636e524262476c6e626741414141646b5a575a68645778304141414143324a6e5132397362334a556558426c5a5735316251414141424646553278705932564352304e766247397956486c775a5141414141424f6232356c41414141435852766345393164484e6c64477876626d63414141414141414141436d786c5a6e52506458527a5a5852736232356e41414141414141414141786962335230623231506458527a5a5852736232356e4141414141414141414174796157646f6445393164484e6c64477876626d63414141414141446843535530454b41414141414141444141414141492532463841414141414141414468435355304546414141414141414241414141415934516b6c4e424177414141414142334d4141414142414141415541414141464141414144774141424c414141414231634147414142253246396a2532463751414d51575276596d566651303041416625324675414135425a4739695a51426b6741414141414825324632774345414177494341674a4341774a4351775243776f4c45525550444177504652675445785554457867524441774d4441774d4551774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d444177424451734c4451344e4541344f4542514f446734554641344f446734554551774d4441774d4552454d4441774d444177524441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d445025324641414245494146414155414d4249674143455145444551482532463351414541415825324678414525324641414142425145424151454241514141414141414141414441414543424155474277674a4367734241414546415145424151454241414141414141414141454141674d454251594843416b4b43784141415151424177494541675548426767464177777a4151414345514d45495249784255465259524d6963594579426853526f62464349795156557346694d7a5279677446444279575355253246446838574e7a4e526169736f4d6d524a4e555a4558436f33513246394a56346d5879733454443033586a3830596e6c4b5346744a5845314f54307062584631655831566d5a326870616d74736257357659335231646e64346558703766483125324266334551414341674543424151444241554742776347425455424141495241794578456752425557467849684d464d6f4752464b477851695042557448774d79526934584b436b6b4e5446574e7a4e50456c42686169736f4d484a6a5843306b5354564b4d585a4556564e6e526c34764b7a684d50546465507a5270536b68625356784e546b394b57317864586c39565a6d646f615770726247317562324a7a6448563264336835656e7438662532463267414d4177454141684544455141253246415056556b6b6b6c4b535748396176724b336f474c57356c5872354f51347470724a6761527665253242506437647a566a4e25324273482532424d423751357652366f4f6f6c6a7766756465464a48444b55654c514137635234574f575749504471535033526232715371394d794d724a774b62737967343253357636616b396e4452323356337364394a694c6c57325534317474565a75735930755a55336c7a6750617766316b79746125324269253242394c53704c697a31253246774478676a58396a3152253246566366253246414859576c395666725325324672547238544c6f2532427935324c725a574a6769646a766125324633736378253246746578796b6c686b496d576841333454784c426c69534271436475495539456b6b6b6f6d52253246394431564a4a4476757278364c4c3754747171613537336377316f334f4f6e386c4a547858313839333167364777366a31427038624b6c334b3449327525324274763172784d724372662532427a4f6d6c7066653845427a6d753961503762746a4e6e253246584633716d7a61527878507a52427364754973574c57553544596e51253242536b6b6b6c4379715844644339762532424d58716a526f4379795225324661706375355844645746333163253242754837657471665a30334c62737473594a32467a577363442532466272625a2532464c553244586a6a316c41695069574c4e70775336526b4c386e75556b44437a6366507861387a4664766f7547356a69434a45783946337552314352526f7375372532463948315651747172757166546130507273615750616543317732756170704a4b65437936476656623633344c656e463157443148613237486b6c737564364c76706675797978693731634e3966595a31376f646a74476977533774705a5553753555326257474f52334d545a253246756c6978615379524777496f66336c4a4a4a4b466c557546366730253246574c36376e704f55397836646774334768704944693172584f33626633724c4e762532464142613770634e30483325324634784f7175627131724c415434454f70617073476e755336786761505973576258676a304d6862326d4c6934253242486a7378735a67717071454d594f414f55564a4a5173722532464150253246533952253242305562746e714d33544733634a6c45584a3946364a3072715633575835754d79353436686577504d68776249507463306a3935564d507225324264683950784d4b6d7a643675526b56553562325076496f6f4c646862565437375865253246616b7033253246724c39584d667225324249326d78357075704a645463424d45364f6135756d356a314436733945366a306975396d626e4f7a685a73394c635848594737747762366a6e25324653334b6a54395975724e7078386e4b59473056356e32584b65616e3168395667486f5a62473365253242726125324625324263554d6e367a3952626a325a4e515a3657546d2532465a4d4678593525324232746d3457354a5a562532426b763375622532426a72616e253242354c67344c394b33676a786364657036707a3273457649614f4a4a685358456454366e6e5a33534d696e4d6158444879636230736e306e3043787233612532466f722532466476726331614f52316a72647836706c5954714b7362704c33734e566a43353170714725324233645948743950253246673078633650316936586e3955773255594f5937427362594875736158416c75317a646e364e7a50336c57253242724831567036433232783170796376496a314c694945443362574358666e6654566476562532427464537a6d30394f737078717a68315a59467243386b32442532426263344f6274565a3331747a736d6e7037614133467379716e323357656c5a6b52366233556261716166667465253242763835503841636c7763462532426b72654350467856366e72306c7972657639637947394d70725a586a354f5a5a665461627133687039494e6379396c62746c72647a4475324a576466366e58314b79724c765a675631332532426c58585a6a574f62597951475725324661326e597a31767a557863253246253246302532423673253242715854624c723766567957444a736462645579357a574f633879253242574d56712532466f48544c73576a46465a705a696d635a314c6978395a50306a5859303776662532426574464a4a546e253246735446643032337074396c325254664a6536367732503766527366253242377339715425324268644e663032727072717a396e7839707049635139726d25324652745a5932484e732532466c4c515353553554767137687678485974313254665739374c43627258506344575a5a7463253246364c5532583957656d5a655262652532467742577637524279617172484d72746a253246545674507557736b6b70774d6a36724d797572575a543748553468783255563130574f726637507a4837527439485a2532464b5679373675394d73707836713276787a694e4c63657968377137477450306d2532426f30376e62253246774355744e4a4a546e4d364a694e6668324f6664625a674f7364532532423277766354614e72253246556325324677436e2532464a51386a36755957566b47374974794c4b7a594c546a4f75636164774f372532425a253246724c56535355253246774425324632514134516b6c4e4243454141414141414630414141414241514141414138415151426b414738415967426c414341415541426f414738416441427641484d41614142764148414141414158414545415a414276414749415a5141674146414161414276414851416277427a41476741627742774143414151774244414341414d674177414445414f414141414145414f454a4a5451514741414141414141484141514141414142415144253246345134456148523063446f764c32357a4c6d466b62324a6c4c6d4e7662533934595841764d5334774c7741385033687759574e725a585167596d566e615734394975253242377679496761575139496c63315454424e63454e6c61476c49656e4a6c5533704f56474e3661324d355a43492532465069413865447034625842745a585268494868746247357a4f6e6739496d466b62324a6c4f6d357a4f6d316c64474576496942344f6e68746348527250534a425a4739695a53425954564167513239795a5341314c6a5974597a45304d6941334f5334784e6a41354d6a5173494449774d5463764d4463764d544d744d4445364d4459364d7a6b674943416749434167494349253242494478795a475936556b5247494868746247357a4f6e4a6b5a6a30696148523063446f764c336433647935334d793576636d63764d546b354f5338774d6938794d6931795a47597463336c75644746344c57357a497949253242494478795a4759365247567a59334a706348527062323467636d526d4f6d46696233563050534969494868746247357a4f6e6874634430696148523063446f764c32357a4c6d466b62324a6c4c6d4e7662533934595841764d5334774c79496765473173626e4d366547317754553039496d6830644841364c793975637935685a4739695a53356a62323076654746774c7a45754d43397462533869494868746247357a4f6e4e3052585a3050534a6f644852774f693876626e4d7559575276596d5575593239744c336868634338784c6a41766331523563475576556d567a6233567959325646646d567564434d69494868746247357a4f6d526a50534a6f644852774f6938766348567962433576636d63765a474d765a57786c6257567564484d764d5334784c79496765473173626e4d36634768766447397a6147397750534a6f644852774f693876626e4d7559575276596d5575593239744c33426f6233527663326876634338784c6a4176496942346258413651334a6c59585276636c527662327739496b466b62324a6c4946426f623352766332687663434244517941794d444534494368586157356b6233647a4b534967654731774f6b4e795a5746305a55526864475539496a49774d546b744d5441744d6a4a554d5451364d6a67364e4451724d4445364d444169494868746344704e5a5852685a4746305955526864475539496a49774d546b744d5441744d6a4a554d5451364d6a67364e4451724d4445364d444169494868746344704e623252705a6e6c455958526c505349794d4445354c5445774c544979564445304f6a49344f6a51304b7a41784f6a4177496942346258424e5454704a626e4e305957356a5a556c4550534a346258417561576c6b4f6a45354d474e6d4f54557a4c5463315a6a4d744f4455304f4330354e7a51334c5759324f44526b4e4759314d5759334e43496765473177545530365247396a6457316c626e524a5244306959575276596d55365a47396a61575136634768766447397a614739774f6d55784d474e6c596d55344c54526c59574d745a575130597931694e7a6b784c57566d5a6a4578597a41774f5759325a534967654731775455303654334a705a326c755957784562324e316257567564456c4550534a34625841755a476c6b4f6a6c6a4e44517a5a5745774c5456684e4441744e324930595331695a4451354c575a6b4e6a4a6b5a6a59304d6d51344e5349675a474d365a6d39796257463050534a706257466e5a5339716347566e496942776147393062334e6f623341365132397362334a4e6232526c5053497a496942776147393062334e6f6233413653554e4455484a765a6d6c735a54306963314a485169424a52554d324d546b324e6930794c6a456950694138654731775455303653476c7a644739796554346750484a6b5a6a70545a5845253242494478795a47593662476b6763335246646e513659574e306157397550534a6a636d56686447566b4969427a6445563264447070626e4e305957356a5a556c4550534a346258417561576c6b4f6a6c6a4e44517a5a5745774c5456684e4441744e324930595331695a4451354c575a6b4e6a4a6b5a6a59304d6d51344e53496763335246646e51366432686c626a30694d6a41784f5330784d4330794d6c51784e446f794f446f304e4373774d546f774d43496763335246646e51366332396d64486468636d56425a3256756444306951575276596d5567554768766447397a6147397749454e44494449774d5467674b466470626d527664334d70496938253242494478795a47593662476b6763335246646e513659574e306157397550534a7a59585a6c5a43496763335246646e51366157357a644746755932564a52443069654731774c6d6c705a446f784f54426a5a6a6b314d7930334e57597a4c5467314e4467744f5463304e79316d4e6a67305a44526d4e54466d4e7a516949484e3052585a304f6e646f5a573439496a49774d546b744d5441744d6a4a554d5451364d6a67364e4451724d4445364d44416949484e3052585a304f6e4e765a6e523359584a6c5157646c626e5139496b466b62324a6c4946426f623352766332687663434244517941794d444534494368586157356b6233647a4b53496763335246646e513659326868626d646c5a4430694c794976506941384c334a6b5a6a70545a584525324249447776654731775455303653476c7a6447397965543467504339795a4759365247567a59334a706348527062323425324249447776636d526d4f6c4a45526a3467504339344f6e68746347316c6447452532424943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167504439346347466a61325630494756755a4430696479492532465076253246694446684a51304e6655464a50526b6c4d52514142415141414445684d61573576416841414147317564484a535230496757466c614941664f4141494143514147414445414147466a6333424e55305a554141414141456c465179427a556b644341414141414141414141414141414142414144323167414241414141414e4d74534641674941414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414145574e77636e514141414651414141414d32526c63324d4141414745414141416248643063485141414148774141414146474a7263485141414149454141414146484a5957566f4141414959414141414647645957566f41414149734141414146474a5957566f4141414a414141414146475274626d514141414a5541414141634752745a47514141414c454141414169485a315a57514141414e4d41414141686e5a705a58634141415055414141414a47783162576b4141415034414141414647316c59584d414141514d414141414a48526c59326741414151774141414144484a55556b4d41414151384141414944476455556b4d41414151384141414944474a55556b4d4141415138414141494448526c65485141414141415132397765584a705a3268304943686a4b5341784f546b344945686c6432786c644851745547466a613246795a43424462323177595735354141426b5a584e6a414141414141414141424a7a556b644349456c46517a59784f5459324c5449754d514141414141414141414141414141456e4e5352304967535556444e6a45354e6a59744d693478414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141425957566f6741414141414141413831454141514141414145577a46685a57694141414141414141414141414141414141414141414157466c61494141414141414141472532426941414134395141414135425957566f67414141414141414159706b41414c654641414159326c685a57694141414141414141416b6f41414144345141414c62505a47567a5977414141414141414141575355564449476830644841364c793933643363756157566a4c6d4e6f414141414141414141414141414141575355564449476830644841364c793933643363756157566a4c6d4e6f4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414147526c63324d4141414141414141414c6b6c46517941324d546b324e6930794c6a45675247566d595856736443425352304967593239736233567949484e7759574e6c4943306763314a48516741414141414141414141414141414c6b6c46517941324d546b324e6930794c6a45675247566d595856736443425352304967593239736233567949484e7759574e6c4943306763314a48516741414141414141414141414141414141414141414141414141414141426b5a584e6a4141414141414141414378535a575a6c636d567559325567566d6c6c64326c755a7942446232356b615852706232346761573467535556444e6a45354e6a59744d69347841414141414141414141414141414173556d566d5a584a6c626d4e6c49465a705a586470626d6367513239755a476c306157397549476c7549456c46517a59784f5459324c5449754d5141414141414141414141414141414141414141414141414141414141414141414141646d6c6c6477414141414141453654253242414252664c6741517a78514141253242334d4141515443774144584a34414141414257466c61494141414141414154416c5741464141414142584825324264745a57467a4141414141414141414145414141414141414141414141414141414141414141414141436a77414141414a7a615763674141414141454e535643426a64584a324141414141414141424141414141414641416f414477415541426b414867416a414367414c514179414463414f7742414145554153674250414651415751426541474d41614142744148494164774238414945416867434c414a41416c514361414a384170414370414b344173674333414c774177514447414d734130414456414e73413441446c414f7341384144324150734241514548415130424577455a415238424a514572415449424f4145253242415555425441465341566b425941466e415734426451463841594d4269774753415a6f426f514770416245427551484241636b423051485a416545423651487941666f434177494d416851434851496d416938434f414a42416b734356414a64416d634363514a36416f51436a674b594171494372414b324173454379774c564175414336774c314177414443774d57417945444c514d3441304d4454774e614132594463674e25324241346f446c674f69413634447567504841394d4434415073412532466b4542675154424341454c515137424567455651526a424845456667534d424a6f4571415332424d5145307754684250414525324667554e425277464b77553642556b465741566e425863466867575742615946745158464264554635515832426759474667596e426a634753415a5a426d6f476577614d427030477277624142744547347762314277634847516372427a304854776468423351486867655a423677487677665342253242554825324241674c434238494d67684743466f4962676943434a5949716769253242434e494935776a374352414a4a516b364355384a5a416c354359384a70416d364363384a35516e374368454b4a776f39436c514b616771424370674b726772464374774b3877734c4379494c4f51745243326b4c674175594337414c79417668432532466b4d4567777144454d4d584178314449344d70777a41444e6b4d3877304e4453594e514131614458514e6a67327044634d4e3367333444684d4f4c67354a446d514f667736624472594f3067377544776b504a5139424431345065672532425744374d507a772532467345416b514a6842444547455166684362454c6b513178443145524d524d524650455730526a42477145636b52364249484569595352524a6b456f51536f784c4445754d5441784d6a45304d5459784f44453651547852506c464159554a78524a46476f5569785374464d3455384255534654515656685634465a73567652586746674d574a685a4a466d77576a78617946745957253242686364463045585a52654a4636345830686633474273595142686c47496f5972786a5647506f5a49426c464757735a6b526d334764306142426f71476c4561647871654773556137427355477a73625978754b473749623268774348436f6355687837484b4d637a427a314852346452783177485a6b64777833734868596551423571487051657668377048784d6650683970483551667678253246714942556751534273494a6767784344774952776853434631496145687a6948374969636956534b434971386933534d4b497a676a5a694f554938496a384351664a45306b664353724a4e6f6c435355344a57676c6c7958484a66636d4a795a584a6f636d7479626f4a78676e535364364a36736e3343674e4b44386f635369694b4e517042696b344b5773706e536e514b6749714e53706f4b7073717a7973434b7a5972615375644b394573425377354c4734736f697a584c517774515331324c617374345334574c6b7775676936334c7534764a4339614c35457678792532462532424d4455776244436b4d4e7378456a464b4d594978756a48794d696f79597a4b624d74517a44544e474d33387a754450784e4373305a5453654e4e6731457a564e4e596331776a58394e6a6332636a61754e756b334a4464674e357733317a67554f4641346a446a494f515535516a6c2532464f627735253242546f324f6e5136736a72764f793037617a75714f25324267384a7a786c504b5138347a3069505745396f5433675069412532425944366750754125324649543968503649253246346b416a51475241706b446e51536c42616b4773516535434d454a795172564339304d36513331447745514452456445696b544f52524a465655576152643547496b5a6e52717447384563315233744877456746534574496b556a585352314a59306d705366424b4e3070395373524c444574545335704c346b777154484a4d756b30435455704e6b3033635469564f626b363354774250535525324254543931514a314278554c7452426c4651555a7452356c4978556e785378314d5455313954716c503256454a556a3154625653685664565843566739575846617056766458524665535625324242594c316839574d745a476c6c70576268614231705757715a6139567446573556623556773158495a63316c306e5858686479563461586d786576563850583246667332414659466467716d4438595539686f6d4831596b6c696e474c7759304e6a6c3250725a45426b6c4754705a54316c6b6d586e5a6a316d6b6d626f5a7a316e6b3266706144396f6c6d6a7361554e706d6d6e78616b68716e3272336130397270327625324662466473723230496257427475573453626d747578473865623368763058417263495a7734484536635a567838484a4c63715a7a41584e646337683046485277644d78314b48574664654632506e616264766833566e657a65424634626e6a4d6553703569586e6e656b5a367058734565324e37776e776866494638345831426661462532424158356966734a2532464933253242456625324257415234436f675171426134484e676a43436b6f4c3067316544756f5164684943453434564868617547446f5a79687465484f3465666941534961596a4f69544f4a6d596e253242696d534b796f73776935614c25324649786a6a4d714e4d5932596a662532424f5a6f374f6a7a61506e7041476b4736513170452532466b616953455a4a366b754f54545a4f326c434355697054306c5625324256795a59306c7025324258437064316c2532424359544a69346d53535a6b4a6e386d6d6961315a74436d3625324263484a794a6e5065645a4a33536e6b4365727038646e3475662532427142706f4e6968523647326f6961696c714d476f33616a35715257704d656c4f4b57707068716d693662397032366e344b6853714d53704e366d70716879716a3673437133577236617863724e4374524b3234726932756f61385772347577414c4231734f7178594c4857736b757977724d34733636304a62536374524f3169725942746e6d32384c646f74253242433457626a527555713577726f37757257374c72756e764347386d373056765925324225324243723645767625324225324665722532463177484441374d466e7765504358384c6277316a44314d5252784d374653385849786b624777386442783725324649506369387954724a75636f347972664c4e7375327a44584d746330317a62584f4e7336327a7a6650754e4135304c7252504e47253242306a2532465377644e45303862555364544c3155375630645a5631746a58584e666732475459364e6c733266486164747237323444634264794b335244646c74346333714c664b6425324276344462677665464534637a69552532424c623432506a36253242527a35507a6c684f594e3570626e48253242657036444c6f764f6c473664447157253242726c363344722532422532427947375248746e4f346f37725476514f2532464d38466a77356646793866253246796a504d5a383666304e5054433956443133765a74397676336976675a2532424b6a354f506e482532426c66363525324674332532464166386d5030702532466272253242532532463763253246323325324625324625324625324675414135425a4739695a51426b41414141414148253246327743454141594542415146424159464251594a4267554743517349426759494377774b4367734b436777514441774d4441774d4541774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d44417742427763484451774e474241514742514f446734554641344f446734554551774d4441774d4552454d4441774d444177524441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d445025324641414245494146414155414d424551414345514544455148253246335141454141722532467841476941414141427745424151454241414141414141414141414542514d43426745414277674a4367734241414943417745424151454241414141414141414141454141674d454251594843416b4b437841414167454441774945416759484177514342674a7a4151494445515141425345534d55465242684e68496e474246444b526f5163567355496a77564c5234544d575976416b636f4c784a554d3055354b69736d4e7a776a56454a354f6a737a59585647523077394c694343614443516f59475953555255616b74466254565367613875507a784e546b39475631685a576c746358563566566d646f615770726247317562324e3064585a3365486c3665337839666e397a684957476834694a696f754d6a59365067704f556c5a61586d4a6d616d3579646e70253242536f36536c7071656f71617172724b327572364551414341674543417755464241554742416744413230424141495241775168456a46424256455459534947635947524d714778384254423065456a51685653596e4c784d795130513449576b6c4d6c6f6d4f797767647a306a586952494d58564a4d4943516f594753593252526f6e5a4852564e2532464b6a73384d6f4b64506a38345355704c5445314f54305a5857466c6157317864586c39555a575a6e61476c7161327874626d396b64585a3365486c3665337839666e397a684957476834694a696f754d6a593650673553566c7065596d5a71626e4a32656e354b6a704b576d703669707171757372613676722532463267414d41774541416845444551412532464150564f4b757856324b757856324b757856324b757856324b75785625324639443154697273565952253242616e356c5265534e4b747049726236357164253242375232567553565834414337765434714c7955635625324231797a4c306d6c38575233714d5847314f6f384d64354c44592532467a422532463579426c51534a354f74676a4371686f706c4e443468726748384d796a70744e2532465050342532467a5847386655667a6678383371766c6a556455314851724f37315778625474536b536c335a742532427849706f3348647667616e4a50692532427a6d757978455a45525046467a38636959676b555556716c3363576d6d334e3162327a336c7844457a773273644f636a676643677251664564736a41416b416d6b794e43773868627a392532467a6b474153664a3172516230456370503458476250387670663535253246482532426134486a366a2532426150782532466e4d6d2532464b76383035764e3874253246706d715749303358644e33754c646551566c35634749562532466a526b66345852737839587050436f6738555a4e326d31506957434b6b486f5759546c7578562532462532465239553471374658683335376b5025324259486b654a74313964617225324672584d51503673322532465a253246774464542532464852316d7425324676495063633144733359713746585971384e38696e302532462532426369764e434c384b764463456764795868624e767150384146592532466a76645a682532467741596b39797a554f7a6469722532462532463076564f4b714e396532316a5a584637644e777472574a3570336f5478534e537a476771545252686a456b304f714a4541575868725854253246414a6f2532466d767047703650627925324634613876474e707225324256436975386225324274514139336267697039766a25324238624e7658356643524c36352532467775737678386f492532426944336a4e4f3752324b757856324b7644764e6958666b443833253246415047317861797a253242573956515258647843764c3058644652676638726e47736772397465537238576266445762423459507269367a4c654c4e786b656d543254524e61303757394b74745630365179325632764f435171794569704832574159626a4e586b6759534d547a44735954456859354933494d6e253246253246543955347170586472623364724e61584d596c74376847696d69626f794f43724b666d446842494e6842466969384c315779682532464c58383374446a3046337439443138787833656e6c6d614947535430576f474a25324279536b6966744c396e374762694576487753347671682532464536795138484d4f48365a766563307a744859713746585971384c313947382532422532466e63336c6655707044356430574979505a4978525a47534e57597478703854535342655825324225324231253242486a6d3478253246756450786a363575736e253242397a384a2532426d4c327253394c30253246537450683025324654344674724b33586a44416c654b697461437454314f616d637a4932656273597845525135497249736e2532463150564f4b757856346425324266564976506e6b69346b2532424749546a6b3536414a63524525324663446d33374f25324675356a38636e576137253242386739787a554f7a64697273566469727737794825324225324225324635794938307952253246456b634e7747596441524a43704833696d626655626157507725324653367a422532466a456e754f6168326273566625324656395247253246735249596a6378435148695535727972345572697176697245507a4b2532464c6e547650476b52576b387a576c3561755a4c4b3756656641734b4d724c55636b65677238532532465a584d7253366f345a574e77584831476e4755563155767930386c6559764b317666513678726b6d744c4f597671767147516946597777594c366a50546c7958375038414c683157654f516a686a77493025324247554c7338544d704a596f6c355375714c55446b78414654303635694f53757856693335696556746538796150425a614c72456d69334563346c6b75597a4970654d49796c5033624965724276396a6d547073306363726b4f4e6f31474b557855547770642532425750355757666b6d4f37754a4c74745231612532466f4c6d385a6549436738754b416c6a7578354f7a4e3857543165724f57685844454d4e4e70686a766535466e5759626c4f78562532462532463175706554504a486c547a426565635a745930364b366d585837364a5a3235423153716d697370464b46696356536a5225324650327561563565306e534c4f34395158576f616861326d717a517a5872437973697051724644386372486e7858396c565846553874507a443831705a32476f616a43736468427133364e314f64726157334531744f41494c74466d6f3851567a253242385846565055667a4e387852324678714e714976716d6f36782532426939456b614753594a4243474574795569724a4f585a6633636134716b2532466d667a50726d7365557452744e56694d6932476f3663625455767173396b74776b736d253246377163636c654e6c3474544657536168357738363362655a39523065577974744e38727a5377473075496e6b6b7557746b35796c7041362532426d44253246757669754b756a383365632532464d47757061614463576d6e7748534c5856676c314330785a726b56394e6d444c78417239726a69715750253242626574366a6161416c6d73656d7a366c617a5856376369316e76384169594a6d67347851772532464878643479334a76737269714a6a3825324665656235504c4670424462324770617650665774303131424d735a2532427249724a4f6b62464a56444953775276327668785631783539387977655a4c69323153253242693053326776767174766233476e58456b55385049424a546471654365742532427a25324279754b762532463125324236335035546557353779253242754464616a45756f7a79584e35625133636b634d6b6b78713955536d78366636754b706e666551664c4e3170566a7071573757634f6d45747030747049384d3044485a6a484970355666397576322532463273565848795670556e6c79373876336b393366325636535a704c79643535716e6952786b657048456f724c2532466c59713666794c35636d3875576e6c3534474668593844614d6a736b73636b66325a556b576a4c4a556b3876387246554b253246356461504e7055756d586c37714639424c4e46634637713665615257674e55437339654b2532467a4159717431663873764c4f715839316554473667253242766c54714e746258456b4d46795632426d6a553062465573314838726f645238327a366a4e6353576d6b47776873726533735a354c6555656b61464843674b59654733486c697163586e3564253242576269793025324231686a6d30383655686a734c6d796d6b676e6a5276744b4a46504a673533626c792532424c4656614479527055632532426a33456b39336458476950504a5a7a334d37545346726b635839526e7158322532427a253246414334716874522532464c6e526452314272712532427539517549476e4679326d7664796d7a4d697479423947744b637632667334712532462532463050564f4b757856324b757856324b757856324b757856324b757856253246396b253344, 777, '2019-11-14 11:25:31', '2019-11-14 11:25:31');
INSERT INTO `upload_images` (`id`, `nom`, `content`, `id_equipement`, `created_at`, `updated_at`) VALUES
(3, 'Alteres', 0x253246396a25324634516952525868705a674141545530414b674141414167414277455341414d41414141424141454141414561414155414141414241414141596745624141554141414142414141416167456f41414d41414141424141494141414578414149414141416941414141636745794141494141414155414141416c49647041415141414141424141414171414141414e5141437679414141416e4541414b2532464941414143635151575276596d5567554768766447397a6147397749454e44494449774d5467674b466470626d527664334d70414449774d546b364d5441364d6a49674d5451364d6a67364e44514141414f6741514144414141414151414241414367416741454141414141514141414643674177414541414141415141414146414141414141414141414267454441414d41414141424141594141414561414155414141414241414142496745624141554141414142414141424b67456f41414d414141414241414941414149424141514141414142414141424d67494341415141414141424141414856774141414141414141424941414141415141414145674141414142253246396a2532463751414d51575276596d566651303041416625324675414135425a4739695a51426b6741414141414825324632774345414177494341674a4341774a4351775243776f4c45525550444177504652675445785554457867524441774d4441774d4551774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d444177424451734c4451344e4541344f4542514f446734554641344f446734554551774d4441774d4552454d4441774d444177524441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d445025324641414245494146414155414d4249674143455145444551482532463351414541415825324678414525324641414142425145424151454241514141414141414141414441414543424155474277674a4367734241414546415145424151454241414141414141414141454141674d454251594843416b4b43784141415151424177494541675548426767464177777a4151414345514d45495249784255465259524d6963594579426853526f62464349795156557346694d7a5279677446444279575355253246446838574e7a4e526169736f4d6d524a4e555a4558436f33513246394a56346d5879733454443033586a3830596e6c4b5346744a5845314f54307062584631655831566d5a326870616d74736257357659335231646e64346558703766483125324266334551414341674543424151444241554742776347425455424141495241794578456752425557467849684d464d6f4752464b477851695042557448774d79526934584b436b6b4e5446574e7a4e50456c42686169736f4d484a6a5843306b5354564b4d585a4556564e6e526c34764b7a684d50546465507a5270536b68625356784e546b394b57317864586c39565a6d646f615770726247317562324a7a6448563264336835656e7438662532463267414d4177454141684544455141253246415056556b6b6b6c4b535748396176724b336f474c57356c5872354f51347470724a6761527665253242506437647a566a4e25324273482532424d423751357652366f4f6f6c6a7766756465464a48444b55654c514137635234574f575749504471535033526232715371394d794d724a774b62737967343253357636616b396e4452323356337364394a694c6c57325534317474565a75735930755a55336c7a6750617766316b79746125324269253242394c53704c697a31253246774478676a58396a3152253246566366253246414859576c395666725325324672547238544c6f2532427935324c725a574a6769646a766125324633736378253246746578796b6c686b496d576841333454784c426c69534271436475495539456b6b6b6f6d52253246394431564a4a4476757278364c4c3754747171613537336377316f334f4f6e386c4a547858313839333167364777366a31427038624b6c334b3449327525324274763172784d724372662532427a4f6d6c7066653845427a6d753961503762746a4e6e253246584633716d7a61527878507a52427364754973574c57553544596e51253242536b6b6b6c4379715844644339762532424d58716a526f4379795225324661706375355844645746333163253242754837657471665a30334c62737473594a32467a577363442532466272625a2532464c553244586a6a316c41695069574c4e70775336526b4c386e75556b44437a6366507861387a4664766f7547356a69434a45783946337552314352526f7375372532463948315651747172757166546130507273615750616543317732756170704a4b65437936476656623633344c656e463157443148613237486b6c737564364c76706675797978693731634e3966595a31376f646a74476977533774705a5553753555326257474f52334d545a253246756c6978615379524777496f66336c4a4a4a4b466c557546366730253246574c36376e704f55397836646774334768704944693172584f33626633724c4e762532464142613770634e30483325324634784f7175627131724c415434454f70617073476e755336786761505973576258676a304d6862326d4c6934253242486a7378735a67717071454d594f414f55564a4a5173722532464150253246533952253242305562746e714d33544733634a6c45584a3946364a3072715633575835754d79353436686577504d68776249507463306a3935564d507225324264683950784d4b6d7a643675526b56553562325076496f6f4c646862565437375865253246616b7033253246724c39584d667225324249326d78357075704a645463424d45364f6135756d356a314436733945366a306975396d626e4f7a685a73394c635848594737747762366a6e25324653334b6a54395975724e7078386e4b59473056356e32584b65616e3168395667486f5a62473365253242726125324625324263554d6e367a3952626a325a4e515a3657546d2532465a4d4678593525324232746d3457354a5a562532426b763375622532426a72616e253242354c67344c394b33676a786364657036707a3273457649614f4a4a685358456454366e6e5a33534d696e4d6158444879636230736e306e3043787233612532466f722532466476726331614f52316a72647836706c5954714b7362704c33734e566a43353170714725324233645948743950253246673078633650316936586e3955773255594f5937427362594875736158416c75317a646e364e7a50336c57253242724831567036433232783170796376496a314c694945443362574358666e6654566476562532427464537a6d30394f737078717a68315a59467243386b32442532426263344f6274565a3331747a736d6e7037614133467379716e323357656c5a6b52366233556261716166667465253242763835503841636c7763462532426b72654350467856366e72306c7972657639637947394d70725a586a354f5a5a665461627133687039494e6379396c62746c72647a4475324a576466366e58314b79724c765a675631332532426c58585a6a574f62597951475725324661326e597a31767a557863253246253246302532423673253242715854624c723766567957444a736462645579357a574f633879253242574d56712532466f48544c73576a46465a705a696d635a314c6978395a50306a5859303776662532426574464a4a546e253246735446643032337074396c325254664a6536367732503766527366253242377339715425324268644e663032727072717a396e7839707049635139726d25324652745a5932484e732532466c4c515353553554767137687678485974313254665739374c43627258506344575a5a7463253246364c5532583957656d5a655262652532467742577637524279617172484d72746a253246545674507557736b6b70774d6a36724d797572575a543748553468783255563130574f726637507a4837527439485a2532464b5679373675394d73707836713276787a694e4c63657968377137477450306d2532426f30376e62253246774355744e4a4a546e4d364a694e6668324f6664625a674f7364532532423277766354614e72253246556325324677436e2532464a51386a36755957566b47374974794c4b7a594c546a4f75636164774f372532425a253246724c565353552532467744253246326625324674454935516147393062334e6f623341674d79347741446843535530454a51414141414141454141414141414141414141414141414141414141414134516b6c4e42446f4141414141414f5541414141514141414141514141414141414333427961573530543356306348563041414141425141414141425163335254596d39766241454141414141535735305a5756756457304141414141535735305a5141414141424462484a7441414141443342796157353055326c346447566c626b4a7064474a76623277414141414143334279615735305a584a4f5957316c5645565956414141414145414141414141413977636d6c75644642796232396d5532563064584250596d706a4141414144414251414849416277427641475941494142544147554164414231414841414141414141417077636d39765a6c4e6c64485677414141414151414141414243624852755a573531625141414141786964576c7364476c7555484a76623259414141414a63484a7662325a4454566c4c41446843535530454f774141414141434c5141414142414141414142414141414141415363484a70626e52506458527764585250634852706232357a41414141467741414141424463485275596d3976624141414141414151327869636d4a76623277414141414141464a6e63303169623239734141414141414244636d3544596d397662414141414141415132353051324a7662327741414141414145786962484e6962323973414141414141424f5a335232596d397662414141414141415257317352474a76623277414141414141456c7564484a696232397341414141414142435932746e54324a715977414141414541414141414141425352304a444141414141774141414142535a4341675a473931596b4276344141414141414141414141414564796269426b62335669514725324667414141414141414141414141516d77674947527664574a41622532424141414141414141414141414243636d52555657353052694e536248514141414141414141414141414141414243624751675657353052694e536248514141414141414141414141414141414253633278305657353052694e5165477841556741414141414141414141414170325a574e3062334a4559585268596d39766241454141414141554764516332567564573041414141415547645163774141414142515a314244414141414145786c5a6e5256626e524749314a73644141414141414141414141414141414146527663434256626e524749314a736441414141414141414141414141414141464e6a62434256626e5247493142795930425a41414141414141414141414145474e79623342586147567555484a70626e5270626d646962323973414141414141356a636d3977556d566a64454a766448527662577876626d6341414141414141414144474e79623342535a574e305447566d64477876626d6341414141414141414144574e79623342535a574e30556d6c6e614852736232356e41414141414141414141746a636d3977556d566a6446527663477876626d63414141414141446843535530443751414141414141454142494141414141514142414567414141414241414534516b6c4e42435941414141414141344141414141414141414141414150344141414468435355304544514141414141414241414141466f34516b6c4e42426b414141414141415141414141654f454a4a5451507a414141414141414a414141414141414141414142414468435355306e454141414141414143674142414141414141414141414534516b6c4e41253246554141414141414567414c325a6d4141454162475a6d4141594141414141414145414c325a6d414145416f5a6d614141594141414141414145414d67414141414541576741414141594141414141414145414e514141414145414c514141414159414141414141414534516b6c4e412532466741414141414148414141502532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532463844364141414141442532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532464125324267414141414125324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324625324677506f4141414141502532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532462532463844364141414f454a4a54515141414141414141414341414134516b6c4e42414941414141414141494141446843535530454d41414141414141415145414f454a4a54515174414141414141414741414541414141464f454a4a5451514941414141414141514141414141514141416b414141414a4141414141414468435355304548674141414141414241414141414134516b6c4e42426f414141414141306b414141414741414141414141414141414141414251414141415541414141416f41565142754148514161514230414777415a51426b414330414f4141414141454141414141414141414141414141414141414141414141414141514141414141414141414141414141554141414146414141414141414141414141414141414141414141414151414141414141414141414141414141414141414141414141415141414141415141414141414141473531624777414141414341414141426d4a766457356b63303969616d4d41414141424141414141414141556d4e304d51414141415141414141415647397749477876626d634141414141414141414145786c5a6e52736232356e41414141414141414141424364473974624739755a7741414146414141414141556d646f64477876626d63414141425141414141426e4e7361574e6c63315a7354484d414141414254324a715977414141414541414141414141567a62476c6a5a5141414142494141414148633278705932564a52477876626d634141414141414141414232647962335677535552736232356e414141414141414141415a76636d6c6e6157356c626e5674414141414445565462476c6a5a55397961576470626741414141316864585276523256755a584a686447566b41414141414652356347566c626e567441414141436b565462476c6a5a56523563475541414141415357316e4941414141415a69623356755a484e50596d706a41414141415141414141414141464a6a64444541414141454141414141465276634342736232356e41414141414141414141424d5a575a30624739755a7741414141414141414141516e527662577876626d6341414142514141414141464a6e614852736232356e414141415541414141414e31636d7855525668554141414141514141414141414147353162477855525668554141414141514141414141414145317a5a32565552566855414141414151414141414141426d4673644652685a3152465746514141414142414141414141414f593256736246526c6548524a633068555455786962323973415141414141686a5a57787356475634644652465746514141414142414141414141414a61473979656b4673615764755a5735316251414141413946553278705932564962334a36515778705a323441414141485a47566d595856736441414141416c325a584a30515778705a32356c626e5674414141414430565462476c6a5a565a6c636e524262476c6e626741414141646b5a575a68645778304141414143324a6e5132397362334a556558426c5a5735316251414141424646553278705932564352304e766247397956486c775a5141414141424f6232356c41414141435852766345393164484e6c64477876626d63414141414141414141436d786c5a6e52506458527a5a5852736232356e41414141414141414141786962335230623231506458527a5a5852736232356e4141414141414141414174796157646f6445393164484e6c64477876626d63414141414141446843535530454b41414141414141444141414141492532463841414141414141414468435355304546414141414141414241414141415934516b6c4e424177414141414142334d4141414142414141415541414141464141414144774141424c414141414231634147414142253246396a2532463751414d51575276596d566651303041416625324675414135425a4739695a51426b6741414141414825324632774345414177494341674a4341774a4351775243776f4c45525550444177504652675445785554457867524441774d4441774d4551774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d444177424451734c4451344e4541344f4542514f446734554641344f446734554551774d4441774d4552454d4441774d444177524441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d445025324641414245494146414155414d4249674143455145444551482532463351414541415825324678414525324641414142425145424151454241514141414141414141414441414543424155474277674a4367734241414546415145424151454241414141414141414141454141674d454251594843416b4b43784141415151424177494541675548426767464177777a4151414345514d45495249784255465259524d6963594579426853526f62464349795156557346694d7a5279677446444279575355253246446838574e7a4e526169736f4d6d524a4e555a4558436f33513246394a56346d5879733454443033586a3830596e6c4b5346744a5845314f54307062584631655831566d5a326870616d74736257357659335231646e64346558703766483125324266334551414341674543424151444241554742776347425455424141495241794578456752425557467849684d464d6f4752464b477851695042557448774d79526934584b436b6b4e5446574e7a4e50456c42686169736f4d484a6a5843306b5354564b4d585a4556564e6e526c34764b7a684d50546465507a5270536b68625356784e546b394b57317864586c39565a6d646f615770726247317562324a7a6448563264336835656e7438662532463267414d4177454141684544455141253246415056556b6b6b6c4b535748396176724b336f474c57356c5872354f51347470724a6761527665253242506437647a566a4e25324273482532424d423751357652366f4f6f6c6a7766756465464a48444b55654c514137635234574f575749504471535033526232715371394d794d724a774b62737967343253357636616b396e4452323356337364394a694c6c57325534317474565a75735930755a55336c7a6750617766316b79746125324269253242394c53704c697a31253246774478676a58396a3152253246566366253246414859576c395666725325324672547238544c6f2532427935324c725a574a6769646a766125324633736378253246746578796b6c686b496d576841333454784c426c69534271436475495539456b6b6b6f6d52253246394431564a4a4476757278364c4c3754747171613537336377316f334f4f6e386c4a547858313839333167364777366a31427038624b6c334b3449327525324274763172784d724372662532427a4f6d6c7066653845427a6d753961503762746a4e6e253246584633716d7a61527878507a52427364754973574c57553544596e51253242536b6b6b6c4379715844644339762532424d58716a526f4379795225324661706375355844645746333163253242754837657471665a30334c62737473594a32467a577363442532466272625a2532464c553244586a6a316c41695069574c4e70775336526b4c386e75556b44437a6366507861387a4664766f7547356a69434a45783946337552314352526f7375372532463948315651747172757166546130507273615750616543317732756170704a4b65437936476656623633344c656e463157443148613237486b6c737564364c76706675797978693731634e3966595a31376f646a74476977533774705a5553753555326257474f52334d545a253246756c6978615379524777496f66336c4a4a4a4b466c557546366730253246574c36376e704f55397836646774334768704944693172584f33626633724c4e762532464142613770634e30483325324634784f7175627131724c415434454f70617073476e755336786761505973576258676a304d6862326d4c6934253242486a7378735a67717071454d594f414f55564a4a5173722532464150253246533952253242305562746e714d33544733634a6c45584a3946364a3072715633575835754d79353436686577504d68776249507463306a3935564d507225324264683950784d4b6d7a643675526b56553562325076496f6f4c646862565437375865253246616b7033253246724c39584d667225324249326d78357075704a645463424d45364f6135756d356a314436733945366a306975396d626e4f7a685a73394c635848594737747762366a6e25324653334b6a54395975724e7078386e4b59473056356e32584b65616e3168395667486f5a62473365253242726125324625324263554d6e367a3952626a325a4e515a3657546d2532465a4d4678593525324232746d3457354a5a562532426b763375622532426a72616e253242354c67344c394b33676a786364657036707a3273457649614f4a4a685358456454366e6e5a33534d696e4d6158444879636230736e306e3043787233612532466f722532466476726331614f52316a72647836706c5954714b7362704c33734e566a43353170714725324233645948743950253246673078633650316936586e3955773255594f5937427362594875736158416c75317a646e364e7a50336c57253242724831567036433232783170796376496a314c694945443362574358666e6654566476562532427464537a6d30394f737078717a68315a59467243386b32442532426263344f6274565a3331747a736d6e7037614133467379716e323357656c5a6b52366233556261716166667465253242763835503841636c7763462532426b72654350467856366e72306c7972657639637947394d70725a586a354f5a5a665461627133687039494e6379396c62746c72647a4475324a576466366e58314b79724c765a675631332532426c58585a6a574f62597951475725324661326e597a31767a557863253246253246302532423673253242715854624c723766567957444a736462645579357a574f633879253242574d56712532466f48544c73576a46465a705a696d635a314c6978395a50306a5859303776662532426574464a4a546e253246735446643032337074396c325254664a6536367732503766527366253242377339715425324268644e663032727072717a396e7839707049635139726d25324652745a5932484e732532466c4c515353553554767137687678485974313254665739374c43627258506344575a5a7463253246364c5532583957656d5a655262652532467742577637524279617172484d72746a253246545674507557736b6b70774d6a36724d797572575a543748553468783255563130574f726637507a4837527439485a2532464b5679373675394d73707836713276787a694e4c63657968377137477450306d2532426f30376e62253246774355744e4a4a546e4d364a694e6668324f6664625a674f7364532532423277766354614e72253246556325324677436e2532464a51386a36755957566b47374974794c4b7a594c546a4f75636164774f372532425a253246724c56535355253246774425324632514134516b6c4e4243454141414141414630414141414241514141414138415151426b414738415967426c414341415541426f414738416441427641484d41614142764148414141414158414545415a414276414749415a5141674146414161414276414851416277427a41476741627742774143414151774244414341414d674177414445414f414141414145414f454a4a5451514741414141414141484141514141414142415144253246345134456148523063446f764c32357a4c6d466b62324a6c4c6d4e7662533934595841764d5334774c7741385033687759574e725a585167596d566e615734394975253242377679496761575139496c63315454424e63454e6c61476c49656e4a6c5533704f56474e3661324d355a43492532465069413865447034625842745a585268494868746247357a4f6e6739496d466b62324a6c4f6d357a4f6d316c64474576496942344f6e68746348527250534a425a4739695a53425954564167513239795a5341314c6a5974597a45304d6941334f5334784e6a41354d6a5173494449774d5463764d4463764d544d744d4445364d4459364d7a6b674943416749434167494349253242494478795a475936556b5247494868746247357a4f6e4a6b5a6a30696148523063446f764c336433647935334d793576636d63764d546b354f5338774d6938794d6931795a47597463336c75644746344c57357a497949253242494478795a4759365247567a59334a706348527062323467636d526d4f6d46696233563050534969494868746247357a4f6e6874634430696148523063446f764c32357a4c6d466b62324a6c4c6d4e7662533934595841764d5334774c79496765473173626e4d366547317754553039496d6830644841364c793975637935685a4739695a53356a62323076654746774c7a45754d43397462533869494868746247357a4f6e4e3052585a3050534a6f644852774f693876626e4d7559575276596d5575593239744c336868634338784c6a41766331523563475576556d567a6233567959325646646d567564434d69494868746247357a4f6d526a50534a6f644852774f6938766348567962433576636d63765a474d765a57786c6257567564484d764d5334784c79496765473173626e4d36634768766447397a6147397750534a6f644852774f693876626e4d7559575276596d5575593239744c33426f6233527663326876634338784c6a4176496942346258413651334a6c59585276636c527662327739496b466b62324a6c4946426f623352766332687663434244517941794d444534494368586157356b6233647a4b534967654731774f6b4e795a5746305a55526864475539496a49774d546b744d5441744d6a4a554d5451364d6a67364e4451724d4445364d444169494868746344704e5a5852685a4746305955526864475539496a49774d546b744d5441744d6a4a554d5451364d6a67364e4451724d4445364d444169494868746344704e623252705a6e6c455958526c505349794d4445354c5445774c544979564445304f6a49344f6a51304b7a41784f6a4177496942346258424e5454704a626e4e305957356a5a556c4550534a346258417561576c6b4f6a45354d474e6d4f54557a4c5463315a6a4d744f4455304f4330354e7a51334c5759324f44526b4e4759314d5759334e43496765473177545530365247396a6457316c626e524a5244306959575276596d55365a47396a61575136634768766447397a614739774f6d55784d474e6c596d55344c54526c59574d745a575130597931694e7a6b784c57566d5a6a4578597a41774f5759325a534967654731775455303654334a705a326c755957784562324e316257567564456c4550534a34625841755a476c6b4f6a6c6a4e44517a5a5745774c5456684e4441744e324930595331695a4451354c575a6b4e6a4a6b5a6a59304d6d51344e5349675a474d365a6d39796257463050534a706257466e5a5339716347566e496942776147393062334e6f623341365132397362334a4e6232526c5053497a496942776147393062334e6f6233413653554e4455484a765a6d6c735a54306963314a485169424a52554d324d546b324e6930794c6a456950694138654731775455303653476c7a644739796554346750484a6b5a6a70545a5845253242494478795a47593662476b6763335246646e513659574e306157397550534a6a636d56686447566b4969427a6445563264447070626e4e305957356a5a556c4550534a346258417561576c6b4f6a6c6a4e44517a5a5745774c5456684e4441744e324930595331695a4451354c575a6b4e6a4a6b5a6a59304d6d51344e53496763335246646e51366432686c626a30694d6a41784f5330784d4330794d6c51784e446f794f446f304e4373774d546f774d43496763335246646e51366332396d64486468636d56425a3256756444306951575276596d5567554768766447397a6147397749454e44494449774d5467674b466470626d527664334d70496938253242494478795a47593662476b6763335246646e513659574e306157397550534a7a59585a6c5a43496763335246646e51366157357a644746755932564a52443069654731774c6d6c705a446f784f54426a5a6a6b314d7930334e57597a4c5467314e4467744f5463304e79316d4e6a67305a44526d4e54466d4e7a516949484e3052585a304f6e646f5a573439496a49774d546b744d5441744d6a4a554d5451364d6a67364e4451724d4445364d44416949484e3052585a304f6e4e765a6e523359584a6c5157646c626e5139496b466b62324a6c4946426f623352766332687663434244517941794d444534494368586157356b6233647a4b53496763335246646e513659326868626d646c5a4430694c794976506941384c334a6b5a6a70545a584525324249447776654731775455303653476c7a6447397965543467504339795a4759365247567a59334a706348527062323425324249447776636d526d4f6c4a45526a3467504339344f6e68746347316c6447452532424943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167494341674943416749434167504439346347466a61325630494756755a4430696479492532465076253246694446684a51304e6655464a50526b6c4d52514142415141414445684d61573576416841414147317564484a535230496757466c614941664f4141494143514147414445414147466a6333424e55305a554141414141456c465179427a556b644341414141414141414141414141414142414144323167414241414141414e4d74534641674941414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414145574e77636e514141414651414141414d32526c63324d4141414745414141416248643063485141414148774141414146474a7263485141414149454141414146484a5957566f4141414959414141414647645957566f41414149734141414146474a5957566f4141414a414141414146475274626d514141414a5541414141634752745a47514141414c454141414169485a315a57514141414e4d41414141686e5a705a58634141415055414141414a47783162576b4141415034414141414647316c59584d414141514d414141414a48526c59326741414151774141414144484a55556b4d41414151384141414944476455556b4d41414151384141414944474a55556b4d4141415138414141494448526c65485141414141415132397765584a705a3268304943686a4b5341784f546b344945686c6432786c644851745547466a613246795a43424462323177595735354141426b5a584e6a414141414141414141424a7a556b644349456c46517a59784f5459324c5449754d514141414141414141414141414141456e4e5352304967535556444e6a45354e6a59744d693478414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141425957566f6741414141414141413831454141514141414145577a46685a57694141414141414141414141414141414141414141414157466c61494141414141414141472532426941414134395141414135425957566f67414141414141414159706b41414c654641414159326c685a57694141414141414141416b6f41414144345141414c62505a47567a5977414141414141414141575355564449476830644841364c793933643363756157566a4c6d4e6f414141414141414141414141414141575355564449476830644841364c793933643363756157566a4c6d4e6f4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414147526c63324d4141414141414141414c6b6c46517941324d546b324e6930794c6a45675247566d595856736443425352304967593239736233567949484e7759574e6c4943306763314a48516741414141414141414141414141414c6b6c46517941324d546b324e6930794c6a45675247566d595856736443425352304967593239736233567949484e7759574e6c4943306763314a48516741414141414141414141414141414141414141414141414141414141426b5a584e6a4141414141414141414378535a575a6c636d567559325567566d6c6c64326c755a7942446232356b615852706232346761573467535556444e6a45354e6a59744d69347841414141414141414141414141414173556d566d5a584a6c626d4e6c49465a705a586470626d6367513239755a476c306157397549476c7549456c46517a59784f5459324c5449754d5141414141414141414141414141414141414141414141414141414141414141414141646d6c6c6477414141414141453654253242414252664c6741517a78514141253242334d4141515443774144584a34414141414257466c61494141414141414154416c5741464141414142584825324264745a57467a4141414141414141414145414141414141414141414141414141414141414141414141436a77414141414a7a615763674141414141454e535643426a64584a324141414141414141424141414141414641416f414477415541426b414867416a414367414c514179414463414f7742414145554153674250414651415751426541474d41614142744148494164774238414945416867434c414a41416c514361414a384170414370414b344173674333414c774177514447414d734130414456414e73413441446c414f7341384144324150734241514548415130424577455a415238424a514572415449424f4145253242415555425441465341566b425941466e415734426451463841594d4269774753415a6f426f514770416245427551484241636b423051485a416545423651487941666f434177494d416851434851496d416938434f414a42416b734356414a64416d634363514a36416f51436a674b594171494372414b324173454379774c564175414336774c314177414443774d57417945444c514d3441304d4454774e614132594463674e25324241346f446c674f69413634447567504841394d4434415073412532466b4542675154424341454c515137424567455651526a424845456667534d424a6f4571415332424d5145307754684250414525324667554e425277464b77553642556b465741566e425863466867575742615946745158464264554635515832426759474667596e426a634753415a5a426d6f476577614d427030477277624142744547347762314277634847516372427a304854776468423351486867655a423677487677665342253242554825324241674c434238494d67684743466f4962676943434a5949716769253242434e494935776a374352414a4a516b364355384a5a416c354359384a70416d364363384a35516e374368454b4a776f39436c514b616771424370674b726772464374774b3877734c4379494c4f51745243326b4c674175594337414c79417668432532466b4d4567777144454d4d584178314449344d70777a41444e6b4d3877304e4453594e514131614458514e6a67327044634d4e3367333444684d4f4c67354a446d514f667736624472594f3067377544776b504a5139424431345065672532425744374d507a772532467345416b514a6842444547455166684362454c6b513178443145524d524d524650455730526a42477145636b52364249484569595352524a6b456f51536f784c4445754d5441784d6a45304d5459784f44453651547852506c464159554a78524a46476f5569785374464d3455384255534654515656685634465a73567652586746674d574a685a4a466d77576a78617946745957253242686364463045585a52654a4636345830686633474273595142686c47496f5972786a5647506f5a49426c464757735a6b526d334764306142426f71476c4561647871654773556137427355477a73625978754b473749623268774348436f6355687837484b4d637a427a314852346452783177485a6b64777833734868596551423571487051657668377048784d6650683970483551667678253246714942556751534273494a6767784344774952776853434631496145687a6948374969636956534b434971386933534d4b497a676a5a694f554938496a384351664a45306b664353724a4e6f6c435355344a57676c6c7958484a66636d4a795a584a6f636d7479626f4a78676e535364364a36736e3343674e4b44386f635369694b4e517042696b344b5773706e536e514b6749714e53706f4b7073717a7973434b7a5972615375644b394573425377354c4734736f697a584c517774515331324c617374345334574c6b7775676936334c7534764a4339614c35457678792532462532424d4455776244436b4d4e7378456a464b4d594978756a48794d696f79597a4b624d74517a44544e474d33387a754450784e4373305a5453654e4e6731457a564e4e596331776a58394e6a6332636a61754e756b334a4464674e357733317a67554f4641346a446a494f515535516a6c2532464f627735253242546f324f6e5136736a72764f793037617a75714f25324267384a7a786c504b5138347a3069505745396f5433675069412532425944366750754125324649543968503649253246346b416a51475241706b446e51536c42616b4773516535434d454a795172564339304d36513331447745514452456445696b544f52524a465655576152643547496b5a6e52717447384563315233744877456746534574496b556a585352314a59306d705366424b4e3070395373524c444574545335704c346b777154484a4d756b30435455704e6b3033635469564f626b363354774250535525324254543931514a314278554c7452426c4651555a7452356c4978556e785378314d5455313954716c503256454a556a3154625653685664565843566739575846617056766458524665535625324242594c316839574d745a476c6c70576268614231705757715a6139567446573556623556773158495a63316c306e5858686479563461586d786576563850583246667332414659466467716d4438595539686f6d4831596b6c696e474c7759304e6a6c3250725a45426b6c4754705a54316c6b6d586e5a6a316d6b6d626f5a7a316e6b3266706144396f6c6d6a7361554e706d6d6e78616b68716e3272336130397270327625324662466473723230496257427475573453626d747578473865623368763058417263495a7734484536635a567838484a4c63715a7a41584e646337683046485277644d78314b48574664654632506e616264766833566e657a65424634626e6a4d6553703569586e6e656b5a367058734565324e37776e776866494638345831426661462532424158356966734a2532464933253242456625324257415234436f675171426134484e676a43436b6f4c3067316544756f5164684943453434564868617547446f5a79687465484f3465666941534961596a4f69544f4a6d596e253242696d534b796f73776935614c25324649786a6a4d714e4d5932596a662532424f5a6f374f6a7a61506e7041476b4736513170452532466b616953455a4a366b754f54545a4f326c434355697054306c5625324256795a59306c7025324258437064316c2532424359544a69346d53535a6b4a6e386d6d6961315a74436d3625324263484a794a6e5065645a4a33536e6b4365727038646e3475662532427142706f4e6968523647326f6961696c714d476f33616a35715257704d656c4f4b57707068716d693662397032366e344b6853714d53704e366d70716879716a3673437133577236617863724e4374524b3234726932756f61385772347577414c4231734f7178594c4857736b757977724d34733636304a62536374524f3169725942746e6d32384c646f74253242433457626a527555713577726f37757257374c72756e764347386d373056765925324225324243723645767625324225324665722532463177484441374d466e7765504358384c6277316a44314d5252784d374653385849786b624777386442783725324649506369387954724a75636f347972664c4e7375327a44584d746330317a62584f4e7336327a7a6650754e4135304c7252504e47253242306a2532465377644e45303862555364544c3155375630645a5631746a58584e666732475459364e6c733266486164747237323444634264794b335244646c74346333714c664b6425324276344462677665464534637a69552532424c623432506a36253242527a35507a6c684f594e3570626e48253242657036444c6f764f6c473664447157253242726c363344722532422532427947375248746e4f346f37725476514f2532464d38466a77356646793866253246796a504d5a383666304e5054433956443133765a74397676336976675a2532424b6a354f506e482532426c66363525324674332532464166386d5030702532466272253242532532463763253246323325324625324625324625324675414135425a4739695a51426b41414141414148253246327743454141594542415146424159464251594a4267554743517349426759494377774b4367734b436777514441774d4441774d4541774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d44417742427763484451774e474241514742514f446734554641344f446734554551774d4441774d4552454d4441774d444177524441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d4441774d445025324641414245494146414155414d424551414345514544455148253246335141454141722532467841476941414141427745424151454241414141414141414141414542514d43426745414277674a4367734241414943417745424151454241414141414141414141454141674d454251594843416b4b437841414167454441774945416759484177514342674a7a4151494445515141425345534d55465242684e68496e474246444b526f5163567355496a77564c5234544d575976416b636f4c784a554d3055354b69736d4e7a776a56454a354f6a737a59585647523077394c694343614443516f59475953555255616b74466254565367613875507a784e546b39475631685a576c746358563566566d646f615770726247317562324e3064585a3365486c3665337839666e397a684957476834694a696f754d6a59365067704f556c5a61586d4a6d616d3579646e70253242536f36536c7071656f71617172724b327572364551414341674543417755464241554742416744413230424141495241775168456a46424256455459534947635947524d714778384254423065456a51685653596e4c784d795130513449576b6c4d6c6f6d4f797767647a306a586952494d58564a4d4943516f594753593252526f6e5a4852564e2532464b6a73384d6f4b64506a38345355704c5445314f54305a5857466c6157317864586c39555a575a6e61476c7161327874626d396b64585a3365486c3665337839666e397a684957476834694a696f754d6a593650673553566c7065596d5a71626e4a32656e354b6a704b576d703669707171757372613676722532463267414d41774541416845444551412532464150564f4b757856324b757856324b757856324b757856324b75785625324639443154697273565952253242616e356c5265534e4b747049726236357164253242375232567553565834414337765434714c7955635625324231797a4c306d6c38575233714d5847314f6f384d64354c44592532467a422532463579426c51534a354f74676a4371686f706c4e443468726748384d796a70744e2532465050342532467a5847386655667a6678383371766c6a556455314851724f37315778625474536b536c335a742532427849706f3348647667616e4a50692532427a6d757978455a45525046467a38636959676b555556716c3363576d6d334e3162327a336c7844457a773273644f636a676643677251664564736a41416b416d6b794e43773868627a392532467a6b474153664a3172516230456370503458476250387670663535253246482532426134486a366a2532426150782532466e4d6d2532464b76383035764e3874253246706d715749303358644e33754c646551566c35634749562532466a526b66345852737839587050436f6738555a4e326d31506957434b6b486f5759546c7578562532462532465239553471374658683335376b5025324259486b654a74313964617225324672584d51503673322532465a253246774464542532464852316d7425324676495063633144733359713746585971384e38696e302532462532426369764e434c384b764463456764795868624e767150384146592532466a76645a682532467741596b39797a554f7a6469722532462532463076564f4b714e396532316a5a584637644e777472574a3570336f5478534e537a476771545252686a456b304f714a4541575868725854253246414a6f2532466d767047703650627925324634613876474e707225324256436975386225324274514139336267697039766a25324238624e7658356643524c36352532467775737678386f492532426944336a4e4f3752324b757856324b7644764e6958666b443833253246415047317861797a253242573956515258647843764c3058644652676638726e47736772397465537238576266445762423459507269367a4c654c4e786b656d543254524e61303757394b74745630365179325632764f435171794569704832574159626a4e586b6759534d547a44735954456859354933494d6e253246253246543955347170586472623364724e61584d596c74376847696d69626f794f43724b666d446842494e6842466969384c315779682532464c58383374446a3046337439443138787833656e6c6d614947535430576f474a25324279536b6966744c396e374762694576487753347671682532464536795138484d4f48365a766563307a744859713746585971384c313947382532422532466e63336c6655707044356430574979505a4978525a47534e57597478703854535342655825324225324231253242486a6d3478253246756450786a363575736e253242397a384a2532426d4c327253394c30253246537450683025324654344674724b33586a44416c654b697461437454314f616d637a4932656273597845525135497249736e2532463150564f4b757856346425324266564976506e6b69346b2532424749546a6b3536414a63524525324663446d33374f25324675356a38636e576137253242386739787a554f7a64697273566469727737794825324225324225324635794938307952253246456b634e7747596441524a43704833696d626655626157507725324653367a422532466a456e754f6168326273566625324656395247253246735249596a6378435148695535727972345572697176697245507a4b2532464c6e547650476b52576b387a576c3561755a4c4b3756656641734b4d724c55636b65677238532532465a584d7253366f345a574e77584831476e4755563155767930386c6559764b317666513678726b6d744c4f597671767147516946597777594c366a50546c7958375038414c683157654f516a686a77493025324247554c7338544d704a596f6c355375714c55446b78414654303635694f53757856693335696556746538796150425a614c72456d69334563346c6b75597a4970654d49796c5033624965724276396a6d547073306363726b4f4e6f31474b557855547770642532425750355757666b6d4f37754a4c74745231612532466f4c6d385a6549436738754b416c6a7578354f7a4e3857543165724f57685844454d4e4e70686a766535466e5759626c4f78562532462532463175706554504a486c547a426565635a745930364b366d585837364a5a3235423153716d697370464b46696356536a5225324650327561563565306e534c4f34395158576f616861326d717a517a5872437973697051724644386372486e7858396c565846553874507a443831705a32476f616a43736468427133364e314f64726157334531744f41494c74466d6f3851567a253242385846565055667a4e387852324678714e714976716d6f36782532426939456b614753594a4243474574795569724a4f585a6633636134716b2532466d667a50726d7365557452744e56694d6932476f3663625455767173396b74776b736d253246377163636c654e6c3474544657536168357738363362655a39523065577974744e38727a5377473075496e6b6b7557746b35796c7041362532426d44253246757669754b756a383365632532464d47757061614463576d6e7748534c5856676c314330785a726b56394e6d444c78417239726a69715750253242626574366a6161416c6d73656d7a366c617a5856376369316e76384169594a6d67347851772532464878643479334a76737269714a6a3825324665656235504c4670424462324770617650665774303131424d735a2532427249724a4f6b62464a56444953775276327668785631783539387977655a4c69323153253242693053326776767174766233476e58456b55385049424a546471654365742532427a25324279754b762532463125324236335035546557353779253242754464616a45756f7a79584e35625133636b634d6b6b78713955536d78366636754b706e666551664c4e3170566a7071573757634f6d45747030747049384d3044485a6a484970355666397576322532463273565848795670556e6c79373876336b393366325636535a704c79643535716e6952786b657048456f724c2532466c59713666794c35636d3875576e6c3534474668593844614d6a736b73636b66325a556b576a4c4a556b3876387246554b253246356461504e7055756d586c37714639424c4e46634637713665615257674e55437339654b2532467a4159717431663873764c4f715839316554473667253242766c54714e746258456b4d46795632426d6a553062465573314838726f645238327a366a4e6353576d6b47776873726533735a354c6555656b61464843674b59654733486c697163586e3564253242576269793025324231686a6d30383655686a734c6d796d6b676e6a5276744b4a46504a673533626c792532424c4656614479527055632532426a33456b39336458476950504a5a7a334d37545346726b635839526e7158322532427a253246414334716874522532464c6e526452314272712532427539517549476e4679326d7664796d7a4d697479423947744b637632667334712532462532463050564f4b757856324b757856324b757856324b757856324b757856253246396b253344, 777, '2019-11-14 13:02:00', '2019-11-14 13:02:00');
INSERT INTO `upload_images` (`id`, `nom`, `content`, `id_equipement`, `created_at`, `updated_at`) VALUES
(4, 'barre', 0x6956424f5277304b47676f414141414e53556845556741414243674141414d6743415941414144686e464d6641414141475852465748525462325a30643246795a5142425a4739695a53424a6257466e5a564a6c5957523563636c6c50414141574f4a4a52454655654e72733366313145306d364225324243656525324262253246395471423055534169514152415949454d41483441424541455144484157415347455145694167774561424a774f754e594738584b7330496a3432253246314656645663397a6a6f356d392532423464713675367539372532426458563131774541414141414141414141414141414141414141414141414141414141414145447266744545514b74325a3465542532466974386476725033706e253246383731722532464b756d576e4e77693550357758334e41446325324233333179726b707a7272724725324625324661342532462532467a337a483825324237542532464c2532466e7933314a5241697751555141754665536a4b517744785725324679657841396c756438583751764e41446336423337534573565a786b38494c76344d33383642514f3045464542746866696b5739306c44444d673972702532467a6f796734474b394c383525324631777877376650697430346f5735506a253242506e63725761584c54554a5541734242564236345230657a356a326e77667857784665747964394d58366b4765444b35386a392532467575646c716a61736c733957764b785777555770356f454b4a57414169697834413668784b78626852497a4c644a574957345742567a7266476e325248766d335371736d417372674e49494b49435343753170253246253246573425324625324278726a61615a525146584f3265476336585a4532304c353872333171344153694767414d5a65594b396e53377a6f3341566b7853774b754e723530253242774a2532466a7076397039586e566b56774d674a4b494378467459686d486a5766353532713965417769617a4b4f446e353944397a75774a253246696d454532253246377a7874424254424741677067624558317046764e6c746a58477679455752547738334f7032524e6335716a253246765049574547424d42425441574972704d45766964536559344f724d6f6f447a7a36666850477232424663567a7150507a616741786b4241416551757044334b7755325a5251486e6e31664e6e75433650506f426a4d4c2532466151496759784564467225324638307130653652424f63463254654b6359253242507538476f364a695a62676d6e62695750776c6a733041575a68424165516f6f454d68464b59664b344b347257582532467565754f48253246783162673268373052726345767a627655596e584d726b4a515a46454471416a7145456d483673584343625167585973383041337a3372424e4f734233667832717a4b5944557a4b41416b6a4272676747464f337925324675394f48632532427a33384e666a636d7a6255576352545341524d7969414649587a587265616469796359416a72685661685a63383634515444324f3957613150736151706761475a5141494f4b43376139566a677a4d4c4d6f61506b386125324659457163367a7a37336547526953475254416b45587a79323731574965696d61475a5255484c7a4a346731586e3258527a6241515a6842675577694c3641436348457670596749624d6f615046636125324659454f527a3135396f6e6d6748594e6a4d6f6743454b5a7545454f5a68465159764d6e694348253246546a57413279564752544131735137655a253246366a345730794d5573436c6f3735356f39515537482532466565253242637936774c575a51414e76306f524e4f6b4a645a464c544537416c793234746a503842576d454542624958484f6867527379686f345a78723967526a596b304b5943764d6f4143325553674c4a786954634d4832576a4e514f6139765a6b79735351467368526b55774b333042636b7a46344f4d564a68467364514d56486a656e58537232524d774e73253246373825324234627a5144636c426b557747324b35466b6e6e474338586d6743374e7551314f74594777446369426b5577493330425568594743753873634d555938624d4c4170714f253246644f4f724d6e474c65772532466b393473386578706743757977774b344359466367676c77724f6d77676e477a70316d374e4f51317663614964594b414e63696f414275576942376e53676c324939336e4b463463562532466531784955594b385470674533494b4141726c73676832644c6e326b4a43714a497872344d3654327a4867567758646167414b34735474634d7a7a3662746b6c707245564236656666535766744363707a477325324225324670356f4375416f7a4b49447243472532467345453551496e656573513944656a756474333042313241474258416c7537504461626436617765557969774b536a33253246546a717a4a796862654b7648516a4d416c7a4744417269716435714177726d4c683330583142444169416b6f674576747a6737446f7067544c5548685a6e456d454a5230253246673337724955474b64306b3168494150795767414334726a73507a6f353539706862325a65797a6b476c666a6a554677495545464d426c77683050425157316d4a704651536e69766d70253246705259376e646555413563515541412532464b34346e2532466464544c55466c334a4847766770355044574c4176675a41515677575847736b4b41325a6c4577656d5a5055436d7a4b494366456c4141467858486f5969774d427531636d6361253242796a6b595259466343454242584152613039514d374d6f4743327a4a366963575254416851515577486e466353676572443142376479687872344a655a6846415a784c514147634a7a7a616f584367646d5a524d44706d543941496a35454335784a51414f6478397737374f74676e7762344f4a435767414834513739354e7441534e434c4d6f334d566a4c4f66667343394f7451534e6d4a6a464270776c6f41444f6571774a614d7872545942394564516351483625324661414a674c5335593961327a2532467352564c4f4d6e2532424c7a783378253246336e39507a25324676636e38344f6c5a674d6f636e7963644f66504c677a6a3564374766373458767925324636332532464f6a4d4637253242336f2532425070356f4343483756424d414769325025324230364a62685135253246786d39424130426a346e6e2532466f6e502532462532464b4c25324676343167493451597638587671526239793371787a434e4e41515143436d44546738613350397a42575853724752474c76694139746b734163464d6277635a693837253246666e523275673470373862766c6d774f68396a697974774342527a7941646245556971502532464e4c6a70495a5149643738253242396f586b334a3441514959786542597631467564796668766a336b4167526b5577467072627a494973795065396758526b613448494b63596b4966506b39335a3458372532462532466254376357324c466d6f51347a48674c5237415831703576434d454525324666375976437563414b4173516c6a5578696a776c675678797731434e414d6a33674172547a654561614f7675714c766a6436484943437875686e25324664654c72763548507a7a6d415a68424158773372587a3731724d6d68424d414643574f5853334d70706a7162554241415151315436304d7a25324654653930594f41456f56783744373355396561616f57415770676b5577676d466136586545353369653646344453786363664875374f4474253246313325324674714561424731714341787657467a71542532462532426c6268707333375975366848676167777248375131666e3237642532423738667570523647646e6e454136697877416c5459633263414b425754376f36313653593656706f6d3441437546665a396e7966416d736c63414271745837634934353561684b674767494b594b2532427937586c6c656967417459746a3353733143564154613142417779706366324c5246327a33395377414459336c6e37713646706930446755307a41774b614e7530737532783767514172616c74374a7671556d695867414c616471656962546c797877574131735378373068744174524151414674712532426c5a7a3165364534424731545147576f634347696167674c5a4e4b396b4f7379634161465a6c7379696d656854614a6143415275334f446d75365125324646656a774c517547724777737071464f416142425451726c6f47253246253242584a2532464743684f77466f5752774c6c326f556f475143436d6a58704a4c746d4f744b414b6871544a7a6f536d695467414c6164612532425337664234427744554e536265303558514a6745467447745377546145787a754f6453554166482532464d4934794a537a554b55436f42426253726873462532466f5273426f4c7178636149626f553043436d6a513775787757736d6d664e6162414644663246685272514a636734414332725254795859736443554156446b323775684b6149253242414174705577253242753777766f545331304a41482532424c59324d4e34364e586a554b4442425451707438713241614c59774a417657506b62376f5232694f6767445a4e4b74694772376f52414b6f644979653645646f6a6f494132315442743067774b414b68336a505349427a524951414674716d486871615675424942717830694c5a454b4466744545304a62643265476b25324625324670572532426e61637a4125324263767744673476482532426678567378753857784961326d454542375a6c55734130653777434125324273664b695736457467676f6f443031544a6b38315930415550315936544550614979414174706a67557741714a253242464d6f486943436941457631584577434173524b6f69344143326e4f6e676d30776777494136683872372532426847614975414174706a44516f41714a38314b49446943436741525263414743734273684e515148736d70572532464179667a4149783441555039594f64475430425942426254485941384171466d4130524651414b55785a5255416a4a6c416851515551476b3833674541786b79675167494b614d6a753748437146514141745173775267494b4141414149447342425641617a394d4367444554714a434141696a4e56303041414d5a4d6f4434434367414141434137415157305a553854414142714632434d424254516c68314e4141436f58594178456c41414141414132516b6f41414141674f77454641414141454232416771674e41744e41414447544b4125324241676f41414141674f774546414141416b4a324141674141414d684f514145414141426b4a3641414141414173684e5141414141414e6b4a4b4141414149447342425141414142416467494b414141414944734242514141414a43646741494141414449546b4142414141415a43656741414141414c4954554141414141445a4353674141414341374151554141414151485943436741414143413741515541414143516e5941434141414179453541415141414147516e6f41414141414379453141414141414132516b6f6f433325324630675141674e6f4647434d424262526c54784d4141476f5859497745464141414145423241676f41414141674f774546414141416b4a324141674141414d684f514145414141426b4a3641414141414173684e5141414141414e6b4a4b4141414149447342425141414142416467494b414141414944734242514141414a43646741494141414449546b4142414141415a43656741414141414c4954554141414141445a4353674141414341374151554141414151485943436741414143413741515541414143516e5941434141414179453541415141414147516e6f49433254445542414b423241635a49514145414141426b4a3641414141414173684e5141414141414e6b4a4b4141414149447342425141414142416467494b414141414944734242514141414a43646741494141414449546b4142414141415a43656741414141414c4954554141414141445a435369674562757a77366c57414144554d4d425943536741414143413741515541414141514859434371413070356f414141447149364141696e4979507a6a57436742777054467a6f5257416b67676f41414141674f7745464141414145423241676f41414141674f77454674474f69435143414175316f416d694467414c614d64454541454342396a514274454641415a54454b305942774e674a56457041415a54454b305942774e674a56457041415141414147516e6f41414141414379453141414141414132516b6f6f42322532465662414e46766f43675062477a74393049375242514148746d46537744563931497741304e335a4f64434f3051554142414141415a43656741414141414c49545541416c735159464142673767556f4a4b4943534847734341444232416e55535545413770706f414146444441474d6c6f41414141414379453141417854695a48797930416741594f344536435367414141434137415155304944643265474f5667414131444c416d416b6f6f41313746577a44516a6343514c4e6a364a357568506f4a4b41414141494473424252414b55343141514159513446364353696744545538742532466c564e774a4173324f6f4e5369674151494b6149506e4e674541745177776167494b6f4254486d6741416a4b46417651515551436b3850777341786c43675967494b614d4f6443725a68715273426f4e6b783949357568506f4a4b4b414e78533873645449253246574f704741476832444c56494a6a524151414755594b6b4a414d42594374524e514146744b48336c61305556414c51396c6e714c427a5241514146744b48316135464958416b445459366c48504b41424167716f334f377373495942253246553839435142746a365756314454415477676f6f48343154496c63366b594161483473395a6748564535414166577234573744556a634351504e6a71526b5555446b42426453766872734e78376f52414a6f6653383267674d6f4a4b4b422532427678582532422532423039503567656e756845416269364f706157507037253246705361696267414c714e796e38393573394151444731427071477541534167716f3337547733372532465568514267544b326770674575496143416975334f4469635662495a586a414b414d62576d3267613467494143366c6244494c37516a514267544b326f74674575494b4341756b307232415a72554143414d62576d3267613467494143366e616e384e253246764452344173435756764d6e6a6a70364565676b6f6f473754776e25324225324632524d415947797471625942666b4a41415a574b69306a74464c345a6e253246556b414268624e25324278594b4250714a614341656b30723241597a4b4144413246706a6a514f63513041423962716e694149414b687862372532426c47714a4f4141756f314c667a33687755796c376f52414c596e6a71326c4c355135315a4e514a7745465643672532426d7a6b7066444d57656849416a4c486e6d46694841756f6b6f4941367a5372596871253242364551434d735258584f73415a4167716f557733505a69353049774159597975756459417a66744545554a66643257463474656825324653742532424f6b2532466d4238784d41444663762532464b253242437a666833587925324263366b326f68786b55554a3861706a777564434d414747736271486d414451494b714d25324244437262687332344541474e74417a5550734546414152574a6a33665563446468726a63427746683769566d736659424b434369674c767356624d507079667a675746634377484469574676442532426733376568507149614341756a79755942764d6e6741415932354c74513851435369674572757a77326e25324674566642706e7a556d77435152413372554f7a314e644365726f5136434369674872586351566a6f536742496f705a5a693039314a64524251414556324a306454726f366e73476365353835414b515278397761516f72395741734268524e51514233324b396b4f6a336341674c473335566f496d696167674d4c46313276564d72585241706b41594f7939696164654f51726c453142412532425a37316e786f475a493933414542694654336d73524e724971426741676f6f5747577a4a393772555144496f706248504d7969674d494a4b4b4273746379654f44325a4833693841774179364d66676f7a4157563741705a6c464134515155554b6934576e55747379654f3943674147497533344b6b33656b4335424252517268646448624d6e416f39334149437865427432596f3045464f67585451446c325a306454767576543556737a754a6b666e426672774a4139766f6931426254536a626e666c39664c5051716c4d554d43696a54753471327865774a4144416d6239747233516e6c4556424159585a6e68792532463772306b6c6d374f4d43334d42414a6e464d586c5a79656273785a6f4a4b496941416772534437523758563350565a6f394151444735714738694c5554554167424252516976746537706b63377775764d3375685a414269564e31306472787864657864724b4b414141676f6f5233695773716137414739503567656e7568554178694f4f7a573872327153397a6e6f555541774242525267643361343333253246745637524a5a6b384177486a564e6f746950395a53774d674a4b47446b34724f547453582532465a6b3841774568564f497369654730394368672532464151574d57427849777a764a613370323075774a414269253246326d5a52684672716b354143786b314141534f317353686d625173376d54304241434e583653794b3737575652544e68764151554d454a783441777a4a32704c2532425a656432524d4155496f33636579757966665a7155494b474363424259784d6e487234726173766e4168656d54304241475749592532466172436a66746536336c63513859487745466a4567253246554d3636253242746163574676306863365258676141637353786531486870713358704a6a705a5267504151574d52443941767579253246506e5231686850426337304d414d627745516b31313464596777456a3849736d674c7a3651584853725262446e4661386d654852446f4d253246414a5262723452782532464558466d376a6f503025324636656d5770747945664d79676737324425324672502532463630745564546f534233734b59414643324768664d334252717353253242784e674d794d594d434d756748767a41497675377158416a7a7250736e38344f46586765414b75715854773173366e4825324665613525324267665145464a422532425941253246544936654e62504b62666e4333396751413146504c6842737372637779574853727831515865683753454642416d73463832725556544154482532465942253242562532423844514856315458673874615658644334365151556b3861736d674d4547373741793948372532466564702532464a6f3174666e6876253242684e37415142554b597a7874623457253246547a54384f6c727532582532462532466262253246484a334d44303774427242395a6c4441467356514972785025324230483862725a776965394e4277447172486e327539566279466f31377a38667737657741725a485141473348364444464d647074776f6c706c726b253242313046737963416f5034614b415155253242317269253242794d674961785939445851736561416d784e5177505547346b6d3365755979664f3531416f6d7a7244734241473356527132745233455669253246377a7556753944535455526b744e416c646a44517234635a436464482532427646784547322532464449787033345064564350785547332532467561415143614573622532424c313137363233397a48537a62757a7279253246433136465a726448324e33253242755a466b734242767a4e444171614a7658666d6a4451336a657445514361724b64434c6458536f706c444d687556707632664a714278776f6e6245303441514d4e694458412532463167536f54654847424254416254305554674241323249743846424c414c63686f4142754937784f644b455a41494259453369544633426a416772674a7349557a68424f48476b4b4147417431675a504f6f3937414463676f4143756137336d784a476d4141444f696a57434e536d4161784e51414e646851557741344649577a675275516b4142584e5833516b4d344151426378555a496f585941726b524141567a466f684e4f41414458744246534c4c5147634a6c664e51467769546439636646634d7741414e39485845643866456432644862377576353970456541695a6c414146316d25324671554d344151446357717770764f4544754a4341416a6a506572324a4930304241477a4c7868732532425044594b253246494e485049437a504e49424141776d726b747831794d6677466c6d5541427279323431613049344151414d4c74596339324d4e41694367414c3537303325324675396f5843516c4d41414b6e4532754e7572455741786e6e45413971323746594c595334304251435151337a4c78253246506432654848253246767464253246356c6f4657695467414c61464171427433314238464a544141426a4547253242592532464c34374f777a3179645025324273364e566f4330653859443248485772787a6c6561676f41594778696a5849333169784151387967674859732532427338726a334d41414750583179764c25324675764a37757a776666253246396f76394d74517255543041423966732532427741736d414944537850706c735473376e4862577034447143536967587374754e57506953464d4141435862574a39697631764e714a686f4661695067414c716339797446734138306851415145316966584d55673471776b4f6165566f463643436967486f764f47684d4151414d32676f70705a34304b7149614141736f57586863363731624278464a7a414141743256696a59744b74676f705a35253246576b5543797647595879253246646d7467676f416746616478706f494b4e67766d6f43573763344f2532463166526f5079322532463777356d5238494b774341566d71354d467669576264616a364b4b6d524e394c6563616a57625a253242576c39555074665a5a736b7141414157716a687167736d31675155744d776a486c43584d45434835792532422532463951503353383042414e516d316a6a665973316a76516d6f694555796f55376667347025324241482532466372526251504e496b4145444a3471744651796778305270514a7745463143304d344f3832676f71464a67454153754a566f74414f4151573049517a6f3033364150253242712532466e3175664167415975376a4f784f76253242733638316f4133576f49433268414525324272452532467854464d4141474d56613556766e5841436d6d49474262546e253242393249667542253246304b316d5578787245674267445072365a4b39627a5a71596167316f6a786b55304b3477384825324678746738415941786954664b6c453035417338796741463745325252507a4b594141464b4c73796265395a3839725146744d344d4336474a42384d586146414241537248322532424e494a4a34444f444172675225324275314b523536307763414d4a5434686f34506e6363356741316d5541426e68554c6857337a6e4f414441567355613431736e6e41444f4546414135776c334e54353535414d41324b5a595733794b74516241447a7a694166784d654f546a5472643648616c485067434147346d5064495458682532423572446541695a6c41416c776d46784b64595741414158457466513079363161794a666130422532464979414172694b734c4c327425324667614d4143414b346d3167376430414663696f41437561723075785578544141435869545744395361414b784e51414e66782532465a56676663477872796b4167497645577546444a357741726b464141647a454f7945464148436557434f3830784c4164516b6f674a7353556741415078424f414c63686f414275513067424148776e6e41427553304142334a6151416741614a35774174754558545141253246444b375425324249396851616631363744756e666e506e4f2532464a79667a6753444d41514850313033346e6e4c6a4d636638353754253242667a2532467a6e72712532426646706f4856675155634c30424f49515534584d6e666b25324231796c25324643494875253246483253504e5155414e465562655a586f6a7862644b6f443447723756526e42314167713425324663413837565a427859504f4c4173684251433055774d4a4a315a4333664f78253246797a4d686f446245564441646766714d454450756c56594d5774346b41346878616b3941674371726e6c434f4e48717a5a6c3574776f6c356d6f653242344242517737634f253246336e3666395a394c616f4e305031672532467442514251625a337a6f5776765a737979253246377a74503064434352694767414c53444f4c54253246757446313961614661253246367766756c33676541367571616c37477561635569316a554c765125324644456c42413267463932725556564e77336d414e416462584d703059324e39517767676c4953454142253242516233466f4b4b5a662532423561786f6b414652527634544856373930395425324236757567454535444672356f41306f734433714966364a3931713643693174577651774554336f747550516f414b4e253242377275357749747851436348454731304e655a6842415a6e747a673758462532464854696a667a5954253246597a253246553241425262723451464d54395576496d4c253246764f6b7231655765687679455644416541622532424d4a7669646157624625324235492532464f35524477416f736b594a4d7a322532466466584f2532424878753167534d772532463970416869484f4444656a78667a74516b467a51753944414246717656783146427a3352644f774869595151456a737a7337334f74576a337a735662683533756f42414758564a644f757a72643248486572527a714f39544b4d68786b554d444a786f4c7766423837616d455542414d6275334c37585773494a4742384242597851584b756878704269756a7337334e66444144422532426363796556725a5a36334443756c67775167494b474b6d4e6b474a5a3261615a5251454178757763516b306c6e49415245314441694d55423947465831384b5a6b39335a345575394377446a4663667153555762394c326d456b374175466b6b45386f6f456d703739376a586a674c41654f754f476c3872617146754b49415a46464341666b43643931253242764b74716b5550413830374d414d457250757272436956664343536944475252516b4e335a345a65756e7465506d6b5542414f4f724e5771625058486331787033395379557751774b4b45744e36314745776d656d5377466756475a6450654845656930766f42414343696a497966786732645831714963336567434173586b6f72324c744242524351414746365166614e25324633586f704c4e6d635146514147417a4f4b59504b6c6b637861785a67494b497143414d6a327661467565366b34414d4361726c5141424252546f5a483577334825324656636c6467756a73376e4f6856414d676e6a735854536a626e54617956674d49494b4b42635953324b5768624d4e49734341497a463233446131625665467a52465141474669712532466e724755413374656a41474173336f4a58586d454f356670464530445a646d65483456336c6b776f3235574666554d7a314b41416b72795843347067664b7469555a56394c2532464b35486f56786d5545443561706c4638566858416f41785745304537544b44416970513053794b663575574351424a6134696425324675732532464657794b32524e5141544d6f6f4135764b396d4f6d61344541474e76773755514e45314141585534367570346f38634458516b41787435724f6f3231454641344151565549443457556350415049745454514741676355787434595a4645636545595536434369674868377a4141426148484d3933674756454642414a55376d4238762532426131484270747a546d7742677a4c32695261794267416f494b4b417537797659426a4d6f414d435932314c74413052654d777156325a3064686c65466c62364f773932542532426347783367534177657146766637725325324247626364725843253246253246576d3141504d79696750764d4b747345734367417731725a5138774162424252516e34385662494e314b414441574e74437a514e73454642415a55376d42253242467551756d763270727153514177317637456161783567496f494b4b424f785125324659753750447157344541474e737262554f3845384343716a543577713259616f624163415957334774413577686f4941363158425877546f554147434d72626e574163345155454346547559485951324b306c253246544f6457544147434d50636478724857417967676f6f46364c306a636776714d6441444332566c586a414f635455454339616e673255304142414d6257476d73633442774343716a586f6f4a74754b4d6241634459576d474e4135784451414756716d5164436a4d6f414d445975736e3645314178415158557a554b5a4145424e5925324275784c6f523643536967626c394c3377414c5a514b414d62576d326761346d494143366c62445859614a62675141593270467451317741514546564f786b6672436f5944504d6f4141415932704e74513177415145463147395a2532424f253246334a6738414d4b6257554e4d416c7842515150314b4838776e756841416a4b6d6467414b714a3643412532426e6e564b41425177356871253246516d6f6e49414336766666306a66416d7a774177466861513030442532464a79414175713371474162646e516a4144512532466c6935304939524e51414755594b6f4a414d42594374524e514147567125324252315850253246536b774451396c6a7146614e515077454655414a72554143417352536f6e494143326c4436717466576f414341747364536225324643414267676f6f41326e686639253242643330416f4f3278394651585176304546454152646d65485a6c454167444555714a69414174705177375249737967416f4e307831434d65304141424262546876356f414146444c41474d6d6f41424b4d6455454147414d42656f6c6f4941325746674b4146444c414b4d6d6f49413231504463356d253242364551436148554f745151454e45464141705a686f4167417768674c31456c41414141414132516b6f67464a347a53674147454f4269676b6f6f41456e38344e46425a75786f7963426f4d3078744a4a61427269456741494141414449546b414246474e33646d694b4b6741594f34464b435369416b6e6a4d4177434d6e55436c424254516a71556d414144554d4d425943536a413446365369573445674f62477a715675684459494b414246466741594f774779453141414141414132516b6f41414141674f77454645424a66744d4541474473424f6f6b6f49423248466577445250644341444e6a5a326664534f3051554142376669764a674141414d5a4b514145414141426b4a3641414141414173684e514143585a30775141594f774536695367414571796f776b41774e674a31456c41415141414147516e6f4942324c445142414b434741635a4b514145414141426b4a3641414141414173684e5141414141414e6b4a4b494369374d344f7653344e4149795a51495545464542707643344e4149795a51495545464141414145423241676f41414141674f77454674474f70435141414e5177775667494b614d544a2532464d44674467436f59594452456c41414141414132516b6f41414141674f7745464141414145423241676f41414141674f774546414141416b4a324141674141414d684f514145414141426b4a3641414141414173684e5141414141414e6b4a4b41414141494473424254516c71556d414144554c73415943536a41494138416f48594273684e5141414141414e6b4a4b4141414149447342425141414142416467494b414141414944734242514141414a43646741494141414449546b4142414141415a43656741414141414c4954554141414141445a4353674141414341374151554141414151485943436741414143413741515541414143516e5941434141414179453541415141414147516e6f41414141414379453141414141414132516b6f41414141674f7745464141414145423241676f41414141674f774546744f565545774141616864676a415155304a61766d674141554c73415979536741414141414c4954554141414141445a4353674141414341374151554141414151485943436741414143413741515541414143516e5941434141414179453541415141414147516e6f41414141414379453141414141414132516b6f41414141674f7745464141414145423241676f41414141674f774546414141416b4a324141674141414d684f514145414141426b4a3641414141414173684e5141414141414e6b4a4b4141414149447342425141414142416467494b414141414944734242514141414a43646741494141414449546b41426c476171435144416d416e5552304142414141415a43656741414141414c4954554141414141445a435369674c636561414142517577426a4a4b4341747078714167424137514b4d6b5941434141414179453541415a546d6a69594141474d6d554238424256436148553041414d5a4d6f443443436d6a4c55684d4141415778534359305245414244546d5a4879793141674251554f31696b55786f694941434b4d32654a67414159795a51487745465542725030774b414d524f6f6b49414332754e5a546743674241744e4147305255454237696e2532425763336432614d6f714142677267636f494b4941536d62494b414d5a4b6f444943436d6850445939344b4c6f416f50367838724e75684c59494b4b4139253246363167473078624251426a4a56415a41515730703462336966394c4e774a413957506c715736457467676f6f443031504f4c68726841413144395765764d594e455a41415a544947685141594b77454b694f67674d61637a413857465779474752514155506c5957556e4e416c79446741496f6b766537413441784571694c67414c61564d4d7a6e525064434144566a70454c33516a74455642416d327059466476644951417752674956455642416d7a35587341333364434d41564474476674614e304234424262544a44416f417146634e592532425370626f543243436967545457735162477a4f7a756336456f412532424673634732743478656978336f5432434369675463744b746d4f714b77476779724678715375685051494b614e444a2532464b43575164383646414251346468595561304358494f4141747131714741625a726f52414b6f624778653645646f6b6f4942324c5376596872414f68635579416144377676354547424e7257483969715465685451494b614e65666c577a485931304a4146574e695825324671536d695467414c617461686b4f7a7a6d415142316a596b4c58516c74456c4241753270356664646b6433596f70414367615845736e4b6852674a494a4b4b42524a2532464f44303636655a7a7966366c4541476c664c574c694d4e51725149414546744b32574f78545433646e6856486343304b49344274597944706f394151305455454462766c61304c5339304a77434e716d6b4d2532464b6f376f563043436d6a626f714a744d597343674f5a554e6e756974746f4575435942425454735a4835515778487754713843304a69717872344b617850674767515551453350656f593365727a577051433049493535457a554a554173424262436f6248756565645144674e724631346f25324255354d414e524651414a3872334b5950666547327032734271464563343270387250477a336f57324353694152595862744e4e25324650765546334937754261416d25324664673243574e63484f76554a45425642425451754a503577576c58357a4f666f5844375a695946414c57495939715872733577346a6a574a45444442425241384c485337567250704a6a715967424b46736579576d644f3146794c414e63676f41434365635862746734705875706d41456f557837436177346e6161784867696e37524245417366763554656545546845645a6e6e76484f6743466a4d3354253246697538537254327878565025324237483533336f634d494d43574776687a6b556f384d4a73436f3939414442615959774b593157336d6a5852776c704b5a6b38413325324632714359416f505075353338693254734f6e4c25324637436a4972336f5441366d5238733751494135424c667a6a48725034253242374e6b4b4a737a55496745633867422532424b6f78596538376a494f7178596e4d77506a75304e4143515964304d514d65336144435857504e34422532464d554d436d42546d474b353325324269323736324c77373567584c393639584f33656966373067774c4147346a7a7041496e326e253246755266486e42307434253246454f3447396d5541436278564d6f6d6a3570695173742532426b38494c37374737253246564d432532423975427a4347687242685051746948543763696439544c58536825324278617642745945464d445a4175746274377244773831734268646230786476397a5574774b334774794543654c4d676269664d555078644d774272487645417a6772724d4c7a514444666d54686e414f446b336a37506d4150694c313477435a783170416742417a51476b4a7141416668415867375267465141774a4b2532463442763542514147633536306d41414455476b424b41677267482532424a71326b73744151414d594f6e4e486342354242544152563570416742416a51476b497141417a6e5579507a6a717a4b4941414c5a724757734d6748385155414125324634773448414b4332414a4951554141584d6f7343414e6769737965416e784a51414a647870774d4155464d4167784e514144396c466755417341566d54774358456c41415625324646634577414161676c675341494b3446496e38344e3525324637585145674441445378694c5148775577494b344b716561414941514130424445564141567a4a7966786732566e63436743346e6c6578686743346c494143754c4b25324277486a5a6678317243514467436f356a375142774a51494b344c704d3077514131417a4131676b6f674773356d5225324245475251653951414166755a5672426b41726b7841415678626e4b36353042494177446b5748753041626b4a4141647a5577253246357a71686b416741326e73555941754459424258416a4a2532464f4455494463317849417749623773555941754459424258426a38646c5343324142414d455436303441747947674147366c4c30534f253242713833576749416d76596d316751414e796167414736744c30696539312532424b4567426f303147734251427552554142624556666d495248505936304241413035536a57414143334a714141746b5a494151424e4555344157795767414c5a4b534145415452424f4146736e6f414332546b67424146555454674344454641416734694669376437414542643367676e674b45494b49444278425739465445415549636e3374594244456c4141517771766850396276395a616730414b46495977253242253246474d5231674d41494b594842395158506372554b4b75645941674b4b4573667475484d7342427657724a674253364175623025324637723465377338466e253246253246614c25324637476756414269744d47362532463673647636306b42795a684241535156433530776d324b684e5142676c4d4959665663344161526d426757515846253246774c50757625324237757a772532463325324225324233566e4e6755416a4547594e66486357684e414c6d5a51414e6e4541756a337a757449415343334d42622532464c707741636a4b4441736771726b3378664864322532424c5a627255327872315541494a6d6a6272585778464a54414c6e396f676d414d646d64485534365163552532463949576a387a584137636158253246326d464878783167676c675a4253387746674c79556e253246396252624252584e723145686f414334396267696f4669744d5848556639344b4a6f4178557641435979386f517a697833363343696b6d7237534367414c6a31654e4a79514c487350253242465279715034614358414b436c34675a4b4b79316e25324639626a2532467a46726264674546774b33486b425944696e6e25324665642532425049584e3741464143693251434a56326b68774a72486d6456684a41697a4b7259307a4941384a666a626a5662596d363242464161415156516e46687748595850526c6a786f50394d4f2532427456414e43574d43597525324273253246485469674246453541415252744d367749253246336c336468686d56457a377a3531757457624656437342554a464674317054346d763435333463504e596b514330454645425659714832513745575a316d734877575a6444387574686d436a504e6d585a7a393377484174697a6a35367751756e2532423934483933624859454141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141433125324232583944343865505a70716a752532424f2532462532466a6a6a31504e414d4159396550315876253242316b2532426a506e665a6a347246574277425325324248586a6e7a39706a722532424b76253246552532464c754d6e25324242792532466a32504274744253414754777576394d4525324632744d4e6264312532425141514171253246616f4b666d735250643759596a4348474d6e3425324278253242396a64356f4141414467253242675155747a4f4a6e2532426e3676336a30364646345043534546434730574a687041514141414a63545547786665433534476a3876596d43783644386675315667736452454141414138434d42786642435944474c6e7a444449737975654e392532466a697a474351414141437625324670776d53433675766877584f25324676506f30614d5025324657656d535141414147696447525235665a395a38656a526f3257336d6c58787871774b41414141576d51477854684d253242732532424c25324676507430614e48722532467650524a4d414141445145674846754954314b703531713644695a662532465a3053514141414330514541785875735a4653383142514141414c5554554978626d454552586c5561676f717035674141414b4257416f6f795450725070376725324268636325324241414141714936416f69786866596f766a78343932744d554141414131455241555a354a74776f706e6d6b4b41414141616947674b466434334f4f645a674141414b4147416f717937543936394f694c64536b414141416f6e59436966474539696b39434367414141456f6d6f4b684443436d253242575477544141434155676b6f3668466d5549535a46424e4e4151414151476b454648554a496355486a33734141414251476746466661784a41514141514845454648554b496356727a51414141454170424254314371386766616b5a414141414b4d47766d6637756f763938487348322532463674627a545a5943253246396330364d524c78343965725434343438253246466e5a314141414178697858515047357632682532424f645a47695725324643434a38515750775776366546396e46594e50503376723150376534414141434d316125324261344a25324636692532466c6c25324678552532426938332532467672253246516e3361726f4f4a655630356745576145764f73253246442532465573414141415932554e696d73496a3071456d52253246393533372532464825324625324664663537306e336b4250333332364e476a6d52344541414267724151554e7851656d656725324652253246306e7a457a34766625324238366c617a4c73627174566550416741414d465943696930496a3454456d5255687141697a4b70596a2532464a6d54253246764e4d6277454141444247416f6f7469374d71316a4d717872597735597534414367414141434d696f4269495045744a53476f474e73614653253246304467414141474d6a6f426851584b636972464552506d4f5a54624676466755414141426a4936424934493825324625324667697a4b4f37326e2532424f5225324643537a4b41414141426756415555695953484e2532466975386e6e514d6a33795952514541414d436f43436753326e6a6b34326745503264666a77414141444157416f6f4d253246766a6a6a25324641713071504d502532424f706e674141414741734242535a784a42696b66456e3744783639476866547741414144414776327143724d4c6a4870253246367a31366d76253246253242344738666a4a67414141467a446f30655070726634667a384f5378434d625a734546426d4648614c6671634a4d696842533747543443644f7757475a63774c5056677a71302532423355436f72434f7948456c32373658596239623172612532467851566e4a39725263556a31593854506a76563725324665667a52667472392532466462764a59746a376d564666624f525733302532425367763445717562253246723258497967356831397632364d502532427425324275424f3334626f313032562532463536253246614d6e36364f4762394e333666706d34764155582532426b4f4b34337a46653966253246344f744e506d5057664e773263584d4f41394b3934514e25324671774e34346b45383344747976385a253242584252557230777a3733564825324665564c5a62766168537a384c36754847494f4934253246504534584d626a634e4842395972586453463437346237352532465161253242253242363645417a373770253242782532424c505033713649377a624f4c6431474d5825324274253246726e46755368596e436e7546304b4d4c414845656a25324234743432253242332532426a6a64663925324233686837616734773976765069774836364e394474566b3848367a3367587664786348792532465337766f253246595837627654533337336b44622532463576534334324152783636765125324237253246416f7078684252762532426b352532464d4e546765596e484e5155555a7737756f57634937477a3032657963412532466734446d4b4c6b513565387777427861796d67434a65654b634f4a384c463937795134253246424f2532464d3531484237485933484d7879483578346f635925324225324236454a7a615a3639306e7031736a4f6e72344348484c4d444c544d3938767a696e4c766761253242336270534e7a4b7672463548453853392532422532463664797a5031487743716376626362374625324657416e6a7638504e757541417662667666683763343144747a6b474e72666a2532424d79353764623776344269504d4a463237634d66336576354d6338526e78535768652532467a2532424c764449584a78334243486b7462683925324652253246363535346e594c6937504f786e3642665133374766376d25324235456668304d48457463367638585073343142395032596a6b4f6133306376323264484e33594d324566724338784a642532464e5a4c474d76374b646e4c6d725825324653754d757670253242737236676d335870377a42665a4c33667a6a62364e7451356e79757164376270336a5943696e6a4f654670594b44485a2532424d32545376707a622532464e6333572532466a616664333048366a735574414d524c785976484e75696a4a4d476765465468415053376f704c51755446374867764e3933253242646a61504f5047647277516266463544797a78786e253242357447496a734e706249503977676252317a477365427348547863476456253246306c7253506c6a4a32334c5a416e33522532467a374c6171366851762532423546376635363334773344443657337238753676377132314450503973494b39344b786e38347239316d66776a487a4975537a6876784e7a2532467579706b706352767247774b7a4f4861746a34457242336125324662445463253246784c2532423846663944337a70253242507a487a6873363946755825324673354f4b4e41664674492532427a2532424942586b4d7863786f766b4e376b764544713225324655253246476661356635642532425552696e356e317037566a64754250396f714c6a634237487057556825324239366e6845564f754c4e377638446a633725324269665853555938634e253242253242566c4e38417a375258326231486e704148336c326e635832713571467645666c30345871396642386239346432577a7576335525324652443557505262633576483338575676796664687150654b432532427a66436e52333369447864453853543572624b44664364757a376577666648434c34656a4448397a566b48253246355a67393854377a7362672532424474395664687a757825324250775862785452376b584e43396a364672545076717a73654e31787247443463394a6e3762777070456967346b59784b594d593150563235396137646562586e754563586c6a6635675574412532465856693974382532467a32345766253246497748462532424f5334574e794a6434504865494476627751544f785566724f74694d38636a506a6b7565683955304725324637696639657473557877794e5663614374253242546863392532426d58474d52513167564e4b253246766f3262486a57527737374c50315873513163304637356b4a30326b43253246666d6734464c3933785830696e4f4f2532426c4c49253246784a75714837714377705178456c434d544a7a4f6c794f6b6d493773414e2532424c67395337786f724e63446673533872414b4b36326d33724636566e4a642532463369476969706625324625324637444e75354c68592532464e4454516667384d55782532424832456533734d39253242633165322532426776616437584f6d4e6d596f6466535068787169532532425a626b364e595a25324225324279726e3964536e58416648382532423632725935617767494c3846794c646171477173527a67345552646533722532424d33757845456b35594f5634744b6a6b4533694f475342764568253242483377756e786f394473796e4758517a754e3736506e6a574a5938647254564774734d3925324669253242666e576f376a63454d71484d6574726b3279766a6e31716248487466597532743453363439594b337a7132726d704f69674278516a46525675574759727833416633656c72556177663458774e577172736c4f5234644b5049786a396766253242346e2532463746484b7866444366746574376b676261466433706a39357a6e39637832446352392532465a5238253246314c4d34416d6d694b61757544442532464878674a33436a25324258396546466e74747271597279316d5876544379373069366f253246346e686b3856384252524e53587a44755a5436346425324249675a5672556a373450336b4d584966486939796a787473304b4c61427a374b50765578324838553757766b5076483058554a7864386f7967454a3347737349396550715a37544b6c7573354c374f46364943686c2532464e496c6a5453766e7433746e366f253246694c76546a627a5965625a6d41597278795047382532427a5852776838483157796442253246316d686d65494f377364474c765a764b25324658624f35614a586f573144676b6468793734786c6f49726c253246747177253242755a6966757334706e4637526a764b687a782532466e69342532465a644938667439457a3955654a2532423750773641414846534d574643314f25324633337953716544307a4e62564c6f344744536e6947794b576c562532467333335a2532466e5854706e346c386d32433768424e584c787725324643536d7948487647697074374a365277516575697a6e45377874703259315a6355654e713742763738554145464f4f3253507a334a686b7539685363317a695264385050704567396332657673476e7a4f575a384841313848416f6e726e3878384d476146456e484375474569783071364750687849333674505a486e34756251523348704864327a25324245494b4d6274632532424b253246647925324668776632397946647758762532424366754354346c474762537070384530393479504634706a436965756278485a6a2532424c46693364624743686337584b3250393064364c4c2532467368424d3337564e6a394c683830415444456c434d32794c783339744a6648413734643777676e366f5678253246324638504c445074644559393578414968395437376675427465756334764c47393248344d7433384b736c3373634c4d2532426e6f337357413625324678356f544e362532464e7a646f627a37346336752532424a6c68695767474c45346a6f555351767568416633564125324666796f7342467a584e385a68484351567a3669446c654d6a464d543025324675525837376b675065364856436442633748436a59326373343271634253584d765231744f4a3539253242616d57474a3641597677576c52336334614a6169723639416d5349496a4d736c706c36676459535a6c476b766842394f25324242784741625a31773668555225324248725265437a7a71766e586178773033746a4f6a635a4262556c6d6f51675868324c2532427a4c6151676f786d2532425a49554159744a6a58705673744d726365397351314425324261565825324678663937695964576d6e394133644239343976253242554c4163327731654e7472784e6b75396a68747249665233484772466c515778793742654c5a39755764546d69656a494269253246503673364f4225324232586c75613975654454534e38323369375a694d25324644475042346e253246336e796f7854486a6e656d705132667246337661644876433742354675497364746c4d6a5a446b336d513425324669484338436d2532467a3244637570664f724a686939314f745144484c777859484b535857345976372532424e762532424659663254767325324257586470413658474725324666334b4636434a2532463937626759354478633241463376393533664e634f74394e4253423035482532467a484365436746694f45656564785068583933717276464f4e2532423637787a74782532464868697a367637334e51665633635476424871764e7245426433326864447062567a556e4c5131366867747537396e323465783662395825324250253242356325324262593342766273537167474c253246554130725953596559577635693541663235334d4f394c563173667862764741663234453844586449426c6851385732586470324345414938482532426b46553872253242506835776764786e49793059542532425041253242766e4d667a37764f4678662532464933744f41797a67506237766a7379624e3334574e767078726b32536a69336675787575484474786875414873543965457a3762566a6f39663251432532464b532532463977557a25324630764578374c3032363830253242455833592532466834754b634f6e68396a4e364c3754635a325461456d6c71776d4735253246587466253242593968335038663636486a624956556367253246633261713531765a5838474242516a4e253242796b674e376630512532466152364c7a6355564425324237464264733069345058474162684639333246315139536e7978454337775a6e32667a4565324336642532427647504932524e504b7a774f70374750786e496343696875626b7742326a49656930653376664d63413866774f6470346a766c784e35365a496b4f4d48324f394d4f32366932394948462532426e723250777443376f663476663035467525324239502532423937354a4f4974695444656c6a754e594d3739692532424c2532423459507a63484774796e36644373506a4b4c49704c2532427a3330355a253246786e356533614b2532426339555859687666646749253246253242626f785670787637253246336e487758546a66446674426778744242516a4677366d666f636f665450474d464364786d4a7a4b774e30504d6d39435a2532424e414f5a70786b45727a4b4c593225324261643939424f25324662397a6e766a452532464b424c7630446e5a5266314b6266253246644d413738474f34253242447664754f686262756b34504e71343846736668354e4d327a66576b4733305268536768583330253242564448595278253246317674734b504265642532466e767a4130314332384d376c3833654c6847587836664c655248654347376c7578786e726866543065777a6545346537754e756d686a38664477655249586d4832616554764e6f766a6e7558767a787363326a2532466c376d594b4a56324d364c38666673726a67654c253242337a654e42514d465a253246397279514c57253242654d2532467031626143695a39634a4c304d647966696750457330335925324248574377657025324634416e30327367453339623437794558525343372532423373544264716a6a4d5078375132423446492532464246786d5051774846395930685142743048373267324c73624636374e25324657684c6c624d6f556866336d7865796662382532426a324e61614e764a474d617a384a7353374e253242357835725135383848664653796979483050415956727a5031623672253242484c76517a25324248477835417a444b614a74796e30363575437a72474c4d3448464f714339385848684c52356c574362385739752532426b374f6675643343776c417655357a4177392532466f503645677564766c6554526e66397372737364424f4f5867747a4f7956392532426c58685270714c656e354c7954462532466166253242253242485953486763766f7a4859593546563663786d4b576369357177587a354a7459253242657338253242253242795468753247253242485052654632574a6838647a6e58666f317863347a364132556a63646663776b4234253246306877346c7a617152773742356c32743739686725324278526177743773626a3748544166547056253246585161723176656c4e6f704962434959326b343736335066646325324248675555416f70616938376a654a41665a7a67346a7a4e6548413152474b516565422532424d5963664e73436a535973446e53584d6568372532466e6d4b49596a3850376d5937446c6f76476d7878722532423133253242414f306f5a78746b486a6657764f466e755035646831434c7a44396c364c4667502532424e7825324644434730366e374e6752525965626e71777a62253246626a4277326b5a7a396e33453955576b345462396a7a486463754178305a593979504d594c2532423745565a63716334565544426b305a6e727275317850486d645a6a776f547a4e6448413178636638323854624d746a3054704a434c253242766344485966724e7767344468574e59355772766462687843674b776f7a3736396a4f76625747464b465944253246326238253242376f54677745617a71573138667850485025324676737751557577314e764d707a4a424a66644d6a5666323071506b7459427468786539786e447353554a424c6a6a766832532532424b7a68536244377530307a706e417a7a6d735578634d4b64656d504c43746b785a594130344d4f557147422532424f3644674d672532424579345a253242647847434953327938695357484a324f375735567033426a62756266326f434c635263793531744b446759376c396573495533732532426f7044785a5a64253242316d6b4c7825324278365676544c544f6646464e35326a59695067547752554e44434264356d77586b366f6f4e776d61455147614c6455353834737a376d6b6148514f7172734f4877347074656678584e4336754e77326a486d34767256574e25324232456f25324264687a566476504b505067376e2532464f65356a726d425a73726b434d50666a5043753835576e7352666337696d4625324672316630364d50463577544c4b363951554442554264344f523776654458474531673836537753253246736b68586f655525324273535a653670783673633733673530484f61346f253246566d6a4b38726a4c38705a534872516d2532423878665678706a747831393166637a774b344447506448333870737533754f4b736b482532466e7a345151344e5549253242253246583771346f54253246736d39696f2532465a634e4d78393433484f776e25324278714c6a4277494b53727049253246756c414e664b434d2532425567757655694951344f715175706e4e4d5755253246377425324259437a4461614a3225324231306a41566a70754e7732764654475261695858746553424f3936764938367545786a375437346a4c443333327735574d3552786a2532425a4b7976324d78775936713238575955697864484174734d424254556372496338305852503934545050544a644b446e3339386e627259736436417a7a503535583145627668337a4f396c6a45485355634625324271725769736f616725324247754d4d6e77763231395233597466753254575439764754436f3639314d66796f6f446a2532424c316a396b62573463544347614a64416771474b4d72447856334b75324c4c516c6125324254546c596262333934324378544c674e73307972557a394f764f384f25324266684d797149784642556c764c76375925324255583443584a45554b2532424b716d42347469325450786e376264702532427a694d72616b7678725a394979503142664c37516f3764564946394c5973796a253242724e53676c4e4f6e34676f4b434734755a3949653253636832484f35573064644b70786a46636d39577737326134657a386638253242794a6a614a786e72426f764e4d78707246694d6162465730643833703030397572434d536839466b584b59336c5a304f7359357758325a553474686850667a376c4f67543853554a5368744f6566556965355251785538654a7455586766704737723141766f7a53726164314d666836554568536d4c52713861765543384145343974705836477263634d354f6d39744b6b39634779537a2532424c346c366878334a4a627a76346e504363756c66426354444763474b5a715025324273253246624e42514f4743663467444d655655762532425043376f696c477177474b53356a573663734476595333386c4c25324266614f25324263443762737137393665465053253246364e6448666d58534d35514c34744e5458754d56774f25324656764e253246736e76645142327437492532466a3158565649596e6e4a634e4e344d3438394566386562767a59494b426a69514577355743304b6139396b36664341723533366d4c6a4e5a6f6e6161354a34337832364745315a724d77646878667556394f4f4d5254547062396a507656353125324279667842492532466672624e597a446c766e4a6130694d413853614564536934697630615a734673693443434953364b553037312532423178594579314c4c7a41544c25324677557048724d492532425830756d5743475164547825324247462532422532464169345a2532467a69724c7a7056355537325068375a5536594a6e61526576763579304671436c6e3279774b374e4e556759705a54384e49576525324225324247253246446d596c4545464f4f253246344a385539704e54703339464456614a6b253246386839353061482532464e49253242586a486f4c4d6e4d707733576c7a5561717a6e524f31537a34584e357468786d766f347331426d46716e44336d333063636f4c7171384639756b793064397859567425324266525047785539434367464643535a2532423738556e253246524c65476c4270583652253242566e62513843424f7130753537783756644e346f644e58745255644f4b5175773430724769745437374d5275716f25324276594f7138253246564f70316a41516867386a3964675225324276464c5835667574397a6f4167713266664a50576441734332336a5a656b375362776754586c524f76546a46796e66466e4b55344749703558466f3973545033644d45503871774c6b6374253242326a7175386454653276797358575a754562347a6356694e637967474b376554533355634f46786a322532463935316d4c61315038617463627664494b684838704f6925324231544851424f6653465556684a4f39564a63784a4f30414d4f4650734a2532427a2532464643755354684e756a594d534676544750386d71455734385671635047516d6672556365354e30644945493750312532464659572532462532424f6f577175634e37353838782532464470387343394d4b4b4e69326c416677667a5633566b6672453263696a34636f304f4f37703150646556676d57714252554d6959545250253246765372323056416b7869493146624e25324638766a636d623179486d48343566584d744c425866706369563043523878707263372532463658722532464764676942253246324c6f2532465578414d58354a43345443546d7950253242344f6d78414b7169716c61345447467676334459706d70336e345225324673377a416636394b6438392532466262436657785736505444564c2532465a686359346973746168434a786f6b746469492532466b2532464a5230582532427a486d6b38463971666a745877684e4e78767641306d38524e7138526378744a6a4874706e4878394f32526b4178666a7425324237365548432532466d3837394946464a4e74337832494b79576e476e524330586c5538614146563558307566664b466c4e654a6a7a65504e4f6552306d425773707a66396766703359504d6c686f676e504e347564317647483576683976742532464b575034746b6a6c2532464b4f35504868663165666d377767547965694a594a74326e6269316e4f457637327562664f51504b4c6d6d566c625a647965347a6e51505069374143507331356554332532424943337675332532465a664a71415973517a54706c303863614d4c3738516e774732713866474f314265413449492532426e54393171583057534f36394a726879253246526e6551504c6c4e6f766f43696a474c5856414952316b374266654f334652793176722532467a33684a4a707142735678346c57514a335a4c67504a73253242316e754b3479464875574279783170676d7466773337717a792532427662334b4f4556434d32353345663839624d6268704d6256492532424365334e65736835654d64622532423070384a644a7772396c5a69426366694678553937305169753162713372694133745762634b4b7134313767736f786d32612532424f38744e446b336c484c71323761436863654a666d3859314f5a3245666a4c4a4f48662532426c705a327955647032387a525265674d713830775932454550544c645a59754546434d564a774f5977304b536a4650755025324673334859426e6e69535448563857527754414b4267636362776b5a61345765336572575a53584b6e32466c434d317a54446757634e436d3636373653654a584462787a77654a253246797448753841414368666d4558687074504e58446d6b4546434d56253242726e2532426f515433466253787a7875756242587176556e466f492532464145624d78525a63555a7846345647506d77753125324237764c616e674278586a4e45763839463148312532425825324632377661366953554a7748437a35253246374847774569417551494542456762674c494552684667496e41646753574930434f41446d434b794a67694742314d3967705847504777686a4c6d716d71376e6d66633378676c39306a6566717a716a396d5a647870792532426456306475497667566b5a5051646553305641434279774d5838443969747a5a776c3775336268253242796775486a6f66304343496943393658526b2532464c466665664c6f674f5678687266472532463739646265704262454756414144734d41656338425341384e346c466e66334d645546773375526f4168616141366653534e4446797a766f586a714d5125324272397257674f694378796f4a7548664149454d67316a7941556a757359306276586a6e6a6d657a6e393354253242516f496a70324b47684d596c4746253246576f53725a4a69746b75253246324e39253242346656424e2532467a6373794b326f6a414c4f766e36384b6533626a6773674b773378794d7855623735253246306d6b615234716c45394c7a25324235377839495541536a4e35754f6a443932785a4d766b74664b687557394337752532426a635071654d644b6b7a564443414142366d65354533444b796d48537a694d4173756b6a4a556e784d724554253246616e75585a516e515a464a51575555794e4a413661786c423456564e6e6d73643762386b52344873547265776557596f4538453842516a77382532426966796f4871253246682532423831363563253242797725324675735a54324e6e4237713725324251345346494559423142744b7a70494271754f4c5177253246363746745a6d623066536f757830544c767a794377515237466c3552704d56376e74453867515248484a5346733372754e303833527a346f69393338736a685067694b5744386e6841697a756e324377366b484559783776432532467a646634654c792532424b6f6541536442305737474258323741344b4c5366384e4b597441336d536d457033557877782532466a2532422532427a3976654455324349676a6450654678764b50724377304a6a4a67344e4766797242496b667a7a6d6f6639754e656c62555058517767546c56366176745837734d62424d575034757241493654645970597a442532467a707673704b312532463547364b64386e323876686333646b4e2532465266504977795833524f317134796632596f4f25324259394a416b25324679466f734c6f38253242613154386e44253246793756664a7647655253755458744d49794b52784169714b384b2532426c31514b4632737370774c376e55455456614c362532423973325a647976395044597a48697a63556c4f62467348654f5879396f6e6956644762354d33627433653455474349733641644f7a3038563133614a61423058586438452532426f5157464a703279566f4a446a477725324656686146646a726d68485349773625324254707549544a7537376c79314a46565455337a724174626f79437259717842726d53697a54547a51376252617325324662393763324c774f657a4c675233546e6479644245634e7038736d6b7258745937655538496d343734376f446c6f35345a7642783869376c385832375267786633567470706e794941534151655a776f35574a4a3625324244314f31585664354b6553567463473333764d64554442633252487a774b72585058766d50445566715a494a6b3450354b44396a79654249577a756a416d7965377441747375653268776c7476396e6c4f4477727379724e253246766639505a4825324266616e765a6f68354963736c7256656b303178784d436d7049442532423735594a316f7171716f353025324636306f30765372656f4a572532424978474e6248744855332532467765644d3375317458457a502532424353544564614753346376304a6671373256595556473741353261566766706a7625324239313162444451495a4e4b49586673463678305559783176637a637825324672794b326c703047586656447331323268523234533051616c7a574931534879573858376d33374a6b4868367a543558586a563532562532425a6d39766f41706c7757706e77576a376a4862396e36644741665169794f57597445506b596c5634634e393159485a6733645a3442626c3547552532424e50334b645956746d764148363766646c4c76736d253242535170626e634a6b7144774734686d7965396f523939426f39557235413749706d64685966685a32386335336866516e714b3377253242616f4775415248443157376b65527249505869697071377133783531316e324a593555676a305448633579757452725863373369346f6b7142776f4b7538703435666f652532464c25324646594654397177653064584764614a6161756448526a566a79726f5371506c6433704c5463654f7668702532465875356a6858556234364a6432336e6867554d643761534d4e5a697871693854616774674e6e632532464e253246375955664d58456854326735416b4a37346b333350626c7a315861737641364432314b6774574f77774f5774746b72535a373578456675413475466345666772494f6745653537765278436c36253246556b564e57523148374b734e6d68307064486a644c6a425543253242747875766b4c4351726253556145354951344d253246694d6c6546674e614a327856594879394c4a57573056613159617264376573516a38364b33613459686a487469785425324642596f6338316f65325241467852533031394e50363871754e376b36344e762532467378315155774761656c6a33445a54556543776b6967354d54433641623171344948646a7a4e3075687a70707130476866556e6e4b594e4e494f455430496e6d58364e672532467a747355466d61627a77316d79767a4339362532464a64476e3733615346763551467951494b69344d466e6b6d496b4a38536e416965654d315a7673324231464d4c7939623258775a2532423535615278346e414c50664a323566435a487a4b63502532425165764f4a6848736e6454705058787664517942682532465372554254487a33253242464153465031504c6d51794643553559665971524e3225324257786e2532426267785777526e5869596e425a31545256786d4e4a343025324632694572577767654342396e64697a777775457a72366d615a6e50456b253242547a75766b2532423270356c777036464b6142674a436a364733546b7372375067514a6e43565125324247582532426d35657174334556785163304c373779673325324256544a7425324654637449346367716f6b434748524c62495a765656467a67386774636c74644f6b664f55596f73667569585650693158573965597a435847675443516f253242686c305a76556633314b736d253242335072585a504f41564759716250486e457443766b394e686c4e347132662532425a526b495949487739506f783546306c34644838466f355857413674486d69424e61666e54362532426c376d5a3853764668547a444c7951706746343939253246685145685464446a6879426c754f6331796b47456336626963637965624e486475446c5578797243633646377271684944307945454a7133504c344a646a656a2532467a47556b4b65415a4c6a787772496763326e35336d45657965364825324275253242434f77546a3637592532466f755925324276322532464f4d4365704955514b39747a4d7274764a6f4552546544545a4f596b4a394a774b38346477796d504c6230797a6e344377597341704c43366e56753331655346477a4278594f636a6e6d6b46486a31565a4e375936655076797970666b5737703643566e5041713333585075326d587965365634753041366838394d674e5974654f682532464a365766656a746f6a594a696a304b545934543144253246253246704c694a4362477142794f33465a48367378634f673957503445676e6e784e71613769415a4f6c554a377163344b307a6525324259727079427771684e4832694565347058774337663671736d4a475831625a36523851387746394e694f5a334b693937616d6932456537586d6b5938304a33536b4d664b6a72326a665a735a335a7063733725324635356548307943346d6c4a43646c362532426239306335516a63735a57426f6f6a4a7038253246646c4f4d714d47684c41696d7a486c64366a6e536476695a646f69412532465547594a49567a63694c6e767531504a6c72473333514f642532424251746a4c522532463864357a6d6831334d2532427a5058253246556370375172634a6762694d584c6e25324654253242633273704a30562532427273634733253246734e516d4b7878584f53433753716e394f646164456b3553595a7649727a42307578727a5057664a644d5a397042334c42466b434325324645776d654a3354335579652532466347303151365a504b4a644e7a63426b6852755738523138654f4c63334a696f33314536514846526173666d68715562584d455741495a37253242426c595848635625324265644325324264796c6f545550317963447350356a665174253246394d6457316e7672476764526250757332376e7148384e5041457832657251354f65462532466a6c4f73533636664d704146474b7949514e6925324661776c4950336f25324646566b6f4a494d703278686c584f327979414a6e4630366a4847727272375725324679787661446e4a4c43437074427a47476261726e492532426e664572253242727746743271473050656b5856726c744b3965786f39304f35553935253242384562356d6c373155335059474b6b53517235486d64573756774471416a42362532466d4136747042717825324253636c366c6d35573754766f694455776b59486b66624977374e3237505525324264364c633965456c4853766d52683463727a79504d5436394b34465a4f386176356525324678375047444c436d756a507163357a3276314c6c5547643837776e5a25324232646f4a41745742253242707737305738447a59647a725477586f55344c754d39616670504754412532426871683839434a5466756e6c49545a37795a4c46786c2532423532784a30724b75593864424a73306a44637a533169447566673625324231513662704f426a326d47567345253246646c4b546c776a6c4a38574e253242496d4f564a69703665317550727435253246444e49574e386e685456253242426b6856542532465a467953646f5853522532463062253246723532737a7176766d4242704474666d4b53596962654635627a473233504552616d6d6a4b57666d553749625857253242356d3841384a4a4b3742393368706e32504762763146543937626d4f6c2532426a314c25324274756a684c6a676e7a39747a764c253242704f635837634f7846746c56643355556a53354850417a754e44713345326b785070524c377238317933666f253246564467323943584b326b794e4e773325324652253242766353457842253246736b777856673466613558546a70734853447638456e775162397268526766796664726866524d39326d464d3372736f327656526b716553784a5a25324236724b4c69615147732532423831474234466575376e6d65384d36396f6b253246627a342532464f5057253246434458656148484855535246716261795972746846536c50383335393358366553783576557662754f663434766234383772567834786f616f4e4e574b537425324272665775553554463965477525324668473268364f6e65766b6e64314e4a436a4b38793771646d6e5a577165547665683365457765614d6a55734f377177306272777979547233785a79484e66316339644a6f34664d6d6d4855397268595071454b6c6a64334635355857735130775177763531456271324b766b6f2532466a2532426446552532425632524241374f2532466449727573594c78653166776e253242664a706b7759523548787a723325324653656574654d4e644a253242762532427325324674524e6f615a646b78746134314f7a34696a4975585a4f674b4e6452744f314339333148625243735571494a2532426e4e49554a52326756787a506e684546555441756a6b4c4f45593037344f66464261387a4b6c79525a5041787533346a69624546796d66685167676b6b636438796b6b69585a6e4277567638536a48555134426c4762356a6967754e4a4f586c4d665a2532465556687a353132434f6f6d6c726c64476f69647a514d6333356b6e3775674238504259644b65504945465268724f63566e6431516e52477355486c63485369754276754e546e4536696d696a6845457a7630694554534d536638795148755775765975253242623575486b42476351414a69767a4a7a6f6e7367677a397a69754b44796e253242376f52534c7365387278326570634a3268364363735332783674716e6431794d57625171425570413664316f4a4d51422532464e4a58335a64494a554752253242515175383350786b6c466655347a44707346253246354e585338384b4c59453437524d42253242675658582532466e7a4b344c347137446d253246437667324e356d7666714a6f41477a4e5158394267694a50477831384667564d514e3851484b4632466652375661576630615964496e44645a4e573165777665326c47386f38427663354f3674364349414b5362486372337a72464a554f536e6b6d43696c4b434a3441686144325443456e476c394849677a353932694d68394133636c64494f45542532466e4333306c57667a39707a77754b43686938333435484a436a79496b6d4a7736695a6359496a6446432532466f786e4d4a497032694d4231633046677654647031322532423464364a6f69317a754a4e4d6b425a656c41384d31667969654a554752683430575a4c4758577257436f78584650566a52376e70596c6e6f353569506134594c71694742315534495a646c493844636d4a38693030364d2532427054633970303841674c58564d2532467930534650464a77483734703449734a546971667951344971732532427a41426b6e574b74336c384f744277324f74466c785272523675614367476233774457526e436a645757374a69613032665a6934444263596976566a786e45534648453175796265444841565677496a626d38667069684a67654976783378454f3552456f53514d4b366f6c6767553062786766486b5865316e464563714a6f576235716671744e533844794d72474446696a646f33667a6b61434953514b446c3050594e664841674c58554157744a64526955525a4476635535522532464769484d6d4538544f7871517278365355447a65787564424a37774b497056705a766474597443326e537a67336165534434434a6472707143454a696e6a426d53516d35717834334135597370506958574956647a426c6e6d496b4b526155787031324b4a4e474c7442457849446d4577484e48557564523678344645575863584558706d75376c6d543459574a784369677476743370714f4666504c4d774266647061456335646869775a4b4261253246763333337966316e3866317a7746507057685839632532464d737a3253494c7933485572416331693351796d626a2532465850694b654341505879704b36544d6f5a653144253242544154384b6d542532464d683334306a5449756f6b334c372532466d75627463544857736d4644325172666c545467537767384b504245437938764e537a346857504a49253246543054547a625a6556737a4b4c75646c3874307863306b705046672532426b734352646e6955324e6d454941474e37715959347030707a567a696b4f51455a567859753136313276574b6167426b5a5a3332654d6b444f796a7379654279566371355159634253776271452532466e526c567a5a5554486d7952545a546a3434664737463175684874305870777862614474386e56726b51494b43702532463367356b4c4642786b4b354b253242654d4856253242553851446139557033564d68594d364e7177466e4649336977333572764725324265536f4c414c746d5462253242704b4a52433842306c676e6f39504538593953794b54736739506e346d6e74634e527168794f6544414c5579524944476c6d564f6d65523439482532427132504a253242347a3670557248496f3462336d335871335354714a68726d3559795a59454b4c6d4e4d5851253242584f7439357133253242536d4f67776f5571436f722532464252547253613549534a683146383037646f3772446b45376939634343704b72414d713371737051324e4448253242614362396535525a75726d426661354a77325a58785a683243414b6176657557544959765337775973656336304e35314f64553645444759324c544b6545584a25324662464d5a6476346d5362476d7942784d70424877466754707834756d6e6c6a4b253246345930727848394a49304a304852586547734e534778346a344a3177356a7159503858416575536176447944316855656e50746636354c6e7979656d6b3834574331717274323250534a7163423275476e3125324256385478344a794447676d7259416d3671343771564e584f7163674b6448682532464b4375417764625161315848566733355577663875517972567074253242364131316f774c53566973644c373358662532422532425a7034535076356f7a337465465a717771505233506538723569564273667467736d6b466945784d3477396369253246517a75336e5147725265614b41556151427241702532426d72763362314c6d42316a507025324645344e4a343863372532464272682532424e6767654b4b646a69592532426a6a572532427666616355785936357a697179596b71476639316f48746c632532464a566d446252313955705a384c444773745a774c4e377376314e6b68736c653149413857782532466e30554d4b356f6b68424e50534552556359346b376271596a507647576557744e696b7579634471723425324638466e72775832685374314f526e384a46756b6f79715964523971616e4c7a6f614342723136767441496a36395843356e4f696b73572532425362447a69695266644470734a595062747348354f7034615447336b75383448567779614961657068757737754775433035784962545549306457387a744e30523271642532464e4177556e7531522532466b3125324639477148704556377642396b47576453443575326664447153353933314b25324232322532466c3249714b5a6231535a504b645a756a6b575a64566533777977486a5a6a7a597657253242444a7925324646705643724262253242316b434141414125324270253242516e36546743516f41434e425874704e6e6f33513361624876776c30376964596b30554d6c557a6e694151414141414241414c716a637a585533253246382532465641454141414141414f434e4241554141414141414842486767494141414141414c676a5151454141414141414e79526f41414141414141414f354955414141414141414148636b4b414141414141416744735346414141414141417742304a436741414141414134493445425141414141414163456543416741414141414175434e424151414141414141334a47674141414141414141376b685141414141414141416479516f41414141414143414f784955414141414141444148516b4b41414141414144676a67514641414141414142775234494341414141414143344930454241414141414144636b61414141414141414144755346414141414141414142334a43674141414141414941374568514141414141414d416443516f4141414141414f434f4241554141414141414842486767494141414141414c676a5151454141414141414e79526f41414141414141414f354955414141414141414148636b4b414141414141416744735346414141414141417742304a436741414141414134493445425141414141414163456543416741414141414175434e424151414141414141334a47674141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414e7a395834414241476435464b63576e77776a4141414141456c46546b5375516d4343, 777, '2019-11-16 08:04:35', '2019-11-16 08:04:35');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL COMMENT ' the root [super admin] has ID 1 DON''T "BREAK THE RULE" to prevent damage the application',
  `rights_depending` enum('0','1','2') DEFAULT NULL COMMENT '[0] Static definition, [1] permission based on role, [3] permissions based on departement',
  `departement_id` int(11) DEFAULT NULL,
  `superior_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `gender` enum('0','1') DEFAULT NULL,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `birth_day` timestamp NULL DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `cin` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `photo` text,
  `signature` text,
  `function` varchar(255) DEFAULT NULL,
  `disabled` tinyint(4) DEFAULT '0',
  `is_verified` tinyint(4) DEFAULT '0',
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `qrcode` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `rights_depending`, `departement_id`, `superior_id`, `role_id`, `job_id`, `gender`, `login`, `email`, `password`, `first_name`, `last_name`, `birth_day`, `phone_number`, `cin`, `address`, `photo`, `signature`, `function`, `disabled`, `is_verified`, `last_login`, `created_at`, `updated_at`, `deleted_at`, `qrcode`) VALUES
(1, '1', 0, NULL, 1, 40, '0', 'admin01', 'contact@spotfit.com', '$2y$10$CwNYVgkgDcZrE40YPTEcg.nGY2LSRE8W82Vt.FPtsyNuvFjKGSwzK', 'Lafdaoui', 'Hamza', '1991-02-25 23:00:00', '0771747677', NULL, 'Maarif', 'lafdaoui_hamza.jpg', NULL, 'IT Developer', 0, 1, '2019-12-02 19:18:12', '2019-11-02 20:54:34', '2019-12-02 19:18:12', NULL, '1_Lafdaoui_Hamza'),
(2, '1', 1, NULL, 2, 6, '0', 'partenaire2019', 'contact@partenaire.com', '$2y$10$CwNYVgkgDcZrE40YPTEcg.nGY2LSRE8W82Vt.FPtsyNuvFjKGSwzK', 'Master', 'Robot', '1991-12-31 23:00:00', '+212619923100', '---', '3459 Hewes Avenue, Baltimore, Maryland(MD), 21202', '63a9f0ea7bb98050796b649e85481845_Suivi & Accompagnement.png', NULL, 'full-stack web developer', 0, 1, '2019-08-07 10:47:42', '2019-02-02 23:31:46', '2019-08-07 10:47:42', NULL, '8df490dc-ff60-00e3-62f1-6e0fc74f739b'),
(55, '1', 1, NULL, 3, 5, '0', 'user', 'user@mail.com', '$2y$10$CwNYVgkgDcZrE40YPTEcg.nGY2LSRE8W82Vt.FPtsyNuvFjKGSwzK', 'Richie', 'Denis', NULL, NULL, NULL, NULL, '13edbe8b95261c3a88680818cace44a4_6461245 (1).jpg', NULL, NULL, 0, 1, '2019-11-15 15:35:54', '2019-05-14 09:03:46', '2019-11-15 15:35:54', NULL, '83ae7918-1f56-de1f-54a8-08a4edc3e768'),
(56, '1', 2, NULL, 3, 1, '1', 'user2', 'user_2@yahoo.com', '$2y$10$CwNYVgkgDcZrE40YPTEcg.nGY2LSRE8W82Vt.FPtsyNuvFjKGSwzK', 'Clara', 'Marta', '1991-12-31 23:00:00', '077588596', 'ee878887', 'Los Angeles 450 ', '13edbe8b95261c3a88680818cace44a4_6461245 (1).jpg', NULL, NULL, 0, 1, '2019-11-15 15:35:54', '2019-05-14 09:03:46', '2019-11-15 15:35:54', NULL, 'fcc1e92b-16b5-259b-7bfe-d833b4eeaa26');

-- --------------------------------------------------------

--
-- Structure de la table `user_departement`
--

CREATE TABLE `user_departement` (
  `id` int(11) NOT NULL,
  `departement_name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_departement`
--

INSERT INTO `user_departement` (`id`, `departement_name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'administratif', 'Sa Mission consiste à recommander et faire agréer la politique de gestion administrative et financière . Ce département assure ainsi l’appui logistique, humain et financier pour l’établissement. ', '2019-02-05 23:00:00', '2019-03-28 12:39:51', NULL),
(2, 'informatique', '---', '2019-05-02 23:00:00', '2019-03-28 08:46:53', NULL),
(6, 'commercial', 'Groupe d\'employés travaillant sous la direction d\'un chef de service et qui s\'occupe de la mise en vente et de la publicité autour d\'un produit donné', '2019-02-11 10:17:56', '2019-02-11 10:19:02', NULL),
(7, 'resource human', 'gestion du personnel, est une des bases fondamentales qui permettent le développement de tout organisme professionnel, il s\'agit d\'une activité qui vise à améliorer la communication transversale', '2019-02-11 10:17:56', '2019-02-11 10:19:02', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_group_pivot_table`
--

CREATE TABLE `user_group_pivot_table` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_jobs`
--

CREATE TABLE `user_jobs` (
  `id` int(11) NOT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user_jobs`
--

INSERT INTO `user_jobs` (`id`, `job_title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'installateur', '2019-03-06 08:12:52', '2019-03-06 08:12:52', NULL),
(4, 'stock', '2019-03-06 08:12:52', '2019-03-06 08:12:52', NULL),
(5, 'technique', '2019-03-06 07:20:52', '2019-03-06 07:23:33', NULL),
(6, 'agent d\'éxploitation', '2019-03-06 07:22:36', '2019-03-06 07:22:36', NULL),
(7, 'autres', '2019-03-06 07:22:36', '2019-03-06 07:22:36', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_rights`
--

CREATE TABLE `user_rights` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `right_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_rights`
--

INSERT INTO `user_rights` (`id`, `user_id`, `right_id`) VALUES
(143, 1, 1),
(144, 1, 2),
(146, 1, 3),
(169, 41, 1),
(170, 41, 2),
(171, 41, 3),
(179, 46, 1),
(182, 46, 8),
(896, 2, 1),
(897, 2, 2),
(898, 2, 3),
(900, 2, 8),
(901, 2, 9),
(903, 2, 12),
(904, 2, 13),
(905, 2, 14),
(906, 2, 15),
(907, 2, 16),
(908, 2, 17),
(909, 2, 18),
(910, 2, 19),
(911, 2, 20),
(912, 2, 21),
(913, 2, 19),
(914, 2, 20),
(915, 2, 21),
(916, 2, 22),
(917, 2, 23),
(918, 2, 24),
(919, 2, 25),
(920, 2, 26),
(921, 2, 27),
(922, 2, 18),
(923, 2, 19),
(924, 2, 20),
(925, 2, 21),
(926, 2, 22),
(927, 2, 23),
(928, 2, 24),
(929, 2, 25),
(930, 2, 28),
(931, 2, 29),
(932, 2, 30),
(933, 2, 31),
(934, 2, 32),
(935, 2, 33),
(936, 2, 34),
(937, 2, 35),
(946, 49, 18),
(947, 49, 19),
(948, 49, 20),
(949, 49, 21),
(950, 49, 19),
(951, 49, 20),
(952, 49, 21),
(953, 49, 22),
(954, 49, 23),
(955, 49, 24),
(956, 49, 25),
(957, 49, 26),
(958, 49, 27),
(959, 49, 18),
(960, 49, 19),
(961, 49, 20),
(962, 49, 21),
(963, 49, 22),
(964, 49, 23),
(965, 49, 24),
(966, 49, 25),
(1267, 32, 1),
(1270, 32, 12),
(1271, 32, 13),
(1272, 32, 14),
(1273, 32, 16),
(1274, 32, 17),
(1275, 32, 18),
(1276, 32, 19),
(1277, 32, 20),
(1278, 32, 21),
(1279, 32, 19),
(1280, 32, 20),
(1281, 32, 21),
(1282, 32, 22),
(1283, 32, 23),
(1284, 32, 24),
(1285, 32, 25),
(1286, 32, 26),
(1287, 32, 27),
(1288, 32, 18),
(1289, 32, 19),
(1290, 32, 20),
(1291, 32, 21),
(1292, 32, 22),
(1293, 32, 23),
(1294, 32, 24),
(1295, 32, 25),
(1296, 32, 28),
(1297, 32, 40),
(1298, 32, 41),
(1299, 32, 42),
(1300, 32, 43),
(1337, 48, 1),
(1338, 48, 28),
(1339, 48, 29),
(1340, 48, 30),
(1341, 48, 31),
(1342, 48, 32),
(1343, 48, 33),
(1344, 48, 34),
(1345, 48, 35),
(1346, 56, 1),
(1347, 56, 2),
(1348, 56, 3),
(1349, 56, 6),
(1350, 56, 8),
(1351, 56, 9),
(1352, 56, 10);

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user_roles`
--

INSERT INTO `user_roles` (`id`, `role_name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'super admin', 'This is the individual(s) who have access to the Okta Administrator Dashboard. They control the provisioning and deprovisioning of end users, the assigning of apps, the resetting of passwords, and the overall end user experience.', '2019-02-05 23:00:00', '2019-02-11 10:04:11', NULL),
(2, 'technique', '---', '2019-01-31 23:00:00', '2019-05-10 09:09:08', NULL),
(7, 'admin', 'Administrators aren\'t developers and they\'re not users, but they are critical to keeping the applications your organization relies on running', '2019-03-28 15:42:19', '2019-03-29 07:19:57', NULL),
(8, 'stock', '---', '2019-03-29 07:20:56', '2019-06-10 06:41:20', '2019-06-10 06:41:20'),
(9, 'installateur', '---', '2019-03-29 07:21:10', '2019-03-29 11:19:44', NULL),
(10, 'read-write', 'ability to read and write posts', '2019-03-29 15:58:00', '2019-03-29 15:58:00', NULL),
(11, 'Commande', NULL, '2019-05-06 14:25:50', '2019-05-06 14:25:50', NULL),
(12, 'stock', NULL, '2019-05-08 08:25:08', '2019-05-09 08:58:13', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `villes`
--

CREATE TABLE `villes` (
  `id` int(10) UNSIGNED NOT NULL,
  `pays_id` int(11) NOT NULL,
  `code` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `villes`
--

INSERT INTO `villes` (`id`, `pays_id`, `code`, `nom`, `created_by`, `update_by`, `created_at`, `updated_at`) VALUES
(1, 1, '', 'Casablanca', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(2, 1, '', 'Agadir', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(3, 1, '', 'Al Hoceïma', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(4, 1, '', 'Béni Mellal', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(5, 1, '', 'El Jadida', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(6, 1, '', 'Errachidia', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(7, 1, '', 'Fès', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(8, 1, '', 'Kénitra', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(9, 1, '', 'Khénifra', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(10, 1, '', 'Khouribga', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(11, 1, '', 'Larache', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(12, 1, '', 'Marrakech', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(13, 1, '', 'Meknès', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(14, 1, '', 'Nador', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(15, 1, '', 'Ouarzazate', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(16, 1, '', 'Oujda', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(17, 1, '', 'Rabat', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(18, 1, '', 'Safi', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(19, 1, '', 'Settat', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(20, 1, '', 'Salé', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(21, 1, '', 'Tanger', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(22, 1, '', 'Taza', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05'),
(23, 1, '', 'Tétouan', NULL, NULL, '2019-02-14 13:21:05', '2019-02-14 13:21:05');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_email_unique` (`email`);

--
-- Index pour la table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `equipements`
--
ALTER TABLE `equipements`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gyms`
--
ALTER TABLE `gyms`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT pour la table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `equipements`
--
ALTER TABLE `equipements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gyms`
--
ALTER TABLE `gyms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `trainers`
--
ALTER TABLE `trainers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
