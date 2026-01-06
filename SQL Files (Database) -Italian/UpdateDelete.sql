UPDATE Scorte
SET Num_Copie_Disponibili = 5 
WHERE Numero_Filiale = 5  ; 

UPDATE Libro L 
SET L.Prezzo = L.Prezzo - ((3/100)*Prezzo)
WHERE L.Codice_Editore = (SELECT E.Codice FROM Editori E WHERE E.Nome = 'Bantam Books') ;

/*DELETE 
FROM Autori A
WHERE A.Nome = 'Robert' AND A.Cognome ='Wray'*/

CREATE TABLE Narrativa AS (SELECT Codice , Titolo , Prezzo  FROM Libro WHERE Tipo ='FIC') ;	

UPDATE Narrativa 
SET Prezzo = Prezzo + (12*Prezzo)/100  ; 

UPDATE Narrativa N
SET Prezzo = NULL 
WHERE N.Titolo = 'Amerika'; 

ALTER TABLE Narrativa 
ADD Best_Seller Char(1) DEFAULT 'N'  ;


UPDATE Narrativa
SET Best_Seller = 'Y'
WHERE Titolo = 'Kane and Abel' ;

ALTER TABLE Narrativa 
MODIFY COLUMN Titolo VARCHAR(50);

ALTER TABLE Narrativa
MODIFY COLUMN Best_Seller CHAR(1) NOT NULL ;

ALTER TABLE Narrativa
MODIFY COLUMN Best_Seller CHAR(1) NULL ;

DROP TABLE Narrativa ; 