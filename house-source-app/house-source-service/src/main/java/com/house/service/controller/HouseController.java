package com.house.service.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.StringUtils;
import org.iframework.commons.utils.log.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.house.business.model.City;
import com.house.business.model.CityArea;
import com.house.business.model.ExecutiveStreet;
import com.house.business.model.House;
import com.house.business.model.HouseRoom;
import com.house.business.model.Province;
import com.house.business.model.UserDto;
import com.house.business.service.HouseService;
import com.house.business.util.HouseUtils;

@Controller
@RequestMapping("house")
public class HouseController {

	@Autowired
	private HouseService houseService;

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public ModelAndView add(HttpServletRequest request, @RequestBody House house) {
		ModelAndView modelAndView = new ModelAndView("/house/add");
		Log.i("===========新增房源start=============");
		Log.i("==house：" + JSON.toJSONString(house));
		JSONObject result = new JSONObject();
		try {
			if (StringUtils.isBlank(house.getProvinceName())) {
				result.put("code", "1");
				result.put("message", "provinceName不能为空");
				Log.i("====provinceName不能为空====");
				modelAndView.addObject("result", result);
				Log.i("===========新增房源end=============");
				return modelAndView;
			}

			if (StringUtils.isBlank(house.getCityName())) {
				result.put("code", "1");
				result.put("message", "cityName不能为空");
				Log.i("====cityName不能为空====");
				modelAndView.addObject("result", result);
				Log.i("===========新增房源end=============");
				return modelAndView;
			}
			if (StringUtils.isBlank(house.getCityAreaName())) {
				result.put("code", "1");
				result.put("message", "cityAreaName不能为空");
				Log.i("====cityAreaName不能为空====");
				modelAndView.addObject("result", result);
				Log.i("===========新增房源end=============");
				return modelAndView;
			}
			if (house.getHouseSource() == null) {
				result.put("code", "1");
				result.put("message", "houseSource不能为空");
				Log.i("====houseSource不能为空====");
				modelAndView.addObject("result", result);
				Log.i("===========新增房源end=============");
				return modelAndView;
			}
			if (StringUtils.isBlank(ObjectUtils.toString(house.getStreetAddress()).replaceAll(" ", "").replaceAll("null", ""))) {
				house.setStreetAddress("100000");
			}
			if (StringUtils.isBlank(ObjectUtils.toString(house.getVillageName()).replaceAll(" ", "").replaceAll("null", ""))) {
				house.setVillageName("100000");
			}
			if (StringUtils.isBlank(ObjectUtils.toString(house.getBuildingNumber()).replaceAll(" ", "").replaceAll("null", ""))) {
				house.setBuildingNumber("100000");
			}
			if (StringUtils.isBlank(ObjectUtils.toString(house.getUnitNumber()).replaceAll(" ", "").replaceAll("null", ""))) {
				house.setUnitNumber("100000");
			}
			if (StringUtils.isBlank(ObjectUtils.toString(house.getHouseNumber()).replaceAll(" ", "").replaceAll("null", ""))) {
				house.setHouseNumber("100000");
			}
			House resultHouse = houseService.addHouse(house);
			HouseUtils.filterHouseDefaultValue(Arrays.asList(resultHouse));
			result.put("code", "0");
			result.put("message", "创建成功");
			result.put("data", resultHouse);
		} catch (RuntimeException e) {
			result.put("code", "1");
			result.put("message", e.getMessage());
			result.put("data", new House());
			Log.e("======新增房源出错：" + e.getMessage());
		} catch (Exception e) {
			result.put("code", "1");
			result.put("message", e.getMessage());
			result.put("data", new House());
			Log.e("======新增房源出错：" + e.getMessage());
		}
		modelAndView.addObject("result", result);
		Log.i("===========新增房源end=============");
		return modelAndView;
	}

