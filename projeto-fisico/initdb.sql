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

CREATE TABLE Comum (
	id_heroi int PRIMARY KEY,
    especialidade VARCHAR(80),
    FOREIGN KEY (id_heroi) REFERENCES Herois(id_heroi) 
);

CREATE TABLE Poder (
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

CREATE TABLE Base_De_Operacao (
    numero int AUTO_INCREMENT,
    cod_equipe int,
    PRIMARY KEY (numero, cod_equipe),
    FOREIGN KEY (cod_equipe) REFERENCES Equipes(codigo)
);

CREATE TABLE Vilao (
	codinome VARCHAR(20) PRIMARY KEY
);

Create TABLE Localizacao(
	latitude DECIMAL(8,6),
    longitude DECIMAL(9,6),
    cod_equipe int UNIQUE,
    PRIMARY KEY (latitude, longitude),
    FOREIGN KEY (cod_equipe) REFERENCES Equipes(codigo)
);

CREATE TABLE Combate(
	latitude DECIMAL(8,6),
    longitude Decimal(9,6),
    id_heroi int,
    cod_vilao varchar(20),
    dia date,
    PRIMARY KEY (id_heroi, cod_vilao, dia, latitude, longitude),
    FOREIGN KEY (id_heroi) REFERENCES Herois(id_heroi),
    FOREIGN KEY (cod_vilao) REFERENCES Vilao(codinome),
    FOREIGN KEY (latitude, longitude) REFERENCES Localizacao(latitude, longitude)
);

CREATE TABLE Vitima(
    
    latitude DECIMAL(8,6) NOT NULL,
    longitude Decimal(9,6) NOT NULL,
    id_heroi int NOT NULL,
    cod_vilao varchar(20) NOT NULL,
    dia date NOT NULL,
    cpf varchar(12) PRIMARY KEY,
    FOREIGN KEY (id_heroi, cod_vilao, dia, latitude, longitude) 
    REFERENCES Combate(id_heroi, cod_vilao, dia, latitude, longitude)
);
