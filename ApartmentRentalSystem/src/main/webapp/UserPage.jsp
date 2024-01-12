<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ page import="java.util.List" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="model.Usermember" %>
<%@ page import="Util.DBUtil" %>
<%@ page import="model.Apartment" %>
<%@ page import="dao.ApartmentDAO" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/remixicon@3.4.0/fonts/remixicon.css"
      rel="stylesheet"
    />
    <Style>
      @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap");

:root {
  --primary-color: #2c3855;
  --primary-color-dark: #435681;
  --text-dark: #333333;
  --text-light: #767268;
  --extra-light: #f3f4f6;
  --white: #ffffff;
  --max-width: 1200px;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  scroll-behavior: smooth;
}

.section__container {
  max-width: var(--max-width);
  margin: auto;
  padding: 5rem 1rem;

}

.section__header {
  font-size: 2rem;
  font-weight: 600;
  color: var(--text-dark);
  text-align: center;
}

a {
  text-decoration: none;
}

img {
  width: 100%;
  display: flex;
}

body {
  font-family: "Poppins", sans-serif;
  background-color: white;
}

nav {
  max-width: var(--max-width);
  margin: auto;
  padding: 2rem 1rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.nav__logo img {
  height: 80px;
  border-radius: 100%;
}

.nav__links {
  list-style: none;
  display: flex;
  align-items: center;
  gap: 2rem;
}

.link a {
  font-weight: 500;
  color: black;
  transition: 0.3s;
}

.link1 a {
  font-weight: 500;
  color: rgb(5, 5, 5);
  transition: 0.3s;
}
.link a:hover {
  color: rgb(248, 63, 63);
}
.link1 a:hover {
  color: rgb(248, 63, 63);
}
.header__container {
  padding: 1rem 1rem 5rem 1rem;
}

.header__image__container {
  position: relative;
  min-height: 500px;
  background-image: linear-gradient(
      to right,
      rgba(44, 56, 85, 0.9),
      rgba(100, 125, 187, 0.1)
    ),
    url("image/apartment\ walkthrough.jpg");
  background-position: center center;
  background-size: cover;
  background-repeat: no-repeat;
  border-radius: 2rem;
}

.header__content {
  max-width: 600px;
  padding: 5rem 2rem;
}

.header__content h1 {
  margin-bottom: 1rem;
  font-size: 3.5rem;
  line-height: 4rem;
  font-weight: 600;
  color: var(--white);
}

.header__content p {
  color: var(--extra-light);
}
.booking__container label {
        position: absolute;
        top: 50%;
        left: 0;
        transform: translateY(-50%);
        font-size: 1.2rem;
        font-weight: 500;
        color: var(--text-dark);
        pointer-events: none;
        transition: 0.3s;
      }

      .booking__container select {
        width: 100%;
        padding: 10px 0;
        font-size: 1rem;
        outline: none;
        border: none;
        background-color: transparent;
        border-bottom: 1px solid var(--primary-color);
        color: var(--text-dark);
      }

      .booking__container select:focus ~ label {
        font-size: 0.8rem;
        top: 0;
      }

 .booking__container {
  position: absolute;
  bottom: -5rem;
  left: 50%;
  transform: translateX(-50%);
  width: calc(100% - 6rem);
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 3rem 2rem;
  border-radius: 2rem;
  background-color: white;
  -webkit-backdrop-filter: blur(10px);
  backdrop-filter: blur(10px);
  box-shadow: 5px 5px 30px rgba(0, 0, 0, 0.1);
}

.booking__container form {
  width: 100%;
  flex: 1;
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 1rem;
}

/*.booking_container .input_group {
  width: 100%;
  position: relative;
}

.booking__container label {
  position: absolute;
  top: 50%;
  left: 0;
  transform: translateY(-50%);
  font-size: 1.2rem;
  font-weight: 500;
  color: var(--text-dark);
  pointer-events: none;
  transition: 0.3s;
}

.booking__container input {
  width: 100%;
  padding: 10px 0;
  font-size: 1rem;
  outline: none;
  border: none;
  background-color: transparent;
  border-bottom: 1px solid var(--primary-color);
  color: var(--text-dark);
}

.booking__container input:focus ~ label {
  font-size: 0.8rem;
  top: 0;
}*/

.booking_container .form_group p {
  margin-top: 0.5rem;
  font-size: 0.8rem;
  color: var(--text-light);
}

.booking__container .btn {
  padding: 1rem;
  outline: none;
  border: none;
  font-size: 1.5rem;
  color: var(--white);
  background-color: var(--primary-color);
  border-radius: 100%;
  cursor: pointer;
  transition: 0.3s;
}

.booking__container .btn:hover {
  background-color: var(--primary-color-dark);
} 
.popular__grid {
  margin-top: 4rem;
  display: grid;
  grid-template-columns: repeat(2, 9fr);
  gap: 3rem;
  
}

.popular__card {
  overflow:hidden;
  border-radius: 2rem;
  box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.1);
  background-color: white;
}
.popular__card img{
  background-size: cover;
  width: fit-content;
}
.popular__content {
  padding: 1rem;
  
}

