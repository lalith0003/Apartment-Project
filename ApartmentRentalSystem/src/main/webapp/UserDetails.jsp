<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="model.Usermember" %>
<%@ page import="Util.DBUtil" %>
<%@ page import="model.Apartment" %>
<%@ page import="dao.ApartmentDAO" %>

<html>
<head>
    <title>Users of Apartment Rental Page</title>
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
        <li class="link"><a href="AdminPage.jsp">Our Apartments</a></li>
        <li class="link"><a href="#client">Our Clients</a></li>
        <li class="link"><a href="#about">About Us</a></li>
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

<div><h2>Users of Apartment Rental Page</h2>
</div>
    
<div>
    <% 
        UserDAO userDAO = new UserDAO();
        List<Usermember> userList = userDAO.getAllUsers();

       
        if (!userList.isEmpty()) {
            out.println("<table>");
            out.println("<tr><th>First Name</th><th>Last Name</th><th>Email</th><th>Contact</th></tr>");

            for (Usermember user : userList) {
                out.println("<tr><td>" + user.getFirstname() + "</td><td>" 
                              + user.getLastname() + "</td><td>" 
                              + user.getEmail() + "</td><td>" + user.getContact() + "</td></tr>");
            }

            out.println("</table>");
        } else {
            out.println("<p>No users found</p>");
        }
    %>
    
   
</body>
</html>

