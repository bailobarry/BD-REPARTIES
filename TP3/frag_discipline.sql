-- Création de la fragementation Horizontale de Discipline sur etupre
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
REPLACE Discipline_1-
USING SELECT ndd, nomd, typed, cds-
FROM Discipline
WHERE genred = 'M';

-- Création de la fragementation Horizontale de Discipline sur etusec
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@brehat.univ-tlse3.fr:1521:etusec-
REPLACE Discipline_2-
USING SELECT ndd, nomd, typed, cds-
FROM Discipline-
WHERE genred = 'F';

-- Création de la fragementation Horizontale de Discipline sur etuter
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etuter-
REPLACE Discipline_3-
USING SELECT ndd, nomd, typed, genred, cds-
FROM Discipline-
WHERE genred IN('X, O');