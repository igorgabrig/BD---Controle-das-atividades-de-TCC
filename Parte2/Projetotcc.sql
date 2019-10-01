CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `alu_ra` int(11) NOT NULL,
  `alu_nome` varchar(45) NOT NULL,
  `alu_email` varchar(45) NOT NULL,
  `cur_codigo` int(11) NOT NULL,
  PRIMARY KEY (`alu_ra`),
  KEY `fk_aluno_curso1_idx` (`cur_codigo`),
  CONSTRAINT `fk_aluno_curso1` FOREIGN KEY (`cur_codigo`) REFERENCES `curso` (`cur_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'Tyrion Lannister','tyrionlannister@gmail.com',1),(2,'Clark Kent','clarkkent@hotmail.com',2),(3,'Tony Stark','tonystark@outlook.com',3),(4,'Barry Allen','barryallen@hotmail.com',1),(5,'Ragnar Lothbrook','ragnarlothbrook@gmail.com',6),(6,'Jon Snow','jonsnow@gmail.com',1),(7,'Arya Stark','aryastark@hotmail.com',7),(8,'Cersei Lannister','cerseilannister@uol.com',4);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banca`
--

DROP TABLE IF EXISTS `banca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banca` (
  `tcc_etapa` varchar(5) NOT NULL,
  `alu_ra` int(11) NOT NULL,
  `ban_data` datetime NOT NULL,
  `sal_codigo` int(11) NOT NULL,
  `pro_siape_orientador` int(11) NOT NULL,
  `pro_siape_membro1` int(11) NOT NULL,
  `pro_siape_membro2` int(11) NOT NULL,
  PRIMARY KEY (`tcc_etapa`,`alu_ra`),
  KEY `fk_banca_sala1_idx` (`sal_codigo`),
  KEY `fk_banca_professor1_idx` (`pro_siape_orientador`),
  KEY `fk_banca_professor2_idx` (`pro_siape_membro1`),
  KEY `fk_banca_professor3_idx` (`pro_siape_membro2`),
  CONSTRAINT `fk_banca_professor1` FOREIGN KEY (`pro_siape_orientador`) REFERENCES `professor` (`pro_siape`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_banca_professor2` FOREIGN KEY (`pro_siape_membro1`) REFERENCES `professor` (`pro_siape`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_banca_professor3` FOREIGN KEY (`pro_siape_membro2`) REFERENCES `professor` (`pro_siape`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_banca_sala1` FOREIGN KEY (`sal_codigo`) REFERENCES `sala` (`sal_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_banca_tcc1` FOREIGN KEY (`tcc_etapa`, `alu_ra`) REFERENCES `tcc` (`tcc_etapa`, `alu_ra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banca`
--

LOCK TABLES `banca` WRITE;
/*!40000 ALTER TABLE `banca` DISABLE KEYS */;
INSERT INTO `banca` VALUES ('TCC1',1,'2016-12-07 12:00:00',2,2,1,5),('TCC1',4,'2017-06-29 08:00:00',4,4,3,7),('TCC1',6,'2016-12-08 09:00:00',3,2,7,6),('TCC2',2,'2017-07-04 18:00:00',1,3,6,4),('TCC2',3,'2015-07-21 17:30:00',3,5,1,6),('TCC2',5,'2014-11-07 07:00:00',4,7,4,5);
/*!40000 ALTER TABLE `banca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreira`
--

DROP TABLE IF EXISTS `carreira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carreira` (
  `car_codigo` int(11) NOT NULL,
  `car_descricao` varchar(45) NOT NULL,
  `car_sigla` varchar(45) NOT NULL,
  PRIMARY KEY (`car_codigo`),
  UNIQUE KEY `car_sigla_UNIQUE` (`car_sigla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreira`
--

LOCK TABLES `carreira` WRITE;
/*!40000 ALTER TABLE `carreira` DISABLE KEYS */;
INSERT INTO `carreira` VALUES (1,'Ensino Básico, Técnico e Tecnológico','EBTT'),(2,'Magistério Superior','MS');
/*!40000 ALTER TABLE `carreira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `cur_codigo` int(11) NOT NULL,
  `cur_nome` varchar(45) NOT NULL,
  `dep_codigo` int(11) NOT NULL,
  PRIMARY KEY (`cur_codigo`),
  KEY `fk_curso_departamento_idx` (`dep_codigo`),
  CONSTRAINT `fk_curso_departamento` FOREIGN KEY (`dep_codigo`) REFERENCES `departamento` (`dep_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Bacharelado em Engenharia de Software',1),(2,'Engenharia da Computação',1),(3,'Engenharia de Controle e Automação',3),(4,'Analise e Desenvolvimento de Sistema',1),(5,'Licenciatura em Matemática',4),(6,'Engenharia Eletrônica',2),(7,'Engenharia Mecânica',3);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `dep_codigo` int(11) NOT NULL,
  `dep_nome` varchar(45) NOT NULL,
  `dep_sigla` varchar(45) NOT NULL,
  PRIMARY KEY (`dep_codigo`),
  UNIQUE KEY `dep_nome_UNIQUE` (`dep_nome`),
  UNIQUE KEY `dep_sigla_UNIQUE` (`dep_sigla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Departamento Acadêmico de Computação','DACOM'),(2,'Departamento Acadêmico de Elétrica','DAELE'),(3,'Departamento Acadêmico de Mecânica','DAMEC'),(4,'Departamento Acadêmico de Matemática','DAMAT');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linha`
--

DROP TABLE IF EXISTS `linha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linha` (
  `lin_codigo` int(11) NOT NULL,
  `lin_descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`lin_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linha`
--

LOCK TABLES `linha` WRITE;
/*!40000 ALTER TABLE `linha` DISABLE KEYS */;
INSERT INTO `linha` VALUES (1,'Engenharia de Software'),(2,'Sistemas Web e Multimídia Interativos'),(3,'Biologia Computacional e Sistêmica'),(4,'Processamento e Análise de Imagens'),(5,'Recuperação de Dados Complexos');
/*!40000 ALTER TABLE `linha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesquisa`
--

DROP TABLE IF EXISTS `pesquisa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesquisa` (
  `pro_siape` int(11) NOT NULL,
  `lin_codigo` int(11) NOT NULL,
  PRIMARY KEY (`pro_siape`,`lin_codigo`),
  KEY `fk_professor_has_linha_de_pesquisa_linha_de_pesquisa1_idx` (`lin_codigo`),
  KEY `fk_professor_has_linha_de_pesquisa_professor1_idx` (`pro_siape`),
  CONSTRAINT `fk_professor_has_linha_de_pesquisa_linha_de_pesquisa1` FOREIGN KEY (`lin_codigo`) REFERENCES `linha` (`lin_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_has_linha_de_pesquisa_professor1` FOREIGN KEY (`pro_siape`) REFERENCES `professor` (`pro_siape`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesquisa`
--

LOCK TABLES `pesquisa` WRITE;
/*!40000 ALTER TABLE `pesquisa` DISABLE KEYS */;
INSERT INTO `pesquisa` VALUES (1,1),(7,1),(5,2),(4,3),(6,3),(2,4),(3,4),(1,5);
/*!40000 ALTER TABLE `pesquisa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predio`
--

DROP TABLE IF EXISTS `predio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `predio` (
  `pre_codigo` int(11) NOT NULL,
  `pre_nome` varchar(45) NOT NULL,
  PRIMARY KEY (`pre_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predio`
--

LOCK TABLES `predio` WRITE;
/*!40000 ALTER TABLE `predio` DISABLE KEYS */;
INSERT INTO `predio` VALUES (1,'I'),(2,'A'),(3,'K'),(4,'P'),(5,'G'),(6,'H');
/*!40000 ALTER TABLE `predio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `pro_siape` int(11) NOT NULL,
  `pro_nome` varchar(45) NOT NULL,
  `dep_codigo` int(11) DEFAULT NULL,
  `tit_codigo` int(11) NOT NULL,
  `car_codigo` int(11) NOT NULL,
  PRIMARY KEY (`pro_siape`),
  KEY `fk_professor_departamento1_idx` (`dep_codigo`),
  KEY `fk_professor_titulacao1_idx` (`tit_codigo`),
  KEY `fk_professor_carreira1_idx` (`car_codigo`),
  CONSTRAINT `fk_professor_carreira1` FOREIGN KEY (`car_codigo`) REFERENCES `carreira` (`car_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_departamento1` FOREIGN KEY (`dep_codigo`) REFERENCES `departamento` (`dep_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_titulacao1` FOREIGN KEY (`tit_codigo`) REFERENCES `titulacao` (`tit_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'Valéria Shitre',1,3,2),(2,'Charles Xavier',1,2,2),(3,'Lilian Silva',2,1,1),(4,'Pedro Fenix',4,4,1),(5,'Carmem Lucia',3,4,1),(6,'Shirley Terezinha',2,1,2),(7,'Valter Souza Santos',3,3,2);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sala` (
  `sal_codigo` int(11) NOT NULL,
  `pre_codigo` int(11) NOT NULL,
  PRIMARY KEY (`sal_codigo`),
  KEY `fk_sala_predio1_idx` (`pre_codigo`),
  CONSTRAINT `fk_sala_predio1` FOREIGN KEY (`pre_codigo`) REFERENCES `predio` (`pre_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,1),(2,1),(6,2),(5,3),(3,4),(4,4);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcc`
--

DROP TABLE IF EXISTS `tcc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcc` (
  `tcc_etapa` varchar(5) NOT NULL,
  `alu_ra` int(11) NOT NULL,
  `tcc_titulo` varchar(45) NOT NULL,
  `tcc_inicio` date NOT NULL,
  `tcc_conclusao` date DEFAULT NULL,
  `tcc_nota` decimal(4,2) DEFAULT NULL,
  `lin_codigo` int(11) NOT NULL,
  `pro_siape_orientador` int(11) NOT NULL,
  `pro_siape_coorientador` int(11) DEFAULT NULL,
  PRIMARY KEY (`tcc_etapa`,`alu_ra`),
  KEY `fk_tcc_aluno1_idx` (`alu_ra`),
  KEY `fk_tcc_linha_de_pesquisa1_idx` (`lin_codigo`),
  KEY `fk_tcc_professor1_idx` (`pro_siape_orientador`),
  KEY `fk_tcc_professor2_idx` (`pro_siape_coorientador`),
  CONSTRAINT `fk_tcc_aluno1` FOREIGN KEY (`alu_ra`) REFERENCES `aluno` (`alu_ra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tcc_linha_de_pesquisa1` FOREIGN KEY (`lin_codigo`) REFERENCES `linha` (`lin_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tcc_professor1` FOREIGN KEY (`pro_siape_orientador`) REFERENCES `professor` (`pro_siape`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tcc_professor2` FOREIGN KEY (`pro_siape_coorientador`) REFERENCES `professor` (`pro_siape`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcc`
--

LOCK TABLES `tcc` WRITE;
/*!40000 ALTER TABLE `tcc` DISABLE KEYS */;
INSERT INTO `tcc` VALUES ('TCC1',1,'Implementação de uma interface','2016-06-01','2016-12-07',8.40,5,2,NULL),('TCC1',4,'Implementação de um software para imagens','2017-02-19','2017-06-29',NULL,4,1,2),('TCC1',6,'Ferramenta de construção de softwares','2016-06-01','2016-12-08',5.90,1,2,NULL),('TCC1',7,'Software de recuparação profunda','2015-02-06','2015-07-20',7.40,5,4,6),('TCC2',2,'Ferramenta computacional de gestão Web','2017-02-19','2017-07-04',NULL,2,3,6),('TCC2',3,'Rede de sensores para o monitoramento','2015-02-06','2015-07-21',3.50,1,5,NULL),('TCC2',5,'Planejamento de sistemas Biologicos','2016-02-08','2016-07-10',10.00,3,7,NULL),('TCC2',8,'Protótipo de edição de imagem','2017-08-10','2017-12-10',NULL,4,7,NULL);
/*!40000 ALTER TABLE `tcc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulacao`
--

DROP TABLE IF EXISTS `titulacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulacao` (
  `tit_codigo` int(11) NOT NULL,
  `tit_descrição` varchar(45) NOT NULL,
  PRIMARY KEY (`tit_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulacao`
--

LOCK TABLES `titulacao` WRITE;
/*!40000 ALTER TABLE `titulacao` DISABLE KEYS */;
INSERT INTO `titulacao` VALUES (1,'Bacharelado'),(2,'Mestrado'),(3,'Doutorado'),(4,'Especialização');
/*!40000 ALTER TABLE `titulacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-20 16:04:42
