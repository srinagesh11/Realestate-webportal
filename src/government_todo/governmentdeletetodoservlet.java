package government_todo;

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
 * Servlet implementation class DeleteTodoServlet
 */
@WebServlet("/governmentdeletetodoservlet.do")
public class governmentdeletetodoservlet extends HttpServlet {
	@Resource(name = "jdbc/demo1")
    private DataSource ds;
	Connection conn;
	private static final long serialVersionUID = 1L;
       
	private governmenttodoservice todoService = new governmenttodoservice();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int user_id=Integer.parseInt((String) request.getParameter("user_id"));
		//String location_name=request.getParameter("location_name");
		try
		{
			conn = ds.getConnection();
			todoService.deleteTodo(user_id,conn);
			response.sendRedirect("governmenttodolist.do");
		}
		catch(SQLException e)
		{
			log(e.getMessage(), e);
		}
		finally
		{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
