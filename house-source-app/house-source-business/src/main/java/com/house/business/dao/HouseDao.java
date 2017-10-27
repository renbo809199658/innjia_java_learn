package com.house.business.dao;

import java.util.List;

import org.apache.commons.lang.time.DateFormatUtils;
import org.iframework.commons.utils.validator.ValidatorUtils;
import org.iframework.support.domain.order.Order;
import org.iframework.support.domain.pager.Pager;
import org.iframework.support.spring.hibernate.dao.BaseHibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.house.business.model.House;

/**
 * 房源类
 * 
 * @author zhongqi
 * 
 */
@Repository("houseDao")
public class HouseDao extends BaseHibernateDaoSupport<House, String> {

	@Override
	public List<House> findByModel(House model, Order order, Pager pager) {
		model = model == null ? new House() : model;
		StringBuilder hql = new StringBuilder();
		hql.append("from House c where 1=1");
		hql.append(ValidatorUtils.isNotEmpty(model.getId()) ? " and c.houseId=:houseId " : "");
		hql.append(model.getUnit() != null ? " and c.houseUnit.name='" + model.getUnit() + "' " : "");

		hql.append(ValidatorUtils.isNotEmpty(model.getDateStart()) && ValidatorUtils.isNotEmpty(model.getDateEnd()) ? " and (c.createTime between '"
		    + DateFormatUtils.format(model.getDateStart(), "yyyy-MM-dd HH:mm:ss") + "' and '" + DateFormatUtils.format(model.getDateEnd(), "yyyy-MM-dd HH:mm:ss") + "') " : "");
		hql.append(order != null ? order.toString() : "");
		return this.findByQueryString(hql.toString(), model, pager);
	}

	public House getByHouseId(String houseId) {
		List<House> houses = this.queryHQL("from House p where p.status='AVAILABLE' and p.houseId='" + houseId + "'");
		return (houses != null && houses.size() > 0) ? houses.get(0) : null;
	}

	public House getByRowKey(String rowKey) {
		List<House> houses = this.queryHQL("from House p where p.status='AVAILABLE' and p.rowKey='" + rowKey + "'");
		return (houses != null && houses.size() > 0) ? houses.get(0) : null;
	}

}
