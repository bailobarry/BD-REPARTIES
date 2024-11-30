DELETE FROM plan_table; EXPLAIN PLAN 
SET statement_id = 'Q1'  
FOR  SELECT D.* 
FROM Sport S, Discipline D 
WHERE noms = 'Swimming' 
    AND typed = 'T' 
    AND S.cds = D.cds;  
    
SET PAGESIZE 500;  
COLUMN options           FORMAT A25;
COLUMN object_name       FORMAT A15;  
COLUMN filter_predicates FORMAT A25; 
COLUMN access_predicates FORMAT A20; 
COLUMN projection        FORMAT A50; 

SELECT id, parent_id, operation, options, object_name,  
    filter_predicates, access_predicates, projection, other 
    FROM PLAN_TABLE 
    WHERE statement_id = 'Q1';