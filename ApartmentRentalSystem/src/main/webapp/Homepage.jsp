<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Apartment" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.ApartmentDAO" %>
<%@ page import="Util.DBUtil" %>
<%@ page import="java.sql.*"%>


<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
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
        <li class="link"><a href="Login.jsp">Book Apartment</a></li>
        <li class="link"><a href="#client">Our Clients</a></li>
        <li class="link"><a href="#about">About Us</a></li>
        <li class="link"><a href="#contact">Contact Us</a></li>
    </ul>

    <ul class="nav__links">
        <li class="link"><a href="Login.jsp">Log In</a></li>
        <li class="link"><a href="Registration.jsp">Sign Up</a></li>
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

<form action="FilterServlet" method="post">
    <div>
        <div>
          <%
    try {
        String Q = "select distinct rental_cost from apartment";
        Connection conn = DBUtil.getConnection();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(Q);
%>
        <select name="rental_cost">
            <option value="" disabled selected>Rental Cost</option>
            <% while (rs.next()) { %>
                <option value="<%= rs.getString("rental_cost") %>"><%= rs.getString("rental_cost") %></option>
            <% } %>
        </select>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

        </div>
        <div>
            
          <%
    try {
        String Q = "select distinct floor_space from apartment";
        Connection conn = DBUtil.getConnection();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(Q);
%>
        <select name="floor_space">
            <option value="" disabled selected>Floor Space</option>
            <% while (rs.next()) { %>
                <option value="<%= rs.getString("floor_space") %>"><%= rs.getString("floor_space") %></option>
            <% } %>
        </select>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

        </div>
        </div>
       <div>
            
          <%
    try {
        String Q = "select distinct status from apartment";
        Connection conn = DBUtil.getConnection();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(Q);
%>
        <select name="status">
            <option value="" disabled selected>Vacancy</option>
            <% while (rs.next()) { %>
                <option value="<%= rs.getString("status") %>"><%= rs.getString("status") %></option>
            <% } %>
        </select>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

        </div>
        <div>
            
          <%
    try {
        String Q = "select distinct bedroom from apartment";
        Connection conn = DBUtil.getConnection();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(Q);
%>
        <select name="bedroom">
            <option value="" disabled selected>Bedroom</option>
            <% while (rs.next()) { %>
                <option value="<%= rs.getString("bedroom") %>"><%= rs.getString("bedroom") %></option>
            <% } %>
        </select>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

        </div>
        <button class="btn"><i class="ri-search-line"></i> Search</button>
    </div>
</form>

<div>
    <% List<Apartment> filteredApartments = (List<Apartment>) request.getAttribute("filteredApartments"); %>
    
    <% if (filteredApartments != null && !filteredApartments.isEmpty()) { %>
        <h2>Our Apartments:</h2>
        <table>
            <thead>
                <tr>
                    <th>Apartment Name</th>
                    <th>Rental Cost</th>
                    <th>Floor Space</th>
                    <th>Status</th>
                    <th>Bedroom</th>
                </tr>
            </thead>
            <tbody>
                <% for (Apartment apartment : filteredApartments) { %>
                    <tr>
                       <td><%= "A - " + apartment.getFloorNo() + " - " + apartment.getDoorNo() %></td>
                        <td><%= apartment.getRentalCost() %></td>
                        <td><%= apartment.getFloorSpace() %></td>
                        <td><%= apartment.getStatus() %></td>
                        <td><%= apartment.getBedroom() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } else { %>
        <h2>All Apartments:</h2>
        <table>
            <thead>
                <tr>
                 <th>Apartment Name</th>
                    <th>Rental Cost</th>
                    <th>Floor Space</th>
                    <th>Status</th>
                    <th>Bedroom</th>
                </tr>
            </thead>
            <tbody>
                <% 
                ApartmentDAO apartmentDAO = new ApartmentDAO();
                 List<Apartment> filteredApartments1 = apartmentDAO.getAllApartments(); 
                    for (Apartment apartment : filteredApartments1) { 
                %>
                    <tr>
                        <td><%= "A - " + apartment.getFloorNo() + " - " + apartment.getDoorNo() %></td>
                        <td><%= apartment.getRentalCost() %></td>
                        <td><%= apartment.getFloorSpace() %></td>
                        <td><%= apartment.getStatus() %></td>
                        <td><%= apartment.getBedroom() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } %>
</div>



</body>
</html>
