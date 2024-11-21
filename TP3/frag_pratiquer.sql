-- Création de la fragementation Horizontale de Pratiquer sur etupre
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
REPLACE Pratiquer_1-
USING SELECT P.*-
FROM Pratiquer P-
JOIN Discipline D ON P.ndd = D.ndd-
WHERE genred = 'M';

-- Création de la fragementation Horizontale de Pratiquer sur etusec
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@brehat.univ-tlse3.fr:1521:etusec-
REPLACE Pratiquer_2-
USING SELECT P.*-
FROM Pratiquer P-
JOIN Discipline D ON P.ndd = D.ndd-
WHERE genred = 'F';

-- Création de la fragementation Horizontale de Pratiquer sur etuter
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etuter-
REPLACE Pratiquer_3-
USING SELECT P.*-
FROM Pratiquer P-
JOIN Discipline D ON P.ndd = D.ndd-
WHERE genred IN('X, O');