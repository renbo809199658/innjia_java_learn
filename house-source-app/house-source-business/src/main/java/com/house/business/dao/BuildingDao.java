package com.house.business.dao;

import java.util.List;

import org.apache.commons.lang.time.DateFormatUtils;
import org.iframework.commons.utils.validator.ValidatorUtils;
import org.iframework.support.domain.order.Order;
import org.iframework.support.domain.pager.Pager;
import org.iframework.support.spring.hibernate.dao.BaseHibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.house.business.model.Building;

/**
 * 楼栋类
 * 
 * @author zhongqi
 * 
 */
@Repository("buildingDao")
public class BuildingDao extends BaseHibernateDaoSupport<Building, String> {

	@Override
	public List<Building> findByModel(Building model, Order order, Pager pager) {
		model = model == null ? new Building() : model;
		StringBuilder hql = new StringBuilder();
		hql.append("from Building c where 1=1");
		hql.append(ValidatorUtils.isNotEmpty(model.getId()) ? " and c.id=:id " : "");

		hql.append(ValidatorUtils.isNotEmpty(model.getDateStart()) && ValidatorUtils.isNotEmpty(model.getDateEnd()) ? " and (c.createTime between '"
		    + DateFormatUtils.format(model.getDateStart(), "yyyy-MM-dd HH:mm:ss") + "' and '" + DateFormatUtils.format(model.getDateEnd(), "yyyy-MM-dd HH:mm:ss") + "') " : "");
		hql.append(order != null ? order.toString() : "");
		return this.findByQueryString(hql.toString(), model, pager);
	}

	public Building getByRowKey(String rowKey) {
		List<Building> villages = this.queryHQL("from Building p where p.status='AVAILABLE' and p.rowKey='" + rowKey + "'");
		return (villages != null && villages.size() > 0) ? villages.get(0) : null;
	}

	public Building getByBuildingNum(String buildingNum) {
		List<Building> buildings = this.queryHQL("from Building p where p.status='AVAILABLE' and p.buildingNum='" + buildingNum + "'");
		return (buildings != null && buildings.size() > 0) ? buildings.get(0) : null;
	}

	public Building getByBuildingId(String buildingId) {
		List<Building> buildings = this.queryHQL("from Building p where p.status='AVAILABLE' and p.buildingId='" + buildingId + "'");
		return (buildings != null && buildings.size() > 0) ? buildings.get(0) : null;
	}

}
