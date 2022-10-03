CREATE TABLE Herois(
    heroi VARCHAR(80),
    estado VARCHAR(12) DEFAULT 'Vivo',
    mentor VARCHAR(80),
    CONSTRAINT pk_heroi PRIMARY KEY (heroi),
    CONSTRAINT fk_mentor FOREIGN KEY (mentor) REFERENCES Herois(heroi) ON DELETE SET NULL
);

CREATE TABLE Feitos (
    feito_realizado VARCHAR(280),
    heroi VARCHAR(80),
    CONSTRAINT pk_feito PRIMARY KEY (heroi, feito_realizado),
    CONSTRAINT fk_heroi_feito FOREIGN KEY (heroi) REFERENCES Herois(heroi) ON DELETE CASCADE
);

CREATE TABLE Comuns (
	heroi VARCHAR(80),
    especialidade VARCHAR(80) NOT NULL,
    CONSTRAINT pk_comum PRIMARY KEY (heroi),
    CONSTRAINT fk_heroi_comum FOREIGN KEY (heroi) REFERENCES Herois(heroi) ON DELETE CASCADE
);

CREATE TABLE Poderes (
	grau INT NOT NULL CHECK (grau BETWEEN 0 AND 5),
    poder VARCHAR(80),
    descricao VARCHAR(280),
    heroi VARCHAR(80) NOT NULL,
    CONSTRAINT pk_poder PRIMARY KEY (poder),
    CONSTRAINT fk_heroi_poder FOREIGN KEY (heroi) REFERENCES Herois(heroi) ON DELETE CASCADE
);


CREATE TABLE Artefatos(
    artefato VARCHAR(80),
    heroi VARCHAR(80),
    CONSTRAINT pk_artefato PRIMARY KEY (artefato),
    CONSTRAINT fk_heroi_artefato FOREIGN KEY (heroi) REFERENCES Herois(heroi) ON DELETE SET NULL
);

Create TABLE Localizacoes(
    regiao VARCHAR(80),
	latitude NUMBER (*,15) NOT NULL CHECK (latitude BETWEEN -90 AND 90),
    longitude NUMBER (*,15) NOT NULL CHECK (longitude BETWEEN -180 AND 180),
    CONSTRAINT pk_regiao PRIMARY KEY (regiao)
);

CREATE TABLE Equipes (
    equipe VARCHAR(80),
    regiao VARCHAR(80),
    CONSTRAINT pk_equipe PRIMARY KEY (equipe),
    CONSTRAINT fk_equipe_regiao FOREIGN KEY (regiao) REFERENCES Localizacoes(regiao) ON DELETE SET NULL
);

CREATE TABLE HeroiEquipe (
    heroi VARCHAR(80),
    equipe VARCHAR(80),
    CONSTRAINT pk_heroi_equipe PRIMARY KEY (heroi, equipe),
    CONSTRAINT fk_heroi_heroiequipe FOREIGN KEY (heroi) REFERENCES Herois(heroi) ON DELETE CASCADE,
    CONSTRAINT fk_equipe_heroiequipe FOREIGN KEY (equipe) REFERENCES Equipes(equipe) ON DELETE CASCADE
);

CREATE TABLE Bases_De_Operacoes (
   base VARCHAR(80),
   chefe VARCHAR(80),
   equipe VARCHAR(80),
   CONSTRAINT pk_base PRIMARY KEY (base, equipe),
   CONSTRAINT fk_equipe_base FOREIGN KEY (equipe) REFERENCES Equipes(equipe)
);

CREATE TABLE Viloes (
	vilao VARCHAR(80),
    CONSTRAINT pk_vilao PRIMARY KEY (vilao)
);

CREATE TABLE Combates(
	localizacao VARCHAR(80),
    heroi VARCHAR(80),
    vilao VARCHAR(80),
    dia DATE,
    CONSTRAINT pk_combate PRIMARY KEY (heroi, vilao, dia, localizacao),
    CONSTRAINT fk_heroi_combate FOREIGN KEY (heroi) REFERENCES Herois(heroi) ON DELETE CASCADE,
    CONSTRAINT fk_vilao_combate FOREIGN KEY (vilao) REFERENCES Viloes(vilao) ON DELETE CASCADE,
    CONSTRAINT fk_local_combate FOREIGN KEY (localizacao) REFERENCES Localizacoes(regiao) ON DELETE CASCADE
);

