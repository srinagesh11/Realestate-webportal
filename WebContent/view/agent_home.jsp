


<%@include file="/common/header.jspf" %>
<header>
 		<nav class="navbar navbar-default">
			
			<ul class="nav navbar-nav">
			    <li><a href="home.do">Home</a></li>
			    
			    </ul>
			<ul class="nav navbar-nav navbar-right">					
			    <li><a href="agentLogin.do">login</a></li>
				<li><a href="agentRegistrationServlet.do">register</a></li>
		 </ul>
		</nav>
 </header> 
 
 
 
 <p align="center" color="blue">List of Agents</p>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
<head>
<!--  <title>display data from the table using jsp</title>-->
</head>
<body>
<!--  <h2>Data from the table 'stu_info' of database 'student'</h2>-->
<%
try {
/* Create string of connection url within specified format with machine
name, port number and database name. Here machine name id localhost and 
database name is student. */
String connectionURL = "jdbc:mysql://localhost:3306/demo1";
// declare a connection by using Connection interface
Connection connection = null;
/* declare object of Statement interface that is used for executing sql 
statements. */
Statement statement = null;
// declare a resultset that uses as a table for output data from tha table.
ResultSet rs = null;
// Load JBBC driver "com.mysql.jdbc.Driver"
Class.forName("com.mysql.jdbc.Driver").newInstance();
/* Create a connection by using getConnection() method that takes parameters 
of string type connection url, user name and password to connect to database.*/
connection = DriverManager.getConnection(connectionURL, "root", "root");
/* createStatement() is used for create statement object that is used for 
sending sql statements to the specified database. */
statement = connection.createStatement();
// sql query to retrieve values from the secified table.
String QueryString = "SELECT * from agentlogin";
rs = statement.executeQuery(QueryString);
%>
<!--  <TABLE cellpadding="20" border="1" style="background-color:white;" align="center">-->
<table class="table table-striped">
		<!--<caption align="center" color="blue">List of Agents</caption>  -->
		<thead>
			<th>Agent Name</th>
			<th>Email</th>
			<th>Experience</th>
			<th>contact</th>
		</thead>
		<tbody>
		
			<!--  <c:forEach items="${todos}" var="todo">
				<tr>
					<td>${todo.description}</td>
					<td>${todo.category}</td>
					<td>&nbsp;&nbsp;<a class="btn btn-danger"
						href="todoDelete.do?todo_id=${todo.todo_id}">Delete</a></td>
				</tr>
			</c:forEach>-->
			<%
while (rs.next()) {
%>
<TR>

<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>
<TD><%=rs.getString(5)%></TD>
<TD><%=rs.getString(6)%></TD>
<form action="showProperties.do" method="post" class="form-signin">
<TD><button id="submit" class="btn btn-lg btn-primary btn-block" type="submit">show properties</button></TD>
</form>

</TR>
<% } %>
<%
// close all the connections.
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
%>
		</tbody>
	</table>

<!--  <TR>

<TD>agentname</TD>
<TD>email</TD>
<TD>experience</TD>
<TD>contact</TD>

</TR>-->

<!--  --></font>
<font size="+3" color="red"></b>
<%
out.println("Unable to connect to database.");
}
%>


</TABLE><TABLE>
<TR>
<!-- <TD><FORM ACTION="welcome_to_database_query.jsp" method="get" >
<button type="submit"><-- back</button></TD>-->
</TR>
</TABLE>
</font>
</body>
</html>
 
			    	
<%@include file="/common/footer.jspf" %>