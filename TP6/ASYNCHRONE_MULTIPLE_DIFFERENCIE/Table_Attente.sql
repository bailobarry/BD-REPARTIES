DROP TABLE Attente;
CREATE TABLE Attente (
    numero NUMBER,
    ordre1 VARCHAR2(4000),
    ordre2 VARCHAR2(4000),
    j1 NUMBER(1) DEFAULT 0,
    j2 NUMBER(1) DEFAULT 0,
    CONSTRAINT pk_attente PRIMARY KEY (numero)
);