CREATE TABLE Vitimas(
    cpf VARCHAR(14),
    localizacao VARCHAR(80) NOT NULL,
    heroi VARCHAR(80) NOT NULL,
    vilao VARCHAR(20) NOT NULL,
    dia DATE NOT NULL,
    CONSTRAINT pk_vitimas PRIMARY KEY (cpf),
    CONSTRAINT fk_combate_vitima FOREIGN KEY (heroi, vilao, dia, localizacao)
    REFERENCES Combates(heroi, vilao, dia, localizacao) ON DELETE CASCADE
);

INSERT INTO Herois(heroi) VALUES('Nick Fury');
INSERT INTO Herois(heroi) VALUES('Iron Man');
INSERT INTO Herois(heroi) VALUES('Captain America');
INSERT INTO Herois(heroi) VALUES('Hulk');
INSERT INTO Herois(heroi) VALUES('hawkeye');
INSERT INTO Herois(heroi) VALUES('Black Widow');
INSERT INTO Herois(heroi) VALUES('Thor');
INSERT INTO Herois(heroi) VALUES('Star Lord');
INSERT INTO Herois(heroi) VALUES('Gamora');
INSERT INTO Herois(heroi) VALUES('Groot');
INSERT INTO Herois(heroi) VALUES('Drax');
INSERT INTO Herois(heroi) VALUES('Rocket Racoon');
INSERT INTO Herois(heroi, mentor) VALUES('Spider Man', 'Iron Man');
INSERT INTO Herois(heroi, mentor) VALUES('Winter Soldier', 'Captain America');
INSERT INTO Herois(heroi, mentor) VALUES('Falcon', 'Captain America');

INSERT INTO Poderes(heroi, poder, grau) VALUES('Hulk', 'Super Força', 5);
INSERT INTO Poderes(heroi, poder, grau) VALUES('Hulk', 'Regeneração', 5);

INSERT INTO Feitos(heroi, feito_realizado) VALUES('Captain America', 'Veterano da Segunda Guerra Mundial');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('Iron Man', 'Lutou contra a invasão alienigena de Nova York em 2012');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('Captain America', 'Lutou contra a invasão alienigena de Nova York em 2012');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('Hulk', 'Lutou contra a invasão alienigena de Nova York em 2012');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('hawkeye', 'Lutou contra a invasão alienigena de Nova York em 2012');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('Black Widow', 'Lutou contra a invasão alienigena de Nova York em 2012');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('Thor', 'Lutou contra a invasão alienigena de Nova York em 2012');


INSERT INTO Equipes(equipe) VALUES ('Avengers');
INSERT INTO Equipes(equipe) VALUES ('Guardians Of The Galaxy');


INSERT INTO HeroiEquipe(heroi, equipe) VALUES('Iron Man','Avengers');
INSERT INTO HeroiEquipe(heroi, equipe) VALUES('Captain America','Avengers');
INSERT INTO HeroiEquipe(heroi, equipe) VALUES('Hulk','Avengers');
INSERT INTO HeroiEquipe(heroi, equipe) VALUES('hawkeye','Avengers');
INSERT INTO HeroiEquipe(heroi, equipe) VALUES('Black Widow','Avengers');
INSERT INTO HeroiEquipe(heroi, equipe) VALUES('Thor','Avengers');
INSERT INTO HeroiEquipe(heroi, equipe) VALUES('Star Lord','Guardians Of The Galaxy');
INSERT INTO HeroiEquipe(heroi, equipe) VALUES('Gamora','Guardians Of The Galaxy');
INSERT INTO HeroiEquipe(heroi, equipe) VALUES('Groot','Guardians Of The Galaxy');
INSERT INTO HeroiEquipe(heroi, equipe) VALUES('Drax','Guardians Of The Galaxy');
INSERT INTO HeroiEquipe(heroi, equipe) VALUES('Rocket Racoon','Guardians Of The Galaxy');
INSERT INTO HeroiEquipe(heroi, equipe) VALUES('Spider Man','Avengers');

INSERT INTO Localizacoes(regiao, latitude, longitude) VALUES('Nova York', 40.894112553018076, -73.97263907468503);