package com.easypoetto.model;

import java.util.GregorianCalendar;

public class Client extends User{

	private String name;
	private String surname;
	private GregorianCalendar birthday;
	
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
