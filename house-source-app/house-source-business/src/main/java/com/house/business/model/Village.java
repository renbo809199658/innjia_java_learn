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
 * 小区
 * 
 * @author wangchaoqun
 * @date ：2017年8月15日 上午11:02:12
 */
@Entity
@Table(name = "village")
@org.hibernate.annotations.Table(appliesTo = "village", comment = "小区")
public class Village extends BaseHibernateModelSupport {

	private static final long serialVersionUID = -2482323220654811873L;
	/**
	 * key
	 */
	@Column(columnDefinition = "varchar(1024)  comment 'key'")
	private String rowKey;
	/**
	 * 小区名称
	 */
	@Column(columnDefinition = "varchar(200)  comment '小区名称'")
	private String villageName;
	/**
	 * 街道id
	 */
	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.REFRESH }, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "streetId")
	private Street street;
	/**
	 * 小区地址
	 */
	@Column(columnDefinition = "varchar(200)  comment '小区地址'")
	private String address;
	/**
	 * 小区类型
	 */
	@Column(columnDefinition = "varchar(32)  comment '[普通民房、公租房、小区房、公寓]'")
	private String villageType;

	/**
	 * HBASE villageId,导入数据时有用
	 */
	@Column(columnDefinition = "varchar(64)  comment 'HBASE villageId,导入数据时有用'")
	private String villageId;

	public String getVillageId() {
		return villageId;
	}

	public void setVillageId(String villageId) {
		this.villageId = villageId;
	}

	public String getRowKey() {
		return rowKey;
	}

	public void setRowKey(String rowKey) {
		this.rowKey = rowKey;
	}

	public String getVillageName() {
		return villageName;
	}

	public void setVillageName(String villageName) {
		this.villageName = villageName;
	}

	public Street getStreet() {
		return street;
	}

	public void setStreet(Street street) {
		this.street = street;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getVillageType() {
		return villageType;
	}

	public void setVillageType(String villageType) {
		this.villageType = villageType;
	}

}
