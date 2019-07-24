package com.easypoetto.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		//HttpSession session = request.getSession(false);

		//String email = (String) session.getAttribute("email");
		//String password = (String) session.getAttribute("password");

		/*
		if (email != null && password != null && !email.isEmpty() && !password.isEmpty()
				&& UserFactory.getInstance().login(email, password) == true) {
			
			request.getRequestDispatcher("WEB-INF/JSP/home.jsp").forward(request, response);

		} else {*/
		request.getRequestDispatcher("WEB-INF/JSP/home.jsp").forward(request, response);
		//}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
