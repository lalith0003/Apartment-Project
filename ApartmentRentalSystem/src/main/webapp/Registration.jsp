<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Registration | Apartment Rental System</title>

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
            height: 115vh;

        }

        form {
         
        }
        .div{
          width: 400px;
            background-color: rgba(137, 208, 238, 0.5); 
            border-radius: 10px;
            backdrop-filter: blur(10px);
            border: 2px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
            padding: 40px 35px;
            box-sizing: border-box;
        }

        form * {
            color: #141212;
        }

        h3 {
            font-size: 30px;
            font-weight: 500;
            line-height: 42px;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 20px;
            font-size: 14px;
            font-weight: 500;
        }

        select {
            display: block;
            height: 50px;
            width: 100%;
            background-color: rgba(127, 118, 118, 0.3);
            border: none;
            outline: none;
            border-radius: 5px;
            padding: 0 10px;
            margin-top: 8px;
            font-size: 12px;
            font-weight: 300;
            color: #333;
            box-sizing: border-box;
        }

        input {
            display: block;
            height: 50px;
            width: 100%;
            background-color: rgba(127, 118, 118, 0.3); 
            border: none;
            outline: none;
            border-radius: 5px;
            padding: 0 10px;
            margin-top: 8px;
            font-size: 12px;
            font-weight: 300;
            color: #333;
            box-sizing: border-box;
        }

        ::placeholder {
            color: #403a3a;
        }

        .button {
            margin-top: 30px;
            width: 100%;
            background-color: #0a0a0a; 
            color: #ffffff;
            padding: 15px 0;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .button:hover {
            background-color: #95ebf9;
            color: #141212;
        }

        .error-message {
            color: #ff6666;
            font-size: 12px;
            margin-top: 10px;
            text-align: center;
        }
        div p{
         color: #141212;
        }
    </style>
 
<script>

    function validateForm() {
        var firstName = document.getElementById("firstname").value;
        var lastName = document.getElementById("lastname").value;
        var password = document.getElementById("password").value;
        var email = document.getElementById("email").value;
        var contact = document.getElementById("Contact").value;
        

        if (!validateName(firstName, "First name")) {
            return false;
        }

        if (!validateName(lastName, "Last name")) {
            return false;
        }



        if (!validateEmail(email)) {
            return false;
        }

        if (!validateContact(contact)) {
            return false;
        }
        if (!validatePassword(password)) {
            return false;
        }

        return true;
    }

    function validateName(name, fieldName) {
        if (!name.match(/^[a-zA-Z]+$/)) {
            displayErrorMessage(fieldName + " should contain only letters.");
            return false;
        }
        return true;
    }

    function validatePassword(password) {
       
        if (password.length < 8) {
            displayErrorMessage("Password must be at least 8 characters long.");
            return false;
        }

        if (!/[A-Z]/.test(password)) {
            displayErrorMessage("Password must contain at least one uppercase letter.");
            return false;
        }

    
        if (!/[a-z]/.test(password)) {
            displayErrorMessage("Password must contain at least one lowercase letter.");
            return false;
        }

      
        if (!/\d/.test(password)) {
            displayErrorMessage("Password must contain at least one digit.");
            return false;
        }

        if (!/[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]/.test(password)) {
            displayErrorMessage("Password must contain at least one special character.");
            return false;
        }

        return true;
    }

    function validateEmail(email) {
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            displayErrorMessage("Please enter a valid email address.");
            return false;
        }
        return true;
    }

    function validateContact(contact) {
        var contactRegex = /^\d{10}$/; 
        if (!contactRegex.test(contact)) {
            displayErrorMessage("Please enter a valid 10-digit contact number.");
            return false;
        }
        return true;
    }

    function displayErrorMessage(message) {
        var errorMessageContainer = document.getElementById("error-message");
        errorMessageContainer.innerHTML = message;
    }
</script>


    
</head>
<body>
<div class="div">
<form action="Register" method="post" onclick="return validateForm()" >
    <h3>Registration Login</h3>
    <label for="firstname">First name</label>
    <input type="text" placeholder="First name" id="firstname" name="firstname" required>
    <label for="lastname">Last name</label>
    <input type="text" placeholder="Last name" id="lastname" name="lastname" required>
    <label for="email">Email</label>
    <input type="text" placeholder="Email" id="email" name="email" required>
    <label for="contact">Contact</label>
    <label for="Contact"></label><input type="text" placeholder="Contact" id="Contact" name="contact" required>
     <label for="password">Password</label>
    <input type="password" placeholder="Password" id="password" name="password" required>
    <div id="error-message" class="error-message"></div>
    <input class="button" type="submit" value=Register>
    
</form>
	<p style="text-align: center; margin-top: 15px;">Already have an account? <a href="Login.jsp">Log In</a>.</p>
</div>

</body>
</html>