package com.easypoetto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		//Verificare il ruolo e mostrare la jsp corretta
		int role = -1;
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
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// EFFETTUARE LE MODIFICHE AI DATI
	}

}
