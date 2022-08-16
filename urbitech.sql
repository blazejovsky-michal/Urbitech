-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Úte 16. srp 2022, 17:16
-- Verze serveru: 10.4.24-MariaDB
-- Verze PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `urbitech`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `pages`
--

CREATE TABLE `pages` (
  `ID` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `property` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `text` varchar(2500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `pages`
--

INSERT INTO `pages` (`ID`, `date`, `property`, `name`, `text`) VALUES
(1, '2022-08-10', 'property 1', 'stranka 1', '<div class=\"table-container\">\r\n        <h3>Nejnovější příspěvky</h3>\r\n        <div class=\"row\">\r\n            <div class=\"info_box col\">\r\n                <h4>Název stránky</h4>\r\n                <p>Datum vytvoření stránky</p>\r\n                <p>Nějaký popi'),
(2, '2022-08-10', 'property 2property 2property 2property 2property 2', 'stranka 2', '<h1>Random Quote Generator</h1>\n<div class=\"white-box\">\n  <div class=\"quote\">\n    <i class=\"fa fa-quote-left fa-3x\"></i> \n    <p class=\"random-quote\"> <span id=\"text\"></span></p>\n  </div>\n  <div class=\"random-author\">- <span id=\"author\"></span>\n  </div>\n  <div class= \"buttons\">\n    \n<a id=\"tweet\" href=\"\"https://twitter.com/intent/tweet\"\" title=\"Tweet this!\"><button class= \"button\"><i class= \"fa fa-twitter\"></i></button></a>\n    \n    <div class= \"new-quote-button\" >\n    <button class=\"button\" id=\"new-quote\"> New Quote\n    </div>\n  </div>\n</div>'),
(3, '2022-08-10', 'property 3', 'Stranka 3', '<div class=\"table-container\">\n        <h3>Nejnovější příspěvky</h3>\n        <div class=\"row\">\n            <div class=\"info_box col\">\n                <h4>Název stránky</h4>\n                <p>Datum vytvoření stránky</p>\n                <p>Nějaký popi'),
(13, '2022-08-11', 'popis stránky 4', 'Stránka 4', '<h1>Random Quote Generator</h1>\n<div class=\"white-box\">\n  <div class=\"quote\">\n    <i class=\"fa fa-quote-left fa-3x\"></i> \n    <p class=\"random-quote\"> <span id=\"text\"></span></p>\n  </div>\n  <div class=\"random-author\">- <span id=\"author\"></span>\n  </div>\n  <div class= \"buttons\">\n    \n<a id=\"tweet\" href=\"\"https://twitter.com/intent/tweet\"\" title=\"Tweet this!\"><button class= \"button\"><i class= \"fa fa-twitter\"></i></button></a>\n    \n    <div class= \"new-quote-button\" >\n    <button class=\"button\" id=\"new-quote\"> New Quote\n    </div>\n  </div>\n</div>');

-- --------------------------------------------------------

--
-- Struktura tabulky `tags`
--

CREATE TABLE `tags` (
  `ID` int(11) NOT NULL,
  `Tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `tags`
--

INSERT INTO `tags` (`ID`, `Tag`) VALUES
(1, 'Štítek 1'),
(2, 'Štítek 2'),
(3, 'Štítek 3'),
(4, 'Štítek 4'),
(5, 'Štítek 5'),
(6, 'Štítek 6');

-- --------------------------------------------------------

--
-- Struktura tabulky `used`
--

CREATE TABLE `used` (
  `ID` int(11) NOT NULL,
  `page` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `used`
--

INSERT INTO `used` (`ID`, `page`, `tag`) VALUES
(5, 3, 'Štítek 3'),
(10, 3, 'Štítek 1'),
(11, 2, 'Štítek 3'),
(19, 13, 'Štítek 2'),
(20, 13, 'Štítek 4'),
(21, 13, 'Štítek 6'),
(22, 13, 'Štítek 1'),
(23, 13, 'Štítek 3');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexy pro tabulku `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`ID`);

--
-- Indexy pro tabulku `used`
--
ALTER TABLE `used`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `pages`
--
ALTER TABLE `pages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pro tabulku `tags`
--
ALTER TABLE `tags`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pro tabulku `used`
--
ALTER TABLE `used`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
