package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDAO;
import model.LoginBean;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usernameOrEmail = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        session.setAttribute("username", usernameOrEmail);

        session.removeAttribute("loginErrorMessage");

        boolean isEmail = usernameOrEmail.contains("@");

        LoginBean loginBean = new LoginBean();
        loginBean.setFirstname(usernameOrEmail);
        loginBean.setPassword(password);

        LoginDAO loginDAO = new LoginDAO();
        String role = loginDAO.validate(loginBean);

        if (role != null) {
            if (role.equals("Admin")) {
                response.sendRedirect("AdminPage.jsp");
            } else if (role.equals("User")) {
                response.sendRedirect("UserPage.jsp");
            }
        } else {
            session.setAttribute("loginErrorMessage", "Invalid username or password.");

            // Set an attribute to indicate login failure
            request.setAttribute("loginFailed", true);

            // Forward the request to the Login.jsp page
            RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
            dispatcher.forward(request, response);
        }
    }
}
