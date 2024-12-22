DELETE FROM plan_table; EXPLAIN PLAN 
SET statement_id = 'Q1'  
FOR  SELECT /*+ INDEX ("DISCIPLINE_3") */ "NDD","NOMD","TYPED","GENRED","CDS" 
FROM "DISCIPLINE_3" "DISCIPLINE_3" 
WHERE "NDD"=:1 
    AND "GENRED"='W';
    
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
FROM "GAGNER_I_3" "GAGNER_I_3" 
WHERE "MEDAILLE"='G';

SELECT /*+ INDEX ("DISCIPLINE_3") */ "NDD","NOMD","TYPED","GENRED","CDS" 
FROM "DISCIPLINE_3" "DISCIPLINE_3" 
WHERE "NDD"=:1 
    AND "GENRED"='W';