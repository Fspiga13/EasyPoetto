package com.easypoetto.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BeachResortFactory {
	
	private static BeachResortFactory singleton;

	private BeachResortFactory() {

	}

	public static BeachResortFactory getInstance() {
		if (singleton == null) {
			singleton = new BeachResortFactory();
		}
		return singleton;
	}
	
	
	private boolean convertBoolean(String value){
		
		if (value.equals("Y"))
			return true;
		return false;
		
	}
	
	public BeachResort getBeachResort(String email) {
		
		
		try (Connection conn = DbManager.getInstance().getDbConnection(); Statement stmt = conn.createStatement())  {

			String sql = "select email, name, description, image, logo, address, telephone, num_umbrellas, "
					+ "num_beach_loungers, parking, pedalo, shower, toilette, restaurant, "
					+ "disabled_facilities, children_area, dog_area from beach_resorts, users where user_id = users.id and email= " + email;

			ResultSet result = stmt.executeQuery(sql);

			while (result.next()) {
				
				return new BeachResort(result.getString("email"), result.getString("name"),result.getString("description"), result.getString("image"),
						result.getString("logo"), result.getString("address"), result.getString("telephone"), result.getInt("num_umbrellas"),
						result.getInt("num_beach_loungers"), 
						 convertBoolean(result.getString("parking")), convertBoolean(result.getString("pedalo")), convertBoolean(result.getString("shower")), convertBoolean(result.getString("toilette")),
						convertBoolean(result.getString("restaurant")), convertBoolean(result.getString("disabled_facilities")), 
						convertBoolean(result.getString("children_area")), convertBoolean(result.getString("dog_area")));
			}
					
		} catch (SQLException e) {
			Logger.getLogger(BeachResortFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("errore in getBeachResort dentro BeachResortFactory");
		}	
		
		return null;
		
	}
	
	
	public BeachResort getBeachResortById(int id) {
		
		
		try (Connection conn = DbManager.getInstance().getDbConnection(); Statement stmt = conn.createStatement())  {

			String sql = "select email, name, description, image, logo, address, telephone, num_umbrellas, "
					+ "num_beach_loungers, parking, pedalo, shower, toilette, restaurant, "
					+ "disabled_facilities, children_area, dog_area from beach_resorts, users where user_id = users.id and beach_resorts.id= " + id;

			ResultSet result = stmt.executeQuery(sql);

			while (result.next()) {
				
				return new BeachResort(result.getString("email"), result.getString("name"),result.getString("description"), result.getString("image"),
						result.getString("logo"), result.getString("address"), result.getString("telephone"), result.getInt("num_umbrellas"),
						result.getInt("num_beach_loungers"), 
						 convertBoolean(result.getString("parking")), convertBoolean(result.getString("pedalo")), convertBoolean(result.getString("shower")), convertBoolean(result.getString("toilette")),
						convertBoolean(result.getString("restaurant")), convertBoolean(result.getString("disabled_facilities")), 
						convertBoolean(result.getString("children_area")), convertBoolean(result.getString("dog_area")));
			}
					
		} catch (SQLException e) {
			Logger.getLogger(BeachResortFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("errore in getBeachResortById dentro BeachResortFactory");
		}	
		
		return null;
		
	}

	// Restituisce lista con informazioni essenziali dei resort
	
	public List<BeachResort> getBeachResorts() {
		
		List<BeachResort> beachResorts = new ArrayList<BeachResort>();
			
		try (Connection conn = DbManager.getInstance().getDbConnection(); Statement stmt = conn.createStatement())  {

			String sql = "select id, name, description, image, "
					+ "parking, pedalo, shower, toilette, restaurant, "
					+ "disabled_facilities, children_area, dog_area from beach_resorts";

			ResultSet result = stmt.executeQuery(sql);

			while (result.next()) {
				
				beachResorts.add(new BeachResort(result.getInt("id"), result.getString("name"),result.getString("description"), result.getString("image"),
						convertBoolean(result.getString("parking")), convertBoolean(result.getString("pedalo")), convertBoolean(result.getString("shower")), convertBoolean(result.getString("toilette")),
						convertBoolean(result.getString("restaurant")), convertBoolean(result.getString("disabled_facilities")), 
						convertBoolean(result.getString("children_area")), convertBoolean(result.getString("dog_area"))));
			}
			
			return beachResorts;
					
		} catch (SQLException e) {
			Logger.getLogger(BeachResortFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("errore in getBeachResorts dentro BeachResortFactory");
		}	
		
		return null;
			
	}
	
	// Restituisce lista dei resort filtrati per servizi
	
	public List<BeachResort> getFilteredBeachResorts(List<String> services) {
		
		List<BeachResort> beachResorts = new ArrayList<BeachResort>();
			
		try (Connection conn = DbManager.getInstance().getDbConnection(); Statement stmt = conn.createStatement())  {

			String sql = "select id, name, description, image, "
					+ "parking, pedalo, shower, toilette, restaurant, "
					+ "disabled_facilities, children_area, dog_area from beach_resorts where ";
			
			for (String service : services) {
				sql += service + "= 'Y' and ";
			}
			
			sql = sql.substring(0, sql.length() - 4);

			ResultSet result = stmt.executeQuery(sql);

			while (result.next()) {
				
				beachResorts.add(new BeachResort(result.getInt("id"), result.getString("name"),result.getString("description"), result.getString("image"),
						convertBoolean(result.getString("parking")), convertBoolean(result.getString("pedalo")), convertBoolean(result.getString("shower")), convertBoolean(result.getString("toilette")),
						convertBoolean(result.getString("restaurant")), convertBoolean(result.getString("disabled_facilities")), 
						convertBoolean(result.getString("children_area")), convertBoolean(result.getString("dog_area"))));
			}
			
			return beachResorts;
					
		} catch (SQLException e) {
			Logger.getLogger(BeachResortFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("errore in getFilteredBeachResorts dentro BeachResortFactory");
		}	
		
		return null;
			
	}

	public List<String> getBeachResortEmails() {
		
		List<String> beachResortEmails = new ArrayList<String>();
		
		try (Connection conn = DbManager.getInstance().getDbConnection(); Statement stmt = conn.createStatement())  {

			String sql = "select email from users where role=1";

			ResultSet result = stmt.executeQuery(sql);

			while (result.next()) {
				
				beachResortEmails.add(result.getString("email"));
			}
			
			return beachResortEmails;
					
		} catch (SQLException e) {
			Logger.getLogger(BeachResortFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("errore in getBeachResortEmails dentro BeachResortFactory");
		}	
		
		return null;
	}

	public boolean editDetails(String newName, String newDescription, String newEmail, String newPassword,
			String newImage, String newLogo, String newAddress, String newTelephone, List<String> services,
			String email) {
		// TODO Auto-generated method stub
		return false;
	}

	 
}
