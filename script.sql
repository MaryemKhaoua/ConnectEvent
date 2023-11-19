CREATE TABLE Organisateur (
    id_org INT PRIMARY KEY,
    nom VARCHAR(50),
    email VARCHAR(50),
    tel VARCHAR(15)
);

CREATE TABLE Organiser (
    id_org INT,
    id_event INT,
    PRIMARY KEY (id_org, id_event),
    FOREIGN KEY (id_org) REFERENCES Organisateur(id_org),
    FOREIGN KEY (id_event) REFERENCES Evenement(id_event)
);

CREATE TABLE Participant (
    id_part INT PRIMARY KEY,
    nom VARCHAR(50),
    email VARCHAR(50),
    tel VARCHAR(15)
);

CREATE TABLE Evenement (
    id_event INT PRIMARY KEY,
    titre VARCHAR(100),
    date DATE,
    description TEXT,
    id_lieu INT,
    FOREIGN KEY (id_lieu) REFERENCES Lieu(id_lieu)
);

CREATE TABLE Lieu (
    id_lieu INT PRIMARY KEY,
    nom VARCHAR(50),
    adresse VARCHAR(100)
);

CREATE TABLE Sponsor (
    id_sponsor INT PRIMARY KEY,
    nom VARCHAR(50)
);

CREATE TABLE Sponsorer (
    id_event INT,
    id_sponsor INT,
    PRIMARY KEY (id_event, id_sponsor),
    FOREIGN KEY (id_event) REFERENCES Evenement(id_event),
    FOREIGN KEY (id_sponsor) REFERENCES Sponsor(id_sponsor)
);

CREATE TABLE Billet (
    id_billet INT PRIMARY KEY,
    id_event INT,
    id_part INT,
    FOREIGN KEY (id_event) REFERENCES Evenement(id_event),
    FOREIGN KEY (id_part) REFERENCES Participant(id_part)

);
