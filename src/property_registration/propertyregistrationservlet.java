package property_registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register1.do")
public class propertyregistrationservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name = "jdbc/demo1")
    private DataSource ds;
	Connection conn;
	
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.getRequestDispatcher("view/registration.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
        
				
				System.out.println("2");
			
				try {
				
					String connectionURL = "jdbc:mysql://localhost:3306/demo1";
					// declare a connection by using Connection interface
					Connection connection = null;
					boolean insert1=false;
					Statement statement = null;
					System.out.println("3");
					Class.forName("com.mysql.jdbc.Driver").newInstance();
				
					connection = DriverManager.getConnection(connectionURL, "root", "root");
					
					statement = connection.createStatement();
					
					String location_name = request.getParameter("locationname");
							String property_type = request.getParameter("Type Of Property");
							String description = request.getParameter("description");
							String insertSql = "insert into map (location_name,property_type,description) values('" + location_name + "','" + property_type + "', '"+description+"');";
							int insert = statement.executeUpdate(insertSql);
							if(insert==1)
							{
								insert1=true;
							}

						if(insert1)
						{
							request.setAttribute("msg","success");
							request.setAttribute("success"," Property Posted Successfully");
							request.getRequestDispatcher("view/logout.jsp").forward(request,response);
						}
						else
						{
							request.setAttribute("msg","error");
							request.setAttribute("error","Unsuccessfull");
							request.getRequestDispatcher("view/logout.jsp").forward(request,response);
						}
							
					
					statement.close();
					connection.close();
										} catch (Exception ex) {
						{
							ex.printStackTrace();
	
						}



}
	}
}
