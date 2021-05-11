package com.app.registration;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.app.user.agentUser;
import com.app.user.agentUserAccountService;

/**
 * Servlet implementation class AccountUpdateServlet
 */
@WebServlet(urlPatterns="/agentAccountUpdate.do", initParams={@WebInitParam(name="basePath", value="/Users/SrikanthReddy")})
public class agentAccountUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger LOG = LoggerFactory.getLogger(agentAccountUpdateServlet.class);

       
	@Resource(name = "jdbc/demo1")
    private DataSource ds;
	Connection conn;
   
	private agentUserAccountService userAccountService = new agentUserAccountService();
	private static final String SAVE_DIR = "uploadFiles";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int user_id=(int) request.getSession().getAttribute("user_id");
		String name=(String) request.getSession().getAttribute("name");
		String fileName=SAVE_DIR + File.separator + name+"_"+user_id+".png";
		
		try
		{
			LOG.trace("doGet : DBConnection Open");
			conn = ds.getConnection();
			LOG.info("doGet : Retrive accout details");
			request.setAttribute("user", agentUserAccountService.accountDetails(user_id,conn));
			request.setAttribute("fileName", fileName);
			LOG.info("doGet : Request from agentAccountUpdateServlet to agentAccountUpdate.jsp");
			request.getRequestDispatcher("view/agentAccountUpdate.jsp").forward(request, response);

			
		}
		catch(SQLException e)
		{
			LOG.error("doGet : Catch block : SQLException : "+e.getMessage());
			log(e.getMessage(), e);
		}
		finally
		{
			try {
				conn.close();
				LOG.trace("doGet : DBConnection Close");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				LOG.error("doGet : Finally block : SQLException : "+e.getMessage());
				e.printStackTrace();
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		int user_id= (int)request.getSession().getAttribute("user_id");
		String experience = request.getParameter("experience");
		String contact = request.getParameter("contact");
		String password = request.getParameter("password");

		
		
		String storedToken = (String)request.getSession().getAttribute("csrfToken");
        String token = request.getParameter("token");
        //do check
        if (storedToken.equals(token)) {

        	try
    		{
        		LOG.trace("doPost : DBConnection Open");
    			conn = ds.getConnection();
    			agentUser user=new agentUser();
    			user.setUser_id(user_id);
    			user.setFullname(fullname);
    			user.setEmail(email);
    			user.setExperience(experience);
    			user.setContact(contact);
    			user.setPassword(password);

    			LOG.info("doPost : Update user data");
    			int update=agentUserAccountService.updateUser(user,conn);
    			if(update==1)
    			{
    				LOG.info("doPost : Update done sucessfully");
    				request.setAttribute("success", "Updated");
    				LOG.info("doPost : Redirect from agentAccountUpdateServlet to agentAccountUpdateServlet");
    				response.sendRedirect("agentAccountUpdate.do");
    			}
    			else
    			{
    				LOG.info("doPost : Update failed");
    				request.setAttribute("error", "Update failed");
    				LOG.info("doPost : Redirect from agentAccountUpdateServlet to agentAccountUpdateServlet");
    				response.sendRedirect("agentAccountUpdate.do");
    				
    			}
    			
    			
    		}
    		catch(SQLException e)
    		{
    			LOG.error("doPost : Catch block : SQLException : "+e.getMessage());
    			log(e.getMessage(), e);
    		}
    		finally
    		{
    			try {
    				conn.close();
    				LOG.trace("doPost : DBConnection Close");
    			} catch (SQLException e) {
    				// TODO Auto-generated catch block
    				LOG.error("doPost : Finally block : SQLException : "+e.getMessage());
    				e.printStackTrace();
    			}
    		}
        	
        } else {
               	
        }
		
		
		
		
		
		
		
		
	}

}
