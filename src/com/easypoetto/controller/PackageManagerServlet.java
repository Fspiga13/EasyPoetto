package com.easypoetto.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easypoetto.model.ClientFactory;
import com.easypoetto.model.Package;
import com.easypoetto.model.ReservationFactory;
import com.easypoetto.model.UserFactory;

/**
 * Servlet implementation class PackageListServlet
 */
@WebServlet("/packagemanager.html")
public class PackageManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PackageManagerServlet() {
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
					UserFactory.getInstance().login(email, password) == role && role==1){
				
				request.setAttribute("error", error);
				request.setAttribute("success", success);
				
				// Gestisco creazione nuovo pacchetto
				if(request.getParameter("newPackage") != null) {

					if (ReservationFactory.getInstance().addPackage(email)) {

						request.setAttribute("success", "Nuovo pacchetto creato!");
					}else {
						request.setAttribute("error", "Errore nella creazione del pacchetto");
					}			
				}else {
					if( (request.getParameter("idPackage") != null)) {
						
						if(ReservationFactory.getInstance().deletePackage(Integer.parseInt(request.getParameter("idPackage")))) {
	
							request.setAttribute("success", "Pacchetto eliminato!");
						}else {
							request.setAttribute("error", "Errore nell'eliminazione del pacchetto");
						}
					}
				}
				
				List<Package> packages = ReservationFactory.getInstance().getPackages(email);
				
				request.setAttribute("packageList", packages);
				request.setAttribute("role", role);
				request.getRequestDispatcher("WEB-INF/JSP/package_manager.jsp").forward(request, response);			
			}else {
				response.sendRedirect("login.html");
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
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
					UserFactory.getInstance().login(email, password) == role && role==1){
				
				// Recuperiamo i parametri dal form
				String newName = request.getParameter("name");
				Integer newIncludedUmbrellas = Integer.parseInt(request.getParameter("num_umbrellas"));
				Integer newIncludedBeachLoungers = Integer.parseInt(request.getParameter("num_beach_loungers"));
				Double newPrice = Double.parseDouble(request.getParameter("price"));
				Integer idPackage = Integer.parseInt(request.getParameter("idPackage"));

				
				// Aggiorno i dettagli pachetto
				
				// Se la modifica non va a buon fine
				if (!ReservationFactory.getInstance().editPackage(idPackage, newName, newIncludedUmbrellas, newIncludedBeachLoungers, newPrice)) {
					// Mando l'errore al jsp
					session.setAttribute("error", "Modifica pacchetto non riuscita");
				} else {
					session.setAttribute("success", "Modifica pacchetto avvenuta con successo!");
				}
			
				response.sendRedirect("packagemanager.html");

			}else {
				response.sendRedirect("login.html");
			}
		}
	}

}
