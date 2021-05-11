<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
-->

<%@include file="/common/header.jspf" %>
<header>
 		<nav class="navbar navbar-default">
			
			<ul class="nav navbar-nav">
			    <li><a href="home.do">Home</a></li>
			    <li><a href="agentlogin.do">login</a></li>
				<li><a href="agentRegistrationServlet.do">register</a></li>
		 </ul>
		</nav>
 </header> 
  <!--  <div class="container">
 
 	<form action="agentlogin.do" method="post" class="form-signin">
		<p>
			<font color="red">${error}</font>
		</p>
			<input type="text" class="form-control" name="username" placeholder="Name" required="" autofocus="" />
			<input type="password" class="form-control" name="password" placeholder="Password" required=""/>
			    	      
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button> 
			    	
	</form>

 
 </div>-->
 
 <p align="center" color="blue">List of properties</p>

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
ResultSet rs1 = null;

// Load JBBC driver "com.mysql.jdbc.Driver"
Class.forName("com.mysql.jdbc.Driver").newInstance();
/* Create a connection by using getConnection() method that takes parameters 
of string type connection url, user name and password to connect to database.*/
connection = DriverManager.getConnection(connectionURL, "root", "root");
/* createStatement() is used for create statement object that is used for 
sending sql statements to the specified database. */
statement = connection.createStatement();
// sql query to retrieve values from the secified table.
//String Query="SELECT username from showProperties";
//rs1 = statement.executeQuery(Query);

String QueryString = "SELECT * from map";
rs = statement.executeQuery(QueryString);
%>
<!--  <TABLE cellpadding="20" border="1" style="background-color:white;" align="center">-->
<table class="table table-striped">
		<!--<caption align="center" color="blue">List of Agents</caption>  -->
		<thead>
			<th>location</th>
			<th>type of property</th>
			<th>description</th>
			
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
	//if(rs1==rs.get))
while (rs.next()) {
%>
<TR>


<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>


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

</font>
<font size="+3" color="red"></b>
<%

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