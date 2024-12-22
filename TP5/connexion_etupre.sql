DELETE FROM plan_table; EXPLAIN PLAN 
SET statement_id = 'Q1'  
FOR SELECT g.ndd, nda
FROM Gagner_I g, Discipline d
WHERE genred = 'W'
AND cds = 'JUD'
AND d.ndd = g.ndd
AND medaille = 'G';
    
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
FROM "GAGNER_I_1" "GAGNER_I_1" 
WHERE "MEDAILLE"='G';

SELECT /*+ INDEX ("DISCIPLINE_1") */ "NDD","NOMD","TYPED","CDS" 
FROM "DISCIPLINE_1" "DISCIPLINE_1" 
WHERE "NDD"=:1;

SELECT /*+ INDEX ("ATHLETE_1") */ "NDA","NCOMPLET","TAILLE","POIDS","DATEN","VILLEN","PAYSN","CIO" 
FROM "ATHLETE_1" "ATHLETE_1" 
WHERE "NDA"=:1 
    AND "CIO"='FRA';