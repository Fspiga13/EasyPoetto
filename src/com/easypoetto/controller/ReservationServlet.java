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
 * Servlet implementation class ReservationServlet
 */
@WebServlet("/reservation.html")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Verificare se loggato
		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("email") == null || session.getAttribute("password") == null
				|| session.getAttribute("role") == null) {

			response.sendRedirect("login.html");

		} else {

			String error = (String) session.getAttribute("error");
			session.removeAttribute("error");

			String success = (String) session.getAttribute("success");
			session.removeAttribute("success");

			String email = (String) session.getAttribute("email");
			String password = (String) session.getAttribute("password");
			Integer role = (Integer) session.getAttribute("role");

			if (email != null && password != null && role != null && !email.isEmpty() && !password.isEmpty()
					&& role >= 0 && role <= 2 && UserFactory.getInstance().login(email, password) == role
					&& role == 2) {
				
				Integer idBeachResort = Integer.parseInt(request.getParameter("beach_resort_id"));
				String reservationDate = request.getParameter("date");
				
				request.setAttribute("error", error);
				request.setAttribute("success", success);

				request.setAttribute("beach_resort_id", idBeachResort);
				request.setAttribute("reservation_date", reservationDate);

				request.getRequestDispatcher("WEB-INF/JSP/reservation.jsp").forward(request, response);

			} else {
				response.sendRedirect("login.html");
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("email") == null || session.getAttribute("password") == null
				|| session.getAttribute("role") == null) {

			response.sendRedirect("login.html");

		} else {

			String error = (String) session.getAttribute("error");
			session.removeAttribute("error");

			String success = (String) session.getAttribute("success");
			session.removeAttribute("success");

			String email = (String) session.getAttribute("email");
			String password = (String) session.getAttribute("password");
			Integer role = (Integer) session.getAttribute("role");

			if (email != null && password != null && role != null && !email.isEmpty() && !password.isEmpty()
					&& role >= 0 && role <= 2 && UserFactory.getInstance().login(email, password) == role
					&& role == 2) {

				Integer idBeachResort = Integer.parseInt(request.getParameter("beach_resort_id"));
				String reservationDate = request.getParameter("date");

				Integer numUmbrellas = Integer.parseInt(request.getParameter("num_umbrellas"));
				Double priceUmbrella = Double.parseDouble(request.getParameter("price_umbrella"));
				Integer numBeachLoungers = Integer.parseInt(request.getParameter("num_beach_loungers"));
				Double priceBeachLounger = Double.parseDouble(request.getParameter("price_beach_lounger"));
				Double totalPrice = getTotalPrice(numUmbrellas, numBeachLoungers, priceUmbrella, priceBeachLounger);

				request.setAttribute("error", error);
				request.setAttribute("success", success);

				request.setAttribute("beach_resort_id", idBeachResort);
				request.setAttribute("reservation_date", reservationDate);
				
				request.setAttribute("num_umbrellas", numUmbrellas);
				request.setAttribute("num_beach_loungers", numBeachLoungers);
				request.setAttribute("total_price", totalPrice);
				
				request.getRequestDispatcher("WEB-INF/JSP/reservation_summary.jsp").forward(request, response);

			} else {

				response.sendRedirect("login.html");

			}
		}

	}

	private Double getTotalPrice(Integer numUmbrellas, Integer numBeachLoungers, Double priceUmbrella,
			Double priceBeachLounger) {

		Double totalPrice = numUmbrellas * priceUmbrella + numBeachLoungers * priceBeachLounger;

		return totalPrice;

	}

}
