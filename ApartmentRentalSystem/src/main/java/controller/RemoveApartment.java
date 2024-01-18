package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ApartmentDAO;

@WebServlet("/RemoveApartment")
public class RemoveApartment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String apartmentId = request.getParameter("id");

        if (apartmentId != null && !apartmentId.isEmpty()) {
            try {
                int id = Integer.parseInt(apartmentId);

              
                ApartmentDAO apartmentDAO = new ApartmentDAO();

               
                boolean deleted = apartmentDAO.deleteApartmentById(id);

          
                if (deleted) {
                  
                	response.sendRedirect("AdminPage.jsp?deleted=true");
                } else {
                    
                    response.sendRedirect("delete-error.jsp");
                }
            } catch (NumberFormatException e) {
               
                response.sendRedirect("delete-error.jsp");
            }
        } else {
            
            response.sendRedirect("delete-error.jsp");
        }
    }
}
