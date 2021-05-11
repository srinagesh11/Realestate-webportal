<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/common/header.jspf"%>





<header>
 		<nav class="navbar navbar-default">
			
			<ul class="nav navbar-nav">
				<li class="active"><a href="home.do">Home</a></li>
				
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<li><a href="agentAddServlet.do">add properties</a></li>
			
				<li><a href="agentAccountUpdate.do"><font size="4">Hi ${name},update account</font></a></li>
				<li><a href="logout.do">Logout</a></li>
				
			</ul>
		</nav>
 </header>	
 

<div class="container">

	<H1 align="center">Properties List</H1>

	

	


<div class="row">
<div class="panel panel-default"></div>
<c:forEach items="${todos}" var="todo">
<div class="panel-body">
<p>location name :  ${todo.location_name} </p>
<p>property type :  ${todo.property_type} </p>
<p>description :  ${todo.description} </p>
</div>

<div class="panel-footer" align="right">
<a class="btn btn-danger"href="agentDeleteTodoServlet.do?user_id=${todo.user_id}">Delete</a>
</div>
</c:forEach>
</div>

	





<!-- 	<table class="table table-striped">

		<caption>Properties  are</caption>

		<thead>

			<th>Location Name</th>

			<th>Property Type</th>

			<th>Description</th>

			<th>Actions</th>

		</thead>

		<tbody>

			<c:forEach items="${todos}" var="todo">

				<tr>

					<td>${todo.location_name}</td>

					<td>${todo.property_type}</td>

				    <td>${todo.description}</td>

					<td>&nbsp;&nbsp;<a class="btn btn-danger"

						href="agentDeleteTodoServlet.do?user_id=${todo.user_id}">Delete</a></td>

				</tr>

			</c:forEach>

		</tbody>

	</table>



	<p>

		<font color="red">${errorMessage}</font>

	</p>

	



</div>-->






