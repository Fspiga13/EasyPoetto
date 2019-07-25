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

import com.easypoetto.model.DbManager;

public class ClientFactory {

	private static ClientFactory singleton;

	private ClientFactory() {

	}

	public static ClientFactory getInstance() {
		if (singleton == null) {
			singleton = new ClientFactory();
		}
		return singleton;
	}

	public boolean editDetails(String newName, String newSurname, String newEmail, String newPassword,
			String newBirthday, String email) {
		
		try (Connection conn = DbManager.getInstance().getDbConnection()) {
			
			conn.setAutoCommit(false); //Iniza la transazione perch� se due persone entrano in concorrenza in questo metodo potrebbero superare il successivo controllo e impostare assieme la stessa mail
			
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
					Logger.getLogger(ClientFactory.class.getName()).log(Level.SEVERE, null, e);
					System.out.println("Errore in editDetails di ClientFactory");
				}
			}
			
			int idClient = -1; //inizializzo la variabile che conterr� l'id del client
			int idUser = UserFactory.getInstance().getUserIdFromEmail(email);
			
			String sqlGetId = "select clients.id as client_id from users,clients where clients.user_id = users.id and email = ? "; //cerco l'id del client tramite la sua mail
			try (PreparedStatement stmt = conn.prepareStatement(sqlGetId)) {
				stmt.setString(1, email);
				ResultSet result = stmt.executeQuery();
				if (result.next()) {
					idClient = result.getInt("client_id");
				}

			} catch (SQLException e) {
				conn.rollback(); // elimino le modifiche effettuate in transazione
				Logger.getLogger(ClientFactory.class.getName()).log(Level.SEVERE, null, e);
				System.out.println("Errore in editDetails");
			}

			//Sta effettuando modifiche
			if(idClient != -1) {
				
				String sqlEditClientDetails = " update clients set name = ?, surname= ?, birthday=to_date (?, 'yyyy-mm-dd') where id = ? ";
				try (PreparedStatement stmt = conn.prepareStatement(sqlEditClientDetails)) {
					stmt.setString(1, newName);
					stmt.setString(2, newSurname);
					stmt.setString(3, newBirthday);
					stmt.setInt(4, idClient);
					stmt.executeUpdate();
					conn.commit(); //committo le modifiche, tutto � andato a buon fine

				} catch (SQLException e) {
					conn.rollback();//elimino le modifiche effettuate in transazione
					Logger.getLogger(ClientFactory.class.getName()).log(Level.SEVERE, null, e);
					System.out.println("Errore in editDetails");
				}
			}else {
				
				//INSERT in Clients
				
				String sqlInsertClientDetails = "INSERT INTO CLIENTS VALUES(client_id_seq.nextval, ?, ?, ?,TO_DATE(?, 'YYYY-MM-DD'))";
				try (PreparedStatement stmt = conn.prepareStatement(sqlInsertClientDetails)) {
					stmt.setInt(1, idUser);
					stmt.setString(2, newName);
					stmt.setString(3, newSurname);
					stmt.setString(4, newBirthday);

					stmt.executeUpdate();
					conn.commit(); //committo le modifiche, tutto � andato a buon fine
				} catch (SQLException e) {
					conn.rollback();//elimino le modifiche effettuate in transazione
					Logger.getLogger(ClientFactory.class.getName()).log(Level.SEVERE, null, e);
					System.out.println("Errore in editDetails");
				}
				
			}
			
			//UPDATE tabella users
			return UserFactory.getInstance().editDetails(idUser, newEmail, newPassword);
			
		} catch (SQLException e) {
			Logger.getLogger(ClientFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("Errore in editDetails");
		}
			
		return false; // se sono arrivato a questo punto qualche metodo ha lanciato un'eccezione
	}

	public Client getClient(String email) {
		
		String sql = "select name, surname, birthday from users, clients where users.id=user_id and email= ?";

		try (Connection conn = DbManager.getInstance().getDbConnection();
			PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, email);
			ResultSet result = stmt.executeQuery();

			while (result.next()) {
				String name = result.getString("name");
				String surname = result.getString("surname");
				GregorianCalendar birthday = clientBirthdayManager(result.getString("birthday"));
				Client client = new Client(email, name, surname, birthday);
				return client;
			}

		} catch (SQLException e) {
			Logger.getLogger(UserFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("errore in getClient dentro ClientFactory");

		}
		return null;
	}
	
	private GregorianCalendar clientBirthdayManager(String birthdayString) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		GregorianCalendar birthday = (GregorianCalendar) Calendar.getInstance();
		try {
			birthday.setTime(formatter.parse(birthdayString));
			return birthday;
		} catch (ParseException e) {
			e.printStackTrace();
			System.out.println("Il formatter sta facendo cose sbagliate, errore in clientBithdayManager");
		}
		return null;
	}

	public List<String> getClientEmails() {
		
		List<String> clientEmails = new ArrayList<String>();
		
		try (Connection conn = DbManager.getInstance().getDbConnection(); Statement stmt = conn.createStatement())  {

			String sql = "select email from users where role=2";

			ResultSet result = stmt.executeQuery(sql);

			while (result.next()) {
				
				clientEmails.add(result.getString("email"));
			}
			
			return clientEmails;
					
		} catch (SQLException e) {
			Logger.getLogger(ClientFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("errore in getClientEmails dentro ClientFactory");
		}	
		
		return null;
	}
	
}