	@RequestMapping(value = "query", method = RequestMethod.GET)
	public ModelAndView query(HttpServletRequest request, String houseId) {
		ModelAndView modelAndView = new ModelAndView("/house/list");
		Log.i("===========查询房源start=============");
		Log.i("==houseId：" + houseId);
		JSONObject result = new JSONObject();
		if (StringUtils.isBlank(houseId)) {
			result.put("code", "1");
			result.put("message", "cityName不能为空");
			Log.i("====cityName不能为空====");
			modelAndView.addObject("result", result);
			Log.i("===========新增房源end=============");
			return modelAndView;
		}
		House house = houseService.getHouseByHouseId(houseId);
		if (house != null) {
			HouseUtils.filterHouseDefaultValue(Arrays.asList(house));
			result.put("data", house);
		} else {
			result.put("data", null);
		}
		result.put("code", "0");
		result.put("message", "成功");

		modelAndView.addObject("result", result);
		Log.i("===========查询房源end=============");
		return modelAndView;
	}

	@RequestMapping(value = "queryRoom", method = RequestMethod.GET)
	public ModelAndView queryRoom(HttpServletRequest request, String roomId) {
		ModelAndView modelAndView = new ModelAndView("/house/room");
		Log.i("===========查询房间start=============");
		Log.i("==roomId：" + roomId);
		JSONObject result = new JSONObject();
		if (StringUtils.isBlank(roomId)) {
			result.put("code", "1");
			result.put("message", "cityName不能为空");
			Log.i("====cityName不能为空====");
			modelAndView.addObject("result", result);
			Log.i("===========查询房间end=============");
			return modelAndView;
		}
		HouseRoom houseRoom = houseService.getHouseRoomById(roomId);
		if (houseRoom == null || StringUtils.isBlank(houseRoom.getRoomId())) {
			result.put("code", "1");
			result.put("message", "roomId不存在");
			Log.i("====roomId不存在====");
			modelAndView.addObject("result", result);
			Log.i("===========查询房间end=============");
			return modelAndView;
		}
		HouseUtils.filterHouseDefaultValue(Arrays.asList(houseRoom.getHouse()));
		result.put("code", "0");
		result.put("message", "成功");
		result.put("data", houseRoom);
		modelAndView.addObject("result", result);
		Log.i("===========查询房间end=============");
		return modelAndView;
	}

