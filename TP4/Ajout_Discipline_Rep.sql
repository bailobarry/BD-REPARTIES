CREATE OR REPLACE PACKAGE Gestion_JO_Rep IS 
    PROCEDURE AjouterDiscipline(
        p_nomd Discipline.nomd%TYPE,
        p_typed Discipline.typed%TYPE,
        p_genred Discipline.genred%TYPE,
        p_cds Sport.cds%TYPE
    );
END;
/

CREATE OR REPLACE PACKAGE BODY Gestion_JO_Rep IS 
    PROCEDURE AjouterDiscipline(
        p_nomd Discipline.nomd%TYPE,
        p_typed Discipline.typed%TYPE,
        p_genred Discipline.genred%TYPE,
        p_cds Sport.cds%TYPE
    ) IS 
    -- Déclaration des variables
    nbb NUMBER;
    erreur_fk EXCEPTION;
    PRAGMA EXCEPTION_INIT(erreur_fk, -2221); -- Code d'erreur sur les clés étrangères
    erreur_ck EXCEPTION;
    PRAGMA EXCEPTION_INIT(erreur_ck, -2290); -- Code d'erreur sur les contraintes
    n NUMBER;

    BEGIN 
        -- Ajouter une nouvelle discpline
        SELECT SEQ_DISCIPLINE.NEXTVAL INTO n FROM DUAL;
        IF (p_genred = 'M') THEN
            INSERT INTO Discipline_1@dbl_etupre
            VALUES(n, p_nomd, p_typed, p_cds);
        ELSIF(p_genred='W') THEN
            INSERT INTO Discipline_2@dbl_etusec
            VALUES(n, p_nomd, p_typed, p_cds);
        ELSIF(p_genred IN ('X', 'O')) THEN
            INSERT INTO Discipline_3@dbl_etuter
            VALUES(n, p_nomd, p_typed, p_genred, p_cds);
        END IF;
        
        -- Affichage du message d'ajout de la Discipline
        DBMS_OUTPUT.PUT_LINE('Discipline <' || p_nomd || '> ajoutée avec succès');

        -- Validation de l'ajout
        COMMIT;

    EXCEPTION 
        -- Gestion des erreurs
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('Discipline ' || p_nomd || 'existante !'); 
        WHEN erreur_fk THEN
            DBMS_OUTPUT.PUT_LINE('Code sport inconnu !'); -- Erreur sur le code du Sport
        WHEN erreur_ck THEN
            IF (SQLERRM LIKE '%CK_DISCIPLINE_TYPED%') THEN
                DBMS_OUTPUT.PUT_LINE('Type de Discipline inconnu !'); --Erreur sur le type de la Discipline
            ELSIF (SQLERRM LIKE '%CK_DISCIPLINE_GENRED%') THEN
                DBMS_OUTPUT.PUT_LINE('Genre de Discipline inconnu !'); --Erreur sur le genre de la Discipline
            END IF;
        WHEN OTHERS THEN    
            DBMS_OUTPUT.PUT_LINE(SQLERRM); -- Autres erreurs
    END AjouterDiscipline;
END Gestion_JO_Rep;
/

SET SERVEROUTPUT ON;
EXEC Gestion_JO_Rep.AjouterDiscipline('Sauter très haut', 'P', 'M', 'ATH');
