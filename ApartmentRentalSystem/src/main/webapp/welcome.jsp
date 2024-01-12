<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="model.Usermember" %>
<%@ page import="Util.DBUtil" %>

<html>
<head>
    <title>Users of Apartment Rental Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 70%;
            margin-top: 20px;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }
        div{
        display: inline;
        }
    </style>
</head>
<body>
<div><h2>Users of Apartment Rental Page</h2>
</div>
    
<div>
    <% 
        UserDAO userDAO = new UserDAO();
        List<Usermember> userList = userDAO.getAllUsers();

        // Display data in an HTML table
        if (!userList.isEmpty()) {
            out.println("<table>");
            out.println("<tr><th>First Name</th><th>Last Name</th><th>Password</th><th>Email</th><th>Contact</th></tr>");

            for (Usermember user : userList) {
                out.println("<tr><td>" + user.getFirstname() + "</td><td>" 
                              + user.getLastname() + "</td><td>" + user.getPassword() + "</td><td>" 
                              + user.getEmail() + "</td><td>" + user.getContact() + "</td></tr>");
            }

            out.println("</table>");
        } else {
            out.println("<p>No users found</p>");
        }
    %>
    
    </div>
</body>
</html>
