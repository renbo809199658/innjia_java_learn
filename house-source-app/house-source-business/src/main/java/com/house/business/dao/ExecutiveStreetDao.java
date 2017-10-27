package com.house.business.dao;

import java.util.List;

import org.apache.commons.lang.time.DateFormatUtils;
import org.iframework.commons.utils.validator.ValidatorUtils;
import org.iframework.support.domain.order.Order;
import org.iframework.support.domain.pager.Pager;
import org.iframework.support.spring.hibernate.dao.BaseHibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.house.business.model.ExecutiveStreet;

/**
 * 行政街道类
 * 
 * @author zhongqi
 * 
 */
@Repository("executiveStreetDao")
public class ExecutiveStreetDao extends BaseHibernateDaoSupport<ExecutiveStreet, String> {

	@Override
	public List<ExecutiveStreet> findByModel(ExecutiveStreet model, Order order, Pager pager) {
		model = model == null ? new ExecutiveStreet() : model;
		StringBuilder hql = new StringBuilder();
		hql.append("from ExecutiveStreet c where 1=1");

		hql.append(ValidatorUtils.isNotEmpty(model.getDateStart()) && ValidatorUtils.isNotEmpty(model.getDateEnd()) ? " and (c.createTime between '"
		    + DateFormatUtils.format(model.getDateStart(), "yyyy-MM-dd HH:mm:ss") + "' and '" + DateFormatUtils.format(model.getDateEnd(), "yyyy-MM-dd HH:mm:ss") + "') " : "");
		hql.append(order != null ? order.toString() : "");
		return this.findByQueryString(hql.toString(), model, pager);
	}

	public List<ExecutiveStreet> findByCityAreaId(String cityAreaId) {
		return this.queryHQL("from ExecutiveStreet p where p.status='AVAILABLE' and p.cityArea.cityAreaId='" + cityAreaId + "'");
	}

	public ExecutiveStreet getByCityAreaId(String cityAreaId, String streetName) {
		List<ExecutiveStreet> list = this.queryHQL("from ExecutiveStreet p where p.status='AVAILABLE' and p.cityArea.id='" + cityAreaId + "' and p.streetName='" + streetName + "' ");
		return (list != null && list.size() > 0) ? list.get(0) : null;
	}

}
