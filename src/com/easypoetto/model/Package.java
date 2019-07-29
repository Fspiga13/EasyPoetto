package com.easypoetto.model;

public class Package {
	
	private int id;
	private String name;
	private int includedUmbrellas;
	private int includedBeachLoungers;
	private double price;
	
	public Package(int id, String name, int includedUmbrellas, int includedBeachLoungers, double price) {
		this.id = id;
		this.name = name;
		this.includedUmbrellas = includedUmbrellas;
		this.includedBeachLoungers = includedBeachLoungers;
		this.price = price;
	}

	public int getId() {
		return id;
	}
	
	public String getName() {
		return name;
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
