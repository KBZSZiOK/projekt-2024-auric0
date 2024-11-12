-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Lis 12, 2024 at 01:57 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `4ti1_kino`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bilety`
--

CREATE TABLE `bilety` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `cena` varchar(100) DEFAULT NULL,
  `seans_ID` bigint(20) UNSIGNED DEFAULT NULL,
  `sprzedawca_ID` bigint(20) UNSIGNED DEFAULT NULL,
  `klienci_ID` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bilety`
--

INSERT INTO `bilety` (`ID`, `cena`, `seans_ID`, `sprzedawca_ID`, `klienci_ID`) VALUES
(8, '30zł', 1, 2, 3),
(9, '25zł', 2, 3, 5),
(10, '28zł', 3, 1, 2),
(11, '33zł', 4, 2, 4),
(12, '22zł', 5, 3, 1),
(13, '35zł', 2, 1, 3),
(14, '27zł', 4, 2, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `filmy`
--

CREATE TABLE `filmy` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `tytul` varchar(100) DEFAULT NULL,
  `rezyser` varchar(100) DEFAULT NULL,
  `czas_trwania` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `filmy`
--

INSERT INTO `filmy` (`ID`, `tytul`, `rezyser`, `czas_trwania`) VALUES
(1, 'Riddle me this', 'Krzysztof Gosz', '02:20:00'),
(2, 'Super film', 'Jamal Makumba', '01:30:30'),
(3, 'Oppenheimer', 'zapomnialem', '03:00:45'),
(4, 'Pianista', 'Jarek Pasieka', '02:17:47'),
(5, 'Ojciec chrzestny', 'Tomasz Krawiec', '02:40:10'),
(6, 'Joker', 'Kacper Kelek', '01:21:50');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `filmy_rodzaj`
--

CREATE TABLE `filmy_rodzaj` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `filmy_ID` bigint(20) UNSIGNED DEFAULT NULL,
  `rodzaj_ID` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `filmy_rodzaj`
--

INSERT INTO `filmy_rodzaj` (`ID`, `filmy_ID`, `rodzaj_ID`) VALUES
(1, 1, 3),
(2, 2, 1),
(3, 3, 4),
(4, 4, 2),
(5, 5, 1),
(6, 6, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `imie` varchar(100) DEFAULT NULL,
  `nazwisko` varchar(100) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`ID`, `imie`, `nazwisko`, `mail`) VALUES
(1, 'Marek', 'Nowak', 'marek.nowak@gmail.com'),
(2, 'Krzysztof', 'Krawiec', 'skibidi.sigma@o2.pl'),
(3, 'Aleksandra', 'Kowalska', 'ola.kowalska15@gmail.com'),
(4, 'Wojciech', 'Szymański', 'fajny.wojtek@wp.pl'),
(5, 'Natalia', 'Nowak', 'nowak.nat22@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzaj_filmu`
--

CREATE TABLE `rodzaj_filmu` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `nazwa` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rodzaj_filmu`
--

INSERT INTO `rodzaj_filmu` (`ID`, `nazwa`) VALUES
(1, 'dramat'),
(2, 'komedia'),
(3, 'horror'),
(4, 'przygodowy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sale`
--

CREATE TABLE `sale` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `ilosc_miejsc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`ID`, `ilosc_miejsc`) VALUES
(1, 100),
(2, 120),
(3, 90),
(4, 105);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `seanse`
--

CREATE TABLE `seanse` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `termin` datetime DEFAULT NULL,
  `liczba_wolnych_miejsc` int(11) DEFAULT NULL,
  `film_ID` bigint(20) UNSIGNED DEFAULT NULL,
  `sala_ID` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seanse`
--

INSERT INTO `seanse` (`ID`, `termin`, `liczba_wolnych_miejsc`, `film_ID`, `sala_ID`) VALUES
(1, '2020-12-12 12:00:00', 20, 1, 3),
(2, '2022-05-31 16:30:15', 47, 3, 2),
(3, '2021-08-22 14:20:20', 33, 2, 4),
(4, '2024-01-15 19:30:00', 10, 5, 1),
(5, '2023-03-08 15:00:00', 15, 6, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprzedawcy`
--

CREATE TABLE `sprzedawcy` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `imie` varchar(100) DEFAULT NULL,
  `nazwisko` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sprzedawcy`
--

INSERT INTO `sprzedawcy` (`ID`, `imie`, `nazwisko`) VALUES
(1, 'Robert', 'Karczewski'),
(2, 'Maksymilian', 'Skalski'),
(3, 'Maciek', 'Dąbrowski');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `bilety`
--
ALTER TABLE `bilety`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `seans_ID` (`seans_ID`),
  ADD KEY `sprzedawca_ID` (`sprzedawca_ID`),
  ADD KEY `klienci_ID` (`klienci_ID`);

--
-- Indeksy dla tabeli `filmy`
--
ALTER TABLE `filmy`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `filmy_rodzaj`
--
ALTER TABLE `filmy_rodzaj`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `filmy_ID` (`filmy_ID`),
  ADD KEY `rodzaj_ID` (`rodzaj_ID`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `rodzaj_filmu`
--
ALTER TABLE `rodzaj_filmu`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `seanse`
--
ALTER TABLE `seanse`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `film_ID` (`film_ID`),
  ADD KEY `sala_ID` (`sala_ID`);

--
-- Indeksy dla tabeli `sprzedawcy`
--
ALTER TABLE `sprzedawcy`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bilety`
--
ALTER TABLE `bilety`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `filmy`
--
ALTER TABLE `filmy`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `filmy_rodzaj`
--
ALTER TABLE `filmy_rodzaj`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rodzaj_filmu`
--
ALTER TABLE `rodzaj_filmu`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `seanse`
--
ALTER TABLE `seanse`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sprzedawcy`
--
ALTER TABLE `sprzedawcy`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bilety`
--
ALTER TABLE `bilety`
  ADD CONSTRAINT `bilety_ibfk_1` FOREIGN KEY (`seans_ID`) REFERENCES `seanse` (`ID`),
  ADD CONSTRAINT `bilety_ibfk_2` FOREIGN KEY (`sprzedawca_ID`) REFERENCES `sprzedawcy` (`ID`),
  ADD CONSTRAINT `bilety_ibfk_3` FOREIGN KEY (`klienci_ID`) REFERENCES `klienci` (`ID`);

--
-- Constraints for table `filmy_rodzaj`
--
ALTER TABLE `filmy_rodzaj`
  ADD CONSTRAINT `filmy_rodzaj_ibfk_1` FOREIGN KEY (`filmy_ID`) REFERENCES `filmy` (`ID`),
  ADD CONSTRAINT `filmy_rodzaj_ibfk_2` FOREIGN KEY (`rodzaj_ID`) REFERENCES `rodzaj_filmu` (`ID`);

--
-- Constraints for table `seanse`
--
ALTER TABLE `seanse`
  ADD CONSTRAINT `seanse_ibfk_1` FOREIGN KEY (`film_ID`) REFERENCES `filmy` (`ID`),
  ADD CONSTRAINT `seanse_ibfk_2` FOREIGN KEY (`sala_ID`) REFERENCES `sale` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
