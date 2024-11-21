-- Création de la fragmentation de Pays sur etuter
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etuter-
REPLACE Pays_3-
USING SELECT *-
FROM Pays;

