CREATE TABLE Herois(
    heroi VARCHAR(80) PRIMARY KEY,
    estado VARCHAR(12) DEFAULT 'Vivo',
    mentor VARCHAR(80), 
    FOREIGN KEY (mentor) REFERENCES Herois(heroi)
);

CREATE TABLE Feitos (
    heroi VARCHAR(80) NOT NULL,
    feito_realizado VARCHAR(280),
    CONSTRAINT pk_feitos PRIMARY KEY (heroi, feito_realizado),
    CONSTRAINT fk_feitos FOREIGN KEY (heroi) REFERENCES Herois (heroi)
);

CREATE TABLE Comuns (
	heroi VARCHAR(80) PRIMARY KEY,
    especialidade VARCHAR(80),
    FOREIGN KEY (heroi) REFERENCES Herois(heroi)
);

CREATE TABLE Poderes (
	grau INT NOT NULL CHECK (grau BETWEEN 0 AND 5),
    poder VARCHAR(80) PRIMARY KEY,
    descricao VARCHAR(280), 
    heroi VARCHAR(80) NOT NULL,
    FOREIGN KEY (heroi) REFERENCES Herois(heroi)
);


CREATE TABLE Artefatos(
    artefato VARCHAR(80) PRIMARY KEY,
    heroi VARCHAR(80),
    FOREIGN KEY (heroi) REFERENCES Herois(heroi)
);

Create TABLE Localizacoes(
    regiao VARCHAR(80) PRIMARY KEY,
	latitude NUMBER (*,15) NOT NULL CHECK (latitude BETWEEN -90 AND 90),
    longitude NUMBER (*,15) NOT NULL CHECK (longitude BETWEEN -180 AND 180)
);

CREATE TABLE Equipes (
    equipe VARCHAR(80) PRIMARY KEY,
    regiao VARCHAR(80),
    FOREIGN KEY (regiao) REFERENCES Localizacoes(regiao)
);

CREATE TABLE HeroiEquipe (
    heroi VARCHAR(80) NOT NULL,
    equipe VARCHAR(80) NOT NULL,
    FOREIGN KEY (heroi) REFERENCES Herois(heroi),
    FOREIGN KEY (equipe) REFERENCES Equipes(equipe)
);

CREATE TABLE Bases_De_Operacoes (
   base VARCHAR(80),
   chefe VARCHAR(80),
   equipe VARCHAR(80),
   PRIMARY KEY (base, equipe),
   FOREIGN KEY (equipe) REFERENCES Equipes(equipe)
);

CREATE TABLE Viloes (
	vilao VARCHAR(80) PRIMARY KEY
);

CREATE TABLE Combates(
	localizacao VARCHAR(80),
    heroi VARCHAR(80),
    vilao VARCHAR(80),
    dia DATE,
    PRIMARY KEY (heroi, vilao, dia, localizacao),
    FOREIGN KEY (heroi) REFERENCES Herois(heroi),
    FOREIGN KEY (vilao) REFERENCES Viloes(vilao),
    FOREIGN KEY (localizacao) REFERENCES Localizacoes(regiao)
);

CREATE TABLE Vitimas(
    localizacao VARCHAR(80) NOT NULL,
    heroi VARCHAR(80) NOT NULL,
    vilao VARCHAR(20) NOT NULL,
    dia DATE NOT NULL,
    cpf VARCHAR(14) PRIMARY KEY,
    FOREIGN KEY (heroi, vilao, dia, localizacao),
    REFERENCES Combates(heroi, vilao, dia, localizacao)
);

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