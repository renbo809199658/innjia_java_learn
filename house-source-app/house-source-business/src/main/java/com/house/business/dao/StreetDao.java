package com.house.business.dao;

import java.util.List;

import org.apache.commons.lang.time.DateFormatUtils;
import org.iframework.commons.utils.validator.ValidatorUtils;
import org.iframework.support.domain.order.Order;
import org.iframework.support.domain.pager.Pager;
import org.iframework.support.spring.hibernate.dao.BaseHibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.house.business.model.Street;

/**
 * 街道类
 * 
 * @author zhongqi
 * 
 */
@Repository("streetDao")
public class StreetDao extends BaseHibernateDaoSupport<Street, String> {

	@Override
	public List<Street> findByModel(Street model, Order order, Pager pager) {
		model = model == null ? new Street() : model;
		StringBuilder hql = new StringBuilder();
		hql.append("from Street c where 1=1");

		hql.append(ValidatorUtils.isNotEmpty(model.getDateStart()) && ValidatorUtils.isNotEmpty(model.getDateEnd()) ? " and (c.createTime between '"
				+ DateFormatUtils.format(model.getDateStart(), "yyyy-MM-dd HH:mm:ss") + "' and '" + DateFormatUtils.format(model.getDateEnd(), "yyyy-MM-dd HH:mm:ss") + "') " : "");
		hql.append(order != null ? order.toString() : "");
		return this.findByQueryString(hql.toString(), model, pager);
	}

	public Street getByRowKey(String rowKey) {
		List<Street> streets = this.queryHQL("from Street p where p.status='AVAILABLE' and p.rowKey='" + rowKey + "'");
		return (streets != null && streets.size() > 0) ? streets.get(0) : null;
	}

	public Street getByStreetName(String streetName) {
		List<Street> streets = this.queryHQL("from Street p where p.status='AVAILABLE' and p.streetName='" + streetName + "'");
		return (streets != null && streets.size() > 0) ? streets.get(0) : null;
	}
	
	public Street getByStreetId(String streetId) {
		List<Street> streets = this.queryHQL("from Street p where p.status='AVAILABLE' and p.streetId='" + streetId + "'");
		return (streets != null && streets.size() > 0) ? streets.get(0) : null;
	}
}
