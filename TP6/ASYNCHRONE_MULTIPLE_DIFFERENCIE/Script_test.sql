select *
from athlete_2_maitre 
where nda= 1545880;
 
 
------ Vérification de l'insertion dans la table Athlete_2_maitre -------
SELECT *
FROM athlete_2_maitre 
WHERE nda= 1545880;

-------- Vérification dans la table Athlete_2_cliché ---------
--------- Pour la 1ère insertion
------ NComplet = BARRY Oumou
------- Sur ETUPRE
SELECT *
FROM Athlete_2_cliche@dbl_etupre
WHERE nda= 6581675;

------- Sur ETUTER
SELECT *
FROM Athlete_2_cliche@dbl_etuter
WHERE nda= 6581675;

----------------------------------------------------
------- Pour la 2ème insertion
------ Insertion : Ncomplet = KUMARI Deepika
------ Mise à jour : Ncomplet = Eylul Alptekin
------- Sur ETUPRE
SELECT *
FROM Athlete_2_cliche@dbl_etupre
WHERE nda= 1545880;

------- Sur ETUTER
SELECT *
FROM Athlete_2_cliche@dbl_etuter
WHERE nda= 1545880;

DELETE
FROM Athlete_2_cliche@dbl_etupre
WHERE nda= 1545880;


---------------------- Requêttes d'ordres -------------------- 
INSERT INTO Athlete_2_maitre  
VALUES (6581675, 'BARRY Oumou', 172, 64, 
        TO_DATE('09/11/2004', 'DD/MM/YY'), 
        'MAMOU', 'GUINEA', 'GUI');

INSERT INTO Athlete_2_maitre 
VALUES (1545880, 'KUMARI Deepika', 160, 55, 
        TO_DATE('13/06/94', 'DD/MM/YY'), 
        'RANCHI', 'INDIA', 'IND');

UPDATE Athlete_2_maitre SET ncomplet='Eylul Alptekin' where nda= 1545880;

--------- Vérification du contenu de la table attente après expiration du temps ---------------
SELECT *
FROM attente;

DELETE FROM Attente;


------- Test pour la mise à jour ----------
-------Mise à jour du nom complet sur la table Athlete_2_maitre -------
UPDATE Athlete_2_maitre SET ncomplet='Eylul Alptekin' where nda= 1545880;

DELETE FROM athlete_2_maitre 
WHERE nda= 1545880;

------- Exécution de la procédure 1 -------
SET SERVEROUTPUT ON;
EXEC EXEC_ORDRES_1;

------- Exécution de la procédure 2 -------
SET SERVEROUTPUT ON;
EXEC EXEC_ORDRES_2;



VARIABLE n NUMBER; 
EXECUTE DBMS_JOB.SUBMIT(:n, 'EXEC_ORDRES;', SYSDATE, 'SYSDATE+1/1440');

SELECT job, what FROM user_jobs; 

EXECUTE DBMS_JOB.REMOVE(1576);
EXECUTE DBMS_JOB.REMOVE(1577);



--------- CRéation et exécution des deux jobs avec respectivement 1 et 2 minutes d'attente --------
DECLARE
   n NUMBER; 
BEGIN
   DBMS_JOB.SUBMIT(
      job       => n, 
      what      => 'EXEC_ORDRES_1;', 
      next_date => SYSDATE, 
      interval  => 'SYSDATE + 1/1440');
   COMMIT; 
END;
/

--------- Création et exécution des deux jobs ----------
DECLARE
   n1 NUMBER; 
   n2 NUMBER; 
BEGIN
    ------- Job pour l'exécution de la procédure EXEC_ORDRES_1 -------
    DBMS_JOB.SUBMIT(
        JOB       => n1, 
        WHAT      => 'EXEC_ORDRES_1;', 
        NEXT_DATE => SYSDATE, 
        INTERVAL  => 'SYSDATE + 1/1440');

    ------- Job pour l'exécution de la procédure EXEC_ORDRES_1 -------
    DBMS_JOB.SUBMIT(
        JOB       => n2, 
        WHAT      => 'EXEC_ORDRES_2;', 
        NEXT_DATE => SYSDATE, 
        INTERVAL  => 'SYSDATE + 2/1440');

    ----- Validation -------
    COMMIT; 
END;
/
