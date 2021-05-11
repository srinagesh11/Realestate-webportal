<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@include file="/common/header.jspf" %>
<header>
 		<nav class="navbar navbar-default">
			
			<ul class="nav navbar-nav navbar-right">
			<li class="active"><a href="home.do">Home</a></li>
				<li><a href="adminlogout.do">Logout</a></li>
			</ul>
		</nav>
 </header>	
 

<%
try {
String connectionURL = "jdbc:mysql://localhost:3306/demo1";
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "root");
statement = connection.createStatement();
String QueryString = "SELECT * from map";
rs = statement.executeQuery(QueryString);


%>
<table class="table table-striped">
		<h><caption>Properties </caption></h>
		<thead>
			<th>Location Name</th>
			<th>Property Type</th>
			<th>Description</th>
		</thead>
		<tbody>
<%
while (rs.next()) {
%>
<tr>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
				    <td><%=rs.getString(4)%></td>
					
</tr>
	
		

<% } %>
</tbody>
	</table>
	

<%
// close all the connections.
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
%>
<%
out.println("Unable to connect to database.");
}
%>
<%@include file="/common/footer.jspf" %>