-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 20 oct. 2025 à 11:27
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
-- Base de données : `equidaweb`
--

-- --------------------------------------------------------

--
-- Structure de la table `acheteur`
--

CREATE TABLE `acheteur` (
  `Id_Client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `acheteur`
--

INSERT INTO `acheteur` (`Id_Client`) VALUES
(2),
(3),
(4);

-- --------------------------------------------------------

--
-- Structure de la table `acheteurs_enchere`
--

CREATE TABLE `acheteurs_enchere` (
  `Id_Client` int(11) NOT NULL,
  `Id_enchère` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `acheteurs_enchere`
--

INSERT INTO `acheteurs_enchere` (`Id_Client`, `Id_enchère`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `categvente`
--

CREATE TABLE `categvente` (
  `Id_CategVente` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categvente`
--

INSERT INTO `categvente` (`Id_CategVente`, `code`, `libelle`) VALUES
(1, 'CAT001', 'Vente aux enchères');

-- --------------------------------------------------------

--
-- Structure de la table `cheval`
--

CREATE TABLE `cheval` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `sexe` varchar(50) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `sire` text DEFAULT NULL,
  `id_1` int(11) DEFAULT NULL,
  `id_2` int(11) NOT NULL,
  `Id_vendeur` int(11) NOT NULL,
  `id_3` int(11) NOT NULL,
  `Id_Race` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cheval`
--

INSERT INTO `cheval` (`id`, `nom`, `sexe`, `date_naissance`, `sire`, `id_1`, `id_2`, `Id_vendeur`, `id_3`, `Id_Race`) VALUES
(1, 'Petard', 'M', '2022-12-12', '549562', 1, 1, 1, 1, 1),
(2, 'Tonnerre', 'M', '2025-06-04', '482019', 1, 1, 1, 1, 1),
(4, 'Comète', 'F', '2022-08-19', '774063', 3, 1, 1, 1, 4),
(5, 'Apache', 'M', '2023-10-23', '238711', 3, 1, 1, 1, 5),
(6, 'Galaxie', 'F', '2020-05-12', '415780', 4, 1, 3, 1, 2),
(7, 'Orion', 'M', '2021-06-29', '156912', 2, 1, 3, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `Id_Client` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `rue` varchar(50) DEFAULT NULL,
  `copos` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `adresseMessagerie` varchar(50) DEFAULT NULL,
  `Id_Pays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`Id_Client`, `nom`, `prenom`, `rue`, `copos`, `ville`, `adresseMessagerie`, `Id_Pays`) VALUES
(1, 'Durand', 'Paul', '12 rue des Lilas', '75001', 'Paris', 'paul.durand@example.com', 1),
(2, 'Martin', 'Claire', '8 avenue Victor Hugo', '69002', 'Lyon', 'claire.martin@example.com', 1),
(3, 'Dupont', 'Jean', '5 chemin des Écuries', '13001', 'Marseille', 'jean.dupont@example.com', 1),
(4, 'Bernard', 'Lucie', '42 rue du Haras', '31000', 'Toulouse', 'lucie.bernard@example.com', 1),
(5, 'Lemoine', 'Hugo', '77 rue du Galop', '59000', 'Lille', 'hugo.lemoine@example.com', 1),
(6, 'Lefevre', 'Anna', '23 rue des Cavaliers', '67000', 'Strasbourg', 'anna.lefevre@example.com', 1);

-- --------------------------------------------------------

--
-- Structure de la table `client_categvente`
--

