package com.easypoetto.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ReservationFactory {
	
	private static ReservationFactory singleton;

	private ReservationFactory() {

	}

	public static ReservationFactory getInstance() {
		if (singleton == null) {
			singleton = new ReservationFactory();
		}
		return singleton;
	}
	

	public List<Reservation> getResevationsByClient(String email) {
		
		List<Reservation> reservations = new ArrayList<Reservation>();
		
		String sql = "select r.id, br.name, r.reservation_date, r.umbrellas_qty, r.beach_loungers_qty, r.total_price from reservations r, users u, "
				+ "clients c, beach_resorts br where u.id = c.user_id and r.client_id = c.id and r.beach_resort_id = br.id and u.email = ? order by r.reservation_date DESC" ;
		
		try (Connection conn = DbManager.getInstance().getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql))  {
			
			stmt.setString(1, email);

			ResultSet result = stmt.executeQuery();

			while (result.next()) {

				reservations.add(new Reservation(result.getInt("id"), result.getString("name"), reservationDateManager(result.getString("reservation_date")), result.getInt("umbrellas_qty"), 
						result.getInt("beach_loungers_qty"), result.getDouble("total_price")));
			}
			
			return reservations;
					
		} catch (SQLException e) {
			Logger.getLogger(ClientFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("errore in getResevationsByClient dentro ReservationFactory");
		}	
		
		
		return null;
	}
	
	public List<Reservation> getResevationsByBeachResort(String email) {
		
		List<Reservation> reservations = new ArrayList<Reservation>();
		
		String sql = "select r.id, c.name, c.surname, r.reservation_date, r.umbrellas_qty, r.beach_loungers_qty, r.total_price " + 
				"from reservations r, users u, clients c, beach_resorts br " + 
				"where u.id = br.user_id and r.client_id = c.id and r.beach_resort_id = br.id and " + 
				"u.email = ? order by r.reservation_date DESC" ;
		
		try (Connection conn = DbManager.getInstance().getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql))  {
			
			stmt.setString(1, email);

			ResultSet result = stmt.executeQuery();

			while (result.next()) {
				reservations.add(new Reservation(result.getInt("id"), result.getString("name"), result.getString("surname"), 
						reservationDateManager(result.getString("reservation_date")), result.getInt("umbrellas_qty"), 
						result.getInt("beach_loungers_qty"), result.getDouble("total_price")));
			}
			
			return reservations;
					
		} catch (SQLException e) {
			Logger.getLogger(ClientFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("errore in getResevationsByBeachResort dentro ReservationFactory");
		}	
		
		
		return null;
	}
	

	public boolean addReservation(String email, int beachResortId, String date, int umbrellasQty, int beachLoungersQty, double totalPrice) {
		
		
		//va effettuato ulteriore controllo in transazione per prenotazioni multiple
		
		Client client = ClientFactory.getInstance().getClient(email);
				
		if (client != null) { // deve per forza trovare un client
			
			String sqlNewPackage = " insert into reservations values(reservation_id_seq.nextval, ?, ?, to_date(?, 'yyyy-mm-dd'), ?, ?, ?) ";
			try (Connection conn = DbManager.getInstance().getDbConnection();
					PreparedStatement stmt = conn.prepareStatement(sqlNewPackage)) {
				
				stmt.setInt(1, beachResortId);
				stmt.setInt(2, client.getId());
				stmt.setString(3, date);
				stmt.setInt(4, umbrellasQty);
				stmt.setInt(5, beachLoungersQty);
				stmt.setDouble(6, totalPrice);
	
				stmt.executeUpdate();
				return true;
			} catch (SQLException e) {
				Logger.getLogger(UserFactory.class.getName()).log(Level.SEVERE, null, e);
				System.out.println("Errore in addReservation di ReservationFactory");
			}

		}
		return false;
		
	}
	
	private GregorianCalendar reservationDateManager(String dateString) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		GregorianCalendar date = (GregorianCalendar) Calendar.getInstance();
		try {
			date.setTime(formatter.parse(dateString));
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
			System.out.println("Il formatter sta facendo cose sbagliate, errore in reservationDateManager");
		}
		return null;
	}
	
	
}
