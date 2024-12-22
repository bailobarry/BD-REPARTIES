DELETE FROM plan_table; EXPLAIN PLAN 
SET statement_id = 'Q1'  
FOR  SELECT /*+ INDEX ("ATHLETE_2") */ "NDA","NCOMPLET","TAILLE","POIDS","DATEN","VILLEN","PAYSN","CIO" 
FROM "ATHLETE_2" "ATHLETE_2" 
WHERE "NDA"=:1 
    AND "CIO"='FRA';
    
SET PAGESIZE 500;  
COLUMN options           FORMAT A25;
COLUMN object_name       FORMAT A15;  
COLUMN filter_predicates FORMAT A25; 
COLUMN access_predicates FORMAT A20; 
COLUMN projection        FORMAT A50; 
COLUMN other             FORMAT A100;

SELECT id, parent_id, operation, options, object_name,  
    filter_predicates, access_predicates, projection, other 
    FROM PLAN_TABLE 
    WHERE statement_id = 'Q1';


SELECT "NDD","NDA","MEDAILLE","DATEG" 
FROM "GAGNER_I_2" "GAGNER_I_2" 
WHERE "MEDAILLE"='G';

SELECT /*+ INDEX ("DISCIPLINE_2") */ "NDD","NOMD","TYPED","CDS" 
FROM "DISCIPLINE_2" "DISCIPLINE_2" 
WHERE "NDD"=:1;

SELECT /*+ INDEX ("ATHLETE_2") */ "NDA","NCOMPLET","TAILLE","POIDS","DATEN","VILLEN","PAYSN","CIO" 
FROM "ATHLETE_2" "ATHLETE_2" 
WHERE "NDA"=:1 
    AND "CIO"='FRA';