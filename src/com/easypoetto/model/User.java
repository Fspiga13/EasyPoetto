package com.easypoetto.model;

public class User {
	
	private String email;
	private int role;
	private int status;
	
	/**
	 * @param email
	 * @param role
	 * @param status
	 */
	public User(String email, int role, int status) {
		
		this.email = email;
		this.role = role;
		this.status = status;
	}
	
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

	/**
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}

}
