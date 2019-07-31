package com.easypoetto.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easypoetto.model.Reservation;
import com.easypoetto.model.ReservationFactory;
import com.easypoetto.model.UserFactory;

/**
 * Servlet implementation class PackageListServlet
 */
@WebServlet("/myreservations.html")
public class MyReservationsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyReservationsServlet() {
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
				
				List<Reservation> reservations = null;
				
				switch(role) {
				
				case 1:
					reservations = ReservationFactory.getInstance().getResevationsByBeachResort(email);
					break;
					
				case 2:
					reservations = ReservationFactory.getInstance().getResevationsByClient(email);
					break;
				default:
					break;
				}
				
				request.setAttribute("reservationList", reservations);
				request.setAttribute("role", role);
				request.getRequestDispatcher("WEB-INF/JSP/my_reservations.jsp").forward(request, response);			
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
					UserFactory.getInstance().login(email, password) == role && role==2){
				
				// Recuperiamo i parametri dal form
				String reservationDate = (String) request.getParameter("reservation_date");
				Integer umbrellasQty = Integer.parseInt(request.getParameter("num_umbrellas"));
				Integer beachLoungersQty = Integer.parseInt(request.getParameter("num_beach_loungers"));
				Double totalPrice = Double.parseDouble(request.getParameter("total_price"));
				Integer beachResortId = Integer.parseInt(request.getParameter("beach_resort_id"));

				
				// Aggiungo la prenotazione
				
				if (ReservationFactory.getInstance().addReservation(email, beachResortId, reservationDate, umbrellasQty, beachLoungersQty, totalPrice)) {

					request.setAttribute("success", "Prenotazione avvenuta con successo!");
				}else {
					request.setAttribute("error", "Errore nella prenotazione");
				}
			
				response.sendRedirect("myreservations.html");

			}else {
				response.sendRedirect("login.html");
			}
		}
	}

}
