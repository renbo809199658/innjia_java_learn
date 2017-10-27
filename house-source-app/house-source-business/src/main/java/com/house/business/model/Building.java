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
 * 楼栋
 * 
 * @author wangchaoqun
 * @date ：2017年8月15日 上午11:11:11
 */
@Entity
@Table(name = "building")
@org.hibernate.annotations.Table(appliesTo = "building", comment = "楼栋")
public class Building extends BaseHibernateModelSupport {

	private static final long serialVersionUID = 5480463076530650304L;
	/**
	 * key
	 */
	@Column(columnDefinition = "varchar(1024)  comment 'key'")
	private String rowKey;
	/**
	 * 楼栋号
	 */
	@Column(columnDefinition = "varchar(32)  comment '楼栋号'")
	private String buildingNumber;
	/**
	 * 小区id
	 */
	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.REFRESH }, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "villageId")
	private Village village;

	/**
	 * HBASE buildingId,导入数据时有用
	 */
	@Column(columnDefinition = "varchar(64)  comment 'HBASE buildingId,导入数据时有用'")
	private String buildingId;

	public String getBuildingId() {
		return buildingId;
	}

	public void setBuildingId(String buildingId) {
		this.buildingId = buildingId;
	}

	public String getRowKey() {
		return rowKey;
	}

	public void setRowKey(String rowKey) {
		this.rowKey = rowKey;
	}

	public String getBuildingNumber() {
		return buildingNumber;
	}

	public void setBuildingNumber(String buildingNumber) {
		this.buildingNumber = buildingNumber;
	}

	public Village getVillage() {
		return village;
	}

	public void setVillage(Village village) {
		this.village = village;
	}

}
