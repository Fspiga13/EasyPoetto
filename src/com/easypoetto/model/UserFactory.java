package com.easypoetto.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.easypoetto.model.DbManager;
import com.easypoetto.model.UserFactory;

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

}
