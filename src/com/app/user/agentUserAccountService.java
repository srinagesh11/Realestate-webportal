package com.app.user;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class agentUserAccountService {

private static List<agentUser> userList = new ArrayList<agentUser>();
	
	public static List<agentUser> accountDetails(int user_id,Connection conn) {
		userList.clear();
		try {
			 
			if (conn != null && !conn.isClosed()) {
				ResultSet rs = null;

				Statement stmt = conn.createStatement();
				String sql = "select * from agentlogin where user_id=" + user_id;
				System.out.println(sql);
				rs = stmt.executeQuery(sql);

				if (rs != null) {
					
					while (rs.next()) {
						agentUser user=new agentUser();
						user.setUser_id(rs.getInt("user_id"));
						user.setUsername(rs.getString("username"));
						user.setFullname(rs.getString("fullname"));
						user.setEmail(rs.getString("email"));
						user.setExperience(rs.getString("experience"));
						user.setContact(rs.getString("contact"));
						user.setPassword(rs.getString("password"));
						userList.add(user);
			        }  
					
				}
					
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userList;
	}
	
	
	public static int updateUser(agentUser user, Connection conn) {
		int update=0;
		try {
			if (conn != null && !conn.isClosed()) {

				Statement stmt = conn.createStatement();
				
				String sql = "update agentlogin set fullname='"+user.getFullname()+"', email='"+user.getEmail()+"' where user_id="+user.getUser_id();
				System.out.println(sql);
				update=stmt.executeUpdate(sql);
	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return update;
	}
	
	
}
