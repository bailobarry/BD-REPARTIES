CREATE OR REPLACE PACKAGE Gest_JO IS 
    PROCEDURE AjouterDiscipline(
        p_nomd Discipline.nomd%TYPE,
        p_typed Discipline.typed%TYPE,
        p_genred Discipline.genred%TYPE,
        p_cds Sport.cds%TYPE
    );

CREATE OR REPLACE PACKAGE BODY Gest_JO IS 
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
    PRAGMA EXCEPTION_INIT(erreur_ck, -2290); -- Code d'erreur sur les clés primaires

    BEGIN 
        -- Ajouter une nouvelle discpline
        INSERT INTO Discipline(ndd, nomd, typed, genred, cds)
        VALUES(SEQ_DISCIPLINE.NEXTVAL, p_nomd, p_typed, p_genred, p_cds);

        -- Affichage du message d'ajout de la Discipline
        DBMS_OUTPUT.PUT_LINE('Discipline ajoutée avec succès');

        -- Validation de l'ajout
        COMMIT;
    EXCEPTION 
        -- Gestion des erreurs
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('Erreur : Discipline existante !');
        WHEN erreur_fk THEN
            DBMS_OUTPUT.PUT_LINE('Erreur : Code sport inconnu !');
        WHEN erreur_ck THEN
            IF (SQLERRM LIKE '%CK_DISCIPLINE_TYPE%') THEN
                DBMS_OUTPUT.PUT_LINE('Erreur : Type de Discipline inconnu !');
            ELSIF (SQLERRM LIKE 'CK_DISCPLINE_GENRE%') THEN
                DBMS_OUTPUT.PUT_LINE('Erreur : Genre de Discipline inconnu !');
            END IF;
        WHEN OTHERS THEN    
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
    END;
END;

