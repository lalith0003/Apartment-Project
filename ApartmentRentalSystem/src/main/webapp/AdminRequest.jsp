<%@ page import="java.sql.*" %>
<%@ page import="Util.DBUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin All Request View</title>
  <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        nav {
            background-color: #333;
            overflow: hidden;
            padding: 10px 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .nav__logo img {
            height: 50px;
        }

        .nav__links {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        .link {
            margin-right: 20px;
        }

        .link a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        .link a:hover {
            color: #ffd700;
        }

        form {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        select, button {
            padding: 10px;
            margin: 5px;
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        h2, p {
            text-align: center;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-left: auto;
            margin-right: auto;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #4caf50;
            color: #fff;
        }

        tbody tr:hover {
            background-color: #f5f5f5;
        }
       
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        .opening-section {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('image/22.jpg');
            background-size: cover;
            background-position: center;
            height: 500px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #fff;
        }

        .opening-section h1 {
            font-size: 3em;
            margin-bottom: 20px;
        }

        .image-box {
            display: flex;
            justify-content: space-around;
            margin: 20px auto;
            max-width: 1200px;
        }

        .image-box img {
            width: 48%;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
        
        nav {
            background-color: #333;
            overflow: hidden;
            padding: 10px 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .nav__logo img {
            height: 50px;
        }

        .nav__links {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        .link {
            margin-right: 20px;
        }

        .link a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        .link a:hover {
            color: #ffd700;
        }
    </style>
</head>
<body>
<nav>
    <div class="nav__logo"><img src="image/logo.jpg" alt="Logo"></div>
    <ul class="nav__links">
        <li class="link"><a href="#home">Home</a></li>
        <li class="link"><a href="UserDetails.jsp">User Data</a></li>
        <li class="link"><a href="#client">All Request</a></li>
        <li class="link"><a href="AddApartment.jsp">Add Apartment</a></li>
        <li class="link"><a href="#contact">Contact Us</a></li>
    </ul>

    <ul class="nav__links">
    <li class="link"><a href="">Hey Admin! </a></li>
        <li class="link"><a href="LogoutServlet">Logout</a></li>
    </ul>
</nav>
<div class="opening-section">
    <div>
        <h1>Welcome to Our Rental System</h1>
        <p>Find the perfect apartment for your needs</p>
    </div>
</div>

<div class="image-box">
    <img src="image/3bhkinterir.jpg" alt="Image 1">
    <img src="image/2bhk interior.jpg" alt="Image 2">
</div>

    <h2>Request Details</h2>
    
    <table border="1">
        <tr>
            
            <th>Floor Number</th>
            <th>Door Number</th>
            <th>Username</th>
            <th>Contact</th>
            <th>Comment</th>
            <th>Status</th>
            <th>action</th>
            
        </tr>
        
        <% 
           
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
               
                conn = DBUtil.getConnection();

                // Retrieve data 
                String sql = "SELECT id, floor_no, door_no, username, contact, comment, status FROM allrequest ";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);
                
                
                while (rs.next()) {
        %>
                    <tr>
                   <%--  <td><%= rs.getInt("id") %></td>--%>
                    <td><%= rs.getInt("floor_no") %></td>
                    <td><%= rs.getInt("door_no") %></td>
                    <td><%= rs.getString("username") %></td>
                    <td><%= rs.getString("contact") %></td>
                    <td><%= rs.getString("comment") %></td>
                    <td>
    <% 
        String status = rs.getString("status");
        if (status == null || status.trim().isEmpty()) {
            status = "Pending";
        }
        out.print(status);
    %>
</td>
                    <td>
    <% 
        
        if (!"Accepted".equals(rs.getString("status")) && !"Denied".equals(rs.getString("status"))) {
    %>
        						<form method="post" action="AcceptServ">
                                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                    <input type="hidden" name="floorNo" value="<%= rs.getInt("floor_no") %>">
                                    <input type="hidden" name="doorNo" value="<%= rs.getInt("door_no") %>">
                                    <input type="submit" name="accept" value="Accept">
                                </form>

                                <form method="post" action="DenyServ">
                                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                    <input type="hidden" name="floorNo" value="<%= rs.getInt("floor_no") %>">
                                    <input type="hidden" name="doorNo" value="<%= rs.getInt("door_no") %>">
                                    <input type="submit" name="deny" value="Deny">
                                </form>
        
    <% } else { %>
        <p>Done</p>
    <% } %>
</td>

                </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close resources
                try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
    </table>
</body>
</html>
