package working_agent;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


//import working_government.listing;
public class agentTodoService {
	private static List<listing> todos = new ArrayList<listing>();
	public List<listing> retrieveTodos(int user_id,Connection conn) {
		todos.clear();
		try {
			 
			if (conn != null && !conn.isClosed()) {
				ResultSet rs = null;

				Statement stmt = conn.createStatement();
				String sql = "select * from map";
				System.out.println(sql);
				rs = stmt.executeQuery(sql);

				if (rs != null) {
					
					while (rs.next()) {
						listing t=new listing();
						t.setUser_id(rs.getInt("user_id"));
						t.setLocation_name(rs.getString("location_name"));
						t.setProperty_type(rs.getString("property_type"));
						t.setDescription(rs.getString("description"));

			            todos.add(t);
			        }  
					
				}
					
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(todos.size());
		return todos;
	}



public void deleteTodo(int user_id,Connection conn) {
	
	/*Iterator<Todo> iterator = todos.iterator();
    while(iterator.hasNext())
    {
        Todo t = iterator.next();
        if(t.getTodo_id()==todo_id)
        {
            iterator.remove(word);
        }
    }*/

	
	listing t1 = null;
	
	for(listing t : todos) { 
		   if(t.getUser_id()==user_id) { 
			   
			 t1=t;  
		   }
		}
	
	try {
		if (conn != null && !conn.isClosed()) {

			Statement stmt = conn.createStatement();
			String sql = "delete from map where user_id="+user_id;
			System.out.println(sql);
			int delete = stmt.executeUpdate(sql);
			if(delete==1)
			{
				todos.remove(t1);
			}	
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
}



}

