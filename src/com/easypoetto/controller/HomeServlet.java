package com.easypoetto.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easypoetto.model.UserFactory;

/**
 * Servlet implementation class Home
 */
@WebServlet("/home.html")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public HomeServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);

		if(session == null || session.getAttribute("email") == null || session.getAttribute("password") == null 
				|| session.getAttribute("role") == null) {
			
			//System.out.println("sessione non valida");
			
			request.setAttribute("logged", false);
			request.getRequestDispatcher("WEB-INF/JSP/home.jsp").forward(request, response);
		}else {
		
			//System.out.println("esiste sessione");
			
			String email = (String) session.getAttribute("email");
			String password = (String) session.getAttribute("password");
			Integer role = (Integer) session.getAttribute("role");
			
			if (email!= null && password != null && role != null &&
					!email.isEmpty() && !password.isEmpty() && role >= 0 && role <= 2 &&
					UserFactory.getInstance().login(email, password) == role){
				
				//System.out.println("utente loggato correttamente");
				
				//risolvere problema logout
				
				String logout = request.getParameter("logout");
				if (logout != null) {
					
					//System.out.println("utente richiede logout");
					
					session.invalidate();
					request.setAttribute("logged", false);
					request.getRequestDispatcher("WEB-INF/JSP/home.jsp").forward(request, response);
				} else {
				
				//System.out.println("utente loggato accede a home");
				
				request.setAttribute("role", role);
				request.setAttribute("logged", true);
				request.getRequestDispatcher("WEB-INF/JSP/home.jsp").forward(request, response);
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
