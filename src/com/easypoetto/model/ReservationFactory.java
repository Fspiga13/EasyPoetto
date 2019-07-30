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
	

	public List<Reservation> getResevationsByUser(String email) {
		
		List<Reservation> reservations = new ArrayList<Reservation>();
		
		String sql = "select bp.id, bp.name, bp.included_umbrellas, bp.included_beach_loungers, bp.price from users u, beach_resorts br, beach_packages bp where u.id=br.user_id and br.id=bp.beach_resort_id and email= ?" ;
		
		try (Connection conn = DbManager.getInstance().getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql))  {
			
			stmt.setString(1, email);

			ResultSet result = stmt.executeQuery();

			while (result.next()) {
				reservations.add(new Reservation(result.getInt("id"), reservationDateManager(result.getString("date")), result.getInt("umbrellas_qty"), 
						result.getInt("beach_loungers_qty"), result.getDouble("total_price")));
			}
			
			return reservations;
					
		} catch (SQLException e) {
			Logger.getLogger(ClientFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("errore in getResevationsByUser dentro ReservationFactory");
		}	
		
		
		return null;
	}

	public boolean addReservation(String email) {
		
		BeachResort br= BeachResortFactory.getInstance().getBeachResort(email);
				
		if (br != null) { // deve per forza trovare un beach resort
			
			String sqlNewPackage = " insert into beach_packages(id, beach_resort_id) values (beach_package_id_seq.nextval, ?) ";
			try (Connection conn = DbManager.getInstance().getDbConnection();
					PreparedStatement stmt = conn.prepareStatement(sqlNewPackage)) {
				
				stmt.setInt(1, br.getId());
	
				stmt.executeUpdate();
				return true;
			} catch (SQLException e) {
				Logger.getLogger(UserFactory.class.getName()).log(Level.SEVERE, null, e);
				System.out.println("Errore in addPackage di PackageFactory");
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
