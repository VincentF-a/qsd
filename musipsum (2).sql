-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 02 déc. 2019 à 14:28
-- Version du serveur :  5.7.26
-- Version de PHP :  7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `musipsum`
--

-- --------------------------------------------------------

--
-- Structure de la table `auto_ecole`
--

DROP TABLE IF EXISTS `auto_ecole`;
CREATE TABLE IF NOT EXISTS `auto_ecole` (
  `id_auto_ecole` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext,
  `mail_address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `cgu` mediumtext,
  `mention_legal` mediumtext,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_auto_ecole`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auto_ecole`
--

INSERT INTO `auto_ecole` (`id_auto_ecole`, `description`, `mail_address`, `phone_number`, `adress`, `cgu`, `mention_legal`, `name`) VALUES
(1, NULL, 'autoecoledeparis@gmail.com', '+33 6 85 15 04 04', '2 rue d Arsonval', NULL, NULL, 'autoecole de Paris');

-- --------------------------------------------------------

--
-- Structure de la table `cgu`
--

DROP TABLE IF EXISTS `cgu`;
CREATE TABLE IF NOT EXISTS `cgu` (
  `id_cgu` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_cgu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `donne_mesure`
--

DROP TABLE IF EXISTS `donne_mesure`;
CREATE TABLE IF NOT EXISTS `donne_mesure` (
  `id_saisie` int(11) NOT NULL AUTO_INCREMENT,
  `numero_boitier` int(11) NOT NULL,
  `debut_saisie` datetime NOT NULL,
  `fin_saisie` datetime NOT NULL,
  `valeur_saisie` int(11) NOT NULL,
  PRIMARY KEY (`id_saisie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `donne_mesure_type_capteur`
--

DROP TABLE IF EXISTS `donne_mesure_type_capteur`;
CREATE TABLE IF NOT EXISTS `donne_mesure_type_capteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_saisie` int(11) NOT NULL,
  `id_capteur` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `faq`
--

DROP TABLE IF EXISTS `faq`;
CREATE TABLE IF NOT EXISTS `faq` (
  `id_faq` int(11) NOT NULL AUTO_INCREMENT,
  `question` mediumtext NOT NULL,
  `reponse` mediumtext NOT NULL,
  PRIMARY KEY (`id_faq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `moniteur`
--

DROP TABLE IF EXISTS `moniteur`;
CREATE TABLE IF NOT EXISTS `moniteur` (
  `id_moniteur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse_mail` varchar(255) NOT NULL,
  `id_autoecole` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_moniteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `moniteur_user`
--

DROP TABLE IF EXISTS `moniteur_user`;
CREATE TABLE IF NOT EXISTS `moniteur_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_moniteur` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_moniteur` (`id_user`,`id_moniteur`),
  KEY `id_moniteur` (`id_moniteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sucess_story`
--

DROP TABLE IF EXISTS `sucess_story`;
CREATE TABLE IF NOT EXISTS `sucess_story` (
  `id_sucess` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_sucess`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `id_test` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `date_mesure` datetime NOT NULL,
  `id_type_test` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_moniteur` int(11) NOT NULL,
  `numero_boitier` int(11) NOT NULL,
  PRIMARY KEY (`id_test`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type_capteur`
--

DROP TABLE IF EXISTS `type_capteur`;
CREATE TABLE IF NOT EXISTS `type_capteur` (
  `id_capteur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id_capteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type_test`
--

DROP TABLE IF EXISTS `type_test`;
CREATE TABLE IF NOT EXISTS `type_test` (
  `id_type_test` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id_type_test`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type_test_capteur`
--

DROP TABLE IF EXISTS `type_test_capteur`;
CREATE TABLE IF NOT EXISTS `type_test_capteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_capteur` int(11) NOT NULL,
  `id_type_test` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `account_type` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `mail_address` varchar(255) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `birth_date` varchar(15) DEFAULT NULL,
  `password_account` varchar(255) DEFAULT NULL,
  `id_autoecole` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `account_type`, `name`, `first_name`, `mail_address`, `gender`, `height`, `weight`, `birth_date`, `password_account`, `id_autoecole`) VALUES
(5, 1, 'DEMARS', 'Alexandre', 'DEMARS@gmail.com', NULL, 0, 0, '--', '$2y$10$RtNXtd1AsBdI1kDyDHlD0O502nNXV7zCtLZJRuJU8g2mvqBgXZ1gi', 1),
(6, 1, 'TONNEAU', 'Alexis', 'tonneau@gmail.com', NULL, 0, 0, '--', '$2y$10$RtNXtd1AsBdI1kDyDHlD0O502nNXV7zCtLZJRuJU8g2mvqBgXZ1gi', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `moniteur_user`
--
ALTER TABLE `moniteur_user`
  ADD CONSTRAINT `moniteur_user_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `moniteur_user_ibfk_2` FOREIGN KEY (`id_moniteur`) REFERENCES `moniteur` (`id_moniteur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
