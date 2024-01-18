package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ApartmentDAO;
import model.Apartment;

@WebServlet("/AddApartmentServlet")
public class AddApartmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int floor_no = Integer.parseInt(request.getParameter("floor_no"));
            int door_no = Integer.parseInt(request.getParameter("door_no"));

         
            ApartmentDAO apartmentDAO = new ApartmentDAO();
            if (apartmentDAO.isApartmentExist(floor_no, door_no)) {
                
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().write("<script>alert('Apartment with the specified floor and door number already exists.'); window.location.replace('AdminPage.jsp');</script>");
                return;
            }

            String advance_cost = request.getParameter("advance_cost");
            String rental_cost = request.getParameter("rental_cost");
            String bedroom = request.getParameter("bedroom");
            String floor_space = request.getParameter("floor_space");
            String status = request.getParameter("status");
            String notice_period = request.getParameter("notice_period");

            apartmentDAO.addApartment(floor_no, door_no, advance_cost, rental_cost, bedroom, floor_space, status, notice_period);

       
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write("<script>alert('New Apartment added successfully.'); window.location.replace('AdminPage.jsp');</script>");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ErrorPage.jsp");
        }
    }
}
