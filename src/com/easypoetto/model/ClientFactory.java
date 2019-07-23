package com.easypoetto.model;

public class ClientFactory {

	private static ClientFactory singleton;

	private ClientFactory() {

	}

	public static ClientFactory getInstance() {
		if (singleton == null) {
			singleton = new ClientFactory();
		}
		return singleton;
	}
	
}