.popular__card__header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 1rem;
  margin-bottom: 0.5rem;
}

.popular__card__header h4 {
  font-size: 1.2rem;
  font-weight: 400;
  color: var(--text-dark);
}

.popular__content p {
  color: rgb(0, 0, 0);
}

.client {
  background-color: var(--extra-light);
}

.client__grid {
  margin-top: 4rem;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 2rem;
}

.client__card {
  padding: 2rem;
  background-color: var(--white);
  border-radius: 1rem;
  box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.1);
}

.client__card img {
  max-width: 80px;
  margin: auto;
  margin-bottom: 1rem;
  border-radius: 100%;
}

.client__card p {
  text-align: center;
  color: var(--text-dark);
}

.reward__container {
  padding: 2rem;
  text-align: center;
  
  border-radius: 2rem;
  box-shadow: 5px 5px 30px rgba(0, 0, 0, 0.1);
  background-image: url(image/11.jpg);
  background-position: center;
  background-size: cover;
}

.reward__container p {
  margin-bottom: 1rem;
  font-weight: 600;
  color: var(--text-light);
  color: #020202;

}

.reward__container h4 {
  max-width: 700px;
  margin: auto;
  margin-bottom: 1rem;
  font-size: 1.5rem;
  font-weight: 100;
  color: var(--text-dark);
  color: #040404;
  background-color: white;
  padding: 5px;
  border-radius: 50px;
 
}

.reward__btn {
  padding: 1rem 3rem;
  outline: none;
  border: none;
  font-size: 1rem;
  color: var(--white);
  background-color:#061945;
  border-radius: 1rem;
  cursor: pointer;
  transition: 0.3s;
}

.reward__btn:hover {
  background-color: var(--primary-color-dark);
}

.footer {
  background-color: var(--extra-light);
}

.footer__container {
  display: grid;
  grid-template-columns: 2fr repeat(3, 1fr);
  gap: 5rem;
}

.footer__col h3 {
  margin-bottom: 1rem;
  font-size: 1.5rem;
  font-weight: 600;
  color: var(--text-dark);
}

.footer__col h4 {
  margin-bottom: 1rem;
  font-size: 1.2rem;
  font-weight: 600;
  color: var(--text-dark);
}

.footer__col p {
  margin-bottom: 1rem;
  color: var(--text-light);
  cursor: pointer;
  transition: 0.3s;
}

.footer__col p:hover {
  color: var(--text-dark);
}

.footer__bar {
  position: relative;
  max-width: var(--max-width);
  margin: auto;
  padding: 1rem;
  font-size: 0.9rem;
  font-weight: 500;
  color: var(--text-light);
  text-align: right;
  overflow: hidden;
}

.footer__bar::before {
  position: absolute;
  content: "";
  top: 50%;
  right: 45rem;
  transform: translateY(-50%);
  width: 20rem;
  height: 2px;
  background-color: var(--text-light);
}

