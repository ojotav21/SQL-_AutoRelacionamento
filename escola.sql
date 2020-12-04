-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Dez-2020 às 16:53
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola`
--
CREATE DATABASE IF NOT EXISTS `escola` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `escola`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE `cargo` (
  `codCargo` int(11) NOT NULL,
  `cargo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`codCargo`, `cargo`) VALUES
(1, 'Professor'),
(2, 'Coordenador RH'),
(3, 'Coordenador Ensino Médio'),
(4, 'Coordenador ETIM-Info'),
(5, 'Coordenador ETIM-ADM'),
(6, 'Coordenador Banco de Dados'),
(7, 'Coordenador Pedagógico '),
(15, 'Biblioteca Ativa ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargofuncionario`
--

CREATE TABLE `cargofuncionario` (
  `codFunc` int(11) NOT NULL,
  `codCargo` int(11) NOT NULL,
  `dataEntradaCargo` date NOT NULL,
  `dataSaidaCargo` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargofuncionario`
--

INSERT INTO `cargofuncionario` (`codFunc`, `codCargo`, `dataEntradaCargo`, `dataSaidaCargo`) VALUES
(1, 1, '2011-10-07', NULL),
(1, 3, '2011-11-07', NULL),
(1, 7, '2012-09-07', NULL),
(7, 1, '2008-03-07', NULL),
(7, 4, '2019-06-20', NULL),
(4, 1, '2014-08-04', NULL),
(4, 2, '2019-07-07', NULL),
(4, 3, '2015-07-08', NULL),
(4, 7, '2012-09-07', NULL),
(4, 15, '2018-04-02', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `codFunc` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `dataEntrada` date NOT NULL,
  `dataSaida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`codFunc`, `nome`, `dataEntrada`, `dataSaida`) VALUES
(1, 'Amanda', '2011-10-07', NULL),
(3, 'Andershow', '2006-11-05', NULL),
(4, 'Agda', '2014-08-04', NULL),
(7, 'Carlos ', '2008-03-07', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`codCargo`);

--
-- Índices para tabela `cargofuncionario`
--
ALTER TABLE `cargofuncionario`
  ADD KEY `codCargo` (`codCargo`),
  ADD KEY `codFunc` (`codFunc`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`codFunc`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cargo`
--
ALTER TABLE `cargo`
  MODIFY `codCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `codFunc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cargofuncionario`
--
ALTER TABLE `cargofuncionario`
  ADD CONSTRAINT `cargofuncionario_ibfk_1` FOREIGN KEY (`codCargo`) REFERENCES `cargo` (`codCargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cargofuncionario_ibfk_2` FOREIGN KEY (`codFunc`) REFERENCES `funcionario` (`codFunc`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
