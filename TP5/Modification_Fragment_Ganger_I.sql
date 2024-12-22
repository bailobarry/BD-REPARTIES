-----------------------Gagner_I------------------------------
-- Modification de la fragementation Horizontale de Gagner_I sur etupre
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
REPLACE Gagner_I_1_bis-
USING SELECT G_I.*, D.genred-
    FROM Gagner_I G_I-
    JOIN Discipline D ON G_I.ndd = D.ndd-
    WHERE genred = 'M' AND typed = 'P';

-- Modification de la fragementation Horizontale de Gagner_I su+r etusec
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@brehat.univ-tlse3.fr:1521:etusec-
REPLACE Gagner_I_2_bis-
USING SELECT G_I.*, D.genred-
    FROM Gagner_I G_I-
    JOIN Discipline D ON G_I.ndd = D.ndd-
    WHERE genred = 'W' AND typed = 'P';

-- Modification de la fragementation Horizontale de Gagner_I sur etuter
COPY FROM BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre-
    TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etuter-
REPLACE Gagner_I_3_bis-
USING SELECT G_I.*, D.genred-
    FROM Gagner_I G_I-
    JOIN Discipline D ON G_I.ndd = D.ndd-
    WHERE genred IN('X', 'O') AND typed = 'P';


----------------Code de Eylul---------------------

-----------------------Gagner_I------------------------------
-- Modification de la fragementation Horizontale de Gagner_I sur etupre
COPY FROM LPL3702A/"EbattrDi"@telline.univ-tlse3.fr:1521:etupre -
TO LPL3702A/"EbattrDi"@telline.univ-tlse3.fr:1521:etupre -
REPLACE Gagner_I_1_bis -
USING SELECT g.* , genred -
      FROM Gagner_I g, Discipline d-
      WHERE g.ndd=d.ndd -
      AND typed='P' -
      AND genred='M';

-- Modification de la fragementation Horizontale de Gagner_I su+r etusec
COPY FROM LPL3702A/"EbattrDi"@telline.univ-tlse3.fr:1521:etupre -
TO LPL3702A/"EbattrDi"@brehat.univ-tlse3.fr:1521:etusec -
REPLACE Gagner_I_2_bis -
USING SELECT g.* , genred -
      FROM Gagner_I g, Discipline d-
      WHERE g.ndd=d.ndd -
      AND typed='P' -
      AND genred='W';

-- Modification de la fragementation Horizontale de Gagner_I sur etuter
COPY FROM LPL3702A/"EbattrDi"@telline.univ-tlse3.fr:1521:etupre -
TO LPL3702A/"EbattrDi"@telline.univ-tlse3.fr:1521:etuter -
REPLACE Gagner_I_3_bis -
USING SELECT g.* , genred -
      FROM Gagner_I g, Discipline d-
      WHERE g.ndd=d.ndd -
      AND typed='P' -
      AND genred IN ('X','O');

--------------- Redéfinition de la vue -----------------
CREATE OR REPLACE VIEW Gagner_I AS SELECT *  
FROM Gagner_I_1_bis@dbl_etupre  
WHERE genred = 'M' 
UNION 
SELECT *  
FROM Gagner_I _2_bis@dbl_etusec  
WHERE genred = 'W' 
UNION 
SELECT *  
FROM Gagner_I _2_bis@dbl_etusec  
WHERE genred IN ('X', 'O'); 


SELECT a.ncomplet 
FROM Athlete a, Gagner_I g, Discipline d 
WHERE a.nda = g.nda 
    AND g.ndd = d.ndd 
    AND g.medaille = 'G' 
    AND d.genred = 'W' 
    AND g.genred = 'W'
    AND cio = 'FRA';
