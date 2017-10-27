package com.house.business.dao;

import java.util.List;

import org.apache.commons.lang.time.DateFormatUtils;
import org.iframework.commons.utils.validator.ValidatorUtils;
import org.iframework.support.domain.order.Order;
import org.iframework.support.domain.pager.Pager;
import org.iframework.support.spring.hibernate.dao.BaseHibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.house.business.model.Unit;

/**
 * 单元类
 * 
 * @author zhongqi
 * 
 */
@Repository("unitDao")
public class UnitDao extends BaseHibernateDaoSupport<Unit, String> {

	@Override
	public List<Unit> findByModel(Unit model, Order order, Pager pager) {
		model = model == null ? new Unit() : model;
		StringBuilder hql = new StringBuilder();
		hql.append("from Unit c where 1=1");
		hql.append(ValidatorUtils.isNotEmpty(model.getId()) ? " and c.id=:id " : "");

		hql.append(ValidatorUtils.isNotEmpty(model.getDateStart()) && ValidatorUtils.isNotEmpty(model.getDateEnd()) ? " and (c.createTime between '"
		    + DateFormatUtils.format(model.getDateStart(), "yyyy-MM-dd HH:mm:ss") + "' and '" + DateFormatUtils.format(model.getDateEnd(), "yyyy-MM-dd HH:mm:ss") + "') " : "");
		hql.append(order != null ? order.toString() : "");
		return this.findByQueryString(hql.toString(), model, pager);
	}

	public Unit getByRowKey(String rowKey) {
		List<Unit> units = this.queryHQL("from Unit p where p.status='AVAILABLE' and p.rowKey='" + rowKey + "'");
		return (units != null && units.size() > 0) ? units.get(0) : null;
	}

	public Unit getByUnitNum(String unitNum) {
		List<Unit> units = this.queryHQL("from Unit p where p.status='AVAILABLE' and p.unitNum='" + unitNum + "'");
		return (units != null && units.size() > 0) ? units.get(0) : null;
	}
	
	public Unit getByUnitId(String unitId) {
		List<Unit> units = this.queryHQL("from Unit p where p.status='AVAILABLE' and p.unitId='" + unitId + "'");
		return (units != null && units.size() > 0) ? units.get(0) : null;
	}
}
