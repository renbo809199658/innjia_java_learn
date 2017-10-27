package com.house.business.dao;

import java.util.List;

import org.apache.commons.lang.time.DateFormatUtils;
import org.iframework.commons.utils.validator.ValidatorUtils;
import org.iframework.support.domain.order.Order;
import org.iframework.support.domain.pager.Pager;
import org.iframework.support.spring.hibernate.dao.BaseHibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.house.business.model.HouseRoom;

/**
 * 房源房门类
 * 
 * @author zhongqi
 * 
 */
@Repository("houseRoomDao")
public class HouseRoomDao extends BaseHibernateDaoSupport<HouseRoom, String> {

	@Override
	public List<HouseRoom> findByModel(HouseRoom model, Order order, Pager pager) {
		model = model == null ? new HouseRoom() : model;
		StringBuilder hql = new StringBuilder();
		hql.append("from HouseRoom c where 1=1");
		hql.append(ValidatorUtils.isNotEmpty(model.getId()) ? " and c.id=:id " : "");

		hql.append(ValidatorUtils.isNotEmpty(model.getDateStart()) && ValidatorUtils.isNotEmpty(model.getDateEnd()) ? " and (c.createTime between '"
		    + DateFormatUtils.format(model.getDateStart(), "yyyy-MM-dd HH:mm:ss") + "' and '" + DateFormatUtils.format(model.getDateEnd(), "yyyy-MM-dd HH:mm:ss") + "') " : "");
		hql.append(order != null ? order.toString() : "");
		return this.findByQueryString(hql.toString(), model, pager);
	}

	public HouseRoom getByRowKey(String rowKey) {
		List<HouseRoom> houseRooms = this.queryHQL("from HouseRoom p where p.status='AVAILABLE' and p.rowKey='" + rowKey + "'");
		return (houseRooms != null && houseRooms.size() > 0) ? houseRooms.get(0) : null;
	}

	public HouseRoom getByRoomId(String roomId) {
		List<HouseRoom> houses = this.queryHQL("from HouseRoom p where p.status='AVAILABLE' and p.roomId='" + roomId + "'");
		return (houses != null && houses.size() > 0) ? houses.get(0) : null;
	}

	public HouseRoom getByIdName(String id, String roomName) {
		List<HouseRoom> houseRooms = this.queryHQL("from HouseRoom p where p.status='AVAILABLE' and p.roomName='" + roomName + "' and p.id='" + id + "' ");
		return (houseRooms != null && houseRooms.size() > 0) ? houseRooms.get(0) : null;
	}

}
