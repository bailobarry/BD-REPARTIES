-- Création de la fragmentation de Gagner_E sur etuter
COPY FROM BRM2996A/"B@rryA999"@telline.univ-tlse3.fr:1521:etupre-
    To BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etuter-
REPLACE Gagner_E_3-
USING SELECT *-
FROM Gagner_E;