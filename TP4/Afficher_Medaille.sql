CREATE OR REPLACE PACKAGE Gest_JO IS
    PROCEDURE AfficherMedaille(
        p_cio Pays.cio%TYPE
    );
END Gest_JO;
/

CREATE OR REPLACE PACKAGE BODY Gest_JO IS
    PROCEDURE AfficherMedaille(
        p_cio Pays.cio%TYPE
    ) IS
        -- Déclarations des variables
        v_ncomplet Pays.ncomplet%TYPE;
        v_total_medailles NUMBER := 0;
        
        -- Exception personnalisée
        pays_inconnu EXCEPTION;
        
    BEGIN
        -- Vérification de l'existence du pays et récupération du nom complet
        BEGIN
            SELECT ncomplet INTO v_ncomplet
            FROM Pays
            WHERE cio = p_cio;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE pays_inconnu;
        END;
        
        -- Affichage du code CIO et du nom complet du pays
        DBMS_OUTPUT.PUT_LINE('Pays #' || p_cio || '# : ' || v_ncomplet);
        
        -- Récupération des sports aux quels a participé un pays (en équipes ou en individuel)
        FOR sports_recuperes IN (
            SELECT DISTINCT s.cds, s.noms
            FROM Sport s
            JOIN Discipline d ON d.cds = s.cds
            LEFT JOIN GAGNER_E g_e ON g_e.ndd = d.ndd
            LEFT JOIN GAGNER_I gi ON gi.ndd = d.ndd
            LEFT JOIN Athlete a ON (gi.nda = a.nda AND a.cio = p_cio)
            WHERE g_e.cio = p_cio OR a.cio = p_cio
            ORDER BY s.cds
        ) LOOP
            -- Affichage du sport
            DBMS_OUTPUT.PUT_LINE('* ' || sports_recuperes.cds || '  ' || sports_recuperes.noms);
            
            -- Récupération des des Discipline des Sports pratiques
            FOR disciplines_recuperees IN (
                SELECT DISTINCT d.ndd, d.nomd,
                    (SELECT COUNT(*) FROM GAGNER_E g_e WHERE g_e.ndd = d.ndd AND g_e.cio = p_cio) as medaille_equipe,
                    (SELECT COUNT(*) FROM GAGNER_I gi 
                     JOIN Athlete a ON gi.nda = a.nda 
                     WHERE gi.ndd = d.ndd AND a.cio = p_cio) as medaille_individuelle
                FROM Discipline d
                LEFT JOIN GAGNER_E g_e ON g_e.ndd = d.ndd
                LEFT JOIN GAGNER_I gi ON gi.ndd = d.ndd
                LEFT JOIN Athlete a ON (gi.nda = a.nda AND a.cio = p_cio)
                WHERE d.cds = sports_recuperes.cds
                AND (g_e.cio = p_cio OR a.cio = p_cio)
                ORDER BY d.ndd
            ) LOOP
                -- Calcul du nombre total de médailles pour cette discipline
                IF disciplines_recuperees.medaille_equipe > 0 OR disciplines_recuperees.medaille_individuelle > 0 THEN
                    -- Affichage de la discipline et des médailles
                    DBMS_OUTPUT.PUT_LINE('   ' || LPAD(disciplines_recuperees.ndd, 3) || '  ' || 
                                        RPAD(disciplines_recuperees.nomd, 30) || 
                                        LPAD(TO_CHAR(disciplines_recuperees.medaille_equipe + disciplines_recuperees.medaille_individuelle), 3));
                    
                    -- Mise à jour du total des médailles
                    v_total_medailles := v_total_medailles + disciplines_recuperees.medaille_equipe + disciplines_recuperees.medaille_individuelle;
                END IF;
            END LOOP;
        END LOOP;
        
        -- Affichage du nombre total de médailles
        IF v_total_medailles > 0 THEN
            DBMS_OUTPUT.PUT_LINE('Nombre total de médailles : ' || v_total_medailles);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Aucune médaille pour ce pays.');
        END IF;
        
    EXCEPTION
        WHEN pays_inconnu THEN
            DBMS_OUTPUT.PUT_LINE('Erreur : Pays inconnu !');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erreur inattendue : ' || SQLERRM);
    END AfficherMedaille;
END Gest_JO;
/

SET SERVEROUTPUT ON;
EXEC Gest_JO.AfficherMedaille('FRA');
