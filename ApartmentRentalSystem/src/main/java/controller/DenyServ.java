package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AllRequestDAO;

/**
 * Servlet implementation class DenyServ
 */
@WebServlet("/DenyServ")
public class DenyServ extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            AllRequestDAO allRequestDAO = new AllRequestDAO();

            boolean denied = allRequestDAO.markRequestAsDenied(id);

            if (denied) {
            	response.setContentType("text/html;charset=UTF-8");
            	response.getWriter().write("<script>alert('Request Denied successfully.'); window.location.replace('AdminRequest.jsp');</script>");
               // response.sendRedirect("AdminRequest.jsp");
               return;
            }

            response.sendRedirect("ErrorPage.jsp");
        } catch (NumberFormatException e) {
            response.sendRedirect("ErrorPage.jsp");
        }
    }
}

