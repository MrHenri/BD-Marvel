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
SELECT h.heroi, h.estado, he.equipe
FROM Herois h
INNER JOIN heroiequipe he
ON h.heroi = he.heroi;

-- LEFT OUTTER JOIN (Listar todos os hérois e os artefatos dos que possuem) --
SELECT h.heroi, a.artefato
FROM herois H
LEFT JOIN artefatos A
ON h.heroi = a.heroi;

-- SEMI JOIN (Listar todos os heroies que participaram de um combate) --
SELECT h.heroi
FROM  herois h
WHERE EXISTS 
    (SELECT c.dia
    FROM combates c
    WHERE h.heroi = c.heroi)

-- ANTI JOIN (Listar todos os herois sem equipes) -- 
SELECT H.heroi
FROM herois h
WHERE h.heroi NOT IN
    (SELECT he.heroi
    FROM heroiequipe he);

-- SUBCONSULTA TIPO ESCALAR (Listar heróis que possuem algum poder com grau acima da média) --
SELECT DISTINCT heroi
FROM superes
WHERE grau >
    (SELECT AVG(grau)
    FROM superes);

-- SUBCONSULTA TIPO LINHA 
SELECT HEROI
FROM SUPERES 
WHERE (GRAU, PODER) = 
    (SELECT GRAU, PODER
    FROM SUPERES
    WHERE HEROI = 'Thor');
    
-- SUBCONSULTA DO TIPO TABELA (Listar heróis que não participaram de um combate) --
SELECT HEROI
FROM HEROIS
WHERE HEROI NOT IN
    (SELECT HEROI
    FROM COMBATES)

-- SUBCONSULTA DO TIPO TABELA 2 (Listar heróis que são chefes) --


SELECT H.HEROI 
FROM HEROIS H
WHERE H.HEROI IN
    (SELECT B.CHEFE
    FROM BASES_DE_OPERACOES B)

-- OPERAÇÃO DE CONJUNTO -- (Juntar heróis e artefatos em uma tabela)

SELECT H.HEROI
FROM HEROIS H
UNION
SELECT A.ARTEFATO
FROM ARTEFATOS A
