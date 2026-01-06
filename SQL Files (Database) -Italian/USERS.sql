 /*USERS */
CREATE USER Lopez , Browen , Merril , Jenkins , Sherman , Scout , Verner , Chambers   ;

/*GRANTS*/
GRANT SELECT ON Libro TO Lopez ; 
GRANT UPDATE ON Libro TO Browen , Merril ; 
GRANT UPDATE ON Editori TO Browen , Merril ; 
GRANT UPDATE  (Num_Copie_Disponibili) ON Scorte TO Jenkins , Sherman ; 
GRANT SELECT (Titolo,Codice,Prezzo ) ON Libro TO Lopez , Browen , Merril , Jenkins , Sherman , Socut , Verner , Chambers;
GRANT UPDATE ON Editori TO Scout ; 
GRANT DELETE ON Editori TO Scout ;
GRANT INDEX ON Libro TO Verner ; 
GRANT ALTER ON Autori TO Verner , Scout ; 
GRANT ALL PRIVILEGES  ON *  TO  Scout ; 
GRANT UPDATE (Num_Copie_Disponibili) ON FilialeNum2 TO  Chambers; 
REVOKE ALL PRIVILEGES , GRANT OPTION FROM Verner ;

CREATE USER henry IDENTIFIED BY "henry" ; 
GRANT SELECT ON Libro TO "henry"@"localhost" ;
 


