COPY FROM BRM2996A/"B@rry1999"@brehat.univ-tlse3.fr:1521:etusec -
TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre -
REPLACE Athlete_2 -
USING SELECT * -
FROM Athlete_2;


-- Site etupre
COPY FROM LPL3702A/"EbattrDi"@brehat.univ-tlse3.fr:1521:etusec -
TO LPL3702A/"EbattrDi"@telline.univ-tlse3.fr:1521:etupre -
REPLACE Athlete_2 -
USING SELECT * -
FROM Athlete_2;


------ Site etupre
CREATE OR REPLACE VIEW Athlete AS
SELECT * FROM Athlete_1@dbl_etupre          
UNION ALL
SELECT * FROM Athlete_2@dbl_etupre;

INSERT INTO Athlete_2 
VALUES (1545880, 'KUMARI Deepika', 160, 55, 
        TO_DATE('13/06/94', 'DD/MM/YY'), 'RANCHI', 
        'INDIA', 'IND');