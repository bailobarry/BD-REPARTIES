CREATE OR REPLACE PACKAGE Gest_JO IS 
    PROCEDURE PratiquerUneDiscipline(
        p_nom_athlete Athlete.ncomplet%TYPE,
        p_nom_sport Sport.noms%TYPE,
        p_nom_discipline Discipline.nomd%TYPE
    );
END Gest_JO;
/

CREATE OR REPLACE PACKAGE BODY Gest_JO IS 
    PROCEDURE PratiquerUneDiscipline(
        p_nom_athlete Athlete.ncomplet%TYPE,
        p_nom_sport Sport.noms%TYPE,
        p_nom_discipline Discipline.nomd%TYPE
    ) IS 
    -- Déclaration des variables
    v_nda Athlete.nda%TYPE;
    v_cds Sport.cds%TYPE;
    v_ndd Discipline.ndd%TYPE;
    erreur_athlete EXCEPTION;
    erreur_sport EXCEPTION;
    erreur_discipline EXCEPTION;

    BEGIN 
        -- Vérification de l'existance de l'Athlète
        BEGIN 
            SELECT nda INTO v_nda
            FROM Athlete
            WHERE ncomplet = p_nom_athlete;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE erreur_athlete;
        END;

        -- Vérification de l'existance du Sport
        BEGIN 
            SELECT cds INTO v_cds
            FROM Sport
            WHERE noms = p_nom_sport;
        EXCEPTION 
            WHEN NO_DATA_FOUND THEN
                RAISE erreur_sport;
        END;

        -- Vérification de l'existance de la discipline
        BEGIN 
            SELECT ndd INTO v_ndd
            FROM Discipline
            WHERE nomd = p_nom_discipline
            AND cds = v_cds;
        EXCEPTION 
            WHEN NO_DATA_FOUND THEN
                RAISE erreur_discipline;
        END;

        -- Ajouter la pratique de la Discipline par l'Athlète
        INSERT INTO Pratiquer(nda, ndd)
        VALUES(v_nda, v_ndd);

        -- Afiichage du message de création de la pratique
        DBMS_OUTPUT.PUT_LINE('L''Athlète ' || p_nom_athlete || ' pratique la discipline ' || p_nom_discipline);

        -- Validation
        COMMIT;

    EXCEPTION
        -- Gestion des erreurs
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('Cet Athlète pratique déjà la discipline.');
        WHEN erreur_athlete THEN
            DBMS_OUTPUT.PUT_LINE('Athlète inconnu !');
        WHEN erreur_sport THEN
            DBMS_OUTPUT.PUT_LINE('Sport inconnu !');
        WHEN erreur_discipline THEN
            DBMS_OUTPUT.PUT_LINE('Discipline inconnu !');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
    END PratiquerUneDiscipline;
END Gest_JO;
/

SET SERVEROUTPUT ON;
EXEC Gest_JO.PratiquerUneDiscipline('BARRY Mamadou bailo', 'Basketball', 'Men');