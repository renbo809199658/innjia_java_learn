package com.house.business.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang.CharUtils;
import org.apache.commons.lang.StringUtils;
import org.iframework.commons.utils.log.Log;
import org.iframework.support.spring.hibernate.service.BaseServiceSupport;
import org.springframework.stereotype.Service;

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
import com.house.business.service.HouseService;

/**
 * 房源业务接口<br>
 * 
 * @author zhongqi
 *
 */
@Service("houseService")
public class HouseServiceImpl extends BaseServiceSupport<House, String> implements HouseService {

	@Resource(name = "houseDao")
	private HouseDao houseDao;

	@Resource(name = "provinceDao")
	private ProvinceDao provinceDao;

	@Resource(name = "cityDao")
	private CityDao cityDao;

	@Resource(name = "cityAreaDao")
	private CityAreaDao cityAreaDao;

	@Resource(name = "streetDao")
	private StreetDao streetDao;

	@Resource(name = "villageDao")
	private VillageDao villageDao;

	@Resource(name = "buildingDao")
	private BuildingDao buildingDao;

	@Resource(name = "unitDao")
	private UnitDao unitDao;

	@Resource(name = "houseRoomDao")
	private HouseRoomDao houseRoomDao;

	@Resource(name = "executiveStreetDao")
	private ExecutiveStreetDao executiveStreetDao;

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

	private Street validateAndCreateStreet(House house, CityArea cityArea) {
		StringBuilder rowKey = new StringBuilder();
		rowKey.append(house.getProvinceName().replace(" ", ""));
		rowKey.append(house.getCityName().replace(" ", ""));
		rowKey.append(house.getCityAreaName().replace(" ", ""));
		rowKey.append(processStreetNumber(house.getStreetAddress().replace(" ", "")));
		Street street = streetDao.getByRowKey(rowKey.toString().trim());
		if (street != null && StringUtils.isNotBlank(street.getId())) {
			return street;
		} else {
			Street newStreet = new Street();
			newStreet.setStreetAddress(house.getStreetAddress());
			newStreet.setStreetName(house.getStreetName());
			newStreet.setCreateTime(new Date());
			newStreet.setUpdateTime(newStreet.getCreateTime());
			newStreet.setCityArea(cityArea);
			newStreet.setRowKey(rowKey.toString());
			String id = streetDao.save(newStreet);
			newStreet.setId(id);
			return newStreet;
		}
	}

	private void validateAndCreateExecutiveStreet(String streetName, CityArea cityArea) {
		ExecutiveStreet executiveStreet = executiveStreetDao.getByCityAreaId(cityArea.getCityAreaId(), streetName);
		if (executiveStreet == null) {
			ExecutiveStreet street = new ExecutiveStreet();
			street.setCityArea(cityArea);
			street.setStreetName(StringUtils.trim(streetName));
			street.setCreateTime(new Date());
			street.setUpdateTime(street.getCreateTime());
			executiveStreetDao.save(street);
		}
	}

	private Village validateAndCreateVillage(House house, Street street) {
		StringBuilder rowKey = new StringBuilder();
		rowKey.append(house.getProvinceName().replace(" ", ""));
		rowKey.append(house.getCityName().replace(" ", ""));
		rowKey.append(house.getCityAreaName().replace(" ", ""));
		rowKey.append(processStreetNumber(house.getStreetAddress().replace(" ", "")));
		rowKey.append(house.getVillageName().replace(" ", ""));
		Village model = villageDao.getByRowKey(rowKey.toString().trim());
		if (model != null && StringUtils.isNotBlank(model.getId())) {
			return model;
		} else {
			Village village = new Village();
			village.setAddress(rowKey.toString());
			village.setRowKey(rowKey.toString().trim());
			village.setVillageName(StringUtils.trim(house.getVillageName()));
			village.setVillageType("");
			village.setStreet(street);
			village.setCreateTime(new Date());
			village.setUpdateTime(village.getCreateTime());
			String id = villageDao.save(village);
			village.setId(id);
			return village;
		}
	}

	private Building validateAndCreateBuilding(House house, Village village) {
		StringBuilder rowKey = new StringBuilder();
		rowKey.append(house.getProvinceName().replace(" ", ""));
		rowKey.append(house.getCityName().replace(" ", ""));
		rowKey.append(house.getCityAreaName().replace(" ", ""));
		rowKey.append(processStreetNumber(house.getStreetAddress().replace(" ", "")));
		rowKey.append(house.getVillageName().replace(" ", ""));
		rowKey.append(processBuildingNumber(house.getBuildingNumber().replace(" ", "")));
		Building model = buildingDao.getByRowKey(rowKey.toString().trim());
		if (model != null && StringUtils.isNotBlank(model.getId())) {
			return model;
		} else {
			Building building = new Building();
			building.setVillage(village);
			building.setBuildingNumber(house.getBuildingNumber());
			building.setRowKey(rowKey.toString().trim());
			building.setCreateTime(new Date());
			building.setUpdateTime(building.getCreateTime());
			String id = buildingDao.save(building);
			building.setId(id);
			return building;
		}
	}

