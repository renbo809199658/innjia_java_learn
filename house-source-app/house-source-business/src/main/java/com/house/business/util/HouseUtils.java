package com.house.business.util;

import java.util.List;

import com.house.business.model.House;

public final class HouseUtils {

	public static void filterHouseDefaultValue(List<House> list) {
		for (House house : list) {
			if (house.getUnit().getBuilding().getVillage().getStreet().getStreetAddress().equals("100000")) {
				house.getUnit().getBuilding().getVillage().getStreet().setStreetAddress("");
			}
			if (house.getUnit().getBuilding().getVillage().getVillageName().equals("100000")) {
				house.getUnit().getBuilding().getVillage().setVillageName("");
			}
			if (house.getUnit().getBuilding().getBuildingNumber().equals("100000")) {
				house.getUnit().getBuilding().setBuildingNumber("");
			}
			if (house.getUnit().getUnitNumber().equals("100000")) {
				house.getUnit().setUnitNumber("");
			}
			if (house.getHouseNumber().equals("100000")) {
				house.setHouseNumber("");
			}
		}
	}
}
