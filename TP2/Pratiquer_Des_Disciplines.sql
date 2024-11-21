CREATE OR REPLACE PACKAGE Gest_JO IS 
    PROCEDURE PratiquerUneDiscipline(
        p_nom_athlete Athlete.ncomplet%TYPE,
        p_nom_sport Sport.noms%TYPE,
        p_nom_discipline Discipline.nomd%TYPE,
        p_valider BOOLEAN DEFAULT TRUE
    );

    PROCEDURE PratiquerDesDiscipline(
        p_nom_athlete Athlete.ncomplet%TYPE,
        p_nom_sport Sport.noms%TYPE,
        p_listes_noms_disciplines VARCHAR2
    );
END Gest_JO;
/

CREATE OR REPLACE PACKAGE BODY Gest_JO IS
------------- Modification dela procédure PratiquerUneDiscipline ----------------- 
    PROCEDURE PratiquerUneDiscipline(
        p_nom_athlete Athlete.ncomplet%TYPE,
        p_nom_sport Sport.noms%TYPE,
        p_nom_discipline Discipline.nomd%TYPE,
        p_valider BOOLEAN DEFAULT TRUE
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
        IF p_valider THEN
            COMMIT;
        END IF;

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

----------------Procédure PratiquerDesDisciplines -------------------
    PROCEDURE PratiquerDesDiscipline(
        p_nom_athlete Athlete.ncomplet%TYPE,
        p_nom_sport Sport.noms%TYPE,
        p_listes_noms_disciplines VARCHAR2
    ) IS 
    -- Déclaration des variables
    v_nom_discipline Discipline.nomd%TYPE;
    v_position NUMBER := 1;
    

    BEGIN 
        -- Extraction du premier nom de discipline
        v_nom_discipline := REGEXP_SUBSTR(p_listes_noms_disciplines, '[^-]+', 1, v_position);
        
        -- Boucle WHILE pour chaque discipline de la liste
        WHILE v_nom_discipline IS NOT NULL LOOP
            PratiquerUneDiscipline(
                p_nom_athlete => p_nom_athlete,
                p_nom_sport => p_nom_sport,
                p_nom_discipline => v_nom_discipline,
                p_valider => FALSE
            );

            v_position := v_position + 1;
            -- Extraction du prochain nom de discipline
            v_nom_discipline := REGEXP_SUBSTR(p_listes_noms_disciplines, '[^-]+', 1, v_position);
        END LOOP;

        -- Validation
        COMMIT;

    EXCEPTION 
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
    END PratiquerDesDiscipline;
END Gest_JO;
/

SET SERVEROUTPUT ON;
EXEC Gest_JO.PratiquerDesDiscipline('BARRY Mamadou bailo', 'Football', 'Men-Women');