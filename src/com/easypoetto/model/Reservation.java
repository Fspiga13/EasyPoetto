package com.easypoetto.model;

import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;

public class Reservation {
	
	private int id;
	private String clientName;
	private String clientSurname;
	private String beachResortName;
	private GregorianCalendar date;
	private int umbrellasQty;
	private int beachLoungersQty;
	private double totalPrice;

	/**
	 * @param id
	 * @param beachResortName
	 * @param date
	 * @param umbrellasQty
	 * @param beachLoungersQty
	 * @param totalPrice
	 */
	public Reservation(int id, String beachResortName, GregorianCalendar date, int umbrellasQty, int beachLoungersQty,
			double totalPrice) {
		this.id = id;
		this.beachResortName = beachResortName;
		this.date = date;
		this.umbrellasQty = umbrellasQty;
		this.beachLoungersQty = beachLoungersQty;
		this.totalPrice = totalPrice;
	}
	
	/**
	 * @param id
	 * @param clientName
	 * @param clientSurname
	 * @param date
	 * @param umbrellasQty
	 * @param beachLoungersQty
	 * @param totalPrice
	 */
	public Reservation(int id, String clientName, String clientSurname, GregorianCalendar date, int umbrellasQty, int beachLoungersQty,
			double totalPrice) {
		this.id = id;
		this.clientName = clientName;
		this.clientSurname = clientSurname;
		this.date = date;
		this.umbrellasQty = umbrellasQty;
		this.beachLoungersQty = beachLoungersQty;
		this.totalPrice = totalPrice;
	}

	public int getId() {
		return id;
	}
	
	/**
	 * @return the date
	 */
	public GregorianCalendar getDate() {
		return date;
	}
	
	public String getDateString() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		formatter.setCalendar(date);
		return formatter.format(date.getTime());
	}


	/**
	 * @return the umbrellasQty
	 */
	public int getUmbrellasQty() {
		return umbrellasQty;
	}


	/**
	 * @return the beachLoungersQty
	 */
	public int getBeachLoungersQty() {
		return beachLoungersQty;
	}

	/**
	 * @return the totalPrice
	 */
	public double getTotalPrice() {
		return totalPrice;
	}

	/**
	 * @return the clientName
	 */
	public String getClientName() {
		return clientName;
	}

	/**
	 * @return the clientSurname
	 */
	public String getClientSurname() {
		return clientSurname;
	}

	/**
	 * @return the beachResortName
	 */
	public String getBeachResortName() {
		return beachResortName;
	}
	

}
