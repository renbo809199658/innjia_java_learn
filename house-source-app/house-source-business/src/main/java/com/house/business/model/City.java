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
 * 城市
 * 
 * @author wangchaoqun
 * @date ：2017年8月15日 上午10:33:01
 */
@Entity
@Table(name = "city")
@org.hibernate.annotations.Table(appliesTo = "city", comment = "城市")
public class City extends BaseHibernateModelSupport {

	private static final long serialVersionUID = -6919571334692164964L;

	/**
	 * 城市名称
	 */
	@Column(columnDefinition = "varchar(32)  comment '城市名称'")
	private String cityName;

	/**
	 * 城市ID
	 */
	@Column(columnDefinition = "varchar(32)  comment '城市ID'")
	private String cityId;
	/**
	 * 城市简称
	 */
	@Column(columnDefinition = "varchar(32)  comment '城市简称'")
	private String cityShort;

	/**
	 * 省份id
	 */
	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.REFRESH }, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "provinceId")
	private Province province;

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getCityShort() {
		return cityShort;
	}

	public void setCityShort(String cityShort) {
		this.cityShort = cityShort;
	}

	public Province getProvince() {
		return province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

}
