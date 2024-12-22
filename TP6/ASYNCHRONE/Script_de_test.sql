select *
from athlete_2_maitre 
where nda= 1545880;
 


DELETE FROM Attente;
 
------ Vérification de l'insertion dans la table Athlete_2_maitre -------
SELECT *
FROM athlete_2_maitre 
WHERE nda= 1545880;

-------- Vérification dans la table Athlete_2_cliché ---------
--------- Pour la 1ère insertion
------ NComplet = BARRY Mamadou Bailo
SELECT *
FROM Athlete_2_cliche@dbl_etupre
WHERE nda= 6581675;

------- Pour la 2ème insertion
------ Insertion : Ncomplet = KUMARI Deepika
------ Mise à jour : Ncomplet = Eylul Alptekin
SELECT *
FROM Athlete_2_cliche@dbl_etupre
WHERE nda= 1545880;

DELETE
FROM Athlete_2_cliche@dbl_etupre
WHERE nda= 1545880;


---------------------- Requêttes d'ordres -------------------- 
DELETE FROM athlete_2_maitre 
WHERE nda= 1545880;

INSERT INTO Athlete_2_maitre  
VALUES (6581675, 'BARRY Mamadou bail0', 172, 64, 
        TO_DATE('09/11/1999', 'DD/MM/YY'), 
        'MAMOU', 'GUINEA', 'GUI');

INSERT INTO Athlete_2_maitre 
VALUES (1545880, 'KUMARI Deepika', 160, 55, 
        TO_DATE('13/06/94', 'DD/MM/YY'), 
        'RANCHI', 'INDIA', 'IND');

UPDATE Athlete_2_maitre SET ncomplet='Eylul Alptekin' where nda= 1545880;

--------- Vérification du contenu de la table attente après expiration du temps ---------------
SELECT *
FROM attente;


------- Test pour la mise à jour ----------
-------Mise à jour du nom complet sur la table Athlete_2_maitre -------
UPDATE Athlete_2_maitre SET ncomplet='Eylul Alptekin' where nda= 1545880;

DELETE FROM athlete_2_maitre 
WHERE nda= 1545880;

------- Exécution de la procédure -------
SET SERVEROUTPUT ON;
EXEC EXEC_ORDRES;


CREATE OR REPLACE TRIGGER t_iud_athlete_2_maitre
AFTER INSERT OR UPDATE OR DELETE
ON Athlete_2_maitre
FOR EACH ROW
DECLARE
    R VARCHAR(300);
BEGIN
    IF (INSERTING) THEN
        R := 'INSERT INTO Athlete_2_cliche@dbl_etupre VALUES (' 
             || :NEW.NDA || ', ''' 
             || :NEW.NCOMPLET || ''', ' 
             || :NEW.TAILLE || ', ' 
             || :NEW.POIDS || ', TO_DATE(''' 
             || TO_CHAR(:NEW.DATEN,'DD/MM/YY') || ''', ''DD/MM/YY''), '''
             || :NEW.VILLEN || ''', ''' 
             || :NEW.PAYSN || ''', ''' 
             || :NEW.CIO || ''')';
        INSERT INTO ATTENTE 
        VALUES (SEQ_ATTENTE.NEXTVAL, R);
    ELSIF (DELETING) THEN
        R := 'DELETE FROM Athlete_2_cliche@dbl_etupre WHERE NDA = ' || :OLD.NDA;
        INSERT INTO ATTENTE 
        VALUES (SEQ_ATTENTE.NEXTVAL, R);
    ELSIF (UPDATING) THEN
        R := 'UPDATE Athlete_2_cliche@dbl_etupre SET ' 
             || 'NCOMPLET = ''' || :NEW.NCOMPLET || ''', ' 
             || 'TAILLE = ' || :NEW.TAILLE || ', ' 
             || 'POIDS = ' || :NEW.POIDS || ', '
             || 'DATEN = TO_DATE(''' || TO_CHAR(:NEW.DATEN, 'DD/MM/YY') || ''', ''DD/MM/YY''), ' 
             || 'VILLEN = ''' || :NEW.VILLEN || ''', ' 
             || 'PAYSN = ''' || :NEW.PAYSN || ''', ' 
             || 'CIO = ''' || :NEW.CIO || ''' ' 
             || 'WHERE NDA = ' || :OLD.NDA;
        INSERT INTO ATTENTE  
        VALUES (SEQ_ATTENTE.NEXTVAL, R);
    END IF;
END;
/

CREATE OR REPLACE PROCEDURE EXEC_ORDRES
IS
    CURSOR c1
    IS SELECT ordre 
        FROM Attente 
        ORDER BY numero FOR UPDATE;
BEGIN 
    FOR ligne_c1 IN c1 LOOP 
        EXECUTE IMMEDIATE ligne_c1.ordre;
        DELETE FROM Attente
        WHERE CURRENT OF c1;
    END LOOP;
    COMMIT;
END;
/


VARIABLE n NUMBER; 
EXECUTE DBMS_JOB.SUBMIT(:n, 'EXEC_ORDRES;', SYSDATE, 'SYSDATE+1/1440');

SELECT job, what FROM user_jobs; 

EXECUTE DBMS_JOB.REMOVE(1540);


--------- CRéation et exécution du job avec une minute d'attente --------
DECLARE
   n NUMBER; 
BEGIN
   DBMS_JOB.SUBMIT(
      job       => n, 
      what      => 'EXEC_ORDRES;', 
      next_date => SYSDATE, 
      interval  => 'SYSDATE + 1/1440');
   COMMIT; 
END;
/

--------------- Pour Athlete_2_cliche ----------------
COPY FROM LPL3702A/"EbattrDi"@telline.univ-tlse3.fr:1521:etupre - 
TO LPL3702A/"EbattrDi"@telline.univ-tlse3.fr:1521:etupre - 
REPLACE Athlete_2_cliche - 
USING SELECT * - 
FROM Athlete_2;

--------------- Pour Athlete_2_maitre ----------------
COPY FROM LPL3702A/"EbattrDi"@brehat.univ-tlse3.fr:1521:etusec -
TO LPL3702A/"EbattrDi"@brehat.univ-tlse3.fr:1521:etusec - 
REPLACE Athlete_2_maitre - 
USING SELECT * - 
FROM Athlete_2;

