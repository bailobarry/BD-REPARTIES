CREATE OR REPLACE PACKAGE Gest_JO IS
    PROCEDURE AjouterAthlete(
        p_nda Athlete.nda%TYPE,
        p_nom VARCHAR2,
        p_prenom VARCHAR2,
        p_genre Athlete.genre%TYPE,
        p_taille Athlete.taille%TYPE,
        p_poids Athlete.poids%TYPE,
        p_daten Athlete.daten%TYPE,
        p_villen Athlete.villen%TYPE,
        p_paysn Athlete.paysn%TYPE,
        p_nationalite Pays.cio%TYPE
    );
END Gest_JO;
/

CREATE OR REPLACE PACKAGE BODY Gest_JO IS 
    PROCEDURE AjouterAthlete(
        p_nda Athlete.nda%TYPE,
        p_nom VARCHAR2,
        p_prenom VARCHAR2,
        p_genre Athlete.genre%TYPE,
        p_taille Athlete.taille%TYPE,
        p_poids Athlete.poids%TYPE,
        p_daten Athlete.daten%TYPE,
        p_villen Athlete.villen%TYPE,
        p_paysn Athlete.paysn%TYPE,
        p_nationalite Pays.cio%TYPE
    ) IS 
    -- Déclaration des variables
    v_ncomplet Athlete.ncomplet%TYPE;
    erreur_fk EXCEPTION;
    PRAGMA EXCEPTION_INIT(erreur_fk, -2291); -- Code d'erreur sur les clés étrangères
    erreur_ck EXCEPTION;
    PRAGMA EXCEPTION_INIT(erreur_ck, -2290); -- Code d'erreur sur les contraintes

    BEGIN 
        -- Concaténation du nom et du prénom de l'Athlète avec le nom et la premère lettre du prenom en majuscule
        -- puis le reste en du prenom en minuscule
        v_ncomplet := UPPER(p_nom) || ' ' || UPPER(SUBSTR(p_prenom, 1, 1)) || LOWER(SUBSTR(p_prenom, 2));

        -- Ajout d'un nouveau Athlète
        INSERT INTO Athlete(nda, ncomplet, genre, taille, poids, daten, villen, paysn, cio)
        VALUES(p_nda, v_ncomplet, p_genre, p_taille, p_poids, p_daten, p_villen, p_paysn, p_nationalite);

        -- Affichage du message d'ajout
        DBMS_OUTPUT.PUT_LINE('Athlète ' || v_ncomplet || ' ajouté avec succès');

        -- Validation de l'ajout
        COMMIT;

    EXCEPTION 
        -- Gestion des erreurs
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('Ce numéro dAthlète existe déjà'); -- Erreur sur le numéro de l'Athlète
        WHEN erreur_fk THEN
            DBMS_OUTPUT.PUT_LINE('Nationalité de lAthlète inconnu.'); -- Erreur sur la nationalité de l'Athlète
        WHEN erreur_ck THEN
            IF (SQLERRM LIKE '%CK_ATHLETE_GENRE%') THEN
                DBMS_OUTPUT.PUT_LINE('Genre de lAthlète invalide.'); -- Erreur sur le genre de l'Athlète
            ELSIF (SQLERRM LIKE '%CK_ATHLETE_TAILLE%') THEN
                DBMS_OUTPUT.PUT_LINE('Taille de lAthlète invalide.'); -- Erreur sur la taille de l'Athlète
            ELSIF (SQLERRM LIKE '%CK_ATHLETE_POIDS%') THEN
                DBMS_OUTPUT.PUT_LINE('Poids de lAthlète invalide.'); -- Erreur  sur le poids de l'Athlète
            END IF;
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM); -- Autres erreurs
    END AjouterAthlete;
END Gest_JO;
/

SET SERVEROUTPUT ON;
EXEC Gest_JO.AjouterAthlete(6581675, 'BARRY', 'Mamadou bailo', 'M', 172, 64.5, TO_DATE('1999-11-09', 'YYYY-MM-DD'), 'Mamou', 'Guinea', 'GUI');