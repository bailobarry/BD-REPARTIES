-- Sur la base ETUPRE
DROP DATABASE LINK dbl_etupre;
DROP DATABASE LINK dbl_etusec;
DROP DATABASE LINK dbl_etuter;

CREATE DATABASE LINK dbl_etupre
    CONNECT TO BRM2996A
    IDENTIFIED BY "B@rry1999"
    USING 'VERS_ETUPRE';

CREATE DATABASE LINK dbl_etusec
    CONNECT TO BRM2996A
    IDENTIFIED BY "B@rry1999"
    USING 'VERS_ETUSEC';

CREATE DATABASE LINK dbl_etuter
    CONNECT TO BRM2996A
    IDENTIFIED BY "B@rry1999"
    USING 'VERS_ETUTER';

-- Vérification
SELECT * FROM TAB@dbl_etupre;
SELECT * FROM TAB@dbl_etusec;
SELECT * FROM TAB@dbl_etuter;

-------------------------------------------------------------
-- Sur la base ETUSEC
DROP DATABASE LINK dbl_etupre;
DROP DATABASE LINK dbl_etusec;
DROP DATABASE LINK dbl_etuter;

CREATE DATABASE LINK dbl_etupre
    CONNECT TO BRM2996A
    IDENTIFIED BY "B@rry1999"
    USING 'VERS_ETUPRE';

CREATE DATABASE LINK dbl_etusec
    CONNECT TO BRM2996A
    IDENTIFIED BY "B@rry1999"
    USING 'VERS_ETUSEC';

CREATE DATABASE LINK dbl_etuter
    CONNECT TO BRM2996A
    IDENTIFIED BY "B@rry1999"
    USING 'VERS_ETUTER';

-- Vérification
SELECT * FROM TAB@dbl_etupre;
SELECT * FROM TAB@dbl_etusec;
SELECT * FROM TAB@dbl_etuter;

------------------------------------------------------------
-- Sur la base ETUTER
DROP DATABASE LINK dbl_etupre;
DROP DATABASE LINK dbl_etusec;
DROP DATABASE LINK dbl_etuter;

CREATE DATABASE LINK dbl_etupre
    CONNECT TO BRM2996A
    IDENTIFIED BY "B@rry1999"
    USING 'VERS_ETUPRE';

CREATE DATABASE LINK dbl_etusec
    CONNECT TO BRM2996A
    IDENTIFIED BY "B@rry1999"
    USING 'VERS_ETUSEC';

CREATE DATABASE LINK dbl_etuter
    CONNECT TO BRM2996A
    IDENTIFIED BY "B@rry1999"
    USING 'VERS_ETUTER';

-- Vérification
SELECT * FROM TAB@dbl_etupre;
SELECT * FROM TAB@dbl_etusec;
SELECT * FROM TAB@dbl_etuter;