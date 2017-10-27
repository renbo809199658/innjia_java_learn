package com.house.business.dao.test;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang.CharUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang3.ObjectUtils;
import org.iframework.commons.utils.log.Log;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import com.alibaba.fastjson.JSON;
import com.house.business.dao.BuildingDao;
import com.house.business.dao.CityAreaDao;
import com.house.business.dao.CityDao;
import com.house.business.dao.ExecutiveStreetDao;
import com.house.business.dao.HouseDao;
import com.house.business.dao.HouseRoomDao;
import com.house.business.dao.ProvinceDao;
import com.house.business.dao.StreetDao;
import com.house.business.dao.UnitDao;
import com.house.business.dao.VillageDao;
import com.house.business.enums.HouseSourceEnum;
import com.house.business.model.Building;
import com.house.business.model.City;
import com.house.business.model.CityArea;
import com.house.business.model.ExecutiveStreet;
import com.house.business.model.House;
import com.house.business.model.HouseRoom;
import com.house.business.model.Province;
import com.house.business.model.Street;
import com.house.business.model.Unit;
import com.house.business.model.Village;

@ContextConfiguration(locations = { "classpath:main.xml" })
public class HouseDaoTest extends AbstractJUnit4SpringContextTests {

	@Autowired
	private ProvinceDao provinceDao;

	@Autowired
	private CityDao cityDao;

	@Autowired
	private CityAreaDao cityAreaDao;

	@Autowired
	private ExecutiveStreetDao executiveStreetDao;

	@Autowired
	private StreetDao streetDao;

	@Autowired
	private VillageDao villageDao;

	@Autowired
	private BuildingDao buildingDao;

	@Autowired
	private UnitDao unitDao;

	@Autowired
	private HouseDao houseDao;

	@Autowired
	private HouseRoomDao houseRoomDao;

