<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.ApartmentDAO" %>
<%@ page import="model.Apartment" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    int floor_no = Integer.parseInt(request.getParameter("floor_no"));
    int door_no = Integer.parseInt(request.getParameter("door_no"));
    String advance_cost = request.getParameter("advance_cost");
    String rental_cost = request.getParameter("rental_cost");
    String bedroom = request.getParameter("bedroom");
    String floor_space = request.getParameter("floor_space");
    String status = request.getParameter("status");
    String notice_period = request.getParameter("notice_period");

    Apartment updatedApartment = new Apartment(id, floor_no, door_no, advance_cost, rental_cost, bedroom, floor_space, status, notice_period);
    ApartmentDAO apartmentDAO = new ApartmentDAO();
    
    try {
        apartmentDAO.updateApartment(updatedApartment);
%>
        <script>
            alert("Apartment updated successfully.");
            window.location.replace("AdminPage.jsp");
        </script>
<%
    } catch (Exception e) {
%>
        <script>
            alert("Error updating apartment: <%= e.getMessage() %>");
            window.location.replace("AdminPage.jsp"); 
        </script>
<%
    }
%>
