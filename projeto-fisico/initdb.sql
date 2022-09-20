CREATE TABLE Herois(
    nome VARCHAR(80) NOT NULL,
    id_heroi INT AUTO_INCREMENT PRIMARY KEY,
    estado VARCHAR(12) DEFAULT 'Vivo',
    mentor INT, 
    FOREIGN KEY (mentor) REFERENCES Herois(id_heroi)
);

CREATE TABLE Feitos (
    id_heroi INT NOT NULL,
    feitos_realizados VARCHAR(280),
    CONSTRAINT pk_feitos PRIMARY KEY (id_heroi, feitos_realizados),
    CONSTRAINT fk_feitos FOREIGN KEY (id_heroi) REFERENCES Herois (id_heroi)
);

CREATE TABLE Comuns (
	id_heroi int PRIMARY KEY,
    especialidade VARCHAR(80),
    FOREIGN KEY (id_heroi) REFERENCES Herois(id_heroi) 
);

CREATE TABLE Poderes (
	grau ENUM('1', '2', '3', '4', '5'),
    titulo VARCHAR(80) PRIMARY KEY,
    descricao VARCHAR(280), 
    id_heroi int NOT NULL,
    FOREIGN KEY (id_heroi) REFERENCES Herois(id_heroi)
);


CREATE TABLE Artefatos(
    nome VARCHAR(80) PRIMARY KEY,
    id_heroi INT,
    FOREIGN KEY (id_heroi) REFERENCES Herois(id_heroi)
);

CREATE TABLE Equipes (
    nome VARCHAR(80) NOT NULL,
    codigo INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE HeroiEquipe (
    id_heroi INT NOT NULL,
    cod_equipe INT NOT NULL,
    FOREIGN KEY (id_heroi) REFERENCES Herois(id_heroi),
    FOREIGN KEY (cod_equipe) REFERENCES Equipes(codigo)
);

CREATE TABLE Bases_De_Operacao (
    numero int AUTO_INCREMENT,
    cod_equipe int,
    PRIMARY KEY (numero, cod_equipe),
    FOREIGN KEY (cod_equipe) REFERENCES Equipes(codigo)
);

CREATE TABLE Viloes (
	codinome VARCHAR(20) PRIMARY KEY
);

Create TABLE Localizacoes(
	latitude DECIMAL(8,6),
    longitude DECIMAL(9,6),
    cod_equipe int UNIQUE,
    PRIMARY KEY (latitude, longitude),
    FOREIGN KEY (cod_equipe) REFERENCES Equipes(codigo)
);

CREATE TABLE Combates(
	latitude DECIMAL(8,6),
    longitude Decimal(9,6),
    id_heroi int,
    cod_vilao varchar(20),
    dia date,
    PRIMARY KEY (id_heroi, cod_vilao, dia, latitude, longitude),
    FOREIGN KEY (id_heroi) REFERENCES Herois(id_heroi),
    FOREIGN KEY (cod_vilao) REFERENCES Viloes(codinome),
    FOREIGN KEY (latitude, longitude) REFERENCES Localizacoes(latitude, longitude)
);

CREATE TABLE Vitimas(
    latitude DECIMAL(8,6) NOT NULL,
    longitude Decimal(9,6) NOT NULL,
    id_heroi int NOT NULL,
    cod_vilao varchar(20) NOT NULL,
    dia date NOT NULL,
    cpf varchar(12) PRIMARY KEY,
    FOREIGN KEY (id_heroi, cod_vilao, dia, latitude, longitude) 
    REFERENCES Combates(id_heroi, cod_vilao, dia, latitude, longitude)
);

INSERT INTO Herois(nome) VALUES("Iron Man");
INSERT INTO Herois(nome) VALUES("Captain America");
INSERT INTO Herois(nome) VALUES("Hulk");
INSERT INTO Herois(nome) VALUES("hawkeye");
INSERT INTO Herois(nome) VALUES("Black Widow");
INSERT INTO Herois(nome) VALUES("Thor");
INSERT INTO Herois(nome) VALUES("Star Lord");
INSERT INTO Herois(nome) VALUES("Gamora");
INSERT INTO Herois(nome) VALUES("Groot");
INSERT INTO Herois(nome) VALUES("Drax");
INSERT INTO Herois(nome) VALUES("Rocket Racoon");
INSERT INTO Herois(nome, mentor) VALUES("Spider Man", 1);
INSERT INTO Herois(nome, mentor) VALUES("Winter Soldier", 2);
INSERT INTO Herois(nome, mentor) VALUES("Falcon", 2);


INSERT INTO Feitos(id_heroi, feitos_realizados) VALUES(2, "Veterano da Segunda Guerra Mundial");
INSERT INTO Feitos(id_heroi, feitos_realizados) VALUES(1, "Lutou contra a invasão alienigena de Nova York em 2012");
INSERT INTO Feitos(id_heroi, feitos_realizados) VALUES(2, "Lutou contra a invasão alienigena de Nova York em 2012");
INSERT INTO Feitos(id_heroi, feitos_realizados) VALUES(3, "Lutou contra a invasão alienigena de Nova York em 2012");
INSERT INTO Feitos(id_heroi, feitos_realizados) VALUES(4, "Lutou contra a invasão alienigena de Nova York em 2012");
INSERT INTO Feitos(id_heroi, feitos_realizados) VALUES(5, "Lutou contra a invasão alienigena de Nova York em 2012");
INSERT INTO Feitos(id_heroi, feitos_realizados) VALUES(6, "Lutou contra a invasão alienigena de Nova York em 2012");


INSERT INTO Equipes(nome) VALUES ("Avengers");
INSERT INTO Equipes(nome) VALUES ("Guardians Of The Galaxy");


INSERT INTO HeroiEquipe(id_heroi, cod_equipe) VALUES(1,1);
INSERT INTO HeroiEquipe(id_heroi, cod_equipe) VALUES(2,1);
INSERT INTO HeroiEquipe(id_heroi, cod_equipe) VALUES(3,1);
INSERT INTO HeroiEquipe(id_heroi, cod_equipe) VALUES(4,1);
INSERT INTO HeroiEquipe(id_heroi, cod_equipe) VALUES(5,1);
INSERT INTO HeroiEquipe(id_heroi, cod_equipe) VALUES(6,1);
INSERT INTO HeroiEquipe(id_heroi, cod_equipe) VALUES(7,2);
INSERT INTO HeroiEquipe(id_heroi, cod_equipe) VALUES(8,2);
INSERT INTO HeroiEquipe(id_heroi, cod_equipe) VALUES(9,2);
INSERT INTO HeroiEquipe(id_heroi, cod_equipe) VALUES(10,2);
INSERT INTO HeroiEquipe(id_heroi, cod_equipe) VALUES(11,2);
INSERT INTO HeroiEquipe(id_heroi, cod_equipe) VALUES(12,1);


-- ALL Avengers
-- SELECT h.nome FROM Herois h, HeroiEquipe he, Equipes e
-- WHERE h.id_heroi = he.id_heroi AND he.cod_equipe = e.codigo AND e.nome = "Avengers";