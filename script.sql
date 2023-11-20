-- creation des tableaux

CREATE TABLE IF NOT EXISTS Organisateurs (
    id_org INT PRIMARY KEY,
    nom VARCHAR(50),
    email VARCHAR(50),
    tel VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS Lieux (
    id_lieu INT PRIMARY KEY,
    nom VARCHAR(50),
    adresse VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Evenements (
    id_event INT PRIMARY KEY,
    titre VARCHAR(100),
    date DATE,
    description TEXT,
    id_lieu INT,
    FOREIGN KEY (id_lieu) REFERENCES Lieux(id_lieu)
);

CREATE TABLE IF NOT EXISTS Participants (
    id_part INT PRIMARY KEY,
    nom VARCHAR(50),
    email VARCHAR(50),
    tel VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS Organiser (
    id_org INT,
    id_event INT,
    PRIMARY KEY (id_org, id_event),
    FOREIGN KEY (id_org) REFERENCES Organisateurs(id_org),
    FOREIGN KEY (id_event) REFERENCES Evenements(id_event)
);

CREATE TABLE IF NOT EXISTS Sponsors (
    id_sponsor INT PRIMARY KEY,
    nom VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Sponsorer (
    id_event INT,
    id_sponsor INT,
    FOREIGN KEY (id_event) REFERENCES Evenements(id_event),
    FOREIGN KEY (id_sponsor) REFERENCES Sponsors(id_sponsor),
    PRIMARY KEY (id_event, id_sponsor)
);

CREATE TABLE IF NOT EXISTS Billets (
    id_billet INT PRIMARY KEY,
    id_event INT,
    id_part INT,
    FOREIGN KEY (id_event) REFERENCES Evenements(id_event),
    FOREIGN KEY (id_part) REFERENCES Participants(id_part)
);

-- Insert data to tables

INSERT INTO Organisateurs (id_org, nom, email, tel)
VALUES (1, 'Maryem', 'mym@gmail.com', '0623456789');

INSERT INTO Participants (id_part, nom, email, tel)
VALUES (1, 'Malak', 'malak@gmail.com', '0612345678');

INSERT INTO Lieux (id_lieu, nom, adresse)
VALUES (1, 'Youcode', 'Youssofia');

INSERT INTO Sponsors (id_sponsor, nom)
VALUES (1, 'OCP');

INSERT INTO Organiser (id_org, id_event)
VALUES (1, 1);

INSERT INTO Sponsorer (id_event, id_sponsor)
VALUES (1, 1);

INSERT INTO Billets (id_billet, id_event, id_part)
VALUES (1, 1, 1);