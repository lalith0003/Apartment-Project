package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AllRequestDAO;
import dao.ApartmentDAO;

@WebServlet("/AcceptServ")
public class AcceptServ extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int floorNo = Integer.parseInt(request.getParameter("floorNo"));
            int doorNo = Integer.parseInt(request.getParameter("doorNo"));

            ApartmentDAO apartmentDAO = new ApartmentDAO();
            AllRequestDAO allRequestDAO = new AllRequestDAO();

            
            boolean updated = apartmentDAO.updateApartmentStatus(floorNo, doorNo);

            if (updated) {
                
                boolean accepted = allRequestDAO.markRequestAsAccepted(id);

                if (accepted) {
                	response.setContentType("text/html;charset=UTF-8");
                	response.getWriter().write("<script>alert('Request accepted successfully.'); window.location.replace('AdminRequest.jsp');</script>");

//                    response.sendRedirect("AdminRequest.jsp");
                    return;
                    
                }
            }

            
            response.sendRedirect("ErrorPage.jsp");
        } catch (NumberFormatException e) {
            
            response.sendRedirect("ErrorPage.jsp");
        }
    }
}
