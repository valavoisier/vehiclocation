-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 02 jan. 2026 à 14:07
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `vehiclocation`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20260102125339', '2026-01-02 13:54:11', 35);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

CREATE TABLE `voiture` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `prix_quotidien` double NOT NULL,
  `prix_mensuel` double NOT NULL,
  `places` int(11) NOT NULL,
  `manuelle` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `voiture`
--

INSERT INTO `voiture` (`id`, `nom`, `description`, `prix_quotidien`, `prix_mensuel`, `places`, `manuelle`) VALUES
(1, 'Renault Twingo', 'La Renault Twingo est une citadine compacte à trois ou cinq portes, conçue pour la conduite urbaine. Elle offre une excellente maniabilité, un rayon de braquage réduit, une consommation modérée et un habitacle optimisé pour maximiser l’espace intérieur. Disponible en motorisations essence ou électrique selon les générations, elle se distingue par son design moderne et sa facilité de stationnement.', 39.14, 900, 4, 1),
(2, 'Renault Clio', 'La Renault Clio est une berline citadine polyvalente offrant un bon équilibre entre confort, économie de carburant et tenue de route. Son format compact facilite la conduite urbaine, tandis que son habitacle bien conçu propose un espace intérieur fonctionnel. Disponible en plusieurs motorisations essence, diesel ou hybride selon les générations, elle se distingue par sa fiabilité, son équipement moderne et son design dynamique.', 38.64, 850, 4, 1),
(3, 'BMW IX (Electric)', 'BMW est connu pour ses voitures puissantes et luxueuses - la BMW iX ne fait pas exception. Avec une puissance allant de 326 ch (BMW iX 40) à 523 ch (BMW iX 50) et une autonomie de 408 (BMW iX 40) à 590 kilomètres (BMW iX 50), la BMW iX offre tout ce que l\'on peut attendre d\'une voiture électrique.', 42.4, 950, 4, 1),
(4, 'Citroën Ami', 'La Citroën Ami est un quadricycle électrique ultra‑compact conçu pour les déplacements urbains courts. Elle offre une conduite silencieuse, une autonomie adaptée aux trajets quotidiens et une grande facilité de stationnement grâce à son format réduit. Son habitacle minimaliste accueille deux personnes côte à côte et privilégie la simplicité d’usage. Accessible dès 14 ans en France, elle se distingue par son coût d’utilisation très faible et son design symétrique original.', 28.59, 799, 4, 1),
(5, 'Opel Corsa', 'L’Opel Corsa est une citadine polyvalente offrant un bon compromis entre compacité, confort et efficacité énergétique. Son design moderne s’accompagne d’un habitacle ergonomique et bien équipé, adapté aux trajets urbains comme aux déplacements quotidiens. Disponible en motorisations essence, diesel ou électrique selon les générations, elle se distingue par sa tenue de route fiable, sa consommation maîtrisée et ses technologies d’aide à la conduite.', 36.38, 820, 4, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0E3BD61CE16BA31DBBF396750` (`queue_name`,`available_at`,`delivered_at`,`id`);

--
-- Index pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `voiture`
--
ALTER TABLE `voiture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
