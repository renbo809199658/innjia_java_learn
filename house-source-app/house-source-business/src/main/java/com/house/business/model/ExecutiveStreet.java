package com.house.business.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.iframework.support.spring.hibernate.model.BaseHibernateModelSupport;

/**
 * 行政街道
 * @author wangchaoqun
 * @date ：2017年8月15日 上午10:51:22
 */
@Entity
@Table(name = "executive_street")
@org.hibernate.annotations.Table(appliesTo = "executive_street", comment = "行政街道")
public class ExecutiveStreet extends BaseHibernateModelSupport {

	private static final long serialVersionUID = -234519379147400568L;

	/**
	 * 行政街道名称
	 */
	@Column(columnDefinition = "varchar(200)  comment '行政街道名称'")
	private String streetName;
	/**
	 * 城市区县id
	 */
	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.REFRESH }, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "cityAreaId")
	private CityArea cityArea;
	
	public String getStreetName() {
		return streetName;
	}
	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}
	public CityArea getCityArea() {
		return cityArea;
	}
	public void setCityArea(CityArea cityArea) {
		this.cityArea = cityArea;
	}
	
	
	
}
