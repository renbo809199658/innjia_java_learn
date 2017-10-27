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
 * 街道地址
 * 
 * @author wangchaoqun
 * @date ：2017年8月15日 上午10:58:17
 */
@Entity
@Table(name = "street")
@org.hibernate.annotations.Table(appliesTo = "street", comment = "街道地址")
public class Street extends BaseHibernateModelSupport {

	private static final long serialVersionUID = 931091362947199705L;

	/**
	 * key
	 */
	@Column(columnDefinition = "varchar(1024)  comment 'key'")
	private String rowKey;

	/**
	 * 街道名称(道路)
	 */
	@Column(columnDefinition = "varchar(512)  comment '街道名称(道路)'")
	private String streetName;
	/**
	 * 街道地址
	 */
	@Column(columnDefinition = "varchar(512)  comment '街道地址'")
	private String streetAddress;
	/**
	 * 城市区县id
	 */
	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.REFRESH }, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "cityAreaId")
	private CityArea cityArea;
	
	/**
	 * HBASE streetId,导入数据时有用
	 */
	@Column(columnDefinition = "varchar(64)  comment 'HBASE streetId,导入数据时有用'")
	private String streetId;
	
	

	public String getStreetId() {
		return streetId;
	}

	public void setStreetId(String streetId) {
		this.streetId = streetId;
	}

	public String getRowKey() {
		return rowKey;
	}

	public void setRowKey(String rowKey) {
		this.rowKey = rowKey;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public CityArea getCityArea() {
		return cityArea;
	}

	public void setCityArea(CityArea cityArea) {
		this.cityArea = cityArea;
	}

}
