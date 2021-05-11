package com.app.registration;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class agentRegistrationService {
	
	public boolean isUserRegistered(String name,String fullname,String email,String experience,String contact, String password, Connection conn) {
		boolean usernameExists=true;
		try {

			if (conn != null && !conn.isClosed()) {
				ResultSet rs = null;

				Statement stmt = conn.createStatement();
				String sql = "select * from agentlogin where username='" + name + "'";
				System.out.println(sql);
				rs = stmt.executeQuery(sql);
				if(rs.next()) {
					System.out.println("aaa");
				  usernameExists = true;
				}
				else
				{
					System.out.println("sss");
					String insertSql = "insert into agentlogin (username,fullname,email,experience,contact,password) values('" + name + "','" + fullname + "','" + email + "','" + experience + "','" + contact + "', '"+password+"');";
					stmt.executeUpdate(insertSql);
					usernameExists=false;
					return usernameExists;
				}

			}
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usernameExists;
		
	}

}
