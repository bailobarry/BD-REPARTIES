------- Procédure EXEC_ORDRES_1 -------
CREATE OR REPLACE PROCEDURE EXEC_ORDRES_1 IS
  CURSOR c1 IS
    SELECT numero, ordre1, ordre2, j1, j2
    FROM attente
    WHERE j1 = 0
    ORDER BY numero FOR UPDATE;
BEGIN
  FOR ligne_c1 IN c1 LOOP
    EXECUTE IMMEDIATE ligne_c1.ordre1;
    UPDATE attente
    SET j1 = 1
    WHERE CURRENT OF c1;

    IF ligne_c1.j1 = 1 AND ligne_c1.j2 = 1 THEN
      DELETE FROM attente WHERE CURRENT OF c1;
    END IF;
  END LOOP;
  COMMIT;
END;
/


--------- Procédure EXEC_ORDRES_2 ---------
CREATE OR REPLACE PROCEDURE EXEC_ORDRES_2 IS
  CURSOR c1 IS
    SELECT numero, ordre1, ordre2, j1, j2
    FROM attente
    WHERE j2 = 0
    ORDER BY numero FOR UPDATE;
BEGIN
  FOR ligne_c1 IN c1 LOOP
    EXECUTE IMMEDIATE ligne_c1.ordre2;
    UPDATE attente
    SET j2 = 1
    WHERE CURRENT OF c1;

    IF ligne_c1.j1 = 1 AND ligne_c1.j2 = 1 THEN
      DELETE FROM attente WHERE CURRENT OF c1;
    END IF;
  END LOOP;
  COMMIT;
END;
/


EXEC EXEC_ORDRES_1;

EXEC EXEC_ORDRES_2;
