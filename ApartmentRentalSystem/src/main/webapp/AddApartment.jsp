<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.ApartmentDAO" %>
<%@ page import="model.Apartment" %>

<html>
<head>
    <title>Add New Apartment</title>
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

        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
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
    <h2>Add New Apartment</h2>

       <form name="apartmentForm" action="AddApartmentServlet" method="post" onsubmit="return validateForm()">
        <label for="floor_no">Floor No:</label>
        <input type="number" name="floor_no" required>

        <label for="door_no">Door No:</label>
        <input type="number" name="door_no" required>

        <label for="advance_cost">Advance Cost:</label>
        <input type="number" name="advance_cost" required>

        <label for="rental_cost">Rental Cost:</label>
        <input type="number" name="rental_cost" required>

        <label for="bedroom">Bedroom:</label>
        <select name="bedroom">
            <option value="" disabled selected>Select Bedroom</option>
            <option value="2BHK">2 BHK</option>
            <option value="3BHK">3 BHK</option>
           
        </select>

        <label for="floor_space">Floor Space:</label>
        <select name="floor_space">
            <option value="" disabled selected>Select Floor Space</option>
            <option value="500 sq ft">500 sq ft</option>
            <option value="750 sq ft">750 sq ft</option>
           
        </select>

        <label for="status">Status:</label>
        <select name="status">
            <option value="" disabled selected>Select Status</option>
            <option value="Vacant">Vacant</option>
            <option value="Rented out">Rented out</option>
            
        </select>

        <label for="notice_period">Notice Period:</label>
        <input type="text" name="notice_period" required>

        <input type="submit" value="Add Apartment">
    </form>
    <script>
        function validateForm() {
            var floorNo = document.forms["apartmentForm"]["floor_no"].value;
            var doorNo = document.forms["apartmentForm"]["door_no"].value;
            var advanceCost = document.forms["apartmentForm"]["advance_cost"].value;
            var rentalCost = document.forms["apartmentForm"]["rental_cost"].value;
            var bedroom = document.forms["apartmentForm"]["bedroom"].value;
            var floorSpace = document.forms["apartmentForm"]["floor_space"].value;
            var status = document.forms["apartmentForm"]["status"].value;
            var noticePeriod = document.forms["apartmentForm"]["notice_period"].value;

            if (floorNo === "" || doorNo === "" || advanceCost === "" || rentalCost === "" || bedroom === ""
                || floorSpace === "" || status === "" || noticePeriod === "") {
                alert("All fields must be filled out");
                return false;
            }

           

            return true;
        }
   </script>
</body>
 
</html>
