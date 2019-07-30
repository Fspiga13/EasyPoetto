package com.easypoetto.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
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

		String sql = "select beach_resorts.id, email, name, description, image, logo, address, telephone, num_umbrellas, price_umbrella, "
				+ "num_beach_loungers, price_beach_lounger, parking, pedalo, shower, toilette, restaurant, "
				+ "disabled_facilities, children_area, dog_area from beach_resorts, users where user_id = users.id and email=?";
		
		try (Connection conn = DbManager.getInstance().getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
				
			stmt.setString(1, email);
			ResultSet result = stmt.executeQuery();

			while (result.next()) {
				String logo = result.getString("logo");
				String image = result.getString("image");
				if(logo.equals("view/Resources/default-logo.png")) {
					logo = "";
					}
				if(image.equals("view/Resources/default-image.png")) {
					image = "";
					}
				
				return new BeachResort(result.getInt("id"), result.getString("email"), result.getString("name"),result.getString("description"), image,
						logo, result.getString("address"), result.getString("telephone"), result.getInt("num_umbrellas"), result.getDouble("price_umbrella"),
						result.getInt("num_beach_loungers"), result.getDouble("price_beach_lounger"),
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

			String sql = "select email, name, description, image, logo, address, telephone, num_umbrellas, price_umbrella, "
					+ "num_beach_loungers, price_beach_lounger, parking, pedalo, shower, toilette, restaurant, "
					+ "disabled_facilities, children_area, dog_area from beach_resorts, users where user_id = users.id and beach_resorts.id= " + id;

			ResultSet result = stmt.executeQuery(sql);

			while (result.next()) {
				
				return new BeachResort(id, result.getString("email"), result.getString("name"),result.getString("description"), result.getString("image"),
						result.getString("logo"), result.getString("address"), result.getString("telephone"), result.getInt("num_umbrellas"), result.getDouble("price_umbrella"),
						result.getInt("num_beach_loungers"),  result.getDouble("price_beach_lounger"), 
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
	
	public List<BeachResort> getBeachResorts(String date) {
		
		List<BeachResort> beachResorts = new ArrayList<BeachResort>();
		
		String sql = "select beach_resorts.id, name, address, logo, "
				+ "parking, pedalo, shower, toilette, restaurant, "
				+ "disabled_facilities, children_area, dog_area from beach_resorts, users where user_id=users.id and status=0";
			
		try (Connection conn = DbManager.getInstance().getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql))  {


			ResultSet result = stmt.executeQuery(sql);

			while (result.next()) {
				
				beachResorts.add(new BeachResort(result.getInt("id"), result.getString("name"),result.getString("address"), result.getString("logo"),
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
	
	public List<BeachResort> getFilteredBeachResorts(List<String> services, String date) {
		
		List<BeachResort> beachResorts = new ArrayList<BeachResort>();
		
		String sql = "select id, name, address, logo, "
				+ "parking, pedalo, shower, toilette, restaurant, "
				+ "disabled_facilities, children_area, dog_area from beach_resorts where ";
		
		for (String service : services) {
			sql += service + "= 'Y' and ";
		}
		
		sql = sql.substring(0, sql.length() - 4);
		 
			
		try (Connection conn = DbManager.getInstance().getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql))  {
			

			ResultSet result = stmt.executeQuery(sql);

			while (result.next()) {
				
				beachResorts.add(new BeachResort(result.getInt("id"), result.getString("name"),result.getString("address"), result.getString("logo"),
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
			String newImage, String newLogo, String newAddress, String newTelephone, Integer newNumUmbrellas, Double newPriceUmbrella, Integer newNumBeachLoungers, Double newPriceBeachLounger, List<String> services,
			String email) {
	
			try (Connection conn = DbManager.getInstance().getDbConnection()) {
			
			conn.setAutoCommit(false); //Inizia la transazione perch� se due persone entrano in concorrenza in questo metodo potrebbero superare il successivo controllo e impostare assieme la stessa mail
			
			if (newEmail.equals("")) {
				newEmail=email;
			}
			
			if (!newEmail.equals(email)) { //Se la vecchia mail � diversa dalla nuova verifico che non siano presenti mail uguali in database prima di permettere il cambio
				
				String sqlCheckEmail = "select email from users where email = ? "; 
				
				try (PreparedStatement stmt = conn.prepareStatement(sqlCheckEmail)) {
					
					stmt.setString(1, newEmail);
					ResultSet result = stmt.executeQuery();
					if (result.next()) {
						return false; //se trova risultati la mail esiste quindi interrompo l'esecuzione la modifica non si pu� fare
					}
					

				} catch (SQLException e) {
					conn.rollback();// elimino le modifiche effettuate in transazione
					Logger.getLogger(BeachResortFactory.class.getName()).log(Level.SEVERE, null, e);
					System.out.println("Errore in editDetails di BeachResortFactory");
				}
			}
			
			int idBeachResort = -1; //inizializzo la variabile che conterr� l'id del beach resort
			int idUser = UserFactory.getInstance().getUserIdFromEmail(email);
			
			String sqlGetId = "select beach_resorts.id as beach_resort_id from users,beach_resorts where beach_resorts.user_id = users.id and email = ? "; //cerco l'id del beach resort tramite la sua mail
			try (PreparedStatement stmt = conn.prepareStatement(sqlGetId)) {
				stmt.setString(1, email);
				ResultSet result = stmt.executeQuery();
				if (result.next()) {
					idBeachResort = result.getInt("beach_resort_id");
				}

			} catch (SQLException e) {
				conn.rollback(); // elimino le modifiche effettuate in transazione
				Logger.getLogger(BeachResortFactory.class.getName()).log(Level.SEVERE, null, e);
				System.out.println("Errore in editDetails di BeachResortFactory");
			}

			//Sta effettuando modifiche
			if(idBeachResort != -1) {
				
				String sqlEditBeachResortDetails = " update beach_resorts set name = ?, description = ?, image = ?, logo = ?, address = ?, telephone = ?,  num_umbrellas = ?,  price_umbrella = ?, num_beach_loungers = ?,  price_beach_lounger = ?, parking = 'N', pedalo = 'N', shower = 'N', toilette = 'N', restaurant = 'N', disabled_facilities = 'N', children_area = 'N', dog_area = 'N' where id = ? ";
				
				for(String service : services) {
					sqlEditBeachResortDetails = sqlEditBeachResortDetails.replace(service + " = 'N'", service + " = 'Y'");		
				}
				
				
				try (PreparedStatement stmt = conn.prepareStatement(sqlEditBeachResortDetails)) {
					stmt.setString(1, newName);
					stmt.setString(2, newDescription);
					stmt.setString(3, newImage);
					stmt.setString(4, newLogo);
					stmt.setString(5, newAddress);
					stmt.setString(6, newTelephone);
					stmt.setInt(7, newNumUmbrellas);
					stmt.setDouble(8, newPriceUmbrella);
					stmt.setInt(9, newNumBeachLoungers);
					stmt.setDouble(10, newPriceBeachLounger);
					stmt.setInt(11, idBeachResort);
					stmt.executeUpdate();

				} catch (SQLException e) {
					conn.rollback();//elimino le modifiche effettuate in transazione
					Logger.getLogger(BeachResortFactory.class.getName()).log(Level.SEVERE, null, e);
					System.out.println("Errore in editDetails");
				}
			} else {
				
				//INSERT in BeachResort
				
				String sql1 = "INSERT INTO BEACH_RESORTS (id, user_id, name, description, image, logo, address, telephone, num_umbrellas, price_umbrella, num_beach_loungers, price_beach_lounger ";
				String sql2= " VALUES(beach_resort_id_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ";
				for(String service : services) {
					sql1 = sql1 + service +", ";
					sql2 = sql2 + "'Y', ";
				}
				
				sql1 = sql1.substring(0, sql1.length() -2) + ")";
				sql2 = sql2.substring(0, sql2.length() -2) + ")";
				
				String sqlInsertBeachResortDetails = sql1 + sql2;
				
				System.out.println(sqlInsertBeachResortDetails);
				
				try (PreparedStatement stmt = conn.prepareStatement(sqlInsertBeachResortDetails)) {
					stmt.setInt(1, idUser);
					stmt.setString(2, newName);
					stmt.setString(3, newDescription);
					stmt.setString(4, newImage);
					stmt.setString(5, newLogo);
					stmt.setString(6, newAddress);
					stmt.setString(7, newTelephone);
					stmt.setInt(8, newNumUmbrellas);
					stmt.setDouble(9, newPriceUmbrella);
					stmt.setInt(10, newNumBeachLoungers);
					stmt.setDouble(11, newPriceBeachLounger);
					stmt.executeUpdate();
				} catch (SQLException e) {
					conn.rollback();//elimino le modifiche effettuate in transazione
					Logger.getLogger(BeachResortFactory.class.getName()).log(Level.SEVERE, null, e);
					System.out.println("Errore in editDetails");
				}
				
			}
			
			conn.commit(); //committo le modifiche, tutto � andato a buon fine
			//UPDATE tabella users
			return UserFactory.getInstance().editDetails(idUser, newEmail, newPassword);

			
		} catch (SQLException e) {
			Logger.getLogger(BeachResortFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("Errore in editDetails");
		}
			
		return false; // se sono arrivato a questo punto qualche metodo ha lanciato un'eccezione

		
	}

	 
}
