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
 * Servlet implementation class SingUpServlet
 */
@WebServlet("/signup.html")
public class SingUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SingUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		if(session == null || session.getAttribute("email") == null 
				|| session.getAttribute("password") == null || session.getAttribute("role") == null) {

			request.getRequestDispatcher("WEB-INF/JSP/sign_up.jsp").forward(request, response);
			
		}else {

			String email = (String) session.getAttribute("email");
			String password = (String) session.getAttribute("password");
			Integer role = (Integer) session.getAttribute("role");
			
			String error = (String) session.getAttribute("error");
			session.removeAttribute("error");
			
			String success = (String) session.getAttribute("success");
			session.removeAttribute("success");
			
			//Se loggato
			if (email!= null && password != null && role != null &&
					!email.isEmpty() && !password.isEmpty() && role >= 0 && role <= 2 &&
					UserFactory.getInstance().login(email, password) == role){
				
				response.sendRedirect("profile.html");
			}else {
				
				request.setAttribute("error", error);
				request.getRequestDispatcher("WEB-INF/JSP/sign_up.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);

		String email = (String) session.getAttribute("email");
		String password = (String) session.getAttribute("password");
		Integer role = (Integer) session.getAttribute("role");
		
		//Se loggato
		if (email!= null && password != null && role != null &&
				!email.isEmpty() && !password.isEmpty() && role >= 0 && role <= 2 &&
				UserFactory.getInstance().login(email, password) == role){
			
			response.sendRedirect("profile.html");
			
		}else {
			//Dobbiamo registrate nuovo user
			
			// Recuperiamo i parametri dal form
			String newEmail = request.getParameter("email");
			String newPassword = request.getParameter("password");
			String newPasswordConfirm = request.getParameter("confirm_password");
			String newRoleString = request.getParameter("role");
			
			Integer newRole = null;
			switch(newRoleString) {
				case "beach_resort":
					newRole = 1;
					break;
				case "client":
					newRole = 2;
					break;
				default:
					break;
			}
			
			//Se le due password sono diverse
			if(!newPassword.equals(newPasswordConfirm)) {
				session.setAttribute("error", "Password non corrispondenti");
				response.sendRedirect("signup.html");
			}else {
			
				// Se la creazione non va a buon fine
				if(UserFactory.getInstance().addUser(newEmail, newPassword, newRole) == false) {
					
					// Mando l'errore al jsp
					
					session.setAttribute("error", "Registrazione fallita: email già esistente");
					response.sendRedirect("signup.html");
				}else {
				
				// La registrazione e' andata a buon fine e lo mando al login			
				session.setAttribute("success", "Registrazione avvenuta con successo!");
				response.sendRedirect("login.html");
				}
			}
		}
	}

}
