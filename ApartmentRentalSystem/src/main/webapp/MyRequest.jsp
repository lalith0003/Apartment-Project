<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Apartment" %>
<%@ page import="dao.ApartmentDAO" %>

<html>
<head>
    <title>All Request Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        form {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        p {
            color: red;
        }

        .error-message {
            color: red;
            margin-top: 5px;
        }
    </style>
    <script>
        function validateForm() {
            var floorNo = document.getElementById("floorNo").value;
            var doorNo = document.getElementById("doorNo").value;
            var username = document.getElementById("username").value;
            var contact = document.getElementById("contact").value;
            var comment = document.getElementById("comment").value;

            var errorMessage = "";

            if (floorNo.trim() === "" || isNaN(floorNo)) {
                errorMessage += "Please enter a valid floor number.\n";
            }

            if (doorNo.trim() === "" || isNaN(doorNo)) {
                errorMessage += "Please enter a valid door number.\n";
            }

            if (username.trim() === "") {
                errorMessage += "Please enter a username.\n";
            }

            if (contact.trim() === "" || isNaN(contact)) {
                errorMessage += "Please enter a valid contact number.\n";
            }

            if (comment.trim() === "") {
                errorMessage += "Please enter a comment.\n";
            }

            if (errorMessage !== "") {
                document.getElementById("error-message").innerHTML = errorMessage;
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <h2>All Request Page</h2>

    <form action="SubmitAllRequestServlet" method="post" onsubmit="return validateForm();">
        
        <%
            String floorNoParam = request.getParameter("floorNo");
            String doorNoParam = request.getParameter("doorNo");

            if (floorNoParam != null && doorNoParam != null) {
        %>
                <label for="floorNo">Floor No:</label>
                <input type="text" id="floorNo" name="floorNo" value="<%= floorNoParam %>"  ><br>

                <label for="doorNo">Door No:</label>
                <input type="text" id="doorNo" name="doorNo" value="<%= doorNoParam %>" ><br>
        <%
            } else {
        %>
                <p>Error: Missing or invalid parameters.</p>
        <%
            }
        %>

        <label for="username">Username:</label>
        <input type="text" id="username" name="username" placeholder="Registered username" required><br>

        <label for="contact">Contact:</label>
        <input type="number" id="contact" name="contact" placeholder="Registered contact" required><br>
        <div id="error-message" class="error-message"></div>
        <label for="comment">Comment:</label>
        <textarea id="comment" name="comment" rows="4" cols="50" required></textarea><br>

        <input type="submit" value="Submit Request">
    </form>

</body>
</html>
