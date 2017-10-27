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
 * 城市区县
 * 
 * @author wangchaoqun
 * @date ：2017年8月15日 上午10:46:08
 */
@Entity
@Table(name = "city_area")
@org.hibernate.annotations.Table(appliesTo = "city_area", comment = "城市区县")
public class CityArea extends BaseHibernateModelSupport {

	private static final long serialVersionUID = -1693307299228969408L;

	/**
	 * 区县名称
	 */
	@Column(columnDefinition = "varchar(32)  comment '区县名称'")
	private String cityAreaName;

	/**
	 * 区县ID
	 */
	@Column(columnDefinition = "varchar(32)  comment '区县ID'")
	private String cityAreaId;
	/**
	 * 区县简称
	 */
	@Column(columnDefinition = "varchar(32)  comment '区县简称'")
	private String cityAreaShort;
	/**
	 * 城市区县描述
	 */
	@Column(columnDefinition = "varchar(200)  comment '城市区县描述'")
	private String cityAreaDescription;
	/**
	 * 城市id
	 */
	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.REFRESH }, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "cityId")
	private City city;

	public String getCityAreaName() {
		return cityAreaName;
	}

	public void setCityAreaName(String cityAreaName) {
		this.cityAreaName = cityAreaName;
	}

	public String getCityAreaShort() {
		return cityAreaShort;
	}

	public void setCityAreaShort(String cityAreaShort) {
		this.cityAreaShort = cityAreaShort;
	}

	public String getCityAreaDescription() {
		return cityAreaDescription;
	}

	public void setCityAreaDescription(String cityAreaDescription) {
		this.cityAreaDescription = cityAreaDescription;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public String getCityAreaId() {
		return cityAreaId;
	}

	public void setCityAreaId(String cityAreaId) {
		this.cityAreaId = cityAreaId;
	}

}
