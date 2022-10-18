--Herois
INSERT INTO Herois(heroi) VALUES('Nick Fury');
INSERT INTO Herois(heroi) VALUES('Iron Man');
INSERT INTO Herois(heroi) VALUES('Captain America');
INSERT INTO Herois(heroi) VALUES('Hulk');
INSERT INTO Herois(heroi) VALUES('Black Widow');
INSERT INTO Herois(heroi) VALUES('hawkeye');
INSERT INTO Herois(heroi) VALUES('Star Lord');
INSERT INTO Herois(heroi) VALUES('Gamora');
INSERT INTO Herois(heroi) VALUES('Groot');
INSERT INTO Herois(heroi) VALUES('Drax');
INSERT INTO Herois(heroi) VALUES('Rocket Racoon');
INSERT INTO Herois(heroi) VALUES('Professor Xavier');
INSERT INTO Herois(heroi) VALUES('Doutor Estranho');
INSERT INTO Herois(heroi) VALUES('Bill Raio Beta');

--Mentora
INSERT INTO Herois(heroi, mentor) VALUES('Spider Man', 'Iron Man');
INSERT INTO Herois(heroi, mentor) VALUES('Winter Soldier', 'Captain America');
INSERT INTO Herois(heroi, mentor) VALUES('Falcon', 'Captain America');
INSERT INTO Herois(heroi, mentor) VALUES('Wolverine', 'Professor Xavier');
INSERT INTO Herois(heroi, mentor) VALUES('Tempestade', 'Professor Xavier');
INSERT INTO Herois(heroi, mentor) VALUES('Ciclope', 'Professor Xavier');
INSERT INTO Herois(heroi, mentor) VALUES('Noturno', 'Professor Xavier');
INSERT INTO Herois(heroi, mentor) VALUES('Colosso', 'Professor Xavier');
INSERT INTO Herois(heroi, mentor) VALUES('Thor', 'Bill Raio Beta');

--Artefatos
INSERT INTO Artefatos(artefato,heroi) VALUES('Armas de fogo', 'Nick Fury');
INSERT INTO Artefatos(artefato,heroi) VALUES('Armadura de ferro', 'Iron Man');
INSERT INTO Artefatos(artefato,heroi) VALUES('Escudo', 'Captain America' );
INSERT INTO Artefatos(artefato,heroi) VALUES('Pistolas', 'Black Widow' );
INSERT INTO Artefatos(artefato,heroi) VALUES('Arco e flechas', 'hawkeye' );
INSERT INTO Artefatos(artefato,heroi) VALUES('Mjolnir', 'Thor' );
INSERT INTO Artefatos(artefato,heroi) VALUES('Capacete', 'Star Lord' );
INSERT INTO Artefatos(artefato,heroi) VALUES('Espada Godslayer', 'Gamora' );
INSERT INTO Artefatos(artefato,heroi) VALUES('Facas', 'Drax');
INSERT INTO Artefatos(artefato,heroi) VALUES('Canhao laser', 'Rocket Racoon');
INSERT INTO Artefatos(artefato,heroi) VALUES('Olho de Agamento', 'Doutor Estranho');
INSERT INTO Artefatos(artefato) VALUES('Darkhold');

--Comuns
UPDATE Comuns SET especialidade = 'arquearia' WHERE heroi = 'hawkeye';
UPDATE Comuns SET especialidade = 'Liderança' WHERE heroi = 'Nick Fury';
UPDATE Comuns SET especialidade = 'Espionagem' WHERE heroi = 'Black Widow';
UPDATE Comuns SET especialidade = 'Roubo' WHERE heroi = 'Star Lord';
UPDATE Comuns SET especialidade = 'Combate' WHERE heroi IN ('Gamora', 'Drax');
UPDATE Comuns SET especialidade = 'Tecnologia' WHERE heroi IN ('Rocket Racoon', 'Iron Man');

--Vilões
INSERT INTO Viloes(vilao) VALUES('Thanos');
INSERT INTO Viloes(vilao) VALUES('Loki');
INSERT INTO Viloes(vilao) VALUES('Sentinela');
INSERT INTO Viloes(vilao) VALUES('Magneto');
INSERT INTO Viloes(vilao) VALUES('Caveira Vermelha');
INSERT INTO Viloes(vilao) VALUES('Ultron');
INSERT INTO Viloes(vilao) VALUES('Abutre');
INSERT INTO Viloes(vilao) VALUES('Misterio');

