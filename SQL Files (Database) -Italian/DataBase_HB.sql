DROP DATABASE IF EXISTS HENRY_BOOKS ; 

CREATE DATABASE HENRY_BOOKS ;

USE  HENRY_BOOKS; 
/* ------------CREATE TABLE ------------*/
CREATE TABLE Filiali 
(	Numero_Filiale  INTEGER  PRIMARY KEY ,
	Nome VARCHAR(20),
    Sede VARCHAR(20) NOT NULL, 
    Numero_Dipendenti INTEGER 
) ; 

CREATE TABLE Editori
(
	Codice CHAR(2) PRIMARY KEY , 
    Nome VARCHAR(20) 	NOT NULL , 
    Città VARCHAR(20) , 
	Stato VARCHAR(20)
    
); 

CREATE TABLE Autori 
(
	Numero_Autore INTEGER PRIMARY KEY , 
    Cognome VARCHAR(20) ,
    Nome VARCHAR(20)
) ; 

CREATE TABLE Libro
(
	Codice CHAR(4)  PRIMARY KEY,
    Titolo Varchar(30) ,
    Codice_Editore CHAR(5) ,
    Tipo VARCHAR(20) , 
    Prezzo NUMERIC(5,2) , 
	Paperback CHAR(1) ,
    FOREIGN KEY(Codice_Editore) REFERENCES Editori(Codice)		
) ; 

CREATE TABLE Ha_Scritto
(
	Codice_Libro CHAR(4) ,
    Numero_Autore INTEGER ,
    Numero_Sequenziale CHAR(5), 
    PRIMARY KEY (Codice_Libro , Numero_Autore) ,
    FOREIGN KEY(Codice_Libro) REFERENCES Libro(Codice) ,
    FOREIGN KEY(Numero_Autore) REFERENCES Autori(Numero_Autore)
) ; 
CREATE TABLE Scorte
(
	Codice_Libro CHAR(4) ,
    Numero_Filiale INTEGER ,
    Num_Copie_Disponibili INT (5), 
    PRIMARY KEY (Codice_Libro , Numero_Filiale) ,
    FOREIGN KEY(Codice_Libro) REFERENCES Libro(Codice) ,
    FOREIGN KEY(Numero_Filiale) REFERENCES Filiali(Numero_Filiale)
) ; 
/* ------------INSERT------------*/
INSERT INTO  Filiali VALUES 
(1,'Henry Downtown','16 Riverview',10) ,
(2,'Henry On the Hill','1289 Bedford',06),
(3,'Henry Brentwood','Brentwood Mall',15),
(4,'Henry Eastshore','Eastshore Mall',09) ; 

INSERT INTO Editori VALUES
('AH', 'Arkham House Publ.', 'Sauk City', 'WI'),
('AP', 'Arcade Publishing', 'New York', 'NY'),
('AW', 'Addison Wesley', 'Reading', 'MA'),
('BB', 'Bantam Books', 'New York', 'NY'),
('BF', 'Best and Furrow', 'Boston', 'MA'),
('JT', 'Jeremy P. Tarcher', 'Los Angeles', 'CA'),
('MP', 'McPherson and Co.', 'Kinston', 'NY'),
('PB', 'Pocket Books', 'New York', 'NY'),
('RH', 'Random House', 'New York', 'NY'),
('RZ', 'Rizzoli', 'New York', 'NY'),
('SB', 'Schoken Books', 'New York', 'NY'),
('SI', 'Signet', 'New York', 'NY'),
('TH', 'Thames and Hudson', 'New York', 'NY'),
('WN', 'W.W. Norton and Co.', 'New York', 'NY');

INSERT INTO Autori VALUES
(1, 'Archer', 'Jeffrey'),
(2, 'Christie', 'Agatha'),
(3, 'Clarke', 'Arthur C.'),
(4, 'Francis', 'Dick'),
(5, 'Cussler', 'Clive'),
(6, 'King', 'Stephen'),
(7, 'Pratt', 'Philip'),
(8, 'Adamski', 'Joseph'),
(10, 'Harmon', 'Willis'),
(11, 'Rheingold', 'Howard'),
(12, 'Owen', 'Barbara'),
(13, 'Williams', 'Peter'),
(14, 'Kafka', 'Franz'),
(15, 'Novalis', NULL),
(16, 'Lovecraft', 'H.P.'),
(17, 'Paz', 'Octavio'),
(18, 'Camus', 'Albert'),
(19, 'Castleman', 'Riva'),
(20, 'Zimbardo', 'Philip'),
(21, 'Gimferrer', 'Pere'),
(22, 'Southworth', 'Rod'),
(23, 'Wray', 'Robert');