	@Test
	public void addProvince() throws IOException {
		String filePath = "e:/p.csv";
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "GBK"));
		List<Province> list = new ArrayList<Province>();
		String line = null;
		while ((line = br.readLine()) != null) {
			try {
				Province province = new Province();
				String[] data = line.split(",");
				province.setProvinceId(data[0]);
				province.setProvinceName(data[1]);
				province.setProvinceShort(data[2]);
				province.setCreateTime(new Date());
				province.setUpdateTime(province.getCreateTime());
				list.add(province);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		br.close();
		System.out.println(list.size());
		if (list.size() > 0) {
			provinceDao.saveOrUpdateAll(list);
		}
	}

	@Test
	public void addCity() throws IOException {
		String filePath = "e:/c.csv";
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "GBK"));
		List<City> list = new ArrayList<City>();
		String line = null;
		while ((line = br.readLine()) != null) {
			try {
				City city = new City();
				String[] data = line.split(",");
				city.setCityId(data[0]);
				city.setCityName(data[1]);
				city.setCityShort(data[2]);
				city.setProvince(provinceDao.getByProvinceId(data[3]));
				city.setCreateTime(new Date());
				city.setUpdateTime(city.getCreateTime());
				list.add(city);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		br.close();
		if (list.size() > 0) {
			cityDao.saveOrUpdateAll(list);
			list.clear();
		}
	}

	@Test
	public void addCityArea() throws IOException {
		String filePath = "e:/cc.csv";
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "GBK"));
		List<CityArea> list = new ArrayList<CityArea>();
		String line = null;
		while ((line = br.readLine()) != null) {
			try {
				CityArea city = new CityArea();
				String[] data = line.split(",");
				city.setCityAreaId(data[0]);
				city.setCityAreaName(data[1]);
				city.setCityAreaShort(data[2]);
				city.setCity(cityDao.getByCityId(data[3]));
				city.setCreateTime(new Date());
				city.setUpdateTime(city.getCreateTime());
				list.add(city);
				if ((list.size() + 1) % 100 == 0) {
					cityAreaDao.saveOrUpdateAll(list);
					list.clear();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		br.close();
		if (list.size() > 0) {
			cityAreaDao.saveOrUpdateAll(list);
			list.clear();
		}
	}

	@Test
	public void addEnvStreet() throws IOException {
		String filePath = "e:/es.csv";
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "GBK"));
		List<ExecutiveStreet> list = new ArrayList<ExecutiveStreet>();
		String line = null;
		while ((line = br.readLine()) != null) {
			try {
				ExecutiveStreet city = new ExecutiveStreet();
				String[] data = line.split(",");
				city.setCityArea(cityAreaDao.getByCityId(data[0]));
				city.setStreetName(data[2]);
				city.setCreateTime(new Date());
				city.setUpdateTime(city.getCreateTime());
				list.add(city);
				if ((list.size() + 1) % 100 == 0) {
					executiveStreetDao.saveOrUpdateAll(list);
					list.clear();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		br.close();
		if (list.size() > 0) {
			executiveStreetDao.saveOrUpdateAll(list);
			list.clear();
		}
	}

	@Test
	public void addStreet() throws IOException {
		String filePath = "D:/innjia_work/house/hbase_20171026/streets_1026.csv";
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "GBK"));
		List<Street> list = new ArrayList<Street>();
		String line = null;
		while ((line = br.readLine()) != null) {
			try {
				Street street = new Street();
				String[] data = line.split(",");
				if (StringUtils.isBlank(data[6])) {
					continue;
				}
				CityArea cityArea = cityAreaDao.getByCityId(data[6]);
				if (cityArea == null) {
					continue;
				}
				street.setCityArea(cityArea);
				StringBuilder rowKey = new StringBuilder();
				rowKey.append(cityArea.getCity().getProvince().getProvinceName().replace(" ", ""));
				rowKey.append(cityArea.getCity().getCityName().replace(" ", ""));
				rowKey.append(cityArea.getCityAreaName().replace(" ", ""));
				String streetAddress = ObjectUtils.toString(data[0]);
				rowKey.append(processStreetNumber(streetAddress.replace(" ", "")));
				street.setRowKey(rowKey.toString());
				street.setStreetAddress(processStreetNumber(streetAddress.replace(" ", "")));
				street.setStreetName(data[4]);
				street.setCreateTime(new Date());
				street.setUpdateTime(street.getCreateTime());
				street.setStreetId(data[1]);
				System.out.println("====" + JSON.toJSON(street));
				list.add(street);
				if ((list.size() + 1) % 100 == 0) {
					streetDao.saveOrUpdateAll(list);
					list.clear();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		br.close();
		if (list.size() > 0) {
			streetDao.saveOrUpdateAll(list);
			list.clear();
		}
	}

	@Test
	public void addVillage() throws IOException {
		String filePath = "D:/innjia_work/house/hbase_20171026/villages_1026.csv";
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "GBK"));
		List<Village> list = new ArrayList<Village>();
		String line = null;
		while ((line = br.readLine()) != null) {
			try {
				Village village = new Village();
				String[] data = line.split(",");
				if (StringUtils.isBlank(data[2])) {
					continue;
				}
				Street street = streetDao.getByStreetId(data[1]);
				if (street == null) {
					continue;
				}
				StringBuilder rowKey = new StringBuilder();
				rowKey.append(street.getCityArea().getCity().getProvince().getProvinceName().replace(" ", ""));
				rowKey.append(street.getCityArea().getCity().getCityName().replace(" ", ""));
				rowKey.append(street.getCityArea().getCityAreaName().replace(" ", ""));
				rowKey.append(processStreetNumber(street.getStreetAddress().replace(" ", "")));
				rowKey.append(data[2]);
				village.setRowKey(rowKey.toString());
				village.setAddress(rowKey.toString());
				village.setCreateTime(new Date());
				village.setUpdateTime(village.getCreateTime());
				village.setStreet(street);
				village.setVillageName(data[2]);
				village.setVillageType("");
				village.setVillageId(data[0]);
				System.out.println("====" + JSON.toJSON(village));
				list.add(village);
				if ((list.size() + 1) % 100 == 0) {
					villageDao.saveOrUpdateAll(list);
					list.clear();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		br.close();
		if (list.size() > 0) {
			villageDao.saveOrUpdateAll(list);
			list.clear();
		}
	}

	@Test
	public void addBuilding() throws IOException {
		String filePath = "D:/innjia_work/house/hbase_20171026/buildings_1026.csv";
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "GBK"));
		List<Building> list = new ArrayList<Building>();
		String line = null;
		while ((line = br.readLine()) != null) {
			try {
				Building building = new Building();
				String[] data = line.split(",");
				if (StringUtils.isBlank(data[1])) {
					continue;
				}
				Village village = villageDao.getByVillageId(data[0]);
				if (village == null) {
					continue;
				}
				StringBuilder rowKey = new StringBuilder();
				rowKey.append(village.getStreet().getCityArea().getCity().getProvince().getProvinceName().replace(" ", ""));
				rowKey.append(village.getStreet().getCityArea().getCity().getCityName().replace(" ", ""));
				rowKey.append(village.getStreet().getCityArea().getCityAreaName().replace(" ", ""));
				rowKey.append(processStreetNumber(village.getStreet().getStreetAddress().replace(" ", "")));
				rowKey.append(village.getVillageName());
				rowKey.append(data[1]);
				building.setRowKey(rowKey.toString());
				building.setBuildingId(data[2]);
				building.setCreateTime(new Date());
				building.setUpdateTime(building.getCreateTime());
				building.setBuildingNumber(data[1]);
				building.setVillage(village);
				System.out.println("====" + JSON.toJSON(village));
				list.add(building);
				if ((list.size() + 1) % 100 == 0) {
					buildingDao.saveOrUpdateAll(list);
					list.clear();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		br.close();
		if (list.size() > 0) {
			buildingDao.saveOrUpdateAll(list);
			list.clear();
		}
	}

	@Test
	public void addUnit() throws IOException {
		String filePath = "D:/innjia_work/house/hbase_20171026/units_1026.csv";
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "GBK"));
		List<Unit> list = new ArrayList<Unit>();
		String line = null;
		while ((line = br.readLine()) != null) {
			try {
				Unit unit = new Unit();
				String[] data = line.split(",");
				if (StringUtils.isBlank(data[0])) {
					continue;
				}
				Building building = buildingDao.getByBuildingId(data[2]);
				if (building == null) {
					continue;
				}
				StringBuilder rowKey = new StringBuilder();
				rowKey.append(building.getVillage().getStreet().getCityArea().getCity().getProvince().getProvinceName().replace(" ", ""));
				rowKey.append(building.getVillage().getStreet().getCityArea().getCity().getCityName().replace(" ", ""));
				rowKey.append(building.getVillage().getStreet().getCityArea().getCityAreaName().replace(" ", ""));
				rowKey.append(processStreetNumber(building.getVillage().getStreet().getStreetAddress().replace(" ", "")));
				rowKey.append(building.getVillage().getVillageName());
				rowKey.append(building.getBuildingNumber());
				rowKey.append(data[0]);
				unit.setRowKey(rowKey.toString());
				unit.setUnitId(data[1]);
				unit.setCreateTime(new Date());
				unit.setUpdateTime(unit.getCreateTime());
				unit.setUnitNumber(data[0]);
				unit.setBuilding(building);
				System.out.println("====" + JSON.toJSON(unit));
				list.add(unit);
				if ((list.size() + 1) % 100 == 0) {
					unitDao.saveOrUpdateAll(list);
					list.clear();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		br.close();
		if (list.size() > 0) {
			unitDao.saveOrUpdateAll(list);
			list.clear();
		}
	}

	@Test
	public void addHouse() throws IOException {
		String filePath = "D:/innjia_work/house/hbase_20171026/final_house_102602.csv";
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "GBK"));
		List<House> list = new ArrayList<House>();
		String line = null;
		while ((line = br.readLine()) != null) {
			try {
				House house = new House();
				String[] data = line.split(",");
				if (StringUtils.isBlank(data[0])) {
					continue;
				}
				Unit unit = unitDao.getByUnitId(data[3]);
				if (unit == null) {
					continue;
				}
				StringBuilder rowKey = new StringBuilder();
				rowKey.append(unit.getBuilding().getVillage().getStreet().getCityArea().getCity().getProvince().getProvinceName().replace(" ", ""));
				rowKey.append(unit.getBuilding().getVillage().getStreet().getCityArea().getCity().getCityName().replace(" ", ""));
				rowKey.append(unit.getBuilding().getVillage().getStreet().getCityArea().getCityAreaName().replace(" ", ""));
				rowKey.append(processStreetNumber(unit.getBuilding().getVillage().getStreet().getStreetAddress().replace(" ", "")));
				rowKey.append(unit.getBuilding().getVillage().getVillageName());
				rowKey.append(unit.getBuilding().getBuildingNumber());
				rowKey.append(unit.getUnitNumber());
				rowKey.append(data[0]);
				house.setRowKey(rowKey.toString().trim());
				house.setCreateTime(new Date());
				house.setUpdateTime(house.getCreateTime());
				house.setBuilding(unit.getBuilding());
				house.setHouseSource(HouseSourceEnum.valueOf(data[1]));
				house.setHouseId(data[2]);
				house.setHouseNumber(data[0]);
				house.setUnit(unit);
				house.setVillage(unit.getBuilding().getVillage());
				System.out.println("====" + JSON.toJSON(house));
				list.add(house);
				if ((list.size() + 1) % 100 == 0) {
					houseDao.saveOrUpdateAll(list);
					list.clear();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		br.close();
		if (list.size() > 0) {
			houseDao.saveOrUpdateAll(list);
			list.clear();
		}
	}

	@Test
	public void addHouseRoom() throws IOException {
		String filePath = "D:/innjia_work/house/hbase_20171026/final_house_room_1026.csv";
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "GBK"));
		String line = null;
		while ((line = br.readLine()) != null) {
			try {
				String[] data = line.split(",");
				if (StringUtils.isBlank(data[0])) {
					continue;
				}
				House house = houseDao.getByHouseId(data[2]);
				if (house == null) {
					continue;
				}
				String roomRowKey = house.getRowKey() + data[0];
				HouseRoom houseRoom = houseRoomDao.getByRowKey(roomRowKey);
				if (houseRoom == null || StringUtils.isNotBlank(houseRoom.getId())) {
					// 插入
					houseRoom = new HouseRoom();
					houseRoom.setRowKey(roomRowKey);
					houseRoom.setRoomName(data[0]);
					houseRoom.setHouse(house);
					houseRoom.setRoomId(data[1]);
					houseRoom.setCreateTime(new Date());
					houseRoom.setUpdateTime(houseRoom.getCreateTime());
					String id = houseRoomDao.save(houseRoom);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		br.close();
	}

	private Province validaProvinceName(String provinceName) {
		Province province = provinceDao.getByProvinceName(provinceName);
		if (province != null && StringUtils.isNotBlank(province.getProvinceId())) {
			return province;
		}
		return null;
	}

	private City validaCityName(String cityName, String provinceId) {
		City city = cityDao.getByCityName(cityName, provinceId);
		if (city != null && StringUtils.isNotBlank(city.getCityId())) {
			return city;
		}
		return null;
	}

	private CityArea validaCityAreaName(String cityAreaName, String cityId) {
		CityArea cityArea = cityAreaDao.getByCityAreaName(cityAreaName, cityId);
		if (cityArea != null && StringUtils.isNotBlank(cityArea.getCityAreaId())) {
			return cityArea;
		}
		return null;
	}

	private static String processStreetNumber(String streetNumber) {
		char v = CharUtils.toChar(streetNumber.substring(streetNumber.length() - 1));
		if (Character.isDigit(v)) {
			return streetNumber + "弄";
		} else {
			return streetNumber;
		}
	}

	private static String processBuildingNumber(String buildingNumber) {
		if (buildingNumber == null || buildingNumber.equals("")) {
			return "";
		} else {
			int count = 0;
			for (int i = 0; i < buildingNumber.length(); i++) {
				if (Character.isDigit(buildingNumber.charAt(i))) {
					count++;
				}
			}
			if (count == buildingNumber.length()) {
				return buildingNumber + "幢";
			} else {
				return buildingNumber;
			}

		}
	}

	private static String processUnitNumber(String buildingNumber) {
		if (buildingNumber == null || buildingNumber.equals("")) {
			return "";
		} else {
			int count = 0;
			for (int i = 0; i < buildingNumber.length(); i++) {
				if (Character.isDigit(buildingNumber.charAt(i))) {
					count++;
				}
			}
			if (count == buildingNumber.length()) {
				return buildingNumber + "号";
			} else {
				return buildingNumber;
			}

		}
	}

}
