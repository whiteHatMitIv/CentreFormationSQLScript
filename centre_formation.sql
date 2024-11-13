DROP TABLE IF EXISTS public.etudiant CASCADE;
CREATE TABLE Etudiant (
    NumCINEtu INT PRIMARY KEY,
    NomEtu VARCHAR(50),
    PrenomEtu VARCHAR(50),
    DateNaissance DATE,
    AdresseEtu VARCHAR(100),
    VilleEtu VARCHAR(50),
    NiveauEtu VARCHAR(20)
);

DROP TABLE IF EXISTS public.session CASCADE;
CREATE TABLE Session (
    CodeSess INT PRIMARY KEY,
    NomSess VARCHAR(50),
    DateDebut DATE,
    DateFin DATE,
	CONSTRAINT chk_date CHECK(DateFin > DateDebut)
);

DROP TABLE IF EXISTS public.specialite CASCADE;
CREATE TABLE Specialite (
    CodeSpec INT PRIMARY KEY,
    NomSpec VARCHAR(50),
    DescSpec TEXT,
	Active INT DEFAULT 0
);

DROP TABLE IF EXISTS public.formation CASCADE;
CREATE TABLE Formation (
    CodeForm INT PRIMARY KEY,
    TitreForm VARCHAR(100),
    DureeForm INT,
    PrixForm SERIAL
);

DROP TABLE IF EXISTS public.estinscrit CASCADE;
CREATE TABLE EstInscrit (
    NumCINEtu INT,
    CodeSess INT,
	TypeCours VARCHAR(50) NOT NULL,
    PRIMARY KEY (NumCINEtu, CodeSess),
    FOREIGN KEY (NumCINEtu) REFERENCES Etudiant(NumCINEtu),
    FOREIGN KEY (CodeSess) REFERENCES Session(CodeSess)
);

DROP TABLE IF EXISTS public.concerne CASCADE;
CREATE TABLE Concerne (
    CodeSess INT,
    CodeForm INT,
    PRIMARY KEY (CodeSess, CodeForm),
    FOREIGN KEY (CodeSess) REFERENCES Session(CodeSess),
    FOREIGN KEY (CodeForm) REFERENCES Formation(CodeForm)
);

DROP TABLE IF EXISTS public.appartient CASCADE;
CREATE TABLE Appartient (
    CodeSpec INT,
    CodeForm INT,
    PRIMARY KEY (CodeSpec, CodeForm),
    FOREIGN KEY (CodeSpec) REFERENCES Specialite(CodeSpec),
    FOREIGN KEY (CodeForm) REFERENCES Formation(CodeForm)
);
