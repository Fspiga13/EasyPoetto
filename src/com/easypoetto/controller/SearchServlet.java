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

import com.easypoetto.model.BeachResortFactory;

/**
 * Servlet implementation class Search
 */
@WebServlet("/search.html")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String[] servicesStrings = request.getParameterValues("service");
		
		if(servicesStrings != null) {
		
			List<String> services = new ArrayList<String>(Arrays.asList(servicesStrings));	
			request.setAttribute("beachResorts", BeachResortFactory.getInstance().getFilteredBeachResorts(services));
			
		}else {			
			request.setAttribute("beachResorts", BeachResortFactory.getInstance().getBeachResorts());
		}
		
		request.getRequestDispatcher("WEB-INF/JSP/search.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setAttribute("beachResort", 
				BeachResortFactory.getInstance().getBeachResortById(Integer.parseInt(request.getParameter("beachResortId"))));
		request.getRequestDispatcher("WEB-INF/JSP/beach_resort.jsp").forward(request, response);
	}

}
