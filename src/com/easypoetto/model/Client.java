package com.easypoetto.model;

import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;

public class Client{

	private String email;
	private String name;
	private String surname;
	private GregorianCalendar birthday;
	
	/**
	 * @param email
	 * @param name
	 * @param surname
	 * @param birthday
	 */
	public Client(String email, String name, String surname, GregorianCalendar birthday) {
		this.email = email;
		this.name = name;
		this.surname = surname;
		this.birthday = birthday;
	}

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
	
	public String getBirthdayString() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		formatter.setCalendar(birthday);
		return formatter.format(birthday.getTime());
	}
}
