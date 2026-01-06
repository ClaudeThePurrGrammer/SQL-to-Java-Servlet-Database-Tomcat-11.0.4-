
//Jakarta Servlet Packages
import jakarta.servlet.ServletException; //Servlet Exceptions 
import jakarta.servlet.annotation.WebServlet; //'@WebServlet()' 
import jakarta.servlet.http.HttpServlet; //Servlet Basics (Classes & Methods)
import jakarta.servlet.http.HttpServletRequest; //Client-->Server Requests
import jakarta.servlet.http.HttpServletResponse; //Client-->Server Responses
//---------------------------------------

//Java IO Packages
import java.io.IOException; //Input/Output Exceptions 
import java.io.PrintWriter; //Writing HTML in HTTP Output Page
//---------------------------------------

//Java SQL Packages
import java.sql.Connection; //Establish Connection With SQL DataBase (Port : 3306)
import java.sql.DriverManager; //Add-On JDBC Needed to Establish Connection With DataBase
import java.sql.PreparedStatement; //Pre-Fetching  of SQL Prompts
import java.sql.ResultSet; //Loading of SQL Prompts (Output :Query Result)
//---------------------------------------
import java.sql.SQLException;

@WebServlet("/GenericHB_Servlet") //--> Tomcat Now Knows That This Program is a Servlet 

public class GenericHB_Servlet extends HttpServlet{
	//Serial Number That Prevents Version Incompatibility (OPTIONAL)
	private static final long serialVersionUID = 1L;

	public GenericHB_Servlet()
	{
		super();
	}
	
	@Override //IMPORTANT : Indicates That The Method 'doGet()' From HttpServlet Class Is Being Re-Writed
	protected void doGet(HttpServletRequest request , HttpServletResponse response) 
	
		throws ServletException , IOException //Used to Catch Exceptions
		{
			response.setContentType("text/html;charset=UTF-8"); //Setting-Up HTTP Response (in  HTML)
			
			//SQL User Credentials
			String username = "henry" ; 
			String password = "henry" ;
			//--------------------
			
			//SQL Database Reference
			String DataBase_name = "henry_books";
			int DataBase_Connection_port = 3306 ; // IMPORTANT : JDBC Uses 3306 Port to Communicate With SQL Database (DO NOT CHANGE)
			//--------------------
			
			//Host & URL
			String Web_host = "localhost";
			String Database_URL = "jdbc:mysql://" + Web_host + ":" + DataBase_Connection_port + "/" + DataBase_name + "?serverTimezone=UTC";
			//--------------------
			
			try(PrintWriter HTML_writer = response.getWriter()) //Loads HTTP Writer --> Will Write HTML Prompts
			{
				String MySQL_driver_URL = "com.mysql.cj.jdbc.Driver" ;  //URL For The MySQL Connection Driver
				Class.forName(MySQL_driver_URL); //Loads MySQL Driver
				
				ResultSet Query_Result = SQL_Query_Laucher(Database_URL, username, password,"SELECT codice FROM libro");//Returns The Query Result
				
				//HTML Prompts
				HTML_writer.println("<html>");
					HTML_writer.println("<body>");
					
						HTML_writer.println("<h1> SERVLET RESULT </h1>");
						
						//HTML Table
						HTML_writer.println("<table border='1' style = 'border-collapse : collapse;'>");
							HTML_writer.println("<tr><th>Book Code</th> <th>Book Title</th></tr>"); //Table Headers
							
								while(Query_Result.next()) // Repeat While The Query Reading Reaches The End
								{
									String Book_code = Query_Result.getString("codice"); //"codice"  (Book_Code) is an Attribute of Libro (Book) Table
									String Book_title = Query_Result.getString("titolo");//"titolo"  (Book_Title) is an Attribute of Libro (Book) Table
									
									//Adding Values On The Table
									HTML_writer.println("<tr>");
									HTML_writer.println("<td>" + Book_code + "</td>");
									HTML_writer.println("<td>" + Book_title + "</td>");
									HTML_writer.println("</tr>");
									//--------------------------
									
								}
							
						
						HTML_writer.println("</table>");
						//--------------------
				
					
					HTML_writer.println("</body>");
				HTML_writer.println("</html>");
				
				//--------------------
				
				
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			
			
			
			
			
		}
		
	
	public  ResultSet SQL_Query_Laucher(String DB_url , String username ,String password ,String SQL_CommandLine) // Query Launcher Method 
	{
		Connection DB_connection;
		try {
			 DB_connection = DriverManager.getConnection(DB_url, username, password); //Established DataBase Connection
			 PreparedStatement pstmt = DB_connection.prepareStatement("SELECT codice, titolo FROM libro"); //Pre-Fetched SQL Statements
		     ResultSet result = pstmt.executeQuery() ; //Execute SQL Pre-Fetched Statements
		     return result ; //Returns Query Results
		     
		} catch (SQLException e) { //Catches Eventual SQL Exception
			
			e.printStackTrace();
			return null ; 
			
		}
       
	}
		
	
}


