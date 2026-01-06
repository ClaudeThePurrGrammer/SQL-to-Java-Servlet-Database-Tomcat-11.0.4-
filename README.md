# 🚀 SQL to Java Servlet – Tomcat 11 Project  
*(Italiano 🇮🇹 + English 🇬🇧)*

---

# 🇮🇹 SEZIONE ITALIANA

## 📌 Descrizione del Progetto

Questo progetto mostra come creare un **Java Servlet** che si connette a un database **MySQL**, esegue una query e restituisce i risultati in formato HTML.  
L’applicazione è sviluppata in **Eclipse**, utilizza **Apache Tomcat 11** e il **MySQL Connector/J** come driver JDBC.

Durante lo sviluppo sono stati risolti diversi problemi comuni:

- ⚙️ Configurazione del progetto come **Dynamic Web Module**
- 🗂️ Configurazione del **Deployment Assembly**
- 📦 Deploy corretto tramite la cartella `wtpwebapps` generata da Eclipse
- ❌ Errore `404` dovuto al mancato deploy del servlet
- 🐞 Errore `ClassNotFoundException: com.mysql.cj.jdbc.Driver`
- 🔗 Mapping del servlet tramite `@WebServlet`

Il risultato finale è un servlet funzionante che interroga la tabella `libro` e mostra i dati in una tabella HTML.

---

## 📁 Struttura del Progetto

 ```
  SQL_to_Java_Servlet_Tomcat_11.0.4/
  │
  ├── src/main/java/
  │   └── Generic_Servlet.java
  │
  ├── WebContent/
  │   ├── index.html   (optional)
  │   └── WEB-INF/
  │       ├── web.xml
  │       └── lib/
  │           └── mysql-connector-j-8.x.x.jar
  │
  └── build/
```



---

## 🛠️ Installazione e Configurazione

### 1️⃣ Requisiti
- Java 17+ (nel progetto: JDK 25)
- Eclipse IDE for Enterprise Java
- Apache Tomcat 11
- MySQL Server
- MySQL Connector/J

---

### 2️⃣ Configurazione del Progetto in Eclipse

#### ✔ Abilitare Dynamic Web Module
`Right click → Properties → Project Facets → Dynamic Web Module`

#### ✔ Deployment Assembly
Assicurarsi che siano presenti:

/src/main/java → WEB-INF/classes
/WebContent → /


#### ✔ Aggiungere il driver MySQL
Copiare:

mysql-connector-j-8.x.x.jar

in:

WebContent/WEB-INF/lib/


Poi:

`Right click → Build Path → Add to Build Path`

---

### 3️⃣ Configurazione del Server Tomcat in Eclipse

- Aprire la vista **Servers**
- Doppio click su *Tomcat v11.0 Server at localhost*
- Sezione **Modules**
- Se il progetto non è presente → **Add Web Module**
- Eseguire:
  - `Server → Clean`
  - `Project → Clean`

---

### 🌐 URL del Servlet

http://localhost:8080/SQL_to_Java_Servlet_Tomcat_11.0.4/Generic_Servlet


---

## 🧩 Esempio di Servlet

```java
@WebServlet("/Generic_Servlet")
public class Generic_Servlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/tuo_database",
                "username",
                "password"
            );

            Statement stmt = conn.createStatement();
            ResultSet result = stmt.executeQuery("SELECT codice, titolo FROM libro");

            writer.println("<table border='1'>");
            writer.println("<tr><th>Codice</th><th>Titolo</th></tr>");

            while (result.next()) {
                writer.println("<tr>");
                writer.println("<td>" + result.getInt("codice") + "</td>");
                writer.println("<td>" + result.getString("titolo") + "</td>");
                writer.println("</tr>");
            }

            writer.println("</table>");

        } catch (Exception e) {
            e.printStackTrace();
            writer.println("<p>Errore: " + e.getMessage() + "</p>");
        }
    }
}
```

# 🇬🇧 ENGLISH SECTION

## 📌 Project Description

This project demonstrates how to create a **Java Servlet** that connects to a **MySQL database**, executes a query, and returns the results in HTML format.  
The application is developed in **Eclipse**, uses **Apache Tomcat 11**, and relies on the **MySQL Connector/J** JDBC driver.

During development, several common issues were solved:

- ⚙️ Configuring the project as a **Dynamic Web Module**
- 🗂️ Setting up the **Deployment Assembly**
- 📦 Ensuring correct deployment inside Eclipse’s `wtpwebapps` directory
- ❌ Fixing `404` errors caused by missing servlet deployment
- 🐞 Fixing `ClassNotFoundException: com.mysql.cj.jdbc.Driver`
- 🔗 Mapping the servlet using the `@WebServlet` annotation

The final result is a working servlet that queries the `libro` table and displays the data in an HTML table.

---

## 📁 Project Structure

  ```
  SQL_to_Java_Servlet_Tomcat_11.0.4/
  │
  ├── src/main/java/
  │   └── Generic_Servlet.java
  │
  ├── WebContent/
  │   ├── index.html   (optional)
  │   └── WEB-INF/
  │       ├── web.xml
  │       └── lib/
  │           └── mysql-connector-j-8.x.x.jar
  │
  └── build/
```


---

## 🛠️ Installation & Setup

### 1️⃣ Requirements
- Java 17+ (project uses JDK 25)
- Eclipse IDE for Enterprise Java
- Apache Tomcat 11
- MySQL Server
- MySQL Connector/J

---

### 2️⃣ Eclipse Project Configuration

#### ✔ Enable Dynamic Web Module
`Right click → Properties → Project Facets → Dynamic Web Module`

#### ✔ Deployment Assembly
Ensure the following entries exist:

/src/main/java → WEB-INF/classes
/WebContent → /


#### ✔ Add MySQL Driver
Copy:

mysql-connector-j-8.x.x.jar


into:

WebContent/WEB-INF/lib/


Then:

`Right click → Build Path → Add to Build Path`

---

### 3️⃣ Tomcat Server Configuration

- Open the **Servers** view  
- Double-click *Tomcat v11.0 Server at localhost*  
- Go to **Modules**  
- If the project is missing → **Add Web Module**  
- Run:
  - `Server → Clean`
  - `Project → Clean`

---

## 🌐 Servlet URL

If the context path is:

/SQL_to_Java_Servlet_Tomcat_11.0.4


the servlet endpoint is:


http://localhost:8080/SQL_to_Java_Servlet_Tomcat_11.0.4/Generic_Servlet


---

## 🧩 Example Servlet

```java
@WebServlet("/Generic_Servlet")
public class Generic_Servlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/your_database",
                "username",
                "password"
            );

            Statement stmt = conn.createStatement();
            ResultSet result = stmt.executeQuery("SELECT codice, titolo FROM libro");

            writer.println("<table border='1'>");
            writer.println("<tr><th>Code</th><th>Title</th></tr>");

            while (result.next()) {
                writer.println("<tr>");
                writer.println("<td>" + result.getInt("codice") + "</td>");
                writer.println("<td>" + result.getString("titolo") + "</td>");
                writer.println("</tr>");
            }

            writer.println("</table>");

        } catch (Exception e) {
            e.printStackTrace();
            writer.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
}

