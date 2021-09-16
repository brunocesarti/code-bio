-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 15-Set-2021 às 22:55
-- Versão do servidor: 8.0.26-0ubuntu0.20.04.2
-- versão do PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `codebio`
--
CREATE DATABASE IF NOT EXISTS `codebio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `codebio`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `deposito`
--

CREATE TABLE `deposito` (
  `id` int NOT NULL,
  `conta` int NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `moeda` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `deposito`
--

INSERT INTO `deposito` (`id`, `conta`, `valor`, `moeda`, `data`) VALUES
(5, 1, '2500', 'BRL', '2021-09-15 17:03:57'),
(6, 1, '50', 'BRL', '2021-09-15 18:05:49'),
(7, 1, '3000', 'BRL', '2021-09-15 18:06:03'),
(8, 1, '4000', 'BRL', '2021-09-15 18:06:34'),
(9, 2, '200', 'BRL', '2021-09-15 19:59:59'),
(10, 2, '5000', 'AUD', '2021-09-15 20:01:09'),
(11, 1, '50000', 'AUD', '2021-09-15 20:33:32');

-- --------------------------------------------------------

--
-- Estrutura da tabela `saldo`
--

CREATE TABLE `saldo` (
  `id` int NOT NULL,
  `conta` int NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `moeda` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `operacao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `saldo`
--

INSERT INTO `saldo` (`id`, `conta`, `valor`, `moeda`, `data`, `operacao`) VALUES
(6, 1, '2500', 'BRL', '2021-09-15 17:03:57', 'deposito'),
(8, 1, '-150', 'BRL', '2021-09-15 19:08:30', 'saque'),
(9, 1, '-250', 'BRL', '2021-09-15 19:08:23', 'saque'),
(10, 1, '-500', 'BRL', '2021-09-15 19:08:12', 'saque'),
(11, 1, '50', 'BRL', '2021-09-15 19:07:35', 'deposito'),
(12, 1, '3000', 'BRL', '2021-09-15 18:06:03', 'deposito'),
(13, 1, '-2700', 'BRL', '2021-09-15 19:08:03', 'saque'),
(14, 1, '4000', 'BRL', '2021-09-15 18:06:34', 'deposito'),
(15, 1, '-300', 'BRL', '2021-09-15 19:05:50', 'saque'),
(16, 1, '-350', 'BRL', '2021-09-15 19:05:47', 'saque'),
(17, 1, '-381', 'BRL', '2021-09-15 19:05:43', 'saque'),
(18, 1, '-200', 'BRL', '2021-09-15 19:05:31', 'saque'),
(19, 2, '200', 'BRL', '2021-09-15 19:59:59', 'deposito'),
(20, 2, '-50', 'BRL', '2021-09-15 20:00:28', 'saque'),
(21, 2, '5000', 'AUD', '2021-09-15 20:01:09', 'deposito'),
(22, 2, '-500', 'AUD', '2021-09-15 20:01:22', 'saque'),
(23, 1, '50000', 'AUD', '2021-09-15 20:33:32', 'deposito'),
(24, 1, '-500', 'AUD', '2021-09-15 20:33:59', 'saque');

-- --------------------------------------------------------

--
-- Estrutura da tabela `saque`
--

CREATE TABLE `saque` (
  `id` int NOT NULL,
  `conta` int NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `moeda` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `saque`
--

INSERT INTO `saque` (`id`, `conta`, `valor`, `moeda`, `data`) VALUES
(5, 1, '150', 'BRL', '2021-09-15 18:05:05'),
(6, 1, '250', 'BRL', '2021-09-15 18:05:25'),
(7, 1, '500', 'BRL', '2021-09-15 18:05:31'),
(8, 1, '2700', 'BRL', '2021-09-15 18:06:18'),
(9, 1, '-300', 'BRL', '2021-09-15 18:23:51'),
(10, 1, '350', 'BRL', '2021-09-15 18:27:13'),
(11, 1, '350', 'BRL', '2021-09-15 18:27:25'),
(12, 1, '381', 'BRL', '2021-09-15 18:29:27'),
(13, 1, '200', 'BRL', '2021-09-15 19:01:07'),
(14, 2, '50', 'BRL', '2021-09-15 20:00:28'),
(15, 2, '500', 'AUD', '2021-09-15 20:01:22'),
(16, 1, '500', 'AUD', '2021-09-15 20:33:59');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `deposito`
--
ALTER TABLE `deposito`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `saldo`
--
ALTER TABLE `saldo`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `saque`
--
ALTER TABLE `saque`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `deposito`
--
ALTER TABLE `deposito`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `saldo`
--
ALTER TABLE `saldo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `saque`
--
ALTER TABLE `saque`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
