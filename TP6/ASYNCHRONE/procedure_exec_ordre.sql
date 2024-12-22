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