	@RequestMapping(value = "updateRoom", method = RequestMethod.POST)
	public @ResponseBody JSONObject updateRoom(HttpServletRequest request, @RequestBody HouseRoom houseRoom) {
		Log.i("===========更新房间start=============");
		Log.i("==houseRoom：" + JSON.toJSONString(houseRoom));
		JSONObject result = new JSONObject();
		try {
			if (houseRoom == null) {
				result.put("code", "1");
				result.put("message", "参数为空");
				return result;
			}
			if (StringUtils.isBlank(houseRoom.getId())) {
				result.put("code", "1");
				result.put("message", "ID为空");
				return result;
			}

			if (StringUtils.isBlank(houseRoom.getRoomName())) {
				result.put("code", "1");
				result.put("message", "房间号为空");
				return result;
			}
			boolean updateResult = houseService.editHouseRoom(houseRoom);
			if (updateResult) {
				result.put("code", "0");
				result.put("message", "成功");
			} else {
				result.put("code", "1");
				result.put("message", "失败");
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			result.put("code", "1");
			result.put("message", e.getMessage());
		}
		Log.i("===========更新房间end=============");
		return result;
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public @ResponseBody JSONObject update(HttpServletRequest request, @RequestBody House house) {
		Log.i("===========更新房源start=============");
		Log.i("==house：" + JSON.toJSONString(house));
		JSONObject result = new JSONObject();
		try {
			if (StringUtils.isBlank(house.getId())) {
				result.put("code", "1");
				result.put("message", "id不能为空");
				return result;
			}
			if (StringUtils.isBlank(ObjectUtils.toString(house.getStreetAddress()).replaceAll(" ", "").replaceAll("null", ""))) {
				house.setStreetAddress("100000");
			}
			if (StringUtils.isBlank(ObjectUtils.toString(house.getVillageName()).replaceAll(" ", "").replaceAll("null", ""))) {
				house.setVillageName("100000");
			}
			if (StringUtils.isBlank(ObjectUtils.toString(house.getBuildingNumber()).replaceAll(" ", "").replaceAll("null", ""))) {
				house.setBuildingNumber("100000");
			}
			if (StringUtils.isBlank(ObjectUtils.toString(house.getUnitNumber()).replaceAll(" ", "").replaceAll("null", ""))) {
				house.setUnitNumber("100000");
			}
			if (StringUtils.isBlank(ObjectUtils.toString(house.getHouseNumber()).replaceAll(" ", "").replaceAll("null", ""))) {
				house.setHouseNumber("100000");
			}
			boolean updateResult = houseService.editHouse(house);
			if (updateResult) {
				result.put("code", "0");
				result.put("message", "成功");
			} else {
				result.put("code", "1");
				result.put("message", "失败");
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			result.put("code", "1");
			result.put("message", e.getMessage());
		}
		Log.i("===========更新房源end=============");
		return result;
	}

	@RequestMapping(value = "queryProvince", method = RequestMethod.GET)
	public ModelAndView queryProvince(HttpServletRequest request) {
		Log.i("===========查询省份start=============");
		ModelAndView modelAndView = new ModelAndView("/house/province");
		JSONObject result = new JSONObject();
		List<Province> provinces = houseService.findAllProvince();
		result.put("code", "0");
		result.put("message", "成功");
		result.put("data", provinces);
		modelAndView.addObject("result", result);
		Log.i("===========查询省份end=============");
		return modelAndView;
	}

	@RequestMapping(value = "queryCity", method = RequestMethod.GET)
	public ModelAndView queryCity(HttpServletRequest request, String provinceId) {
		Log.i("===========查询城市start=============");
		ModelAndView modelAndView = new ModelAndView("/house/city");
		JSONObject result = new JSONObject();
		List<City> citys = houseService.findCityByProvinceId(provinceId);
		result.put("code", "0");
		result.put("message", "成功");
		result.put("data", citys);
		modelAndView.addObject("result", result);
		Log.i("===========查询城市end=============");
		return modelAndView;
	}

	@RequestMapping(value = "queryCityArea", method = RequestMethod.GET)
	public ModelAndView queryCityArea(HttpServletRequest request, String cityId) {
		Log.i("===========查询城市区县start=============");
		ModelAndView modelAndView = new ModelAndView("/house/cityArea");
		JSONObject result = new JSONObject();
		List<CityArea> cityAreas = houseService.findCityAreaByCityId(cityId);
		result.put("code", "0");
		result.put("message", "成功");
		result.put("data", cityAreas);
		modelAndView.addObject("result", result);
		Log.i("===========查询城市区县end=============");
		return modelAndView;
	}

	@RequestMapping(value = "queryStreet", method = RequestMethod.GET)
	public ModelAndView queryStreet(HttpServletRequest request, String cityAreaId) {
		Log.i("===========查询行政街道start=============");
		ModelAndView modelAndView = new ModelAndView("/house/street");
		JSONObject result = new JSONObject();
		List<ExecutiveStreet> executiveStreets = houseService.findExecutiveStreetByCityAreaId(cityAreaId);
		result.put("code", "0");
		result.put("message", "成功");
		result.put("data", executiveStreets);
		modelAndView.addObject("result", result);
		Log.i("===========查询行政街道end=============");
		return modelAndView;
	}

	@RequestMapping(value = "testPost", method = RequestMethod.POST)
	public void testPost(HttpServletRequest request, @RequestBody UserDto data) {
		Log.i("===========查询行政街道start=============");
		System.out.println(JSON.toJSON(data));
	}

}
