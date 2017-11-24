<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dbc.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Order</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="StylesheetIntro.css">
</head>
<body>

    <div class="navbar">
        <a href="index.html">Home</a>
        <a href="about.html">About Us</a>
        <a href="contact.html">Contact Us</a>
    </div>

    <div class="main">
        <h1>Shipperman Trucking Company</h1>    
    
        <br>
	<table width ="59%" border =1>
	<tr>
	<th>Order ID</th>
	<th>Order Date</th>
	<th>Order Amount</th>
	<th>Order Status</th>
	<th>Driver</th>
	<th>Truck For shipping</th>
	
	</tr>
		<%
		if(session.getAttribute("fname")==null){
			response.sendRedirect("Page1_Login.jsp");
		}
			
			try{
			/*Query for displaying the order*/
			String view_orders=" SELECT order_id, order_date, order_amount, status, employees.emp_lname, employees.emp_fname"+
								" ,trucks.truck_make, trucks.truck_model, trucks.truck_color " +
								"FROM orders" +
								" INNER JOIN employees on employees.emp_id = orders.emp_id " +
								"INNER JOIN trucks on employees.emp_id = trucks.emp_id " +
								"INNER JOIN customers on customers.cust_id = orders.cust_id " +
								"where customers.cust_id = " + session.getAttribute("cust_id");
		
			/*Establish a connection*/
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/soag14","root","root");
			PreparedStatement ps= conn.prepareStatement(view_orders);
			ResultSet rs= ps.executeQuery();
			/*Loop to display data*/
			while(rs.next()){ 
				
				/*IMPORTANT: Pass the data in the form of variables, else it'll only display*/
				int order_id = rs.getInt("order_id") ;
				Date order_date = rs.getDate("order_date");
				double amt = rs.getDouble("order_amount") ;
				String status = rs.getString("status") ;
				String fn =  rs.getString("emp_fname");
				String ln = rs.getString("emp_lname");
				String make=rs.getString("truck_make");
				String model =rs.getString("truck_model");
				String color = rs.getString("truck_color");
				
			%>
			
			<tr>
			<td><%= order_id %>	</td>
			<td><%= order_date %>	</td>
			<td><%= amt %>	</td>
			<td><%= status %>	</td>
			<td><%= ln%> <%= fn %></td>
			<td><%= make%>	 <%= model%> <%= color %></td>	
			</tr>
		<%		
			}
				rs.close();
				ps.close();
				conn.close();
			}
			catch(Exception e){
				e.printStackTrace();
			}
			
		%>


	</table>
    <a class = "button" href ="Page3_Profile.jsp">Go To Profile</a>
    </div>
</body>
</html>