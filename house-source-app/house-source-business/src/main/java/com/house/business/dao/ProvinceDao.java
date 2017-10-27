package com.house.business.dao;

import java.util.List;

import org.apache.commons.lang.time.DateFormatUtils;
import org.iframework.commons.utils.validator.ValidatorUtils;
import org.iframework.support.domain.order.Order;
import org.iframework.support.domain.pager.Pager;
import org.iframework.support.spring.hibernate.dao.BaseHibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.house.business.model.Province;

/**
 * 省份类
 * 
 * @author zhongqi
 * 
 */
@Repository("provinceDao")
public class ProvinceDao extends BaseHibernateDaoSupport<Province, String> {

	@Override
	public List<Province> findByModel(Province model, Order order, Pager pager) {
		model = model == null ? new Province() : model;
		StringBuilder hql = new StringBuilder();
		hql.append("from Province c where 1=1");

		hql.append(ValidatorUtils.isNotEmpty(model.getDateStart()) && ValidatorUtils.isNotEmpty(model.getDateEnd()) ? " and (c.createTime between '"
				+ DateFormatUtils.format(model.getDateStart(), "yyyy-MM-dd HH:mm:ss") + "' and '" + DateFormatUtils.format(model.getDateEnd(), "yyyy-MM-dd HH:mm:ss") + "') " : "");
		hql.append(order != null ? order.toString() : "");
		return this.findByQueryString(hql.toString(), model, pager);
	}

	public Province getByProvinceId(String provinceId) {
		List<Province> provinces = this.queryHQL("from Province p where p.status='AVAILABLE' and p.provinceId='" + provinceId + "'");
		return (provinces != null && provinces.size() > 0) ? provinces.get(0) : null;
	}
	
	public Province getByProvinceName(String provinceName) {
		List<Province> provinces = this.queryHQL("from Province p where p.status='AVAILABLE' and p.provinceName='" + provinceName + "'");
		return (provinces != null && provinces.size() > 0) ? provinces.get(0) : null;
	}

	
	public List<Province> findAll() {
		List<Province> provinces = this.queryHQL("from Province p where p.status='AVAILABLE' ");
		return provinces;
	}
}
