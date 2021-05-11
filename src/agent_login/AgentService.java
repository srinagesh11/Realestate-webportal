package agent_login;

import java.sql.*;

import com.app.user.agentUser;


public class AgentService {
	

	public boolean isUserValid(String name, String password, agentUser user,Connection conn) {
		try {

			if (conn != null && !conn.isClosed()) {
				ResultSet rs = null;

				Statement stmt = conn.createStatement();
				String sql = "select * from agentlogin where username='" + name + "' and password='" + password + "'";
				System.out.println(sql);
				rs = stmt.executeQuery(sql);

				if (rs != null && rs.next()) {
					user.setUser_id(rs.getInt("user_id"));
					return true;

				}

			}


		} catch (SQLException e) {
			// log(e.getMessage(), e);
			e.printStackTrace();
		}
		return false;
	}

}

