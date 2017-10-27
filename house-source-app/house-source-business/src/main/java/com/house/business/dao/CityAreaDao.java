package com.house.business.dao;

import java.util.List;

import org.apache.commons.lang.time.DateFormatUtils;
import org.iframework.commons.utils.validator.ValidatorUtils;
import org.iframework.support.domain.order.Order;
import org.iframework.support.domain.pager.Pager;
import org.iframework.support.spring.hibernate.dao.BaseHibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.house.business.model.CityArea;

/**
 * 城市区县类
 * 
 * @author zhongqi
 * 
 */
@Repository("cityAreaDao")
public class CityAreaDao extends BaseHibernateDaoSupport<CityArea, String> {

	@Override
	public List<CityArea> findByModel(CityArea model, Order order, Pager pager) {
		model = model == null ? new CityArea() : model;
		StringBuilder hql = new StringBuilder();
		hql.append("from CityArea c where 1=1");

		hql.append(ValidatorUtils.isNotEmpty(model.getDateStart()) && ValidatorUtils.isNotEmpty(model.getDateEnd()) ? " and (c.createTime between '"
		    + DateFormatUtils.format(model.getDateStart(), "yyyy-MM-dd HH:mm:ss") + "' and '" + DateFormatUtils.format(model.getDateEnd(), "yyyy-MM-dd HH:mm:ss") + "') " : "");
		hql.append(order != null ? order.toString() : "");
		return this.findByQueryString(hql.toString(), model, pager);
	}

	public CityArea getByCityId(String cityAreaId) {
		List<CityArea> citys = this.queryHQL("from CityArea c where c.status='AVAILABLE' and c.cityAreaId='" + cityAreaId + "'");
		return (citys != null && citys.size() > 0) ? citys.get(0) : null;
	}

	public CityArea getByCityAreaName(String cityAreaName, String cityId) {
		List<CityArea> citys = this.queryHQL("from CityArea p where p.status='AVAILABLE' and p.cityAreaName='" + cityAreaName + "' and p.city.cityId='" + cityId + "' ");
		return (citys != null && citys.size() > 0) ? citys.get(0) : null;
	}

	public List<CityArea> findByCityId(String cityId) {
		List<CityArea> citys = this.queryHQL("from CityArea p where p.status='AVAILABLE' and p.city.cityId='" + cityId + "'");
		return citys;
	}
}