	private Unit validateAndCreateUnit(House house, Building building) {
		StringBuilder rowKey = new StringBuilder();
		rowKey.append(house.getProvinceName().replace(" ", ""));
		rowKey.append(house.getCityName().replace(" ", ""));
		rowKey.append(house.getCityAreaName().replace(" ", ""));
		rowKey.append(processStreetNumber(house.getStreetAddress().replace(" ", "")));
		rowKey.append(house.getVillageName().replace(" ", ""));
		rowKey.append(processBuildingNumber(house.getBuildingNumber().replace(" ", "")));
		rowKey.append(processUnitNumber(house.getUnitNumber().replace(" ", "")));
		Unit model = unitDao.getByRowKey(rowKey.toString().trim());
		if (model != null && StringUtils.isNotBlank(model.getId())) {
			return model;
		} else {
			Unit unit = new Unit();
			unit.setBuilding(building);
			unit.setUnitNumber(house.getUnitNumber());
			unit.setRowKey(rowKey.toString().trim());
			unit.setCreateTime(new Date());
			unit.setUpdateTime(unit.getCreateTime());
			String id = unitDao.save(unit);
			unit.setId(id);
			return unit;
		}
	}

	private List<HouseRoom> validateAndCreateHouseRoom(House house) {
		List<HouseRoom> list = new ArrayList<>();
		List<HouseRoom> rooms = house.getHouseRooms();
		if (rooms != null && rooms.size() > 0) {
			for (HouseRoom room : rooms) {
				if (StringUtils.isBlank(room.getRoomName())) {
					continue;
				}
				String roomRowKey = house.getRowKey() + room.getRoomName();
				HouseRoom houseRoom = houseRoomDao.getByRowKey(roomRowKey);
				if (houseRoom != null && StringUtils.isNotBlank(houseRoom.getId())) {
					list.add(houseRoom);
				} else {
					// 插入
					houseRoom = new HouseRoom();
					houseRoom.setRoomName(room.getRoomName());
					houseRoom.setHouse(house);
					houseRoom.setRoomId(UUID.randomUUID().toString().replaceAll("-", ""));
					houseRoom.setCreateTime(new Date());
					houseRoom.setUpdateTime(houseRoom.getCreateTime());
					houseRoom.setRowKey(roomRowKey);
					String id = houseRoomDao.save(houseRoom);
					houseRoom.setId(id);
					list.add(houseRoom);
					Log.i("创建" + house.getRowKey() + "," + room.getRoomName() + "房间成功");
				}
			}
		}
		return list;
	}

	@Override
	public House addHouse(House house) {
		Province province = validaProvinceName(house.getProvinceName());
		if (province != null && StringUtils.isBlank(province.getProvinceId())) {
			throw new RuntimeException("省份不存在");
		}
		City city = validaCityName(house.getCityName(), province.getProvinceId());
		if (city != null && StringUtils.isBlank(city.getCityId())) {
			throw new RuntimeException("城市不存在");
		}
		CityArea cityArea = validaCityAreaName(house.getCityAreaName(), city.getCityId());
		if (cityArea != null && StringUtils.isBlank(cityArea.getCityAreaId())) {
			throw new RuntimeException("区县不存在");
		}
		validateAndCreateExecutiveStreet(house.getStreetName(), cityArea);
		Street street = validateAndCreateStreet(house, cityArea);
		Village village = validateAndCreateVillage(house, street);
		Building building = validateAndCreateBuilding(house, village);
		Unit unit = validateAndCreateUnit(house, building);
		unit.setBuilding(building);
		// 开始创建房源
		StringBuilder rowKey = new StringBuilder();
		rowKey.append(house.getProvinceName().replace(" ", ""));
		rowKey.append(house.getCityName().replace(" ", ""));
		rowKey.append(house.getCityAreaName().replace(" ", ""));
		rowKey.append(processStreetNumber(house.getStreetAddress().replace(" ", "")));
		rowKey.append(house.getVillageName().replace(" ", ""));
		rowKey.append(processBuildingNumber(house.getBuildingNumber().replace(" ", "")));
		rowKey.append(processUnitNumber(house.getUnitNumber().replace(" ", "")));
		rowKey.append(house.getHouseNumber().replace(" ", ""));
		House model = houseDao.getByRowKey(rowKey.toString().trim());
		if (model != null && StringUtils.isNotBlank(model.getId())) {
			house.setId(model.getId());
			house.setRowKey(model.getRowKey());
			house.setBuilding(building);
			house.setUnit(unit);
			house.setHouseId(model.getHouseId());
			house.setVillage(village);
		} else {
			house.setRowKey(rowKey.toString().trim());
			house.setCreateTime(new Date());
			house.setUpdateTime(house.getCreateTime());
			house.setBuilding(building);
			house.setHouseId(UUID.randomUUID().toString().replaceAll("-", ""));
			house.setUnit(unit);
			house.setVillage(village);
			String id = houseDao.save(house);
			house.setId(id);
		}
		List<HouseRoom> roomList = validateAndCreateHouseRoom(house);
		house.setHouseRooms(roomList);
		house.setBuildingNumber(building.getBuildingNumber());
		house.setUnitNumber(unit.getUnitNumber());
		house.setVillageName(village.getVillageName());
		return house;
	}

