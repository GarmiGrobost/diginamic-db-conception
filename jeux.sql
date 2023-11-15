DROP TABLE IF EXISTS player ;
CREATE TABLE player (id_player_player BIGINT AUTO_INCREMENT NOT NULL,
nom_player_player VARCHAR(20),
prenom_player_player VARCHAR(20),
pseudo_player_player VARCHAR(20),
mail_player_player VARCHAR(30),
phone_player_player VARCHAR(10),
skin_player_player BOOLEAN,
id_equipe_equipe_players INTEGER,
PRIMARY KEY (id_player_player)) ENGINE=InnoDB;

DROP TABLE IF EXISTS parties ;
CREATE TABLE parties (id_partie_parties BIGINT AUTO_INCREMENT NOT NULL,
nom_partie_parties VARCHAR(20),
date_debut_partie_parties DATETIME,
date_fin_partie_parties DATETIME,
PRIMARY KEY (id_partie_parties)) ENGINE=InnoDB;

DROP TABLE IF EXISTS cartes ;
CREATE TABLE cartes (id_cartes_cartes BIGINT AUTO_INCREMENT NOT NULL,
nom_cartes_cartes VARCHAR(20),
caracteristique_cartes VARCHAR(20),
PRIMARY KEY (id_cartes_cartes)) ENGINE=InnoDB;

DROP TABLE IF EXISTS score_final ;
CREATE TABLE score_final (id_score_score-final BIGINT AUTO_INCREMENT NOT NULL,
score_total_score-final INTEGER,
date_saisie_score-final DATETIME,
id_partie_parties **NOT FOUND**,
PRIMARY KEY (id_score_score-final)) ENGINE=InnoDB;

DROP TABLE IF EXISTS equipe_players ;
CREATE TABLE equipe_players (id_equipe_equipe_players BIGINT AUTO_INCREMENT NOT NULL,
equipe_equipe_players INTEGER,
PRIMARY KEY (id_equipe_equipe_players)) ENGINE=InnoDB;

DROP TABLE IF EXISTS joue ;
CREATE TABLE joue (id_player_player **NOT FOUND** AUTO_INCREMENT NOT NULL,
id_partie_parties **NOT FOUND** NOT NULL,
PRIMARY KEY (id_player_player,
 id_partie_parties)) ENGINE=InnoDB;

DROP TABLE IF EXISTS utilise ;
CREATE TABLE utilise (id_partie_parties **NOT FOUND** AUTO_INCREMENT NOT NULL,
id_cartes_cartes **NOT FOUND** NOT NULL,
PRIMARY KEY (id_partie_parties,
 id_cartes_cartes)) ENGINE=InnoDB;

ALTER TABLE player ADD CONSTRAINT FK_player_id_equipe_equipe_players FOREIGN KEY (id_equipe_equipe_players) REFERENCES equipe_players (id_equipe_equipe_players);

ALTER TABLE score_final ADD CONSTRAINT FK_score_final_id_partie_parties FOREIGN KEY (id_partie_parties) REFERENCES parties (id_partie_parties);
ALTER TABLE joue ADD CONSTRAINT FK_joue_id_player_player FOREIGN KEY (id_player_player) REFERENCES player (id_player_player);
ALTER TABLE joue ADD CONSTRAINT FK_joue_id_partie_parties FOREIGN KEY (id_partie_parties) REFERENCES parties (id_partie_parties);
ALTER TABLE utilise ADD CONSTRAINT FK_utilise_id_partie_parties FOREIGN KEY (id_partie_parties) REFERENCES parties (id_partie_parties);
ALTER TABLE utilise ADD CONSTRAINT FK_utilise_id_cartes_cartes FOREIGN KEY (id_cartes_cartes) REFERENCES cartes (id_cartes_cartes);
