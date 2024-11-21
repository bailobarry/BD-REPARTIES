--------------- Mauvaise manière de faire ---------------------
CREATE OR REPLACE PACKAGE Gest_JO IS PROCEDURE AjouterAthlete
(
    p_nda Athlete.nda%TYPE,
    p_nom Athlete.nom%TYPE,
    p_prenom Althelete.prenom%TYPE,
    p_genre Athlete.genre%TYPE,
    p_cio Athlete.cio
);

CREATE OR REPLACE PACKAGE BODY Gest_JO IS AjouterAthlete() IS
    n NUMBER,
    erreur_fk EXCEPTION,
    erreur_genre EXCEPTION,

    BEGIN
        SELECT COUNT(*) INTO n
        FROM Pays
        WHERE cio = p_cio,
        IF (n=0) THEN 
            RAISE erreur_fk,
        END IF;

        IF (p_genre NOT IN ('H', 'F')) THEN 
            RAISE erreur_genre,
        END IF;

        INSERT INTO Athlete(nda, nom, prenom, genre, cio)
        VALUES(p_nda, p_nom, p_prenom, p_cio)
        
        DBMS_OUTPUT.PUT_LINE('Athlete inséré.');
        COMMIT;
    
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('Erreur pk');
        WHEN erreur_fk THEN
            DBMS_OUTPUT.PUT_LINE('Erreur pk');
        WHEN erreur_genre THEN

        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM); -- Permet d'afficher le message d'Erreur
    END,
END,

---------------- BONNE MANIERE DE FAIRE -------------------------
CREATE OR REPLACE PACKAGE Gest_JO IS PROCEDURE AjouterAthlete
(
    p_nda Athlete.nda%TYPE,
    p_nom Athlete.nom%TYPE,
    p_prenom Althelete.prenom%TYPE,
    p_genre Athlete.genre%TYPE,
    p_cio Athlete.cio
);

CREATE OR REPLACE PACKAGE BODY Gest_JO IS
    PROCEDURE AjouterAthlete() IS
        n NUMBER;
        erreur_fk EXCEPTION;
        PRAGMA EXCEPTION_INIT (erreur_fk, -2291); -- 2291 Code d'erreur sur les clés étrangères
        erreur_ck EXCEPTION;
        PRAGMA EXCEPTION_INIT (erreur_fk, -2290); -- 2290 Code d'erreur sur les clés primaires

        BEGIN
            INSERT INTO Athlete(nda, nom, prenom, genre, cio);
            VALUES(p_nda, p_nom, p_prenom, p_cio);
            DBMS_OUTPUT.PUT_LINE('Athlete inséré.');
            COMMIT;
        
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                DBMS_OUTPUT.PUT_LINE('Erreur pk');
            WHEN erreur_fk THEN
                DBMS_OUTPUT.PUT_LINE('Erreur fk');
            WHEN erreur_ck THEN
                IF (SQLERRM LIKE '%CK_ATHLETE_GENRE%') THEN
                ELSIF()
                END IF;
            WHEN erreur_genre THEN

            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(SQLERRM); -- Permet d'afficher le message d'Erreur
    END;
END;

