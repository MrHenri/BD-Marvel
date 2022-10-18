-- GROUP BY HAVING (Listar poderes que são compartilhados por mais de 1 herói) --
SELECT COUNT(heroi) AS quantheroi, poder, grau
FROM superes
GROUP BY poder, grau
HAVING COUNT(heroi) >= 2;

--INNER JOIN OLD SCHOOL (Listar heróis com equipes)--
SELECT h.heroi, he.equipe
FROM Herois h, HeroiEquipe he
WHERE h.heroi = he.heroi;

--INNER JOIN NEW SCHOOL (Listar heróis e suas detemrinadas equipes caso possuam) --
SELECT h.heroi, he.equipe
FROM Herois h
INNER JOIN heroiequipe he
ON h.heroi = he.heroi;

-- LEFT OUTTER JOIN (Listar todos os hérois e os artefatos dos que possuem) --
SELECT h.heroi, a.artefato
FROM Herois h
LEFT JOIN artefatos a
ON h.heroi = a.heroi;

-- SEMI JOIN (Listar todos os heroies que participaram de um combate) --
SELECT h.heroi
FROM Herois h
WHERE EXISTS
    (SELECT dia
    FROM Combates c
    WHERE h.heroi = c.heroi);

-- ANTI JOIN (Listar todos os Herois sem equipes) --
SELECT heroi
FROM Herois
WHERE heroi NOT IN
    (SELECT heroi
    FROM heroiequipe);

-- SUBCONSULTA TIPO ESCALAR (Listar heróis que possuem algum poder com grau acima da média) --
SELECT heroi, SUM(grau)
FROM Superes
GROUP BY heroi
HAVING SUM(grau) > (SELECT AVG(SUM(grau))
                    FROM Superes
                    GROUP BY heroi);

-- SUBCONSULTA TIPO LINHA (Listar heróis que possuem poder de Regeneração com grau 5)
SELECT heroi
FROM Superes
WHERE (grau, poder) =
    (SELECT grau, poder
    FROM Poderes
    WHERE poder = 'Regeneração' AND grau = 5);

-- SUBCONSULTA DO TIPO TABELA (Listar heróis que não participaram de um combate) --
SELECT heroi
FROM Herois
WHERE heroi NOT IN
    (SELECT heroi
    FROM Combates);

-- SUBCONSULTA DO TIPO TABELA 2 (Listar heróis que são chefes) --
SELECT heroi
FROM Herois
WHERE heroi IN
    (SELECT chefe
    FROM Bases_De_Operacoes);

-- OPERAÇÃO DE CONJUNTO -- (Juntar heróis e artefatos em uma tabela)
SELECT heroi
FROM Herois
UNION
SELECT Artefato
FROM Artefatos;
