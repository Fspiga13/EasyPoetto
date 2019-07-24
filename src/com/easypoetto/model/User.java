package com.easypoetto.model;

public class User {
	
	private String email;
	private int role;
	
	/**
	 * @param email
	 * @param role
	 */
	public User(String email, int role) {
		
		this.email = email;
		this.role = role;	
	}
	
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @return the role
	 */
	public int getRole() {
		return role;
	}
	

}
