package com.house.business.service;

import java.util.List;

import org.iframework.support.spring.hibernate.service.IBaseServiceSupport;

import com.house.business.model.City;
import com.house.business.model.CityArea;
import com.house.business.model.ExecutiveStreet;
import com.house.business.model.House;
import com.house.business.model.HouseRoom;
import com.house.business.model.Province;

/**
 * 房源业务接口<br>
 * 
 * @author zhongqi
 *
 */

public interface HouseService extends IBaseServiceSupport<House, String> {
	/**
	 * 创建房源
	 * 
	 * @return
	 */
	public House addHouse(House house);

	/**
	 * 创建房源
	 * 
	 * @return
	 */
	public boolean addHouses(List<House> houses);

	/**
	 * 编辑房源
	 * 
	 * @return
	 */
	public boolean editHouse(House house);

	/**
	 * 编辑房间
	 * 
	 * @return
	 */
	public boolean editHouseRoom(HouseRoom houseRoom);

	/**
	 * 获取房源
	 * 
	 * @param houseId
	 * @return
	 */
	public House getHouseByHouseId(String houseId);

	/**
	 * 获取房间
	 * 
	 * @param houseId
	 * @return
	 */
	public HouseRoom getHouseRoomById(String roomId);

	/**
	 * 获取省份
	 * 
	 * @return
	 */
	public List<Province> findAllProvince();

	/**
	 * 获取城市
	 * 
	 * @param provinceId
	 * @return
	 */
	public List<City> findCityByProvinceId(String provinceId);

	/**
	 * 获取区县
	 * 
	 * @param cityId
	 * @return
	 */
	public List<CityArea> findCityAreaByCityId(String cityId);

	/**
	 * 获取行政街道
	 * 
	 * @param cityId
	 * @return
	 */
	public List<ExecutiveStreet> findExecutiveStreetByCityAreaId(String cityAreaId);

}
