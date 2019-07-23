package com.easypoetto.model;

import java.util.GregorianCalendar;

public class Client{

	private String email;
	private String name;
	private String surname;
	private GregorianCalendar birthday;
	
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @return the surname
	 */
	public String getSurname() {
		return surname;
	}

	/**
	 * @return the birthday
	 */
	public GregorianCalendar getBirthday() {
		return birthday;
	}

}
