package working_map;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;




@WebServlet("/map.do")
public class map extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/demo1")
    private DataSource ds;
	Connection conn;
	
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("hello");
		String password = request.getParameter("hello1");
		
			try {
				conn = ds.getConnection();

				if (conn != null && !conn.isClosed()) {
					ResultSet rs = null;

					Statement stmt = conn.createStatement();
					String sql = "select description from map where location_name='" + name + "' and property_type='" + password + "'";
					System.out.println(sql);
					rs=stmt.executeQuery(sql);
					if(rs.next())
					{
						request.setAttribute("dataValues",rs.getString(1));

					}
					   request.getRequestDispatcher("view/home.jsp").forward(request, response);


				}


			} catch (SQLException e) {
				// log(e.getMessage(), e);
				e.printStackTrace();
			
			
		}
	}

}
