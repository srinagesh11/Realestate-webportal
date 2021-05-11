package agent_login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.app.user.agentUser;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/agentlogin.do")
public class agentlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger LOG = LoggerFactory.getLogger(agentlogin.class);
	
	@Resource(name = "jdbc/demo1")
    private DataSource ds;
	Connection conn;
	
   private AgentService userValidation =new AgentService();
   agentUser user=new agentUser();
	
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LOG.info("doGet : Request from agentLoginServlet to agentlogin.jsp");
	   request.getRequestDispatcher("view/agentlogin.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		//LOG.info("doPost : Request from login.jsp to validate login");
		//LOG.trace("Requested User : "+name);
		try
		{
			conn = ds.getConnection();
		
			boolean isUserValid=userValidation.isUserValid(name, password,user,conn);
			if(isUserValid)
			{
				//LOG.info("User validated sucessfully");

				request.getSession().setAttribute("name", name);
				System.out.println(user.getUser_id());
				request.getSession().setAttribute("user_id", user.getUser_id());
				//request.getSession().setAttribute("csrfToken", generateCSRFToken());
				String sessionid = request.getSession().getId();
				response.setHeader("Set-Cookie", "JSESSIONID=" +  sessionid + ";");
				//LOG.info("doPost : Redirect from LoginServlet to TodoServlet");
				 request.getRequestDispatcher("view/AdminLogout.jsp").forward(request, response);		
			}
			else
			{
				request.setAttribute("error", "Invalid credientials");
				//LOG.info("User validation failed");
				//LOG.info("doPost : Request from LoginServlet to login.jsp");
			   request.getRequestDispatcher("view/agentlogin.jsp").forward(request, response);

			}
		}
		catch(SQLException e)
		{
			//log(e.getMessage(), e);
		}
	}
	
	
	
	

}
