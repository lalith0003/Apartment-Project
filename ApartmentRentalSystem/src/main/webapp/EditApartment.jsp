<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.ApartmentDAO" %>
<%@ page import="model.Apartment" %>

<html>
<head>
    <title>Edit Apartment Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            height: 100vh;
            margin: 0;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            width: 50%;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h2>Edit Apartment Details</h2>

    <%
        int apartmentId = Integer.parseInt(request.getParameter("id"));
        ApartmentDAO apartmentDAO = new ApartmentDAO();
        Apartment apartment = apartmentDAO.getApartmentById(apartmentId);
    %>

    <form action="UpdateApartment.jsp" method="post">
        <label for="floor_no">Floor No:</label>
        <input type="text" name="floor_no" value="<%= apartment.getFloorNo() %>">

        <label for="door_no">Door No:</label>
        <input type="text" name="door_no" value="<%= apartment.getDoorNo() %>">

        <label for="advance_cost">Advance Cost:</label>
        <input type="text" name="advance_cost" value="<%= apartment.getAdvanceCost() %>">

        <label for="rental_cost">Rental Cost:</label>
        <input type="text" name="rental_cost" value="<%= apartment.getRentalCost() %>">

        <label for="bedroom">Bedrooms:</label>
        <input type="text" name="bedroom" value="<%= apartment.getBedroom() %>">

        <label for="floor_space">Floor Space:</label>
        <input type="text" name="floor_space" value="<%= apartment.getFloorSpace() %>">

        <label for="status">Status:</label>
        <input type="text" name="status" value="<%= apartment.getStatus() %>">

        <label for="notice_period">Notice Period:</label>
        <input type="text" name="notice_period" value="<%= apartment.getNoticePeriod() %>">

        <input type="hidden" name="id" value="<%= apartment.getId() %>">
        <input type="submit" value="Update">
    </form>
</body>
</html>
