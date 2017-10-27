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
 * 楼栋单元
 * 
 * @author wangchaoqun
 * @date ：2017年8月15日 上午11:16:51
 */
@Entity
@Table(name = "unit")
@org.hibernate.annotations.Table(appliesTo = "unit", comment = "楼栋单元")
public class Unit extends BaseHibernateModelSupport {

	private static final long serialVersionUID = 6004840407305958362L;
	/**
	 * key
	 */
	@Column(columnDefinition = "varchar(1024)  comment 'key'")
	private String rowKey;
	/**
	 * 单元号
	 */
	@Column(columnDefinition = "varchar(32)  comment '单元号'")
	private String unitNumber;
	/**
	 * 楼栋id
	 */
	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.REFRESH }, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "buildingId")
	private Building building;

	/**
	 * HBASE unitId,导入数据时有用
	 */
	@Column(columnDefinition = "varchar(64)  comment 'HBASE unitId,导入数据时有用'")
	private String unitId;

	public String getUnitId() {
		return unitId;
	}

	public void setUnitId(String unitId) {
		this.unitId = unitId;
	}

	public String getRowKey() {
		return rowKey;
	}

	public void setRowKey(String rowKey) {
		this.rowKey = rowKey;
	}

	public String getUnitNumber() {
		return unitNumber;
	}

	public void setUnitNumber(String unitNumber) {
		this.unitNumber = unitNumber;
	}

	public Building getBuilding() {
		return building;
	}

	public void setBuilding(Building building) {
		this.building = building;
	}

}
