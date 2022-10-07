INSERT INTO Herois(heroi) VALUES('Nick Fury');
INSERT INTO Herois(heroi) VALUES('Iron Man');
INSERT INTO Herois(heroi) VALUES('Captain America');
INSERT INTO Herois(heroi) VALUES('Hulk');
INSERT INTO Comuns(heroi, especialidade) VALUES('hawkeye', 'arquearia');
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
INSERT INTO Viloes(vilao) VALUES('Thanos');
INSERT INTO Viloes(vilao) VALUES('Loki');

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

INSERT INTO Localizacoes(regiao, latitude, longitude) VALUES('New York', 40.894112553018076, -73.97263907468503);

INSERT INTO Combates VALUES('New York', 'Iron Man', 'Loki', TO_DATE('12/03/2008','DD/MM/YYYY'));