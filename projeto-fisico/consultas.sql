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

-- LEFT OUTTER JOIN (Listar todos os hérois e os artefatos dos que possuem)
SELECT h.heroi, a.artefato
FROM herois H
LEFT JOIN artefatos A
ON h.heroi = a.heroi;

-- SEMI JOIN (Listar todos os heroies que participaram de um combate)
SELECT h.heroi
FROM  herois h
WHERE EXISTS 
    (SELECT c.dia
    FROM combates c
    WHERE h.heroi = c.heroi)

-- ANTI JOIN (Listar todos os herois sem equipes)-- 
SELECT H.heroi
FROM herois h
WHERE h.heroi NOT IN
    (SELECT he.heroi
    FROM heroiequipe he);

-- SUBCONSULTA TIPO ESCALAR (Listar heróis que possuem algum poder com grau acima da média)
SELECT DISTINCT heroi
FROM superes
WHERE grau >
    (SELECT AVG(grau)
    FROM superes);
