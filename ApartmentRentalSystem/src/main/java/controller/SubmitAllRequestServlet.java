package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AllRequestDAO;
import dao.ApartmentDAO;
import dao.UserDAO;
import model.Usermember;

@WebServlet("/SubmitAllRequestServlet")
public class SubmitAllRequestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int floorNo = Integer.parseInt(request.getParameter("floorNo"));
            int doorNo = Integer.parseInt(request.getParameter("doorNo"));
            String username = request.getParameter("username");
            String contact = request.getParameter("contact");
            String comment = request.getParameter("comment");

            ApartmentDAO apartmentDAO = new ApartmentDAO();
            int apartmentId = apartmentDAO.getApartmentIdByFloorAndDoor(floorNo, doorNo);

            UserDAO usermemberDAO = new UserDAO();
            Usermember user = usermemberDAO.getUserByFirstname(username);

            if (user != null) {
                AllRequestDAO allRequestDAO = new AllRequestDAO();

                // Check if the user has already submitted a request that was accepted
                if (allRequestDAO.isUserRequestAccepted(user.getId())) {
                    String alertMessage = "You have already submitted a request that was accepted. You cannot submit another request.";
                    response.setContentType("text/html");
                    response.getWriter().println("<script>alert('" + alertMessage + "'); window.location='UserPage.jsp';</script>");
                } else {
                    // Proceed with submitting the request
                    boolean submitted = allRequestDAO.submitAllRequest(apartmentId, user.getId(), username, contact, comment);

                    if (submitted) {
                        String alertMessage = "Your request has been sent to the Admin.";
                        response.setContentType("text/html");
                        response.getWriter().println("<script>alert('" + alertMessage + "'); window.location='UserPage.jsp';</script>");
                    } else {
                        response.sendRedirect("error.jsp");
                    }
                }
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
        }
    }
}
