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