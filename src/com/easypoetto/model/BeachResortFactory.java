package com.easypoetto.model;

public class BeachResortFactory {
	
	private static BeachResortFactory singleton;

	private BeachResortFactory() {

	}

	public static BeachResortFactory getInstance() {
		if (singleton == null) {
			singleton = new BeachResortFactory();
		}
		return singleton;
	}

}
