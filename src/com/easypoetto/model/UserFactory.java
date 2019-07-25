package com.easypoetto.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserFactory {
	
	private static UserFactory singleton;

	private UserFactory() {

	}

	public static UserFactory getInstance() {
		if (singleton == null) {
			singleton = new UserFactory();
		}
		return singleton;
	}
	
	public Integer login(String email, String password) {
		String sql = "select role from users where email= ? and password= ?";

		try (Connection conn = DbManager.getInstance().getDbConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, email);
			stmt.setString(2, password);

			ResultSet result = stmt.executeQuery();

			if (result.next()) {
				return result.getInt("role");
			}

		} catch (SQLException e) {
			Logger.getLogger(UserFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("errore in login dentro UserFactory");
		}
		return null;
	}

	public boolean editDetails(int idUser, String newEmail, String newPassword) {
		
		try (Connection conn = DbManager.getInstance().getDbConnection()) {
		
			String sqlUpdateUserDetails = " update users set email = ?, password= ? where id = ? ";
			try (PreparedStatement stmt = conn.prepareStatement(sqlUpdateUserDetails)) {
				stmt.setString(1, newEmail);
				stmt.setString(2, newPassword);
				stmt.setInt(3, idUser);
				stmt.executeUpdate();
				conn.commit(); //committo le modifiche, tutto � andato a buon fine
				return true;//operazione conclusa con successo
			} catch (SQLException e) {
				conn.rollback();//elimino le modifiche effettuate in transazione
				Logger.getLogger(ClientFactory.class.getName()).log(Level.SEVERE, null, e);
				System.out.println("Errore in editDetails di UserFactory");
			}	
			
		} catch (SQLException e) {
			Logger.getLogger(ClientFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("Errore in editDetails di UserFactory");
		}
			
		return false;
		
	}

	public boolean addUser(String email, String password, Integer role) {
		
		if (getUser(email) == null) { // se l'Utente non c'e' lo aggiungo, altrimenti return false;
		
			String sqlNewUser = " insert into users values (user_id_seq.nextval, ?, ?, ?) ";
			try (Connection conn = DbManager.getInstance().getDbConnection();
					PreparedStatement stmt = conn.prepareStatement(sqlNewUser)) {
				

				stmt.setString(1, email);
				stmt.setString(2, password);
				stmt.setInt(3, role);
	
				stmt.executeUpdate();
				return true;
			} catch (SQLException e) {
				Logger.getLogger(UserFactory.class.getName()).log(Level.SEVERE, null, e);
				System.out.println("Errore in addUser esecuzione query di aggiunta");
			}

		}
		return false;
	}

	public User getUser(String email) {
		
		String sql = "select email, role from users where email= ?";

		try (Connection conn = DbManager.getInstance().getDbConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, email);
			ResultSet result = stmt.executeQuery();

			while (result.next()) {
				Integer role = result.getInt("role");
				User user = new User(email, role);
				return user;
			}

		} catch (SQLException e) {
			Logger.getLogger(UserFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("errore in getUser dentro UserFactory");

		}
		return null;
	}
	
	public int getUserIdFromEmail(String email) {
		
		int idUser = 0; //inizializzo la variabile che conterr� l'id dell'utente
		
		String sqlGetId = "select id from users where email = ? "; //cerco l'id dell'utente tramite la sua mail
		try (Connection conn = DbManager.getInstance().getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sqlGetId)) {
			stmt.setString(1, email);
			ResultSet result = stmt.executeQuery();
			if (result.next()) {
				idUser = result.getInt("id"); //a questo punto � impossibile che non trovi corrispondenza perch� altrimenti l'utente non potrebbe essere loggato

			}
			
			return idUser;

		} catch (SQLException e) {
			Logger.getLogger(UserFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("Errore in getUserIdFromEmail");
		}
		
		return 0;
	}

	public boolean deleteUser(String email) {
		
		// prima di cancellare dalla tabella user
		
		// se client cancellare prima:
		// righe prenotazioni_pacchetti
		// righe prenotazione
		// riga client
		// riga user
		
		// se beach resort cancellare prima:
		// righe prenotazioni_pacchetti
		// righe pacchetti
		// riga beach resort
		// riga user
		
		return false;
	}

}
