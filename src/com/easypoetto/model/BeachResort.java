package com.easypoetto.model;

public class BeachResort extends User{

	private String name;
	private String address;
	private String description;
	private String image;
	private String logo;
	private int numUmbrellas;
	private int numBeachLoungers;
	private boolean parking;
	private boolean pedalo;
	private boolean shower;
	private boolean toilette;
	private boolean restaurant;
	private boolean disableFacilities;
	private boolean childrenArea;
	private boolean dogArea;
	
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @return the image
	 */
	public String getImage() {
		return image;
	}

	/**
	 * @return the logo
	 */
	public String getLogo() {
		return logo;
	}

	/**
	 * @return the numUmbrellas
	 */
	public int getNumUmbrellas() {
		return numUmbrellas;
	}

	/**
	 * @return the numBeachLoungers
	 */
	public int getNumBeachLoungers() {
		return numBeachLoungers;
	}

	/**
	 * @return the parking
	 */
	public boolean isParking() {
		return parking;
	}

	/**
	 * @return the pedalo
	 */
	public boolean isPedalo() {
		return pedalo;
	}

	/**
	 * @return the shower
	 */
	public boolean isShower() {
		return shower;
	}

	/**
	 * @return the toilette
	 */
	public boolean isTiolette() {
		return toilette;
	}

	/**
	 * @return the restaurant
	 */
	public boolean isRestaurant() {
		return restaurant;
	}

	/**
	 * @return the disableFacilities
	 */
	public boolean isDisableFacilities() {
		return disableFacilities;
	}

	/**
	 * @return the childrenArea
	 */
	public boolean isChildrenArea() {
		return childrenArea;
	}

	/**
	 * @return the dogArea
	 */
	public boolean isDogArea() {
		return dogArea;
	}
	
}
