package com.easypoetto.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easypoetto.model.BeachResort;
import com.easypoetto.model.BeachResortFactory;
import com.easypoetto.model.Client;
import com.easypoetto.model.ClientFactory;
import com.easypoetto.model.User;
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
		
			String error = (String) session.getAttribute("error");
			session.removeAttribute("error");
			
			String success = (String) session.getAttribute("success");
			session.removeAttribute("success");
			
			String email = (String) session.getAttribute("email");
			String password = (String) session.getAttribute("password");
			Integer role = (Integer) session.getAttribute("role");
			
			if (email!= null && password != null && role != null &&
					!email.isEmpty() && !password.isEmpty() && role >= 0 && role <= 2 &&
					UserFactory.getInstance().login(email, password) == role){
				
				request.setAttribute("error", error);
				request.setAttribute("success", success);
				
				//Verificare il ruolo e mostrare la jsp corretta
				switch(role) {
				
					case 0:
						List<User> users = UserFactory.getInstance().getUsers();
						request.setAttribute("usersList", users);
						request.getRequestDispatcher("WEB-INF/JSP/admin_profile.jsp").forward(request, response);
						break;
					case 1:
						System.out.println(email);
						BeachResort beachResort = BeachResortFactory.getInstance().getBeachResort(email);
						request.setAttribute("beachResort", beachResort);
						request.setAttribute("role", role);
						request.getRequestDispatcher("WEB-INF/JSP/beach_resort_profile.jsp").forward(request, response);
						break;
					case 2:
						Client client = ClientFactory.getInstance().getClient(email);
						request.setAttribute("client", client);
						request.getRequestDispatcher("WEB-INF/JSP/client_profile.jsp").forward(request, response);
						break;
					default:
						response.sendRedirect("login.html");				
				}
			
			}else {
				response.sendRedirect("login.html");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// EFFETTUARE LE MODIFICHE AI DATI
		
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
				
				//Verificare il ruolo e effettuare le modifiche corrette
				switch(role) {
				
					case 0:
						adminChanges(request, response, session);
						break;
					case 1:
						beachResortChanges(email, password, request, response, session);
						break;
					case 2:
						clientChanges(email, password, request, response, session);
						break;
					default:
						response.sendRedirect("login.html");				
				}
			
			}else {
				response.sendRedirect("login.html");
			}
		}
		
	}

	private void beachResortChanges(String email, String password, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws ServletException, IOException{
		
		// Recuperiamo i parametri 
				String newName = request.getParameter("name");
				String newDescription = request.getParameter("description");
				String newEmail = request.getParameter("email");
				String newPassword = request.getParameter("password");
				String newImage = request.getParameter("image");
				String newLogo = request.getParameter("logo");
				String newAddress = request.getParameter("address");
				String newTelephone = request.getParameter("telephone");
				Integer newNumUmbrellas = Integer.parseInt(request.getParameter("num_umbrellas"));
				Integer newNumBeachLoungers = Integer.parseInt(request.getParameter("num_beach_loungers"));
				String[] servicesStrings = request.getParameterValues("service");
				List<String> services = null;
				
				if(newLogo.equals(""))
					newLogo="view/Resources/default-logo.png";
				
				if(newImage.equals(""))
					newImage="view/Resources/default-image.png";
				
				if(servicesStrings != null) {
					 services = new ArrayList<String>(Arrays.asList(servicesStrings));	
				}
				
				if (newPassword == null || newPassword.isEmpty()) {
					newPassword = password;
				}
				
				// Aggiorno i dettagli dello stabilimento 
				
				// Se la modifica non va a buon fine
				if (!BeachResortFactory.getInstance().editDetails(newName, newDescription, newEmail, newPassword,
						newImage, newLogo, newAddress, newTelephone, newNumUmbrellas, newNumBeachLoungers, services, email)) {
					// Mando l'errore al jsp
					session.setAttribute("error", "Email non disponibile");
					response.sendRedirect("profile.html");
				} else {
					
					// Modifche a buon fine: reimposto email e password nella sessione
					session.removeAttribute("email");
					session.removeAttribute("password");

					session.setAttribute("email", newEmail);
					session.setAttribute("password", newPassword);
					
					session.setAttribute("success", "Modifica avvenuta con successo!");

					response.sendRedirect("profile.html");
				}	
		
		
	}

	private void adminChanges(HttpServletRequest request, HttpServletResponse response, HttpSession session) 
			throws ServletException, IOException{
		
		String email = request.getParameter("email");
		Integer newStatus = Integer.parseInt(request.getParameter("status"));
		
		// se è riuscito ad arrivare a quesro punto in qualche modo lo reindirizzo qui
		if(email == null || newStatus == null) {
			response.sendRedirect("profile.html");
		}
		
		switch(newStatus) {
			case 0:
				if(!UserFactory.getInstance().updateUserStatus(email, newStatus))
					session.setAttribute("error", "Ripristino dell'account non riuscito");
				else
					session.setAttribute("success", "Ripristino dell'account avvenuto con successo!");
				break;
			case 1:
				if(!UserFactory.getInstance().updateUserStatus(email, newStatus))
					session.setAttribute("error", "Blocco dell'account non riuscito");
				else
					session.setAttribute("success", "Blocco dell'account avvenuto con successo!");
				break;
			default:
				break;
		}	
		response.sendRedirect("profile.html");
	}

	private void clientChanges(String email, String password, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws ServletException, IOException{
		
		// Recuperiamo i parametri dal form
		String newName = request.getParameter("name");
		String newSurname = request.getParameter("surname");
		String newEmail = request.getParameter("email");
		String newPassword = request.getParameter("password");
		String newBirthday = request.getParameter("birthday");
		
		if (newPassword == null || newPassword.isEmpty()) {
			newPassword = password;
		}
		
		// Aggiorno i dettagli client 
		
		// Se la modifica non va a buon fine
		if (!ClientFactory.getInstance().editDetails(newName, newSurname, newEmail, newPassword,
				newBirthday, email)) {
			// Mando l'errore al jsp
			session.setAttribute("error", "Email non disponibile");
			response.sendRedirect("profile.html");
		} else {
			
			// Modifche a buon fine: reimposto email e password nella sessione
			session.removeAttribute("email");
			session.removeAttribute("password");

			session.setAttribute("email", newEmail);
			session.setAttribute("password", newPassword);
			
			session.setAttribute("success", "Modifica avvenuta con successo!");

			response.sendRedirect("profile.html");
		}	
		
	}



}
