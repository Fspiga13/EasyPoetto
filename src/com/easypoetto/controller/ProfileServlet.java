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
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/profile.html")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Verificare se loggato
		HttpSession session = request.getSession(false);

		if(session == null || session.getAttribute("email") == null || session.getAttribute("password") == null 
				|| session.getAttribute("role") == null) {	
			
			response.sendRedirect("login.html");
			
		}else {
		
			String email = (String) session.getAttribute("email");
			String password = (String) session.getAttribute("password");
			Integer role = (Integer) session.getAttribute("role");
			
			if (email!= null && password != null && role != null &&
					!email.isEmpty() && !password.isEmpty() && role >= 0 && role <= 2 &&
					UserFactory.getInstance().login(email, password) == role){
				
				//Verificare il ruolo e mostrare la jsp corretta
				switch(role) {
				
					case 0:
						request.getRequestDispatcher("WEB-INF/JSP/admin_profile.jsp").forward(request, response);
						break;
					case 1:
						request.getRequestDispatcher("WEB-INF/JSP/beach_resort_profile.jsp").forward(request, response);
						break;
					case 2:
						request.getRequestDispatcher("WEB-INF/JSP/client_profile.jsp").forward(request, response);
						break;
					default:
						request.getRequestDispatcher("WEB-INF/JSP/login.jsp").forward(request, response);
				}
				response.sendRedirect("login.html");			
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// EFFETTUARE LE MODIFICHE AI DATI
	}

}
