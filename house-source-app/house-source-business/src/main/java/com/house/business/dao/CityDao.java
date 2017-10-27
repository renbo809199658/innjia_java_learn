package com.house.business.dao;

import java.util.List;

import org.apache.commons.lang.time.DateFormatUtils;
import org.iframework.commons.utils.validator.ValidatorUtils;
import org.iframework.support.domain.order.Order;
import org.iframework.support.domain.pager.Pager;
import org.iframework.support.spring.hibernate.dao.BaseHibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.house.business.model.City;

/**
 * 城市类
 * 
 * @author zhongqi
 * 
 */
@Repository("cityDao")
public class CityDao extends BaseHibernateDaoSupport<City, String> {

	@Override
	public List<City> findByModel(City model, Order order, Pager pager) {
		model = model == null ? new City() : model;
		StringBuilder hql = new StringBuilder();
		hql.append("from City c where 1=1");

		hql.append(ValidatorUtils.isNotEmpty(model.getDateStart()) && ValidatorUtils.isNotEmpty(model.getDateEnd()) ? " and (c.createTime between '"
		    + DateFormatUtils.format(model.getDateStart(), "yyyy-MM-dd HH:mm:ss") + "' and '" + DateFormatUtils.format(model.getDateEnd(), "yyyy-MM-dd HH:mm:ss") + "') " : "");
		hql.append(order != null ? order.toString() : "");
		return this.findByQueryString(hql.toString(), model, pager);
	}

	public City getByCityId(String cityId) {
		List<City> citys = this.queryHQL("from City c where c.status='AVAILABLE' and c.cityId='" + cityId + "'");
		return (citys != null && citys.size() > 0) ? citys.get(0) : null;
	}

	public City getByCityName(String cityName, String provinceId) {
		List<City> citys = this.queryHQL("from City p where p.status='AVAILABLE' and p.cityName='" + cityName + "' and p.province.provinceId = '" + provinceId + "' ");
		return (citys != null && citys.size() > 0) ? citys.get(0) : null;
	}

	public List<City> findByProvince(String provinceId) {
		List<City> citys = this.queryHQL("from City p where p.status='AVAILABLE' and p.province.provinceId='" + provinceId + "'");
		return citys;
	}

}
