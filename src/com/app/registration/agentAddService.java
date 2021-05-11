package com.app.registration;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class agentAddService {
	
	public boolean isUserRegistered(String location_name,String property_type,String description , Connection conn) {
		//boolean usernameExists=true;
		

			
				try{

				Statement stmt = conn.createStatement();
				
				
				
					System.out.println("sss");
					String insertSql = "insert into map (location_name,property_type,description) values('" + location_name + "','" + property_type + "','" + description + "');";
					stmt.executeUpdate(insertSql);
					
				
			conn.close();
			return true;

				}
		catch(SQLException e)
				{
			e.printStackTrace();

				}
		return true;
	}

}
