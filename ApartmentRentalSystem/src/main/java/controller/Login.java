package controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LoginDAO;
import model.LoginBean;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username= request.getParameter("username");
		String password= request.getParameter("password");
		
		LoginBean loginBean = new LoginBean();
		loginBean.setFirstname(username);
		loginBean.setPassword(password);
		
		LoginDAO loginDao = new LoginDAO();
		
		 if(loginDao.validate(loginBean)) 
		{
//			request.getSession().setAttribute("user", loginBean);
//
//			List<String> data=new ArrayList<String>();
//			data.add("1");
//			request.setAttribute("name",data);
			request.getRequestDispatcher("UserPage.jsp").forward(request, response);
			//response.sendRedirect("loginSuccess.jsp");
			//response.sendRedirect("welcome.jsp");
		}
		else {
			
		//response.sendRedirect("welcome.jsp");
			
		}
	}

}