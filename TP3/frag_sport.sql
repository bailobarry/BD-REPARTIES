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