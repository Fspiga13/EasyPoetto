package com.easypoetto.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


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
		List<Reservation> reservationsBeachResort = new ArrayList<Reservation>();
		return reservationsBeachResort;

	}

	public List<Reservation> getReservationsByClient(String email) {
		List<Reservation> reservationsClient = new ArrayList<Reservation>();
		return reservationsClient;

	}

	public boolean addReservation(String email) {

		Reservation reservation = ReservationFactory.getInstance().getReservation();

		
		return false;

	}

	private Reservation getReservation() {
		
		return null;
	}

}
