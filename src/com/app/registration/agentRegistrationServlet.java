package com.app.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

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
@WebServlet("/agentRegistrationServlet.do")
public class agentRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name = "jdbc/demo1")
    private DataSource ds;
	Connection conn;
	private agentRegistrationService userRegister= new agentRegistrationService();
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("view/agentRegistrationServlet.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				String name = request.getParameter("name");
				String fullname = request.getParameter("fullname");
				String email = request.getParameter("email");
				String experience = request.getParameter("experience");
				String contact = request.getParameter("contact");

				String password = request.getParameter("password");
				String confirm_password = request.getParameter("confirm_password");
				// check if the page has been submitted:
				if (password!=null && confirm_password!=null) {
				    
				   // check if they are equal:
				   if (!password.equals(confirm_password)) {
					   
					   request.setAttribute("error", "Confirmation password did not match");
					   request.getRequestDispatcher("view/agentRegistrationServlet.jsp").forward(request, response);
			
				   }
				 else
				 {
					 try
						{
							conn = ds.getConnection();
						}
						catch(SQLException e)
						{
							log(e.getMessage(), e);
						}
						boolean isUserRegistered=userRegister.isUserRegistered(name,fullname,email,experience,contact,password,conn);
						if(isUserRegistered)
						{
							request.setAttribute("error", "User already registered");
							request.getRequestDispatcher("view/agentLogin.jsp").forward(request, response);
										
						}
						else
						{
							request.getRequestDispatcher("view/agent_home.jsp").forward(request, response);

						}
					 
				 }
				   
				}
				
	}

}
