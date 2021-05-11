package com.app.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;
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
@WebServlet("/agentAddServlet.do")
public class agentAddServlet extends HttpServlet {
	
		private static final long serialVersionUID = 1L;
		
		@Resource(name = "jdbc/demo1")
	    private DataSource ds;
		Connection conn;
		
	       
	   
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.getRequestDispatcher("view/agentAddServlet.jsp").forward(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			
	        
					
					//System.out.println("2");
				
					try {
					
						String connectionURL = "jdbc:mysql://localhost:3306/demo1";
						// declare a connection by using Connection interface
						Connection connection = null;
						
						Statement statement = null;
						//System.out.println("3");
						Class.forName("com.mysql.jdbc.Driver").newInstance();
					
						connection = DriverManager.getConnection(connectionURL, "root", "root");
						
						statement = connection.createStatement();
						
						String location_name = request.getParameter("location_name");
								String property_type = request.getParameter("property_type");
								String description = request.getParameter("description");
								String insertSql = "insert into map (location_name,property_type,description) values('" + location_name + "','" + property_type + "', '"+description+"');";
						
								statement.executeUpdate(insertSql);
						
						statement.close();
						connection.close();
						request.getRequestDispatcher("view/agentAddServlet.jsp").forward(request, response);

						} catch (Exception ex) {
							{
								ex.printStackTrace();
		
							}



	}
		}
	}