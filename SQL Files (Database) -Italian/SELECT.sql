SELECT *
FROM libro ; 

SELECT Nome
FROM autori; 

SELECT Nome 
FROM filiali 
WHERE Numero_Dipendenti >= 10 ; 

/*------------QUERY ------------------------*/

SELECT Codice , Titolo 
FROM Libro ; 

SELECT *
FROM Editori ; 

SELECT Nome 
FROM Editori 
WHERE Stato = 'NY' ;

SELECT Nome 
FROM Editori 
WHERE Stato !='NY' ; 

SELECT Nome 
FROM Filiali
WHERE Numero_Dipendenti >= 10 ; 

SELECT Codice , Titolo
FROM Libro
WHERE Tipo ='HOR' ; 

SELECT Codice , Titolo
FROM Libro
WHERE Tipo ='HOR' AND Paperback = 'Y' ; 

SELECT Codice , Titolo
FROM Libro
WHERE Tipo ='HOR' OR Codice_Editore = 'PB' ; 

SELECT Codice , Titolo , Prezzo
FROM Libro
WHERE Prezzo BETWEEN 10 AND 20; 	

SELECT Codice , Titolo , (Prezzo*85/100) AS PrezzoScontato
FROM Libro ;

SELECT Nome 
FROM Editori 
WHERE Nome LIKE '%and%' ; 

SELECT Codice , Titolo
FROM Libro
WHERE Tipo IN ('FIC' , 'MYS'  ,'ART' ) 
ORDER BY Titolo Asc ; 

SELECT Codice , Titolo
FROM Libro
WHERE Tipo IN ('FIC' , 'MYS'  ,'ART' ) 
ORDER BY Titolo Desc ;

SELECT Nome , Cognome 
FROM Autori 
ORDER BY Cognome Asc ; 
 
SELECT  Tipo ,  count(tipo) as TotaleTipi
FROM  Libro  
GROUP BY Tipo ; 

SELECT  count(tipo) as TotaleTipiMYS
FROM  Libro 
WHERE Tipo = 'MYS' ;

SELECT Tipo , avg(Prezzo) as PrezzoMedio
FROM Libro 
WHERE Paperback = 'Y'
GROUP BY  Tipo ;

SELECT L.Titolo
FROM Libro L JOIN Editori E ON E.Codice = L.Codice_Editore
WHERE L.prezzo = (SELECT max(Prezzo) FROM Libro Li JOIN Editori Ed ON Ed.Codice = Li.Codice WHERE Ed.Nome = 'Pocket Books')  
AND E.Nome = 'Pocket Books'; 


SELECT  L.Codice AS CodiceLibro , L.Titolo , E.Codice AS CodiceEditore , E.Nome
FROM Libro L JOIN Editori E ON E.Codice = L.Codice_Editore ; 

SELECT  Titolo , Prezzo
FROM Libro L JOIN Editori E ON E.Codice = L.Codice_Editore
WHERE  E.Nome = 'Signet' ; 

SELECT L.Titolo , L.Codice 
FROM Libro L JOIN Editori E ON L.Codice_Editore = E.Codice
WHERE L.Prezzo >= 10 AND E.Nome = 'Bantam Books';


SELECT L.Titolo , L.Codice , Num_Copie_Disponibili
FROM  Libro L JOIN Scorte S  ON L.Codice = 	S.Codice_Libro
WHERE S.Numero_Filiale = 3  ;

SELECT L.Titolo 
FROM  Libro L JOIN Editori E  ON L.Codice_Editore = E.Codice
WHERE E.Nome = 'Best and Furrow' AND L.Tipo = 'COM'  ;

SELECT L.Titolo 
FROM Libro L JOIN Ha_Scritto H ON L.Codice = H.Codice_Libro
WHERE H.Numero_Autore = 01 ; 

SELECT L.Titolo , L.Codice 
FROM  Libro L JOIN Scorte S  ON L.Codice = 	S.Codice_Libro
WHERE S.Numero_Filiale = 2  ;

SELECT S1.Codice_Libro AS Codice1, S2.Codice_Libro AS Codice2
FROM   Scorte S1 , Scorte S2
WHERE S1.Numero_Filiale = S2.Numero_Filiale  AND  S1.Codice_Libro < S2.Codice_Libro;

SELECT S.Num_Copie_Disponibili , L.Titolo , A.Cognome
FROM (Libro L JOIN Scorte S ON S.Codice_Libro = L.Codice)
	 JOIN Ha_Scritto H ON L.Codice = H.Codice_Libro
	 JOIN Autori A  ON H.Numero_Autore = A.Numero_Autore
     
	WHERE S.Numero_Filiale = 4 ;

SELECT L.Titolo 
FROM  Libro L JOIN Editori E  ON L.Codice_Editore = E.Codice
WHERE E.Nome = 'Best and Furrow' AND L.Tipo = 'COM'  AND L.Paperback =' Y' ;

SELECT L.Codice , L.Titolo
FROM Libro L JOIN Editori E ON L.Codice_Editore = E.Codice
WHERE L.Prezzo > 5 OR  E.Stato = 'NY' ; 

SELECT L.Codice , L.Titolo
FROM Libro L JOIN Editori E ON L.Codice_Editore = E.Codice
WHERE L.Prezzo > 5 AND E.Stato != 'NY';

SELECT  DISTINCT E.Codice ,E.Nome 
FROM Editori E JOIN Libro L ON E.Codice = L.Codice_Editore
WHERE L.Prezzo > (SELECT max(Prezzo) FROM Libro WHERE Tipo = 'HOR') ; 

SELECT  DISTINCT E.Codice ,E.Nome 
FROM Editori E JOIN Libro L ON E.Codice = L.Codice_Editore
WHERE L.Prezzo > (SELECT min(Prezzo) FROM Libro WHERE Tipo = 'HOR') ; 

SELECT  L.Titolo
FROM Libro L JOIN Scorte S ON L.Codice = S.Codice_Libro
WHERE S.Num_Copie_Disponibili > 0 
AND L.Codice NOT IN
(SELECT DISTINCT L.Titolo
FROM Libro L JOIN Scorte S ON L.Codice = S.Codice_Libro
WHERE S.Numero_Filiale = 3  );

SELECT   L.Titolo
FROM Libro L JOIN Scorte S ON L.Codice = S.Codice_Libro
WHERE S.Numero_Filiale != 3 AND S.Num_Copie_Disponibili > 0