--Poderes
INSERT INTO Poderes VALUES('Super Força', 1, 'Consede força sobre humana');
INSERT INTO Poderes VALUES('Super Força', 2, 'Consede força capaz de levantar equivalente a 2t');
INSERT INTO Poderes VALUES('Super Força', 3, 'Consede força capaz de levantar equivalente a 8t');
INSERT INTO Poderes VALUES('Super Força', 5, 'Consede força capaz de derrubar prédios');
INSERT INTO Poderes VALUES('Regeneração', 1, 'Consegue curar de ferimentos leves com rapidez');
INSERT INTO Poderes VALUES('Regeneração', 3, 'Consegue curar de ferimentos leves a mortais a seres humanos incluindo orgãos');
INSERT INTO Poderes VALUES('Regeneração', 4, 'Consegue curar de ferimentos mortais incluindo membros');
INSERT INTO Poderes VALUES('Regeneração', 5, 'Consegue curar qualquer tipo de ferimento, enganam a própria morte');
INSERT INTO Poderes VALUES('Raios', 3, 'Consegue Emitir carga eletrica nos oponentes');
INSERT INTO Poderes VALUES('Voo', 2, 'Consegue voar na velocidade de aviões');
INSERT INTO Poderes VALUES('Voo', 3, 'Consegue voar na velocidade de jatos');
INSERT INTO Poderes VALUES('Voo', 4, 'Consegue voar na velocidade do som');
INSERT INTO Poderes VALUES('Morfo', 2, 'Consegue alterar partes do corpo');
INSERT INTO Poderes VALUES('Corpo de Adamantium', 4, 'Possui exoesqueleto de adamantium, podendo possuir laminas extremamente resistentes no corpo');
INSERT INTO Poderes VALUES('Controle do Clima', 4, 'Consegue mudar o clima e causar tempestades');
INSERT INTO Poderes VALUES('Telepatia', 5, 'Consegue conversar mentalmente com as pessoas e/ou controlar a mente delas');
INSERT INTO Poderes VALUES('Olhos Laser', 3, 'Consegue emitir raios laser dos olhos, podendo alcançar extremas temperaturas');
INSERT INTO Poderes VALUES('Teleporte', 4, 'Consegue Mudar sua posição e ou de aliados de forma instantânea');
INSERT INTO Poderes VALUES('Invulnerabilidade', 3, 'Consegue aguentar grandes quantidades de dano sem se ferir');
INSERT INTO Poderes VALUES('Magia', 5, 'Magia de nível mago supremo');

--Superes
INSERT INTO Superes VALUES ('Hulk', 'Super Força', 5);
INSERT INTO Superes VALUES ('Hulk', 'Regeneração', 5);
INSERT INTO Superes VALUES ('Thor', 'Raios', 3);
INSERT INTO Superes VALUES ('Groot', 'Regeneração', 3);
INSERT INTO Superes VALUES ('Groot', 'Morfo', 2);
INSERT INTO Superes VALUES ('Captain America', 'Regeneração', 1);
INSERT INTO Superes VALUES ('Captain America', 'Super Força', 2);
INSERT INTO Superes VALUES ('Wolverine', 'Super Força', 3);
INSERT INTO Superes VALUES ('Wolverine', 'Regeneração', 5);
INSERT INTO Superes VALUES ('Wolverine', 'Corpo de Adamantium', 4);
INSERT INTO Superes VALUES ('Tempestade', 'Controle do Clima', 4);
INSERT INTO Superes VALUES ('Tempestade', 'Voo', 2);
INSERT INTO Superes VALUES ('Professor Xavier', 'Telepatia', 5);
INSERT INTO Superes VALUES ('Ciclope', 'Olhos Laser', 3);
INSERT INTO Superes VALUES ('Noturno', 'Teleporte', 4);
INSERT INTO Superes VALUES ('Colosso', 'Super Força', 3);
INSERT INTO Superes VALUES ('Colosso', 'Invulnerabilidade', 3);
INSERT INTO Superes Values ('Bill Raio Beta', 'Raios', 3);
INSERT INTO Superes Values ('Doutor Estranho', 'Magia', 5);

--Feitos
INSERT INTO Feitos(heroi, feito_realizado) VALUES('Captain America', 'Veterano da Segunda Guerra Mundial');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('Iron Man', 'Lutou contra a invasão alienigena de Nova York em 2012');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('Captain America', 'Lutou contra a invasão alienigena de Nova York em 2012');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('Hulk', 'Lutou contra a invasão alienigena de Nova York em 2012');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('hawkeye', 'Lutou contra a invasão alienigena de Nova York em 2012');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('Black Widow', 'Lutou contra a invasão alienigena de Nova York em 2012');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('Thor', 'Lutou contra a invasão alienigena de Nova York em 2012');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('Star Lord', 'Salvou a galaxia');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('Groot', 'Salvou a galaxia');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('Gamora', 'Salvou a galaxia');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('Drax', 'Salvou a galaxia');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('Rocket Racoon', 'Salvou a galaxia');
INSERT INTO Feitos(heroi, feito_realizado) VALUES('Thor', 'Salvou o povo de Asgard');

