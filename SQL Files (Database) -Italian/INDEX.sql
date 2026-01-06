/*INDEXES*/
CREATE INDEX Libri_Ind ON Libro(Codice) ;  
CREATE INDEX Libri_Ind2 ON Libro(Tipo);
CREATE  INDEX Editori_Ind3 ON Editori(Codice DESC , Nome) ; 
DROP INDEX Editori_Ind3 ON Editori; 

ALTER TABLE Libro
ADD CONSTRAINT CHECK  (Codice < 10000 ) ; 

ALTER TABLE Libro
ADD CONSTRAINT CHECK  (Tipo = 'PSY' OR Tipo = 'FIC' OR Tipo = 'HOR' OR Tipo = 'MYS' OR Tipo = 'ART' OR Tipo = 'POP' OR Tipo = 'POE' OR Tipo = 'SUS' OR Tipo = 'MUS' OR Tipo = 'CS' OR Tipo = 'SFI' OR Tipo = 'COM') ; 

ALTER TABLE Libro
ADD CONSTRAINT CHECK  (Paperback = 'Y' OR Paperback = 'N' ) ; 

ALTER TABLE Filiali
ADD CONSTRAINT CHECK  (Numero_Filiale >= 1 AND Numero_Filiale <= 4  ) ; 

ALTER TABLE Ha_Scritto
ADD CONSTRAINT CHECK  (Numero_Sequenziale = '00001' OR Numero_Sequenziale = '00002'  ) ; 