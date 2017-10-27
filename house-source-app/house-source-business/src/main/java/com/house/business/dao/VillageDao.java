package com.house.business.dao;

import java.util.List;

import org.apache.commons.lang.time.DateFormatUtils;
import org.iframework.commons.utils.validator.ValidatorUtils;
import org.iframework.support.domain.order.Order;
import org.iframework.support.domain.pager.Pager;
import org.iframework.support.spring.hibernate.dao.BaseHibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.house.business.model.Village;

/**
 * 小区类
 * 
 * @author zhongqi
 * 
 */
@Repository("villageDao")
public class VillageDao extends BaseHibernateDaoSupport<Village, String> {

	@Override
	public List<Village> findByModel(Village model, Order order, Pager pager) {
		model = model == null ? new Village() : model;
		StringBuilder hql = new StringBuilder();
		hql.append("from Village c where 1=1");
		hql.append(ValidatorUtils.isNotEmpty(model.getId()) ? " and c.id=:id " : "");

		hql.append(ValidatorUtils.isNotEmpty(model.getDateStart()) && ValidatorUtils.isNotEmpty(model.getDateEnd()) ? " and (c.createTime between '"
				+ DateFormatUtils.format(model.getDateStart(), "yyyy-MM-dd HH:mm:ss") + "' and '" + DateFormatUtils.format(model.getDateEnd(), "yyyy-MM-dd HH:mm:ss") + "') " : "");
		hql.append(order != null ? order.toString() : "");
		return this.findByQueryString(hql.toString(), model, pager);
	}

	public Village getByRowKey(String rowKey) {
		List<Village> villages = this.queryHQL("from Village p where p.status='AVAILABLE' and p.rowKey='" + rowKey + "'");
		return (villages != null && villages.size() > 0) ? villages.get(0) : null;
	}

	public Village getByVillageName(String villageName) {
		List<Village> villages = this.queryHQL("from Village p where p.status='AVAILABLE' and p.villageName='" + villageName + "'");
		return (villages != null && villages.size() > 0) ? villages.get(0) : null;
	}
	
	public Village getByVillageId(String villageId) {
		List<Village> villages = this.queryHQL("from Village p where p.status='AVAILABLE' and p.villageId='" + villageId + "'");
		return (villages != null && villages.size() > 0) ? villages.get(0) : null;
	}

}
