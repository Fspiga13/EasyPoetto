package com.easypoetto.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easypoetto.model.Package;
import com.easypoetto.model.PackageFactory;
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
				
				if(request.getParameter("newPackage") != null) {

					if (PackageFactory.getInstance().addPackage(email)) {

						request.setAttribute("success", "Nuovo pacchetto creato!");
					}else {
						request.setAttribute("error", "Errore nella creazione del pacchetto");
					}			
				}
				
				List<Package> packages = PackageFactory.getInstance().getPackages(email);
				
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

		
	}

}