INSERT INTO Libro VALUES
('0180', 'Shyness', 'BB', 'PSY', 7.65, 'Y'),
('0189', 'Kane and Abel', 'PB', 'FIC', 5.55, 'Y'),
('0200', 'Stranger', 'BB', 'FIC', 8.75, 'Y'),
('0378', 'Dunwich Horror and Others', 'PB', 'HOR', 19.75, 'N'),
('079X', 'Smokescreen', 'PB', 'MYS', 4.55, 'Y'),
('0808', 'Knockdown', 'PB', 'MYS', 4.75, 'Y'),
('1351', 'Cujo', 'SI', 'HOR', 6.65, 'Y'),
('1382', 'Marcel Duchamp', 'PB', 'ART', 11.25, 'Y'),
('138X', 'Death on the Nil', 'BB', 'MYS', 3.95, 'Y'),
('2226', 'Ghost from the Grand Banks', 'BB', 'SFI', 19.95, 'N'),
('2281', 'Prints of the 20th Century', 'PB', 'ART', 13.25, 'Y'),
('2766', 'Prodigal Daughter', 'PB', 'FIC', 5.45, 'Y'),
('2908', 'Hymns to the Night', 'BB', 'POE', 6.75, 'Y'),
('3350', 'Higher Creativity', 'PB', 'PSY', 9.75, 'Y'),
('3743', 'First Among Equals', 'PB', 'FIC', 3.95, 'Y'),
('3906', 'Vortex', 'BB', 'SUS', 5.45, 'Y'),
('5163', 'Organ', 'SI', 'MUS', 16.95, 'Y'),
('5790', 'Database Systems', 'BF', 'CS', 54.95, 'N'),
('6128', 'Evil Under the Sun', 'PB', 'MYS', 4.45, 'Y'),
('6328', 'Vixen 07', 'BB', 'SUS', 5.55, 'Y'),
('669X', 'A Guide to SQL', 'BF', 'CS', 23.95, 'Y'),
('6908', 'DOS Essentials', 'BF', 'CS', 20.50, 'Y'),
('7405', 'Night Probe', 'BB', 'SUS', 5.65, 'Y'),
('7443', 'Carrie', 'SI', 'HOR', 6.75, 'Y'),
('7559', 'Risk', 'PB', 'MYS', 3.95, 'Y'),
('7947', 'dBASE Programming', 'BF', 'CS', 39.90, 'Y'),
('8092', 'Magritte', 'SI', 'ART', 21.95, 'N'),
('8720', 'Castle', 'BB', 'FIC', 12.15, 'Y'),
('9611', 'Amerika', 'BB', 'FIC', 10.95, 'Y');

INSERT INTO Ha_Scritto VALUES
('0180', 20, '00001'),
('0189', 1, '00001'),
('0200', 18, '00001'),
('0378', 16, '00001'),
('079X', 4, '00001'),
('0808', 4, '00001'),
('1351', 6, '00001'),
('1382', 17, '00001'),
('138X', 2, '00001'),
('2226', 3, '00001'),
('2281', 19, '00001'),
('2766', 1, '00001'),
('2908', 15, '00001'),
('3350', 10, '00001'),
('3350', 11, '00002'),
('3743', 1, '00001'),
('3906', 5, '00001'),
('5163', 12, '00002'),
('5163', 13, '00001'),
('5790', 7, '00001'),
('5790', 8, '00002'),
('6128', 2, '00001'),
('6328', 5, '00001'),
('669X', 7, '00001'),
('6908', 22, '00001'),
('7405', 5, '00001'),
('7443', 6, '00001'),
('7559', 4, '00001'),
('7947', 7, '00001'),
('7947', 23, '00002'),
('8092', 21, '00001'),
('8720', 14, '00001'),
('9611', 14, '00001');

INSERT INTO Scorte VALUES
('0180', 1, 2),
('0189', 2, 2),
('0200', 1, 1),
('0200', 2, 3),
('079X', 2, 1),
('079X', 3, 2),
('079X', 4, 3),
('1351', 1, 1),
('1351', 2, 4),
('1351', 3, 2),
('138X', 2, 3),
('2226', 1, 3),
('2226', 3, 2),
('2226', 4, 1),
('2281', 4, 3),
('2766', 3, 2),
('2908', 1, 3),
('2908', 4, 1),
('3350', 1, 2),
('3906', 2, 1),
('3906', 3, 2),
('5163', 1, 1),
('5790', 4, 2),
('6128', 2, 4),
('6128', 3, 3),
('6328', 2, 2),
('669X', 1, 1),
('6908', 2, 2),
('7405', 3, 2),
('7559', 2, 2),
('7947', 2, 2),
('8092', 3, 1),
('8720','1',3),
('9611','1',2);