CREATE TABLE `client_categvente` (
  `Id_CategVente` int(11) NOT NULL,
  `Id_Client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client_categvente`
--

INSERT INTO `client_categvente` (`Id_CategVente`, `Id_Client`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

CREATE TABLE `course` (
  `Id_Course` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `dateCourse` varchar(50) DEFAULT NULL,
  `Id_Lieu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `course`
--

INSERT INTO `course` (`Id_Course`, `nom`, `dateCourse`, `Id_Lieu`) VALUES
(1, 'Grand Prix', '2025-10-15', 1),
(2, 'Coupe de Lyon', '2025-10-20', 3);

-- --------------------------------------------------------

--
-- Structure de la table `course_cheval`
--

CREATE TABLE `course_cheval` (
  `id` int(11) NOT NULL,
  `Id_Course` int(11) NOT NULL,
  `place` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `course_cheval`
--

INSERT INTO `course_cheval` (`id`, `Id_Course`, `place`) VALUES
(2, 1, '1er');

-- --------------------------------------------------------

--
-- Structure de la table `enchère`
--

CREATE TABLE `enchère` (
  `Id_enchère` int(11) NOT NULL,
  `Id_Vente` int(11) NOT NULL,
  `numLot` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `enchère`
--

INSERT INTO `enchère` (`Id_enchère`, `Id_Vente`, `numLot`) VALUES
(1, 1, 'L1');

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

CREATE TABLE `lieu` (
  `Id_Lieu` int(11) NOT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `nbBoxes` varchar(50) DEFAULT NULL,
  `commentaire` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`Id_Lieu`, `ville`, `nbBoxes`, `commentaire`) VALUES
(1, 'Paris', '20', 'Hippodrome principal'),
(2, 'Marseille', '15', 'Centre équestre du sud'),
(3, 'Lyon', '18', 'Hippodrome Lyon-Parilly');

-- --------------------------------------------------------

--
-- Structure de la table `lot`
--

CREATE TABLE `lot` (
  `Id_Vente` int(11) NOT NULL,
  `numLot` varchar(50) NOT NULL,
  `prixDepart` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `lot`
--

INSERT INTO `lot` (`Id_Vente`, `numLot`, `prixDepart`, `id`) VALUES
(1, 'L1', '10000', 2),
(4, 'L2', '15000', 7),
(4, 'L3', '12000', 6);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `Id_Pays` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`Id_Pays`, `code`, `nom`) VALUES
(1, 'FR', 'France');

-- --------------------------------------------------------

--
-- Structure de la table `race`
--

CREATE TABLE `race` (
  `Id_Race` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `race`
--

INSERT INTO `race` (`Id_Race`, `nom`, `description`) VALUES
(1, 'Pur-sang', 'Course de vitesse'),
(2, 'Arabe', 'Race de chevaux d\'endurance'),
(3, 'Quarter Horse', 'Cheval de travail rapide'),
(4, 'Trotteur Français', 'Cheval spécialisé dans le trot'),
(5, 'Appaloosa', 'Cheval tacheté d\'origine américaine');

-- --------------------------------------------------------

--
-- Structure de la table `robe`
--

CREATE TABLE `robe` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `robe`
--

INSERT INTO `robe` (`id`) VALUES
(1),
(2),
(3),
(4);

-- --------------------------------------------------------

--
-- Structure de la table `vendeur`
--

CREATE TABLE `vendeur` (
  `Id_vendeur` int(11) NOT NULL,
  `Id_Client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vendeur`
--

INSERT INTO `vendeur` (`Id_vendeur`, `Id_Client`) VALUES
(1, 1),
(2, 3),
(3, 5);

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE `vente` (
  `Id_Vente` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `dateDebutVente` varchar(50) DEFAULT NULL,
  `dateEnvoiMessage` varchar(50) DEFAULT NULL,
  `objetMessage` varchar(50) DEFAULT NULL,
  `corpsMessage` varchar(50) DEFAULT NULL,
  `Id_CategVente` int(11) NOT NULL,
  `Id_Lieu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`Id_Vente`, `nom`, `dateDebutVente`, `dateEnvoiMessage`, `objetMessage`, `corpsMessage`, `Id_CategVente`, `Id_Lieu`) VALUES
(1, 'Vente Automne', '2025-09-15', '2025-09-10', 'Invitation Vente', 'Nous vous invitons...', 1, 1),
(2, 'Vente Ete', '2025-10-01', '2025-09-25', 'Annonce Vente Sud', 'Découvrez notre sélection de chevaux.', 1, 2),
(3, 'Vente Printemps', '2025-10-10', '2025-10-01', 'Vente spéciale printemps', 'Ne manquez pas nos meilleurs chevaux !', 1, 3),
(4, 'Vente Hiver', '2025-11-10', '2025-11-01', 'Vente d\'hiver exceptionnelle', 'Une nouvelle sélection de chevaux rares.', 1, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD PRIMARY KEY (`Id_Client`);

--
-- Index pour la table `acheteurs_enchere`
--
ALTER TABLE `acheteurs_enchere`
  ADD PRIMARY KEY (`Id_Client`,`Id_enchère`),
  ADD KEY `Id_enchère` (`Id_enchère`);

--
-- Index pour la table `categvente`
--
ALTER TABLE `categvente`
  ADD PRIMARY KEY (`Id_CategVente`);

--
-- Index pour la table `cheval`
--
ALTER TABLE `cheval`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_1` (`id_1`),
  ADD KEY `id_2` (`id_2`),
  ADD KEY `Id_vendeur` (`Id_vendeur`),
  ADD KEY `id_3` (`id_3`),
  ADD KEY `Id_Race` (`Id_Race`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Id_Client`),
  ADD KEY `Id_Pays` (`Id_Pays`);

--
-- Index pour la table `client_categvente`
--
ALTER TABLE `client_categvente`
  ADD PRIMARY KEY (`Id_CategVente`,`Id_Client`),
  ADD KEY `Id_Client` (`Id_Client`);

--
-- Index pour la table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Id_Course`),
  ADD KEY `Id_Lieu` (`Id_Lieu`);

--
-- Index pour la table `course_cheval`
--
ALTER TABLE `course_cheval`
  ADD PRIMARY KEY (`id`,`Id_Course`),
  ADD KEY `Id_Course` (`Id_Course`);

--
-- Index pour la table `enchère`
--
ALTER TABLE `enchère`
  ADD PRIMARY KEY (`Id_enchère`),
  ADD KEY `Id_Vente` (`Id_Vente`,`numLot`);

--
-- Index pour la table `lieu`
--
ALTER TABLE `lieu`
  ADD PRIMARY KEY (`Id_Lieu`);

--
-- Index pour la table `lot`
--
ALTER TABLE `lot`
  ADD PRIMARY KEY (`numLot`),
  ADD KEY `Id_Vente` (`Id_Vente`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`Id_Pays`);

--
-- Index pour la table `race`
--
ALTER TABLE `race`
  ADD PRIMARY KEY (`Id_Race`);

--
-- Index pour la table `robe`
--
ALTER TABLE `robe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vendeur`
--
ALTER TABLE `vendeur`
  ADD PRIMARY KEY (`Id_vendeur`),
  ADD UNIQUE KEY `Id_Client` (`Id_Client`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`Id_Vente`),
  ADD KEY `Id_CategVente` (`Id_CategVente`),
  ADD KEY `Id_Lieu` (`Id_Lieu`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categvente`
--
ALTER TABLE `categvente`
  MODIFY `Id_CategVente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `cheval`
--
ALTER TABLE `cheval`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `Id_Client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `course`
--
ALTER TABLE `course`
  MODIFY `Id_Course` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `enchère`
--
ALTER TABLE `enchère`
  MODIFY `Id_enchère` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `lieu`
--
ALTER TABLE `lieu`
  MODIFY `Id_Lieu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `Id_Pays` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `race`
--
ALTER TABLE `race`
  MODIFY `Id_Race` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `robe`
--
ALTER TABLE `robe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `vendeur`
--
ALTER TABLE `vendeur`
  MODIFY `Id_vendeur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `vente`
--
ALTER TABLE `vente`
  MODIFY `Id_Vente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD CONSTRAINT `acheteur_ibfk_1` FOREIGN KEY (`Id_Client`) REFERENCES `client` (`Id_Client`);

--
-- Contraintes pour la table `acheteurs_enchere`
--
ALTER TABLE `acheteurs_enchere`
  ADD CONSTRAINT `acheteurs_enchere_ibfk_1` FOREIGN KEY (`Id_Client`) REFERENCES `acheteur` (`Id_Client`),
  ADD CONSTRAINT `acheteurs_enchere_ibfk_2` FOREIGN KEY (`Id_enchère`) REFERENCES `enchère` (`Id_enchère`);

--
-- Contraintes pour la table `cheval`
--
ALTER TABLE `cheval`
  ADD CONSTRAINT `cheval_ibfk_1` FOREIGN KEY (`id_1`) REFERENCES `robe` (`id`),
  ADD CONSTRAINT `cheval_ibfk_2` FOREIGN KEY (`id_2`) REFERENCES `cheval` (`id`),
  ADD CONSTRAINT `cheval_ibfk_3` FOREIGN KEY (`Id_vendeur`) REFERENCES `vendeur` (`Id_vendeur`),
  ADD CONSTRAINT `cheval_ibfk_4` FOREIGN KEY (`id_3`) REFERENCES `cheval` (`id`),
  ADD CONSTRAINT `cheval_ibfk_5` FOREIGN KEY (`Id_Race`) REFERENCES `race` (`Id_Race`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`Id_Pays`) REFERENCES `pays` (`Id_Pays`);

--
-- Contraintes pour la table `client_categvente`
--
ALTER TABLE `client_categvente`
  ADD CONSTRAINT `client_categvente_ibfk_1` FOREIGN KEY (`Id_CategVente`) REFERENCES `categvente` (`Id_CategVente`),
  ADD CONSTRAINT `client_categvente_ibfk_2` FOREIGN KEY (`Id_Client`) REFERENCES `client` (`Id_Client`);

--
-- Contraintes pour la table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Id_Lieu`) REFERENCES `lieu` (`Id_Lieu`);

--
-- Contraintes pour la table `course_cheval`
--
ALTER TABLE `course_cheval`
  ADD CONSTRAINT `course_cheval_ibfk_1` FOREIGN KEY (`id`) REFERENCES `cheval` (`id`),
  ADD CONSTRAINT `course_cheval_ibfk_2` FOREIGN KEY (`Id_Course`) REFERENCES `course` (`Id_Course`);

--
-- Contraintes pour la table `enchère`
--
ALTER TABLE `enchère`
  ADD CONSTRAINT `enchère_ibfk_1` FOREIGN KEY (`Id_Vente`,`numLot`) REFERENCES `lot` (`Id_Vente`, `numLot`);

--
-- Contraintes pour la table `lot`
--
ALTER TABLE `lot`
  ADD CONSTRAINT `lot_ibfk_1` FOREIGN KEY (`Id_Vente`) REFERENCES `vente` (`Id_Vente`),
  ADD CONSTRAINT `lot_ibfk_2` FOREIGN KEY (`id`) REFERENCES `cheval` (`id`);

--
-- Contraintes pour la table `vendeur`
--
ALTER TABLE `vendeur`
  ADD CONSTRAINT `vendeur_ibfk_1` FOREIGN KEY (`Id_Client`) REFERENCES `client` (`Id_Client`);

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`Id_CategVente`) REFERENCES `categvente` (`Id_CategVente`),
  ADD CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`Id_Lieu`) REFERENCES `lieu` (`Id_Lieu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
