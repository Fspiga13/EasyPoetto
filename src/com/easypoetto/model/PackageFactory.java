package com.easypoetto.model;

public class PackageFactory {
	
	private static PackageFactory singleton;

	private PackageFactory() {

	}

	public static PackageFactory getInstance() {
		if (singleton == null) {
			singleton = new PackageFactory();
		}
		return singleton;
	}
	
	public boolean editPackages() {
		return false;

}
	
}
