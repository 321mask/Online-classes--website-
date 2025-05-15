-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 15, 2025 at 09:53 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `formation_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int NOT NULL,
  `quizId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `answer` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `quizId`, `userId`, `answer`, `createdAt`, `updatedAt`) VALUES
(2, 1, 6, 'd', '2025-04-28 09:59:41', '2025-04-28 09:59:41'),
(3, 1, 6, 'd', '2025-05-05 09:23:35', '2025-05-05 09:23:35'),
(4, 2, 6, 'Good', '2025-05-05 09:23:35', '2025-05-05 09:23:35'),
(5, 1, 6, 'd', '2025-05-05 09:32:07', '2025-05-05 09:32:07'),
(6, 2, 6, 'Good', '2025-05-05 09:32:07', '2025-05-05 09:32:07'),
(7, 1, 6, 'd', '2025-05-05 13:23:06', '2025-05-05 13:23:06'),
(8, 2, 6, 'Good', '2025-05-05 13:23:06', '2025-05-05 13:23:06'),
(9, 1, 6, 'd', '2025-05-05 13:23:28', '2025-05-05 13:23:28'),
(10, 2, 6, 'Good', '2025-05-05 13:23:28', '2025-05-05 13:23:28'),
(11, 1, 6, 'd', '2025-05-05 13:25:18', '2025-05-05 13:25:18'),
(12, 2, 6, 'Good', '2025-05-05 13:25:18', '2025-05-05 13:25:18'),
(13, 1, 6, 'd', '2025-05-05 13:28:53', '2025-05-05 13:28:53'),
(14, 2, 6, 'Good', '2025-05-05 13:28:53', '2025-05-05 13:28:53'),
(15, 1, 7, 'd', '2025-05-15 09:24:26', '2025-05-15 09:24:26'),
(16, 2, 7, 'Good', '2025-05-15 09:24:26', '2025-05-15 09:24:26'),
(17, 1, 7, 'd', '2025-05-15 09:33:11', '2025-05-15 09:33:11'),
(18, 2, 7, 'Good', '2025-05-15 09:33:11', '2025-05-15 09:33:11'),
(19, 1, 7, 'd', '2025-05-15 09:38:40', '2025-05-15 09:38:40'),
(20, 2, 7, 'Good', '2025-05-15 09:38:40', '2025-05-15 09:38:40'),
(21, 1, 7, 'd', '2025-05-15 09:43:35', '2025-05-15 09:43:35'),
(22, 2, 7, 'Good', '2025-05-15 09:43:35', '2025-05-15 09:43:35'),
(23, 1, 7, 'd', '2025-05-15 09:48:12', '2025-05-15 09:48:12'),
(24, 2, 7, 'Good', '2025-05-15 09:48:12', '2025-05-15 09:48:12'),
(25, 1, 7, 'd', '2025-05-15 09:50:06', '2025-05-15 09:50:06'),
(26, 2, 7, 'Good', '2025-05-15 09:50:06', '2025-05-15 09:50:06');

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `quizId` int NOT NULL,
  `score` int NOT NULL,
  `dateIssued` datetime DEFAULT NULL,
  `certificateUrl` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `userId`, `quizId`, `score`, `dateIssued`, `certificateUrl`, `createdAt`, `updatedAt`) VALUES