@media (width < 900px) {
  .booking__container form {
    grid-template-columns: repeat(2, 1fr);
  }

  .popular__grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 1rem;
  }

  .client__grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 1rem;
  }

  .footer__container {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (width < 600px) {
  .nav__links {
    display: none;
  }

  .header__container {
    padding-bottom: 25rem;
  }

  .booking__container {
    flex-direction: column;
    bottom: -25rem;
  }

  .booking__container form {
    grid-template-columns: repeat(1, 1fr);
  }

  .popular__grid {
    grid-template-columns: repeat(1, 1fr);
  }

  .client__grid {
    grid-template-columns: repeat(1, 1fr);
  }

  .footer__container {
    gap: 2rem;
  }
  div {
  display: flex;
  justify-content: center;
}
.usertable {
    text-align: center;
}

.table-container {
    margin: auto;
    overflow-x: auto;
    max-width: 40%; /* Adjust as needed */
}

table {
    width: 100%;
    border-collapse: collapse;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    background-color: #fff;
}

th, td {
    border: 1px solid #ddd;
    padding: 16px;
    text-align: left;
}

th {
    background-color: #4CAF50;
    color: white;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #e5e5e5;
}


</style>
  </head>
  
  <body>
  
    <nav>
      <div class="nav__logo"><img src="image/logo.jpg"></div>
      <ul class="nav__links">
        <li class="link"><a href="#home">Home</a></li>
        <li class="link"><a href="BookApartmentDetails.jsp">Book Apartment</a></li>
        <li class="link"><a href="#ad">Our Apartments</a></li>
        <li class="link"><a href="#contact">Contact Us</a></li>
      </ul>
      
      <ul class="nav__links">
        <li class="link"><a href="UserDT.jsp">Hello User!</a></li>
        <li class="link"><a href="LogoutUserServlet">Logout</a></li>
      </ul>
    </nav>
    
    
    <header id="home" class="section__container header__container">
      <div class="header__image__container">
        <div class="header__content">
          <h1>Team C Apartments</h1>
          <p>Book Apartment, Here we welcomes you all... <br>Stay packages at lowest price.</p>
        </div>
        <div class="booking__container">
          <form>
            <div class="form__group">
              <select>
                <option value="" disabled selected>Rental Cost</option>
                <option value="2000">Rs.10,000</option>
                <option value="3000">Rs.20,000</option>
                
              </select>
            </div>
            <div class="form__group">
              <div class="input__group">
                <select>
                  <option value="" disabled selected>Floor Space</option>
                  <option value="1000">1000 Sq.Ft</option>
                  <option value="1500">1500 Sq.Ft</option>
                  
                </select>
              </div>
            </div>
            <div class="form__group">
              <div class="input__group">
                <select>
                  <option value="" disabled selected>Location</option>
                  <option value="Chennai">Chennai</option>
                </select>
            
              </div>
              <p></p>
            </div>
            <div class="form__group">
              <div class="input__group">
                <select>
                  <option value="" disabled selected>Bedroom</option>
                  <option value="2BHK">2 BHK</option>
                  <option value="3BHK">3 BHK</option>
                </select>
                
              </div>
            </div>
            <!-- <div class="form__group">
              <div class="input__group">
                <select>
                  <option value="" disabled selected>Advance</option>
                  <option value="10,000">10,000</option>
                  <option value="20,000">20,000</option>
                </select>
                
              </div>
            </div> -->
          </form>
          <button class="btn"><i class="ri-search-line"></i></button>
        </div>
      </div>
    </header>

 
<!--     <section id="book"  class="section__container popular__container">-->


<section id="ad">
 <div class="section__container usertable">
        <h2 class="section__header">Apartment List</h2>
        <div class="table-container">
 

    <%
        ApartmentDAO apartmentDAO = new ApartmentDAO();
        List<Apartment> apartments = apartmentDAO.getAllApartments();
    %>

    <table>
        <tr>
            <th>Block&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
            <th>Floor No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
            <th>Door No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
            <th>Advance Cost&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
            <th>Rental Cost&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
            <th>Bedroom&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
            <th>Floor Space&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
            <th>Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
            <th>Notice Period&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
            <!-- Add more headers as needed -->
        </tr>

        <% for (Apartment apartment : apartments) { %>
            <tr>
                <td><%= "A" %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><%= apartment.getFloorNo() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><%= apartment.getDoorNo() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><%= apartment.getAdvanceCost() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><%= apartment.getRentalCost() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><%= apartment.getBedroom() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><%= apartment.getFloorSpace() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><%= apartment.getStatus() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><%= apartment.getNoticePeriod() %></td>
                <!-- Add more data cells as needed -->
            </tr>
        <% } %>
    </table>
    </div>
    </div>
</section>

   

    <section id="client" class="client">
      <div class="section__container client__container">
        <h2 class="section__header">What our client say</h2>
        <div class="client__grid">
          <div class="client__card">
            <img src="image/client1.jpeg" alt="client" />
            <p>
              Team C apartment allows guests to leave reviews after their stay. Both hosts and guests can review each other, providing a two-way feedback system. Reviews include ratings on cleanliness, communication, check-in experience, accuracy, location, and value.
            </p>
          </div>
          <div class="client__card">
            <img src="image/client2.jpeg" alt="client" />
            <p>
                A robust review system where guests can rate and leave comments about their stay. Reviews cover aspects like staff, facilities, cleanliness, comfort, location, and value for money.
            </p>
          </div>
          <div class="client__card">
            <img src="image/client3.jpeg" alt="client" />
            <p>
              Rentals provides a platform for users to leave reviews for rental properties. Reviews can include details about the property itself, the neighborhood, and the landlord.
            </p>
          </div>
        </div>
      </div>
    </section>

    <section id="moto" class="section__container">
      <div class="reward__container">
        <p>Welcome Home !</p>
        <h4>We're thrilled you've landed on our platform, your gateway to finding your perfect apartment. We understand the search can be daunting, so we've made it simple and stress-free. Browse beautiful rentals, explore vibrant neighborhoods, and discover your dream home – all in one place.</h4>
        <button class="reward__btn">Register now</button>
      </div>
    </section>

    <footer id="contact" class="footer">
      <div class="section__container footer__container">
        <div class="footer__col">
          <h3><img style="height: 120px; width: 120px; border-radius: 150%;"src="image/logo.jpg"></h3>
          <p>
            With three skilled developers and two testers, our team employs full-stack Java to craft a cutting-edge online rental system. We're committed to delivering a seamless experience, ensuring satisfaction for users and landlords alike.
          </p>
        </div>
        <div class="footer__col">
          <h4>Company</h4>
          <p>About Us</p>
          <p>Our Team</p>
          <p>Blog</p>
          <p>Book</p>
          <p>Contact Us</p>
        </div>
        <div class="footer__col">
          <h4>Legal</h4>
          <p>FAQs</p>
          <p>Terms & Conditions</p>
          <p>Privacy Policy</p>
        </div>
        <div class="footer__col">
          <h4>Resources</h4>
          <p>Social Media</p>
          <p>Help Center</p>
          <p>Partnerships</p>
        </div>
      </div>
      <div class="footer__bar">
        Copyright © Team C Java Developers and Automation Testers Web Design. All rights reserved.
      </div>
    </footer>
  </body>
</html>