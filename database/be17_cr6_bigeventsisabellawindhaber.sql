-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 03. Dez 2022 um 13:59
-- Server-Version: 10.4.27-MariaDB
-- PHP-Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `be17_cr6_bigeventsisabellawindhaber`
--
CREATE DATABASE IF NOT EXISTS `be17_cr6_bigeventsisabellawindhaber` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `be17_cr6_bigeventsisabellawindhaber`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20221202100119', '2022-12-03 00:04:57', 1110);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `event_list`
--

CREATE TABLE `event_list` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `street` varchar(255) NOT NULL,
  `zip` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` enum('music','sport','food') NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `event_list`
--

INSERT INTO `event_list` (`id`, `name`, `start`, `description`, `capacity`, `email`, `phone`, `street`, `zip`, `city`, `url`, `type`, `img`) VALUES
(1, 'Sunday Soul Ritual - Ayurveda Yoga', '2022-12-09 10:00:21', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Odit, ducimus accusantium vero facilis debitis quidem obcaecati ad eveniet sit provident id a eum aperiam voluptatum eaque maxime velit, delectus minus iure rerum exercitationem beatae vel adipisci.', 15, 'yoga@mail.com', 66233697812, 'Embelgasse 35', 1050, 'Vienna', 'https://www.eventbrite.at/o/honeyoga-55418199783', 'sport', 'https://image.brigitte.de/11722268/t/TL/v3/w1440/r1.5/-/hatha-yoga-krieger.jpg'),
(2, 'Street Food Festival', '2023-07-21 09:15:13', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore, quod! Quis deserunt eligendi aspernatur assumenda! Aut deserunt optio obcaecati vero nisi tempora omnis possimus voluptatem cumque. Excepturi necessitatibus, in beatae veritatis tempora exer', 400, 'streetfood@mail.com', 66911234458, 'Rathausplatz 1', 1010, 'Vienna', 'http://www.streetfood-festival.eu/', 'food', 'https://images.squarespace-cdn.com/content/v1/53e52074e4b0392a271246de/1558082760967-FXJ98LCJWK5P2HEX5X19/2019-SFF-Facebook-Homepage-001-plastikfrei.jpg?format=2500w'),
(3, 'Donauinsel Fest ', '2023-06-16 07:00:11', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officia aspernatur aliquam architecto, iusto repellat quae voluptate, placeat a voluptates magni ipsum necessitatibus atque quo quis quasi esse tempore accusamus reprehenderit molestias exercitation', 1000, 'dif@mail.com', 667112499637, 'Donauinsel', 1210, 'Vienna', 'https://donauinselfest.at/?nofade', 'music', 'https://brutkasten.com/wp-content/uploads/2022/06/Design-ohne-Titel-55-766x395.jpg'),
(4, 'Pilates Boutique', '2023-01-02 09:30:11', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Magnam vel, id laboriosam, sunt sit inventore fuga aut porro, est officiis placeat laborum voluptate et dolorem quisquam corporis veritatis culpa. Molestias aliquam ipsam tenetur fuga ab minus dolo', 10, 'pilates@mail.com', 66449216782, 'Kärnterstraße 3', 1010, 'Vienna', 'https://pilatesboutiquevienna.at/', 'sport', 'https://dominik-s.de/hofsports/wp-content/uploads/sites/3/2017/03/KURSE-HofSports-Pilates-600x324.jpg'),
(5, 'Coachella Festival', '2023-04-21 06:30:39', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Magnam vel, id laboriosam, sunt sit inventore fuga aut porro, est officiis placeat laborum voluptate et dolorem quisquam corporis veritatis culpa. Molestias aliquam ipsam tenetur fuga ab minus dolo', 1000, '', 4491173645, '81-800 51st Ave', 92201, 'Indio, CA', 'https://www.coachella.com/driving-directions', 'music', 'https://media1.faz.net/ppmedia/aktuell/1187823897/1.6810651/default-retina/das-riesenrad-des-coachella.jpg'),
(6, 'Royal Donuts Pop Up Store', '2023-05-15 08:45:55', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aliquid voluptatum obcaecati corrupti fugit reiciendis unde quod, assumenda in voluptatem, eligendi veritatis officiis nihil distinctio consectetur, animi repellat suscipit inventore qui sequi atqu', 15, 'royal@mail.com', 4441123, 'Mariahilfer Straße 25', 1060, 'Vienna', 'https://www.royal-donuts.at\r\n', 'food', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_YGsEP4O1zbbrc4c9Rm4FyLCuRxgSxDv9Ysjxkf15sFVqP4yhwpEXtqhO8lG7THVCTZg&usqp=CAU'),
(7, 'Wiener Christkindlmarkt', '2022-11-25 08:44:43', 'Das Angebot der Markstandler*innen am Wiener Christkindlmarkt ist einzigartig: Vom Spielzeug, das Kinder glücklich macht über stimmungsvolle Dekoration für die Vorweihnachtszeit und das große Fest bis hin zu Bekleidungsaccessoires für den Winter. Nicht zu', 500, 'office@stadtwienmarketing.at', 43131982000, 'Rathausplatz 1', 1010, 'Vienna', 'https://www.christkindlmarkt.at/', 'food', 'https://www.christkindlmarkt.at/wp-content/uploads/2022/11/221028_Stadt_Wien_Marketing_Christkindlmarkt_Eingang_HD-400x225.jpg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indizes für die Tabelle `event_list`
--
ALTER TABLE `event_list`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `event_list`
--
ALTER TABLE `event_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
