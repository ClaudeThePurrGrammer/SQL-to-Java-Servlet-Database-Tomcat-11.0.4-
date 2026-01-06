
DROP VIEW IF EXISTS BANTAM ; 
CREATE VIEW Bantam AS 
SELECT L.Codice , L.Titolo , L.Tipo , L.Prezzo
FROM Libro L JOIN Editori E ON L.Codice_Editore = E.Codice 
WHERE E.Nome = 'Bantam Books' ; 



SELECT * 
FROM BANTAM ; 

SELECT Codice , Titolo , Prezzo
FROM BANTAM 
WHERE Prezzo < 10 ; 

SELECT L.Codice , L.Titolo , L.Prezzo
FROM Libro L JOIN Editori E ON L.Codice_Editore = E.Codice 
WHERE E.Nome = 'Bantam Books' AND L.Prezzo < 10 ; 

DROP VIEW IF EXISTS RILEGATI ; 
CREATE VIEW Rilegati AS 
SELECT L.Codice , L.Titolo , E.Nome , L.Prezzo
FROM Libro L JOIN Editori E ON L.Codice_Editore = E.Codice 
WHERE L.Paperback = 'N' ; 

SELECT *
FROM Rilegati ; 


SELECT 
    Titolo, Nome
FROM
    Rilegati
WHERE
    Prezzo > 20; 

SELECT L.Titolo , E.Nome 
FROM Libro L JOIN Editori E ON L.Codice_Editore = E.Codice 
WHERE L.Paperback = 'N' AND L.Prezzo > 20 ; 

DROP VIEW IF EXISTS VALORE ; 
CREATE VIEW Valore(Numero_Filiale ,Tot_Copie) AS
SELECT  S.Numero_Filiale , sum(S.Num_Copie_Disponibili) AS Tot_Copie
FROM Scorte S
GROUP BY S.Numero_Filiale ; 


SELECT * 
FROM VALORE ; 


SELECT  S.Numero_Filiale , sum(S.Num_Copie_Disponibili) AS Tot_Copie
FROM Scorte S
GROUP BY S.Numero_Filiale ; 

CREATE VIEW FilialeNum2(Num_Copie_Disponibili ) AS 
SELECT Num_Copie_Disponibili 
FROM Scorte 
WHERE Numero_Filiale = 2 ; 





