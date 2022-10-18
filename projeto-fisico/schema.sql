CREATE TABLE Herois(
    heroi VARCHAR(80),
    estado VARCHAR(12) DEFAULT 'vivo' CHECK (estado IN ('vivo', 'morto')),
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
    poder VARCHAR(80),
	grau INT CHECK (grau BETWEEN 0 AND 5),
    descricao VARCHAR(280),
    CONSTRAINT pk_poder PRIMARY KEY (poder, grau)
);

CREATE TABLE Superes (
    heroi VARCHAR(80),
    poder VARCHAR(80),
    grau INT NOT NULL,
    CONSTRAINT pk_super PRIMARY KEY (heroi, poder),
    CONSTRAINT fk_heroi_super FOREIGN KEY (heroi) REFERENCES Herois (heroi) ON DELETE CASCADE,
    CONSTRAINT fk_heroi_poder FOREIGN KEY (poder, grau) REFERENCES Poderes (poder, grau) ON DELETE CASCADE
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
    cpf VARCHAR(4),
    localizacao VARCHAR(80) NOT NULL,
    heroi VARCHAR(80) NOT NULL,
    vilao VARCHAR(20) NOT NULL,
    dia DATE NOT NULL,
    CONSTRAINT pk_vitimas PRIMARY KEY (cpf),
    CONSTRAINT fk_combate_vitima FOREIGN KEY (heroi, vilao, dia, localizacao)
    REFERENCES Combates(heroi, vilao, dia, localizacao) ON DELETE CASCADE
);