<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.ApartmentDAO" %>
<%@ page import="model.Apartment" %>

<html>
<head>
    <title>Apartment System - Users</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #343a40;
        }

        table {
            width: 80%;
            margin-top: 20px;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            border-radius: 10px;
            background-color: #fff;
        }

        th, td {
            border: 1px solid #dee2e6;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #e9ecef;
        }

        form {
            width: 50%;
            margin-top: 20px;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>Apartment System - Admin</h2>

    <%
        ApartmentDAO apartmentDAO = new ApartmentDAO();
        List<Apartment> apartments = apartmentDAO.getAllApartments();
    %>

    <table>
        <tr>
            <th>ID</th>
            <th>Floor No</th>
            <th>Door No</th>
            <th>Advance Cost</th>
            <th>Rental Cost</th>
            <th>Bedroom</th>
            <th>Floor Space</th>
            <th>Status</th>
            <th>Notice Period</th>
            <th>Edit</th>
            <!-- Add more headers as needed -->
        </tr>

        <% for (Apartment apartment : apartments) { %>
            <tr>
                <td><%= apartment.getId() %></td>
                <td><%= apartment.getFloorNo() %></td>
                <td><%= apartment.getDoorNo() %></td>
                <td><%= apartment.getAdvanceCost() %></td>
                <td><%= apartment.getRentalCost() %></td>
                <td><%= apartment.getBedroom() %></td>
                <td><%= apartment.getFloorSpace() %></td>
                <td><%= apartment.getStatus() %></td>
                <td><%= apartment.getNoticePeriod() %></td>
                <td><a href="EditApartment.jsp?id=<%= apartment.getId() %>">Manage</a></td>
                <!-- Add more data cells as needed -->
            </tr>
        <% } %>
    </table>
</body>
</html>
