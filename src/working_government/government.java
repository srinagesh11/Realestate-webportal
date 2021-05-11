package working_government;

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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.app.user.User;




@WebServlet("/government.do")
public class government extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static final Logger LOG = LoggerFactory.getLogger(government.class);
	
	@Resource(name = "jdbc/demo1")
    private DataSource ds;
	Connection conn;
	
   private governmentservice userValidation =new governmentservice();
   User user=new User();
    
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 request.getRequestDispatcher("view/governmentofficial.jsp").forward(request, response);		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
				LOG.info("User validated sucessfully");

				request.getSession().setAttribute("name", name);
				System.out.println(user.getUser_id());
			request.getSession().setAttribute("user_id", user.getUser_id());
				//request.getSession().setAttribute("csrfToken", generateCSRFToken());
				String sessionid = request.getSession().getId();
				response.setHeader("Set-Cookie", "JSESSIONID=" +  sessionid + ";");
			LOG.info("doPost : Redirect from LoginServlet to TodoServlet");
				 request.getRequestDispatcher("view/governmentlogout.jsp").forward(request, response);		
			}
			else
			{
				request.setAttribute("error", "Invalid credientials");
				//LOG.info("User validation failed");
				//LOG.info("doPost : Request from LoginServlet to login.jsp");
			   request.getRequestDispatcher("view/governmentofficial.jsp").forward(request, response);

			}
		}
		catch(SQLException e)
		{
			//log(e.getMessage(), e);
		}
	}

}
