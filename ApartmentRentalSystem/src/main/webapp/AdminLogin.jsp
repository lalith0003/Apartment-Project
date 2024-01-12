<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.annotation.WebServlet" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Admin | Home Rental System</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <style media="screen">
        *,
        *:before,
        *:after {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            background-image: url(image/apartment\ walkthrough.jpg);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            font-family: 'Poppins', sans-serif;
            color: #fff;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        form {
            width: 400px;
            background-color: rgba(137, 208, 238, 0.5); /* Adjust background color */
            border-radius: 10px;
            backdrop-filter: blur(10px);
            border: 2px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
            padding: 40px 35px;
            box-sizing: border-box;
        }

        form * {
            color: #141212; /* Adjust text color */
        }

        h3 {
            font-size: 32px;
            font-weight: 500;
            line-height: 42px;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 20px;
            font-size: 16px;
            font-weight: 500;
        }

        input {
            display: block;
            height: 50px;
            width: 100%;
            background-color: rgba(127, 118, 118, 0.3); /* Adjust input background color */
            border: none;
            outline: none;
            border-radius: 5px;
            padding: 0 10px;
            margin-top: 8px;
            font-size: 14px;
            font-weight: 300;
            color: #333;
            box-sizing: border-box;
        }

        ::placeholder {
            color: #403a3a;
        }

        button {
            margin-top: 30px;
            width: 100%;
            background-color: #0a0a0a; /* Adjust button background color */
            color: #ffffff;
            padding: 15px 0;
            font-size: 18px;
            font-weight: 600;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #95ebf9;
            color: #141212; /* Adjust button hover color */
        }

        .error-message {
            color: #ff6666;
            font-size: 14px;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>

<body>
    <form id="loginForm" action=LoginServlet method="post" onsubmit="return validateForm()">
    <h3>Administrative Login</h3>
    <label for="username">Username</label>
    <input type="text" placeholder="Username" id="username" name="username">
    <label for="password">Password</label>
    <input type="password" placeholder="Password" id="password" name="password">
    <div id="error-message" class="error-message"></div>
    <button type="submit">Log In</button>
    <p style="text-align: center; margin-top: 15px;">Is you are User? <a href="Login.jsp">User In</a>.</p>
</form>
 
   
</body>

</html>
