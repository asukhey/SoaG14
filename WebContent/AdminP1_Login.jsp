<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="AdminLogin" method="post">
	<table border = "1" align="center">
		<tr>
			<td>Email ID: </td>
			<td><input type="text" id = "email" name ="email"> </td>
		</tr>
		<tr>
			<td>Password: </td>
			<td><input type="password" id= "password" name = "password"> </td>
		</tr>
	</table>
	<input type="Submit" name="Submit" id="Submit" value ="Login"/><br>
	
	</form>

</body>
</html>