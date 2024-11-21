-- Création de la fragementation Horizontale de Pratiquer sur etupre
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
REPLACE Gagner_I_1
USING SELECT G_I.*-
FROM Gagner_I G_I-
JOIN Discipline D ON G_I.ndd = D.ndd-
WHERE genred = 'M' AND typed = 'P';

-- Création de la fragementation Horizontale de Pratiquer sur etusec
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521.etupre-
    TO BRM2996A/"B@rry1999"@brehat.univ-tlse3.fr:1521:etusec-
REPLACE Gagner_I_2
USING SELECT G_I.*-
FROM Gagner_I G_I-
JOIN Discipline D ON G_I.ndd = D.ndd-
WHERE genred = 'W' AND typed = 'P';

-- Création de la fragementation Horizontale de Pratiquer sur etuter
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etuter-
REPLACE Gagner_I_3
USING SELECT G_I.*-
FROM Gagner_I G_I-
JOIN Discipline D ON G_I.ndd = D.ndd-
WHERE genred IN('X', 'O') AND typed = 'P';