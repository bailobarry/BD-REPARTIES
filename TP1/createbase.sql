-- Suppression des tables s'ils existent --
DROP TABLE Gagner_I;
DROP TABLE Gagner_E;
DROP TABLE Pratiquer;
DROP TABLE Athlete;
DROP TABLE Discipline;
DROP TABLE Sport;
DROP TABLE Pays;

-- Création de la table Pays --
CREATE TABLE Pays(
    cio CHAR(3),
    nomp VARCHAR(30),
    ncomplet VARCHAR(50),
    CONSTRAINT pk_pays_cio PRIMARY KEY (cio)
);

-- Création de la table Sports --
CREATE TABLE Sport(
    cds CHAR(3),
    noms VARCHAR(30),
    urls VARCHAR(100),
    CONSTRAINT pk_sport_cds PRIMARY KEY (cds)
);

-- Création de la table Discipline --
CREATE TABLE Discipline (
    ndd NUMBER,
    nomd VARCHAR(50),
    typed CHAR(1),
    genred CHAR(1),
    cds CHAR(3),
    CONSTRAINT pk_discipline_ndd PRIMARY KEY (ndd),
    CONSTRAINT fk_discipline_cds FOREIGN KEY (cds) REFERENCES Sport(cds),
    CONSTRAINT chk_discipline_ndd CHECK (ndd>0),
    CONSTRAINT chk_discipline_typed CHECK (typed IN ('P', 'T')),
    CONSTRAINT chk_discipline_genred CHECK (genred IN ('M', 'W', 'X', 'O'))
);

-- Création de la table Athlete --
CREATE TABLE Athlete(
    nda NUMBER(7),
    ncomplet VARCHAR(50),
    genre CHAR(1),
    taille NUMBER(3),
    poids NUMBER(4, 1),
    daten DATE,
    villen VARCHAR(30),
    paysn VARCHAR(30),
    cio CHAR(3),
    CONSTRAINT pk_athlete_nda PRIMARY KEY (nda),
    CONSTRAINT fk_athlete_cio FOREIGN KEY (cio) REFERENCES Pays(cio),
    CONSTRAINT chk_athlete_genre CHECK (genre IN ('M', 'F')),
    CONSTRAINT chk_athlete_taille CHECK (taille >= 0),
    CONSTRAINT chk_athlete_poids CHECK (poids >= 0.0)
);

-- Création de la table Gagner une médaille Individuelle -- 
CREATE TABLE Gagner_I(
    ndd NUMBER,
    nda NUMBER(7),
    medaille CHAR(1),
    dateg DATE,
    CONSTRAINT pk_gagnerI PRIMARY KEY (ndd, nda),
    CONSTRAINT fk_gagnerI_ndd FOREIGN KEY (ndd) REFERENCES Discipline(ndd),
    CONSTRAINT fk_gagnerI_nda FOREIGN KEY (nda) REFERENCES Athlete(nda),
    CONSTRAINT chk_gagnerI_medaille CHECK (medaille IN ('G', 'S', 'B'))
);

-- Création de la table Gagner un médaille en Equipe --
CREATE TABLE Gagner_E(
    ndd NUMBER,
    cio CHAR(3),
    medaille CHAR(1),
    dateg DATE,
    CONSTRAINT pk_gagnerE PRIMARY KEY (ndd, cio, medaille),
    CONSTRAINT fk_gagnerE_ndd FOREIGN KEY (ndd) REFERENCES Discipline(ndd),
    CONSTRAINT fk_gagnerE_cio FOREIGN KEY (cio) REFERENCES Pays(cio),
    CONSTRAINT chk_gagnerE_medaille CHECK (medaille IN ('G', 'S', 'B'))
);

-- Création de la table Pratiquer --
CREATE TABLE Pratiquer(
    ndd NUMBER,
    nda NUMBER(7),
    CONSTRAINT pk_pratiquer PRIMARY KEY (ndd, nda),
    CONSTRAINT fk_pratiquer_ndd FOREIGN KEY (ndd) REFERENCES Discipline(ndd),
    CONSTRAINT fk_pratiquer_nda FOREIGN KEY (nda) REFERENCES Athlete(nda)
);