-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               5.1.72-community - MySQL Community Server (GPL)
-- Serwer OS:                    Win32
-- HeidiSQL Wersja:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Zrzut struktury bazy danych dondedb
CREATE DATABASE IF NOT EXISTS `dondedb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dondedb`;

-- Zrzut struktury tabela dondedb.budynki
CREATE TABLE IF NOT EXISTS `budynki` (
  `idBudynki` int(11) NOT NULL AUTO_INCREMENT,
  `NumerBudynku` int(11) NOT NULL,
  `AdresBudynku` varchar(300) NOT NULL,
  `OpisDodatkowy` varchar(500) DEFAULT NULL,
  `SzerokoscGeo` double NOT NULL DEFAULT '0',
  `DlugoscGeo` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`idBudynki`),
  UNIQUE KEY `NumerBudynku_UNIQUE` (`NumerBudynku`),
  UNIQUE KEY `idBudynki_UNIQUE` (`idBudynki`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Zrzucanie danych dla tabeli dondedb.budynki: ~3 rows (około)
/*!40000 ALTER TABLE `budynki` DISABLE KEYS */;
INSERT INTO `budynki` (`idBudynki`, `NumerBudynku`, `AdresBudynku`, `OpisDodatkowy`, `SzerokoscGeo`, `DlugoscGeo`) VALUES
	(1, 1, 'Żołnierska 49', 'Budynek 1', 53.4469984508702, 14.4923604099753),
	(2, 2, 'Zołnierska 52', 'Budynek 2', 53.4485036297864, 14.4912712726746),
	(3, 3, 'Wernyhory 17', 'Budynek 3', 53.4491958731394, 14.4961752740026);
/*!40000 ALTER TABLE `budynki` ENABLE KEYS */;

-- Zrzut struktury tabela dondedb.pietra
CREATE TABLE IF NOT EXISTS `pietra` (
  `idPietra` int(11) NOT NULL AUTO_INCREMENT,
  `NumerPietra` int(11) NOT NULL,
  `Budynki_idBudynki` int(11) NOT NULL,
  `PhotoUrl` varchar(300) NOT NULL,
  PRIMARY KEY (`idPietra`,`Budynki_idBudynki`),
  KEY `fk_Pietra_Budynki1_idx` (`Budynki_idBudynki`),
  CONSTRAINT `fk_Pietra_Budynki1` FOREIGN KEY (`Budynki_idBudynki`) REFERENCES `budynki` (`idBudynki`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Zrzucanie danych dla tabeli dondedb.pietra: ~10 rows (około)
/*!40000 ALTER TABLE `pietra` DISABLE KEYS */;
INSERT INTO `pietra` (`idPietra`, `NumerPietra`, `Budynki_idBudynki`, `PhotoUrl`) VALUES
	(1, -1, 1, 'upload/1_-1.svg'),
	(2, 0, 1, 'upload/1_0.svg'),
	(3, 1, 1, 'upload/1_1.svg'),
	(4, 2, 1, 'upload/1_2.svg'),
	(5, 3, 1, 'empty'),
	(6, -1, 2, 'empty'),
	(7, 0, 2, 'upload/2_0.svg'),
	(8, 1, 2, 'upload/2_1.svg'),
	(9, 2, 2, 'empty'),
	(10, 3, 2, 'empty'),
	(11, 0, 3, 'upload/3_0.svg');
/*!40000 ALTER TABLE `pietra` ENABLE KEYS */;

-- Zrzut struktury tabela dondedb.pokoje
CREATE TABLE IF NOT EXISTS `pokoje` (
  `idPokoje` int(11) NOT NULL AUTO_INCREMENT,
  `NumerPokoju` varchar(4) NOT NULL,
  `TypPokoju` int(11) NOT NULL,
  `Pietra_idPietra` int(11) NOT NULL,
  PRIMARY KEY (`idPokoje`,`Pietra_idPietra`),
  KEY `fk_Pokoje_Pietra1_idx` (`Pietra_idPietra`),
  CONSTRAINT `fk_Pokoje_Pietra1` FOREIGN KEY (`Pietra_idPietra`) REFERENCES `pietra` (`idPietra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- Zrzucanie danych dla tabeli dondedb.pokoje: ~77 rows (około)
/*!40000 ALTER TABLE `pokoje` DISABLE KEYS */;
INSERT INTO `pokoje` (`idPokoje`, `NumerPokoju`, `TypPokoju`, `Pietra_idPietra`) VALUES
	(1, '104', 2, 3),
	(2, '20', 2, 2),
	(3, '107', 2, 3),
	(4, '107A', 2, 3),
	(5, '19', 2, 2),
	(6, '122', 2, 3),
	(7, '109', 2, 3),
	(8, '219', 2, 4),
	(9, '220', 2, 4),
	(10, '18', 2, 2),
	(11, '21', 2, 2),
	(12, '17', 2, 2),
	(13, '27', 2, 2),
	(14, '25', 2, 2),
	(15, '28', 2, 2),
	(16, '24', 2, 2),
	(17, '26', 2, 2),
	(18, '209', 2, 4),
	(19, '11A', 2, 2),
	(20, '104', 2, 8),
	(21, '111', 2, 8),
	(22, '115', 2, 8),
	(23, '103', 2, 8),
	(24, '118', 2, 8),
	(25, '114', 2, 8),
	(26, '110', 2, 8),
	(27, '105', 2, 8),
	(28, '102', 2, 8),
	(29, '113', 2, 8),
	(30, '116', 2, 8),
	(31, '212', 2, 9),
	(32, '214', 2, 9),
	(33, '204', 2, 9),
	(34, '203', 2, 9),
	(35, '219', 2, 9),
	(36, '205', 2, 9),
	(37, '218', 2, 9),
	(38, '213', 2, 9),
	(39, '220', 2, 9),
	(40, '215', 2, 9),
	(41, '217', 2, 9),
	(42, '318', 2, 10),
	(43, '202', 2, 9),
	(44, '227A', 2, 9),
	(45, '312', 2, 10),
	(46, '316', 2, 10),
	(47, '302', 2, 10),
	(48, '301', 2, 10),
	(49, '314', 2, 10),
	(50, '304', 2, 10),
	(51, '310', 2, 10),
	(52, '315', 2, 10),
	(53, '303', 2, 10),
	(54, '108', 2, 3),
	(55, '120', 2, 3),
	(56, '220B', 2, 4),
	(57, '104A', 2, 3),
	(58, '111', 2, 3),
	(59, '205', 2, 4),
	(60, '113', 2, 3),
	(61, '204A', 2, 4),
	(62, '224', 2, 4),
	(63, '115', 2, 3),
	(64, '119', 2, 3),
	(65, '117', 2, 3),
	(66, '118', 2, 3),
	(67, '203', 2, 4),
	(68, '212', 2, 4),
	(69, '110', 2, 3),
	(70, '201', 2, 4),
	(71, '225', 2, 4),
	(72, '227', 2, 4),
	(74, '309', 1, 5),
	(75, '13', 1, 1),
	(76, '200', 1, 4),
	(77, '215', 1, 4),
	(78, '11', 1, 1),
	(79, '10', 1, 7),
	(80, '11', 1, 7),
	(81, '17', 1, 7),
	(82, '25', 1, 7);
/*!40000 ALTER TABLE `pokoje` ENABLE KEYS */;

-- Zrzut struktury tabela dondedb.pracownicy
CREATE TABLE IF NOT EXISTS `pracownicy` (
  `idPracownicy` int(11) NOT NULL AUTO_INCREMENT,
  `Tytul` varchar(200) DEFAULT NULL,
  `Imie` varchar(45) DEFAULT NULL,
  `Nazwisko` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPracownicy`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- Zrzucanie danych dla tabeli dondedb.pracownicy: ~96 rows (około)
/*!40000 ALTER TABLE `pracownicy` DISABLE KEYS */;
INSERT INTO `pracownicy` (`idPracownicy`, `Tytul`, `Imie`, `Nazwisko`) VALUES
	(1, 'dr hab. inż.', 'Marcin', 'Pluciński'),
	(2, 'prof. dr hab.', 'Grigorij', 'Sklyar'),
	(3, 'dr hab. inż.', 'Przemysław', 'Klęsk'),
	(4, 'dr hab. inż.', 'Marcin', 'Korzeń '),
	(5, 'dr inż.', 'Sławomir', 'Jaszczak'),
	(6, 'dr', 'Jarosław', 'Woźniak'),
	(7, 'dr inż.', 'Aneta', 'Bera'),
	(8, 'dr inż.', 'Dariusz', 'Sychel'),
	(9, 'mgr inż.', 'Jacek', 'Klimaszewski'),
	(10, 'mgr inż.', 'Jan', 'Rodziewicz-Bielewicz'),
	(11, 'dr inż.', 'Wojciech', 'Sałabun'),
	(12, 'prof. dr hab. inż.', 'Andrzej', 'Piegat'),
	(13, 'dr inż.', 'Larisa', 'Dobryakova'),
	(14, 'dr inż.', 'Joanna', 'Kołodziejczyk'),
	(15, 'mgr inż.', 'Karina', 'Tomaszewska'),
	(16, 'inż.', 'Bartłomiej', 'Kizielewicz'),
	(17, 'dr', 'Joanna', 'Banaś'),
	(18, 'dr inż.', 'Anna', 'Barcz'),
	(19, 'dr inż.', 'Leszek', 'Drobiazgiewicz'),
	(20, 'dr', 'Małgorzata', 'Machowska-Szewczyk'),
	(21, 'dr', 'Małgorzata', 'Pelczar'),
	(22, 'dr inż.', 'Piotr', 'Piela'),
	(23, 'dr hab. inż.', 'Marek', 'Pałkowski'),
	(24, 'prof. dr hab. inż.', 'Włodzimierz', 'Bielecki'),
	(25, 'dr inż.', 'Agnieszka', 'Konys'),
	(26, 'dr inż.', 'Włodzimierz', 'Wysocki'),
	(27, 'dr', 'Łukasz', 'Radliński'),
	(28, 'dr inż.', 'Maciej', 'Poliwoda'),
	(29, 'dr inż.', 'Piotr', 'Błaszyński'),
	(30, 'dr hab. inż.', 'Tomasz', 'Hyla'),
	(31, 'dr hab. inż.', 'Jerzy', 'Pejaś'),
	(32, 'dr hab. inż.', 'Imed', 'El Fray'),
	(33, 'dr  inż.', 'Luiza', 'Fabisiak'),
	(34, 'mgr inż.', 'Maciej', 'Bartłomiejczyk'),
	(35, 'mgr inż.', 'Włodzimierz', 'Chocianowicz'),
	(36, 'mgr inż.', 'Łukasz', 'Cierocki'),
	(37, 'mgr inż.', 'Mateusz', 'Kłos'),
	(38, 'mgr inż.', 'Gerard', 'Wawrzyniak'),
	(39, 'dr. inż.', 'Krzysztof', 'Kraska'),
	(40, 'dr inż.', 'Mykhailo', 'Fedorov'),
	(41, 'mgr inż.', 'Sławomir', 'Wernikowski'),
	(42, 'dr inż.', 'Tomasz', 'Wierciński'),
	(43, 'dr inż.', 'Mirosław', 'Mościcki'),
	(44, 'prof. dr hab. inż.', 'Aleksandr', 'Cariow'),
	(45, 'dr', 'Dorota', 'Majorkowska-Mech'),
	(46, 'dr inż.', 'Janusz', 'Papliński'),
	(47, 'dr', 'Galina', 'Cariowa'),
	(48, 'dr inż.', 'Mirosław', 'Łazoryszczak'),
	(49, 'dr inż.', 'Tomasz', 'Mąka'),
	(50, 'dr hab. inż.', 'Grzegorz', 'Ulacha'),
	(51, 'dr hab. inż.', 'Piotr', 'Dziurzański'),
	(52, 'mgr inż.', 'Łukasz', 'Śmietanka'),
	(53, 'dr inż.', 'Mariusz', 'Kapruziak'),
	(54, 'dr inż.', 'Krzysztof', 'Makles'),
	(55, 'dr inż.', 'Magdalena', 'Szaber-Cybularczyk'),
	(56, 'dr inż.', 'Radosław', 'Maciaszczyk'),
	(57, 'dr inż.', 'Krzysztof', 'Bogusławski'),
	(58, 'dr inż.', 'Grzegorz', 'Śliwiński'),
	(59, 'dr inż.', 'Marek', 'Jaskuła'),
	(60, 'dr inż.', 'Maciej', 'Roszkowski'),
	(61, 'dr hab. inż. ', 'Paweł', 'Forczmański'),
	(62, 'dr inż.', 'Adam', 'Nowosielski'),
	(63, 'dr inż.', 'Edward', 'Półrolniczak'),
	(64, 'mgr inż.', 'Anton', 'Smoliński'),
	(65, 'mgr inż.', 'Michał', 'Kramarczyk'),
	(66, 'dr inż.', 'Krzysztof', 'Siedlecki'),
	(67, 'dr hab. inż.', 'Dariusz', 'Frejlichowski'),
	(68, 'dr hab. inż.', 'Anna', 'Lewandowska'),
	(69, 'dr hab. inż.', 'Krzysztof', 'Małecki'),
	(70, 'mgr inż.', 'Katarzyna', 'Gościewska'),
	(71, 'mgr inż.', 'Maja', 'Dziśko'),
	(72, 'dr hab. inż.', 'Radosław', 'Mantiuk'),
	(73, 'mgr inż.', 'Marek', 'Wernikowski'),
	(74, 'dr hab. inż.', 'Wojciech', 'Maleika'),
	(75, 'dr inż.', 'Andrzej', 'Łysko'),
	(76, 'dr inż.', 'Witold', 'Maćków'),
	(77, 'dr hab. inż.', 'Przemysław', 'Korytkowski'),
	(78, 'dr inż.', 'Dariusz', 'Burak'),
	(79, 'dr', 'Mirosława', 'Marciniak'),
	(80, 'dr inż.', 'Bartłomiej', 'Małachowski'),
	(81, 'dr inż.', 'Agnieszka', 'Olejnik-Krugły'),
	(82, 'dr inż.', 'Wiesław', 'Pietruszkiewicz'),
	(83, 'dr hab. inż.', 'Jarosław', 'Jankowski'),
	(84, 'dr hab. inż.', 'Piotr', 'Sulikowski'),
	(85, 'dr', 'Piotr', 'Buczyński'),
	(86, 'dr inż.', 'Artur', 'Karczmarczyk'),
	(87, 'mgr', 'Piotr', 'Bartków'),
	(88, 'mgr', 'Kamil', 'Bortko'),
	(89, 'mgr inż.', 'Patryk', 'Pazura'),
	(90, 'dr hab.', 'Izabela', 'Rejer'),
	(91, 'dr inż.', 'Michał', 'Twardochleb'),
	(92, 'dr hab.inż.', ' Przemysław', 'Różewski'),
	(93, 'dr hab.inż.', 'Leonard', 'Rozenberg'),
	(94, 'dr', 'Magdalena', 'Kieruzel'),
	(95, 'dr inż.', 'Tomasz', 'Lipczyński'),
	(96, 'mgr inż.', 'Marcin', 'Prys');
/*!40000 ALTER TABLE `pracownicy` ENABLE KEYS */;

-- Zrzut struktury tabela dondedb.pracownicy_w_pokoje
CREATE TABLE IF NOT EXISTS `pracownicy_w_pokoje` (
  `Pracownicy_idPracownicy` int(11) NOT NULL,
  `Pokoje_idPokoje` int(11) NOT NULL,
  PRIMARY KEY (`Pracownicy_idPracownicy`,`Pokoje_idPokoje`),
  KEY `fk_Pracownicy_has_Pokoje_Pokoje1_idx` (`Pokoje_idPokoje`),
  KEY `fk_Pracownicy_has_Pokoje_Pracownicy1_idx` (`Pracownicy_idPracownicy`),
  CONSTRAINT `fk_Pracownicy_has_Pokoje_Pokoje1` FOREIGN KEY (`Pokoje_idPokoje`) REFERENCES `pokoje` (`idPokoje`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pracownicy_has_Pokoje_Pracownicy1` FOREIGN KEY (`Pracownicy_idPracownicy`) REFERENCES `pracownicy` (`idPracownicy`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Zrzucanie danych dla tabeli dondedb.pracownicy_w_pokoje: ~102 rows (około)
/*!40000 ALTER TABLE `pracownicy_w_pokoje` DISABLE KEYS */;
INSERT INTO `pracownicy_w_pokoje` (`Pracownicy_idPracownicy`, `Pokoje_idPokoje`) VALUES
	(2, 1),
	(1, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 7),
	(9, 8),
	(10, 9),
	(11, 10),
	(12, 11),
	(13, 12),
	(14, 13),
	(16, 13),
	(17, 14),
	(18, 15),
	(22, 15),
	(19, 16),
	(20, 17),
	(21, 18),
	(22, 19),
	(23, 20),
	(27, 20),
	(24, 21),
	(25, 22),
	(29, 22),
	(33, 22),
	(26, 23),
	(41, 23),
	(28, 24),
	(39, 24),
	(42, 24),
	(30, 25),
	(76, 25),
	(31, 26),
	(32, 27),
	(35, 27),
	(38, 27),
	(34, 28),
	(36, 28),
	(37, 28),
	(40, 29),
	(43, 30),
	(44, 31),
	(45, 32),
	(46, 33),
	(47, 34),
	(48, 35),
	(49, 36),
	(50, 37),
	(56, 37),
	(51, 38),
	(52, 39),
	(53, 40),
	(55, 40),
	(54, 41),
	(58, 42),
	(57, 43),
	(59, 43),
	(60, 44),
	(61, 45),
	(62, 46),
	(64, 46),
	(68, 46),
	(63, 47),
	(65, 47),
	(66, 48),
	(70, 48),
	(73, 48),
	(67, 49),
	(69, 50),
	(71, 51),
	(72, 52),
	(74, 53),
	(75, 53),
	(77, 54),
	(78, 55),
	(79, 56),
	(80, 57),
	(81, 58),
	(82, 59),
	(96, 59),
	(83, 60),
	(84, 61),
	(85, 62),
	(86, 63),
	(87, 64),
	(88, 65),
	(89, 66),
	(90, 67),
	(91, 68),
	(92, 69),
	(93, 70),
	(94, 71),
	(95, 72),
	(4, 75),
	(86, 75),
	(17, 76),
	(17, 77),
	(41, 78),
	(78, 78);
/*!40000 ALTER TABLE `pracownicy_w_pokoje` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
