-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para healthyia
DROP DATABASE IF EXISTS `healthyia`;
CREATE DATABASE IF NOT EXISTS `healthyia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `healthyia`;

-- Copiando estrutura para tabela healthyia.cadastro
DROP TABLE IF EXISTS `cadastro`;
CREATE TABLE IF NOT EXISTS `cadastro` (
  `id_cadastro` int(11) NOT NULL AUTO_INCREMENT,
  `nome_compl_user` varchar(200) NOT NULL,
  `email_user` varchar(200) NOT NULL,
  `senha_user` text NOT NULL,
  `dt_nasc_user` date NOT NULL,
  PRIMARY KEY (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela healthyia.cadastro: ~1 rows (aproximadamente)
DELETE FROM `cadastro`;
INSERT INTO `cadastro` (`id_cadastro`, `nome_compl_user`, `email_user`, `senha_user`, `dt_nasc_user`) VALUES
	(3, 'Lauane Pasquini', 'lauaneteste@hotmail.com', '855836516286ce0c5daee913e729626352d00c318a6c43d0a3a2d9f17ed17792', '0000-00-00');

-- Copiando estrutura para tabela healthyia.faleconosco
DROP TABLE IF EXISTS `faleconosco`;
CREATE TABLE IF NOT EXISTS `faleconosco` (
  `id_fale` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL DEFAULT '0',
  `nome` varchar(50) NOT NULL DEFAULT '0',
  `assunto` varchar(50) NOT NULL DEFAULT '0',
  `mensagem` text NOT NULL,
  PRIMARY KEY (`id_fale`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela healthyia.faleconosco: ~8 rows (aproximadamente)
DELETE FROM `faleconosco`;
INSERT INTO `faleconosco` (`id_fale`, `email`, `nome`, `assunto`, `mensagem`) VALUES
	(1, 'melissacgv1@gmail.com', 'Melissa Vieira', 'teste', 'Teste se esta funcionando o'),
	(2, 'melissacgv1@gmail.com', 'Melissa Vieira', 'teste', 'Teste se esta funcionando o'),
	(3, 'melissacgv1@gmail.com', 'Melissa Vieira', 'teste', 'Teste se esta funcionando o'),
	(4, 'melissacgv1@gmail.com', 'Melissa Vieira', 'teste', 'Teste se esta funcionando o'),
	(5, 'melissateste@hotmail', 'Melissa Vieira', 'tESTANDOOOO', 'Apenas testando a rota'),
	(6, 'melissacgv1@gmail.com', 'Melissa Vieira', 'teste', 'Teste se esta funcionando o'),
	(7, 'melissacgv1@gmail.com', 'Melissa Vieira', 'teste', 'Teste se esta funcionando o'),
	(8, 'melissacgv1@gmail.com', 'Melissa Vieira', 'teste', 'Teste se esta funcionando o');

-- Copiando estrutura para tabela healthyia.vagas
DROP TABLE IF EXISTS `vagas`;
CREATE TABLE IF NOT EXISTS `vagas` (
  `id_vaga` int(11) NOT NULL AUTO_INCREMENT,
  `nome_compl` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `qual_vaga` text NOT NULL,
  PRIMARY KEY (`id_vaga`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela healthyia.vagas: ~5 rows (aproximadamente)
DELETE FROM `vagas`;
INSERT INTO `vagas` (`id_vaga`, `nome_compl`, `email`, `qual_vaga`) VALUES
	(1, 'Melissa Vieira', 'melissateste@hottesteste', 'Para analise de sistemas'),
	(2, 'Lauane Pasquini ', 'lauanepasquini@gmail.com', 'Para teste de servidor'),
	(3, 'Lauane Pasquini ', 'lauanepasquini@gmail.com', 'Para teste de servidor'),
	(4, 'Lauane Pasquini ', 'lauanepasquini@gmail.com', 'Para teste de servidor'),
	(5, 'Lauane Pasquini ', '000000m', 'Para teste de servidor');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