--Equipes
INSERT INTO Equipes(equipe) VALUES ('Avengers');
INSERT INTO Equipes(equipe) VALUES ('Guardians Of The Galaxy');
INSERT INTO Equipes(equipe) VALUES ('X-men');

--Heróis Equipe
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
INSERT INTO HeroiEquipe(heroi, equipe) VALUES('Wolverine','X-men');
INSERT INTO HeroiEquipe(heroi, equipe) VALUES('Professor Xavier','X-men');
INSERT INTO HeroiEquipe(heroi, equipe) VALUES('Tempestade','X-men');
INSERT INTO HeroiEquipe(heroi, equipe) VALUES('Ciclope','X-men');
INSERT INTO HeroiEquipe(heroi, equipe) VALUES('Noturno','X-men');
INSERT INTO HeroiEquipe(heroi, equipe) VALUES('Colosso','X-men');

--Localização
INSERT INTO Localizacoes(regiao, latitude, longitude) VALUES('New York', 40.894112553018076, -73.97263907468503);
INSERT INTO Localizacoes(regiao, latitude, longitude) VALUES('Washington D.C', 38.9041, -77.0171);
INSERT INTO Localizacoes(regiao, latitude, longitude) VALUES('Wakanda', 4.6427869, 35.906449);

--Base de operações
INSERT INTO Bases_De_Operacoes(base, chefe, equipe) VALUES('Torre dos Vingadores', 'Captain America', 'Avengers');

--Combates
INSERT INTO Combates VALUES('New York', 'Iron Man', 'Loki', TO_DATE('12/03/2008','DD/MM/YYYY'));
INSERT INTO Combates VALUES('New York', 'Hulk', 'Loki', TO_DATE('12/03/2008','DD/MM/YYYY'));
INSERT INTO Combates VALUES('New York', 'Captain America', 'Loki', TO_DATE('12/03/2008','DD/MM/YYYY'));
INSERT INTO Combates VALUES('New York', 'Black Widow', 'Loki', TO_DATE('12/03/2008','DD/MM/YYYY'));
INSERT INTO Combates VALUES('New York', 'Thor', 'Loki', TO_DATE('12/03/2008','DD/MM/YYYY'));
INSERT INTO Combates VALUES('New York', 'hawkeye', 'Loki', TO_DATE('12/03/2008','DD/MM/YYYY'));
INSERT INTO Combates VALUES('Washington D.C', 'Wolverine', 'Magneto', TO_DATE('26/05/2006','DD/MM/YYYY'));
INSERT INTO Combates VALUES('Washington D.C', 'Tempestade', 'Magneto', TO_DATE('26/05/2006','DD/MM/YYYY'));
INSERT INTO Combates VALUES('Washington D.C', 'Professor Xavier', 'Magneto', TO_DATE('26/05/2006','DD/MM/YYYY'));
INSERT INTO Combates VALUES('Washington D.C', 'Colosso', 'Magneto', TO_DATE('26/05/2006','DD/MM/YYYY'));
INSERT INTO Combates VALUES('Washington D.C', 'Noturno', 'Magneto', TO_DATE('26/05/2006','DD/MM/YYYY'));
INSERT INTO Combates VALUES('Washington D.C', 'Ciclope', 'Magneto', TO_DATE('26/05/2006','DD/MM/YYYY'));
INSERT INTO Combates VALUES('Wakanda', 'Star Lord', 'Thanos', TO_DATE('26/04/2018','DD/MM/YYYY'));
INSERT INTO Combates VALUES('Wakanda', 'Rocket Racoon', 'Thanos', TO_DATE('26/04/2018','DD/MM/YYYY'));
INSERT INTO Combates VALUES('Wakanda', 'Groot', 'Thanos', TO_DATE('26/04/2018','DD/MM/YYYY'));
INSERT INTO Combates VALUES('Wakanda', 'Drax', 'Thanos', TO_DATE('26/04/2018','DD/MM/YYYY'));
INSERT INTO Combates VALUES('Wakanda', 'Gamora', 'Thanos', TO_DATE('26/04/2018','DD/MM/YYYY'));

--Vitimas
INSERT INTO Vitimas(cpf, localizacao, heroi, vilao, dia) VALUES('3214', 'New York', 'Iron Man', 'Loki', TO_DATE('12/03/2008','DD/MM/YYYY'));
INSERT INTO Vitimas(cpf, localizacao, heroi, vilao, dia) VALUES('2222', 'Washington D.C', 'Wolverine', 'Magneto', TO_DATE('26/05/2006','DD/MM/YYYY'));
INSERT INTO Vitimas(cpf, localizacao, heroi, vilao, dia) VALUES('1321', 'Wakanda', 'Groot', 'Thanos',TO_DATE('26/04/2018','DD/MM/YYYY'));
