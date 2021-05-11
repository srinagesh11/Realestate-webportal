<%@page language="java" import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Of Properties</title>
</head>
<body>
<table class="table table-striped">
		<caption>Property Details</caption>
		<tbody>
			<c:forEach items="${hell}" var="message">
			
				<tr>
					<td>
						<div style="width:50%;"><b>${message.location_id}</b></div>
  						<div style="width:50%;">${message.location_name}</div>
  						<div style="width:50%;">${message.property_type}</div>
  						<div style="width:50%;">${message.description}</div>
  						
  					</td>
				</tr>
				
				<tr><td></td></tr>
				<tr><td></td></tr>
				
			</c:forEach>
		</tbody>
	</table>

</body>
</html>