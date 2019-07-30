package com.easypoetto.model;

import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;

public class Reservation {
	
	private int id;
	private GregorianCalendar date;
	private int umbrellasQty;
	private int beachLoungersQty;
	private double totalPrice;

	/**
	 * @param id
	 * @param date
	 * @param umbrellasQty
	 * @param beachLoungersQty
	 * @param totalPrice
	 */
	public Reservation(int id, GregorianCalendar date, int umbrellasQty, int beachLoungersQty,
			double totalPrice) {
		this.id = id;
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
	

}