(1, 7, 1, 2, '2025-05-15 09:33:11', NULL, '2025-05-15 09:33:11', '2025-05-15 09:33:11'),
(2, 7, 1, 2, '2025-05-15 09:38:40', NULL, '2025-05-15 09:38:40', '2025-05-15 09:38:40'),
(3, 7, 1, 2, '2025-05-15 09:43:35', NULL, '2025-05-15 09:43:35', '2025-05-15 09:43:35'),
(4, 7, 1, 2, '2025-05-15 09:48:12', NULL, '2025-05-15 09:48:12', '2025-05-15 09:48:12'),
(5, 7, 1, 2, '2025-05-15 09:50:06', NULL, '2025-05-15 09:50:06', '2025-05-15 09:50:06');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `description` text NOT NULL,
  `trainerId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `files` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `content`, `description`, `trainerId`, `createdAt`, `updatedAt`, `files`) VALUES
(1, 'Course 1', '', 'test', NULL, '2025-04-24 09:34:29', '2025-04-24 09:34:29', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` int NOT NULL,
  `score` int NOT NULL,
  `feedbackMessage` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `quizId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `score`, `feedbackMessage`, `userId`, `quizId`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Bien joué, mais il y a encore de la place pour l\'amélioration.', 6, 1, '2025-05-05 09:32:07', '2025-05-05 09:32:07'),
(2, 2, 'Excellent travail! Vous avez un score parfait!', 6, 1, '2025-05-05 09:32:07', '2025-05-05 09:32:07'),
(3, 1, 'Bien joué, mais il y a encore de la place pour l\'amélioration.', 6, 1, '2025-05-05 13:23:06', '2025-05-05 13:23:06'),
(4, 2, 'Excellent travail! Vous avez un score parfait!', 6, 1, '2025-05-05 13:23:06', '2025-05-05 13:23:06'),
(5, 1, 'Bien joué, mais il y a encore de la place pour l\'amélioration.', 6, 1, '2025-05-05 13:23:28', '2025-05-05 13:23:28'),
(6, 2, 'Excellent travail! Vous avez un score parfait!', 6, 1, '2025-05-05 13:23:28', '2025-05-05 13:23:28'),
(7, 1, 'Bien joué, mais il y a encore de la place pour l\'amélioration.', 6, 1, '2025-05-05 13:25:18', '2025-05-05 13:25:18'),
(8, 2, 'Excellent travail! Vous avez un score parfait!', 6, 1, '2025-05-05 13:25:18', '2025-05-05 13:25:18'),
(9, 2, 'Excellent travail! Vous avez un score parfait!', 6, 1, '2025-05-05 13:28:53', '2025-05-05 13:28:53'),
(10, 2, 'Excellent travail! Vous avez un score parfait!', 7, 1, '2025-05-15 09:33:11', '2025-05-15 09:33:11'),
(11, 2, 'Excellent travail! Vous avez un score parfait!', 7, 1, '2025-05-15 09:38:40', '2025-05-15 09:38:40'),
(12, 2, 'Excellent travail! Vous avez un score parfait!', 7, 1, '2025-05-15 09:43:35', '2025-05-15 09:43:35'),
(13, 2, 'Excellent travail! Vous avez un score parfait!', 7, 1, '2025-05-15 09:48:12', '2025-05-15 09:48:12'),
(14, 2, 'Excellent travail! Vous avez un score parfait!', 7, 1, '2025-05-15 09:50:06', '2025-05-15 09:50:06');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int NOT NULL,
  `courseId` int DEFAULT NULL,
  `question` text NOT NULL,
  `options` json NOT NULL,
  `correctAnswer` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `courseId`, `question`, `options`, `correctAnswer`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'gg', '[\"dff\", \"d\", \"f\", \"g\"]', 'd', '2025-04-28 07:13:23', '2025-04-28 07:13:23'),
(2, 1, 'How are you?', '[\"Great\", \"Good\", \"So so\", \"Bad\"]', 'Good', '2025-05-05 09:23:17', '2025-05-05 09:23:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','trainer','student') DEFAULT 'student',
  `validated` tinyint(1) DEFAULT '0',
  `token` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `validated`, `token`, `createdAt`, `updatedAt`) VALUES
(2, 'Teacher Arseny', 'test2@test.fr', '$2b$10$hrRrRERZq05gbmQQFeij6.Fs/yRkDKtZ.OMHMkJtbRmISUJe2.JuW', 'trainer', 0, '4f02b763-b6fb-4061-a996-afd5e06b4a70', '2025-04-18 09:05:07', '2025-04-24 08:36:37'),
(3, 'test3', 'test3@test.fr', '$2b$10$TRTxrPRezNrxuW3TNahEUeyq7xWfA/FVejPD3QKQwwNMkTgQ1/Wsu', 'student', 1, '34bc9955-dc4b-4173-a276-890ee6ec3f11', '2025-04-18 09:13:11', '2025-04-25 09:09:38'),
(4, 'teacher2', 'testTeacher2@test.fr', '$2b$10$KXUx0eiKgqBhaKx5kwqgju2vhaY2tVQ3NesPz20rHYeaEXm3Jop7y', 'student', 0, '1da2c12e-b7c8-4221-aa61-354271f1c4e9', '2025-04-18 09:26:59', '2025-04-18 09:26:59'),
(5, 'teacher3', 'testTeacher3@test.fr', 't', 'trainer', 1, 'bf523c07-bb58-4dce-8524-5859754098f0', '2025-04-18 09:31:56', '2025-04-18 13:13:00'),
(6, 'Arseny', 'test4@test.fr', '$2b$10$wyx/kD/lUFzglXIKU/1rJO2wqD1gVoGFG72Z/s85w6zol6vyRMKOi', 'trainer', 1, '5b999381-df8c-4861-83e9-b04aec605a3d', '2025-04-24 08:46:04', '2025-04-28 09:18:07'),
(7, 'Arseny', 'admin@admin.com', '$2b$10$uewHxWK6hzsi.dp4eLsdweBwFaTv8gurqxMf17jqjUSM8aRMg9srK', 'admin', 1, '42c625fd-7eda-4166-b6ce-9783ca177530', '2025-04-24 09:39:20', '2025-05-15 08:46:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quizId` (`quizId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `quizId` (`quizId`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trainerId` (`trainerId`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD UNIQUE KEY `email_3` (`email`),
  ADD UNIQUE KEY `email_4` (`email`),
  ADD UNIQUE KEY `email_5` (`email`),
  ADD UNIQUE KEY `email_6` (`email`),
  ADD UNIQUE KEY `email_7` (`email`),
  ADD UNIQUE KEY `email_8` (`email`),
  ADD UNIQUE KEY `email_9` (`email`),
  ADD UNIQUE KEY `email_10` (`email`),
  ADD UNIQUE KEY `email_11` (`email`),
  ADD UNIQUE KEY `email_12` (`email`),
  ADD UNIQUE KEY `email_13` (`email`),
  ADD UNIQUE KEY `email_14` (`email`),
  ADD UNIQUE KEY `email_15` (`email`),
  ADD UNIQUE KEY `email_16` (`email`),
  ADD UNIQUE KEY `email_17` (`email`),
  ADD UNIQUE KEY `email_18` (`email`),
  ADD UNIQUE KEY `email_19` (`email`),
  ADD UNIQUE KEY `email_20` (`email`),
  ADD UNIQUE KEY `email_21` (`email`),
  ADD UNIQUE KEY `email_22` (`email`),
  ADD UNIQUE KEY `email_23` (`email`),
  ADD UNIQUE KEY `email_24` (`email`),
  ADD UNIQUE KEY `email_25` (`email`),
  ADD UNIQUE KEY `email_26` (`email`),
  ADD UNIQUE KEY `email_27` (`email`),
  ADD UNIQUE KEY `email_28` (`email`),
  ADD UNIQUE KEY `email_29` (`email`),
  ADD UNIQUE KEY `email_30` (`email`),
  ADD UNIQUE KEY `email_31` (`email`),
  ADD UNIQUE KEY `email_32` (`email`),
  ADD UNIQUE KEY `email_33` (`email`),
  ADD UNIQUE KEY `email_34` (`email`),
  ADD UNIQUE KEY `email_35` (`email`),
  ADD UNIQUE KEY `email_36` (`email`),
  ADD UNIQUE KEY `email_37` (`email`),
  ADD UNIQUE KEY `email_38` (`email`),
  ADD UNIQUE KEY `email_39` (`email`),
  ADD UNIQUE KEY `email_40` (`email`),
  ADD UNIQUE KEY `email_41` (`email`),
  ADD UNIQUE KEY `email_42` (`email`),
  ADD UNIQUE KEY `email_43` (`email`),
  ADD UNIQUE KEY `email_44` (`email`),
  ADD UNIQUE KEY `email_45` (`email`),
  ADD UNIQUE KEY `email_46` (`email`),
  ADD UNIQUE KEY `email_47` (`email`),
  ADD UNIQUE KEY `email_48` (`email`),
  ADD UNIQUE KEY `email_49` (`email`),
  ADD UNIQUE KEY `email_50` (`email`),
  ADD UNIQUE KEY `email_51` (`email`),
  ADD UNIQUE KEY `email_52` (`email`),
  ADD UNIQUE KEY `email_53` (`email`),
  ADD UNIQUE KEY `email_54` (`email`),
  ADD UNIQUE KEY `email_55` (`email`),
  ADD UNIQUE KEY `email_56` (`email`),
  ADD UNIQUE KEY `email_57` (`email`),
  ADD UNIQUE KEY `email_58` (`email`),
  ADD UNIQUE KEY `email_59` (`email`),
  ADD UNIQUE KEY `email_60` (`email`),
  ADD UNIQUE KEY `email_61` (`email`),
  ADD UNIQUE KEY `email_62` (`email`),
  ADD UNIQUE KEY `email_63` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_10` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `answers_ibfk_11` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_12` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `answers_ibfk_13` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_14` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `answers_ibfk_15` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_16` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `answers_ibfk_17` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_18` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `answers_ibfk_19` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `answers_ibfk_20` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_21` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_22` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_23` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_24` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_25` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_26` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_27` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_28` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_29` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_3` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_30` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_31` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_32` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_33` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_34` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_35` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_36` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_37` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_38` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_39` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `answers_ibfk_40` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_41` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_42` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_43` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_44` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_45` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_46` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_47` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_48` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_49` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_5` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_50` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_51` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_52` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_53` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_54` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_55` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_56` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_57` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_58` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `answers_ibfk_7` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_8` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `answers_ibfk_9` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`);

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `certificates_ibfk_2` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `certificates_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `certificates_ibfk_4` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `certificates_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `certificates_ibfk_6` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_10` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_100` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_101` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_102` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_103` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_104` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_105` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_106` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_107` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_108` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_109` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_11` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_110` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_111` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_12` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_13` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_14` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_15` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_16` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_17` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_18` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_19` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_20` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_21` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_22` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_23` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_24` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_25` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_26` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_27` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_28` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_29` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_3` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_30` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_31` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_32` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_33` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_34` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_35` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_36` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_37` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_38` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_39` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_4` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_40` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_41` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_42` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_43` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_44` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_45` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_46` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_47` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_48` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_49` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_5` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_50` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_51` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_52` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_53` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_54` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_55` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_56` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_57` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_58` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_59` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_6` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_60` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_61` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_62` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_63` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_64` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_65` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_66` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_67` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_68` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_69` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_7` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_70` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_71` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_72` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_73` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_74` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_75` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_76` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_77` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_78` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_79` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_8` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_80` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_81` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_82` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_83` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_84` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_85` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_86` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_87` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_88` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_89` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_9` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_ibfk_90` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_91` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_92` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_93` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_94` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_95` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_96` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_97` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_98` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_99` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Courses_trainerId_foreign_idx` FOREIGN KEY (`trainerId`) REFERENCES `users` (`id`);

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_10` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_11` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_12` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_13` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_14` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_15` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_16` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_17` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_18` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_19` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_20` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_21` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_22` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_23` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_24` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_25` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_26` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_27` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_28` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_29` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_3` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_30` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_31` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_32` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_33` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_34` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_35` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_36` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_37` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_38` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_39` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_4` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_40` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_41` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_42` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_43` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_44` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_45` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_46` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_47` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_48` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_49` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_5` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_50` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_51` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_52` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_53` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_54` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_55` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_56` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_57` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_58` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_6` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_7` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_8` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_9` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
