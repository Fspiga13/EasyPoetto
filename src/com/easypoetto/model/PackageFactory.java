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

public class PackageFactory {
	
	private static PackageFactory singleton;

	private PackageFactory() {

	}

	public static PackageFactory getInstance() {
		if (singleton == null) {
			singleton = new PackageFactory();
		}
		return singleton;
	}
	
	public boolean editPackages() {
		return false;

}

	public List<Package> getPackages(String email) {
		
		List<Package> packages = new ArrayList<Package>();
		
		String sql = "select bp.id, bp.name, bp.included_umbrellas, bp.included_beach_loungers, bp.price from users u, beach_resorts br, beach_packages bp where u.id=br.user_id and br.id=bp.beach_resort_id and email= ?" ;
		
		try (Connection conn = DbManager.getInstance().getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql))  {
			
			stmt.setString(1, email);

			ResultSet result = stmt.executeQuery();

			while (result.next()) {
				packages.add(new Package(result.getInt("id"), result.getString("name"), result.getInt("included_umbrellas"), 
						result.getInt("included_beach_loungers"), result.getDouble("price")));
			}
			
			return packages;
					
		} catch (SQLException e) {
			Logger.getLogger(ClientFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("errore in getPackages dentro PackageFactory");
		}	
		
		
		return null;
	}

	public boolean addPackage(String email) {
		
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
	

	public boolean editPackage(int id, String name, int includedUmbrellas, int includedBeachLoungers, double price) {
		
		String sqlEditPackage = " update beach_packages set name= ?, included_umbrellas= ?, included_beach_loungers= ?, price= ? where id= ?";
		
		try (Connection conn = DbManager.getInstance().getDbConnection();
				PreparedStatement stmt = conn.prepareStatement(sqlEditPackage)) {
			stmt.setString(1, name);
			stmt.setInt(2, includedUmbrellas);
			stmt.setInt(3, includedBeachLoungers);
			stmt.setDouble(4, price);
			stmt.setInt(5, id);

			stmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			Logger.getLogger(UserFactory.class.getName()).log(Level.SEVERE, null, e);
			System.out.println("Errore in editPackage di PackageFactory");
		}

		return false;
		
	}
	
	
	
}
