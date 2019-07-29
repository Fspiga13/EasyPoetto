package com.easypoetto.model;

public class Package {
	
	private int id;
	private int includedUmbrellas;
	private int includedBeachLoungers;
	private double price;
	
	public Package(int id, int includedUmbrellas, int includedBeachLoungers, double price) {
		this.id = id;
		this.includedUmbrellas = includedUmbrellas;
		this.includedBeachLoungers = includedBeachLoungers;
		this.price = price;
	}

	public int getId() {
		return id;
	}

	
	public int getIncludedUmbrellas() {
		return includedUmbrellas;
	}

	
	public int getIncludedBeachLoungers() {
		return includedBeachLoungers;
	}

	
	public double getPrice() {
		return price;
	}

	
	
	
	
	

}
