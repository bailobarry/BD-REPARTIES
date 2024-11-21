-------------------------Pays---------------------------------
-- Création de la fragmentation de Pays sur etuter
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etuter-
REPLACE Pays_3-
USING SELECT *-
    FROM Pays;

-------------------------Sport--------------------------------
-- Création de la fragmentation Vertical de Sport sur etupre
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
REPLACE Sport_1-
USING SELECT cds, noms-
    FROM Sport;

-- Création de la fragmentation Vertical de Sport sur etusec
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@brehat.univ-tlse3.fr:1521:etusec-
REPLACE Sport_2-
USING SELECT cds, urls-
    FROM Sport;

--------------------------Discipline---------------------------
-- Création de la fragementation Horizontale de Discipline sur etupre
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
REPLACE Discipline_1-
USING SELECT ndd, nomd, typed, cds-
    FROM Discipline-
    WHERE genred = 'M';

-- Création de la fragementation Horizontale de Discipline sur etusec
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@brehat.univ-tlse3.fr:1521:etusec-
REPLACE Discipline_2-
USING SELECT ndd, nomd, typed, cds-
    FROM Discipline-
    WHERE genred = 'W';

-- Création de la fragementation Horizontale de Discipline sur etuter
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etuter-
REPLACE Discipline_3-
USING SELECT ndd, nomd, typed, genred, cds-
    FROM Discipline-
    WHERE genred IN('X', 'O');

--------------------------Athlete---------------------------
-- Création de la fragementation Horizontale de Athlete sur etupre
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
REPLACE Athlete_1-
USING SELECT nda, ncomplet, taille, poids, daten, villen, paysn, cio-
    FROM Athlete-
    WHERE genre = 'M';

-- Création de la fragementation Horizontale de Athlete sur etusec
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@brehat.univ-tlse3.fr:1521:etusec-
REPLACE Athlete_2-
USING SELECT nda, ncomplet, taille, poids, daten, villen, paysn, cio-
    FROM Athlete-
    WHERE genre = 'F';

------------------------Pratiquer-------------------------------
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
    WHERE genred = 'W';

-- Création de la fragementation Horizontale de Pratiquer sur etuter
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etuter-
REPLACE Pratiquer_3-
USING SELECT P.*-
    FROM Pratiquer P-
    JOIN Discipline D ON P.ndd = D.ndd-
    WHERE genred IN('X', 'O');

------------------------Gagner_I------------------------------
-- Création de la fragementation Horizontale de Pratiquer sur etupre
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
REPLACE Gagner_I_1-
USING SELECT G_I.*-
    FROM Gagner_I G_I-
    JOIN Discipline D ON G_I.ndd = D.ndd-
    WHERE genred = 'M' AND typed = 'P';

-- Création de la fragementation Horizontale de Pratiquer sur etusec
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@brehat.univ-tlse3.fr:1521:etusec-
REPLACE Gagner_I_2-
USING SELECT G_I.*-
    FROM Gagner_I G_I-
    JOIN Discipline D ON G_I.ndd = D.ndd-
    WHERE genred = 'W' AND typed = 'P';

-- Création de la fragementation Horizontale de Pratiquer sur etuter
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etuter-
REPLACE Gagner_I_3-
USING SELECT G_I.*-
    FROM Gagner_I G_I-
    JOIN Discipline D ON G_I.ndd = D.ndd-
    WHERE genred IN('X', 'O') AND typed = 'P';

-------------------------Gagner_E------------------------------
-- Création de la fragmentation de Gagner_E sur etuter
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etuter-
REPLACE Gagner_E_3-
USING SELECT *-
    FROM Gagner_E;