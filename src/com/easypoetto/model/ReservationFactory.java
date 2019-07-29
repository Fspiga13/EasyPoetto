package com.easypoetto.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ReservationFactory {

	private static ReservationFactory singleton;

	private ReservationFactory() {

	}

	public static ReservationFactory getInstance() {
		if (singleton == null) {
			singleton = new ReservationFactory();
		}
		return singleton;
	}

	public List<Reservation> getReservationsByBeachResort(String email) {
		List<Reservation> reservations = new ArrayList<Reservation>();
		return reservations;

	}

	public List<Reservation> getReservationsByClient(String email) {
		List<Reservation> reservations = new ArrayList<Reservation>();
		return reservations;

	}

	public boolean addReservation(String email) {

		Reservation reservation = ReservationFactory.getInstance().getReservation();

		
		return false;

	}

	private Reservation getReservation() {
		
		return null;
	}

}