	@Override
	public boolean addHouses(List<House> houses) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean editHouse(House house) {
		Province province = null;
		if (StringUtils.isNotBlank(house.getProvinceName())) {
			province = validaProvinceName(house.getProvinceName());
			if (province != null && StringUtils.isBlank(province.getProvinceId())) {
				throw new RuntimeException("省份不存在");
			}
		}
		City city = null;
		if (StringUtils.isNotBlank(house.getCityName())) {
			city = validaCityName(house.getCityName(), province.getProvinceId());
			if (city != null && StringUtils.isBlank(city.getCityId())) {
				throw new RuntimeException("城市不存在");
			}
		}
		CityArea cityArea = null;
		if (StringUtils.isNotBlank(house.getCityAreaName())) {
			cityArea = validaCityAreaName(house.getCityAreaName(), city.getCityId());
			if (cityArea != null && StringUtils.isBlank(cityArea.getCityAreaId())) {
				throw new RuntimeException("区县不存在");
			}
		}
		Street street = validateAndCreateStreet(house, cityArea);
		Village village = validateAndCreateVillage(house, street);
		Building building = validateAndCreateBuilding(house, village);
		Unit unit = validateAndCreateUnit(house, building);

		StringBuilder rowKey = new StringBuilder();
		rowKey.append(house.getProvinceName().replace(" ", ""));
		rowKey.append(house.getCityName().replace(" ", ""));
		rowKey.append(house.getCityAreaName().replace(" ", ""));
		rowKey.append(processStreetNumber(house.getStreetAddress().replace(" ", "")));
		rowKey.append(house.getVillageName().replace(" ", ""));
		rowKey.append(processBuildingNumber(house.getBuildingNumber().replace(" ", "")));
		rowKey.append(processUnitNumber(house.getUnitNumber().replace(" ", "")));
		rowKey.append(house.getHouseNumber().replace(" ", ""));
		house.setRowKey(rowKey.toString());
		house.setUpdateTime(new Date());
		house.setBuilding(building);
		house.setUnit(unit);
		house.setVillage(village);
		// 沟通houseId拿到主key
		House byHouseId = houseDao.getByHouseId(house.getId());
		house.setId(byHouseId.getId());
		boolean update = houseDao.update(house);
		return update;
	}

	@Override
	public House getHouseByHouseId(String houseId) {
		House house = houseDao.getByHouseId(houseId);
		return house;
	}

	@Override
	public HouseRoom getHouseRoomById(String roomId) {
		HouseRoom houseRoom = houseRoomDao.getByRoomId(roomId);
		return houseRoom;
	}

	@Override
	public boolean editHouseRoom(HouseRoom houseRoom) {
		HouseRoom room = houseRoomDao.getByIdName(houseRoom.getId(), houseRoom.getRoomName());
		if (room != null) {
			throw new RuntimeException("要更新的房间号已经存在！");
		}
		HouseRoom room2 = houseRoomDao.getById(HouseRoom.class, houseRoom.getId());
		if (room2 == null) {
			throw new RuntimeException("房间不存在！检查id");
		}
		houseRoom.setRowKey(room2.getHouse().getRowKey() + houseRoom.getRoomName());
		boolean update = houseRoomDao.update(houseRoom);
		return update;
	}

	@Override
	public List<Province> findAllProvince() {
		return provinceDao.findAll();
	}

	@Override
	public List<City> findCityByProvinceId(String provinceId) {
		List<City> list = cityDao.findByProvince(provinceId);
		return list;
	}

	@Override
	public List<CityArea> findCityAreaByCityId(String cityId) {
		return cityAreaDao.findByCityId(cityId);
	}

	@Override
	public List<ExecutiveStreet> findExecutiveStreetByCityAreaId(String cityAreaId) {
		return executiveStreetDao.findByCityAreaId(cityAreaId);
	}

}
