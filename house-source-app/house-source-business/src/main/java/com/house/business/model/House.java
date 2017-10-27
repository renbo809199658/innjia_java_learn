package com.house.business.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.iframework.support.spring.hibernate.model.BaseHibernateModelSupport;

import com.house.business.enums.HouseSourceEnum;

/**
 * 房源
 * 
 * @author wangchaoqun
 * @date ：2017年8月15日 上午11:32:02
 */
@Entity
@Table(name = "house")
@org.hibernate.annotations.Table(appliesTo = "house", comment = "房源")
public class House extends BaseHibernateModelSupport {

	private static final long serialVersionUID = -2306390428694699592L;
	/**
	 * key
	 */
	@Column(columnDefinition = "varchar(1024)  comment 'key'")
	private String rowKey;

	/**
	 * houseId
	 */
	@Column(columnDefinition = "varchar(64)  comment 'houseId'")
	private String houseId;

	/**
	 * 总楼层
	 */
	@Column(columnDefinition = "int(32)  comment '总楼层'")
	private Integer floors;
	/**
	 * 所在楼层
	 */
	@Column(columnDefinition = "int(32)  comment '所在楼层'")
	private Integer currentFloor;
	/**
	 * 房屋朝向
	 */
	@Column(columnDefinition = "varchar(32)  comment '房屋朝向'")
	private String houseDirection;
	/**
	 * 房号
	 */
	@Column(columnDefinition = "varchar(32)  comment '房号'")
	private String houseNumber;
	/**
	 * 房屋类型
	 */
	@Column(columnDefinition = "varchar(32)  comment '[非公寓：几室几厅几卫公寓：集中式、分散式]'")
	private String houseType;
	/**
	 * 状态
	 */
	@Column(columnDefinition = "varchar(32)  comment '状态[空闲、出租、发布等等]'")
	private String houseStatus;
	/**
	 * 来源
	 */
	@Enumerated(EnumType.STRING)
	@Column(columnDefinition = "varchar(32)  comment '来源'")
	private HouseSourceEnum houseSource;
	/**
	 * 楼栋id
	 */
	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.REFRESH }, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "buildingId")
	private Building building;
	/**
	 * 单元id
	 */
	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.REFRESH }, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "unitId")
	private Unit unit;
	/**
	 * 小区id
	 */
	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.REFRESH }, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "villageId")
	private Village village;

	/**
	 * 房源编号
	 */
	@OneToMany(mappedBy = "house", cascade = { CascadeType.MERGE, CascadeType.PERSIST }, fetch = FetchType.LAZY)
	private List<HouseRoom> rooms;

	@Transient
	private String provinceName;

	@Transient
	private String cityName;

	@Transient
	private String cityAreaName;

	@Transient
	private String streetAddress;

	@Transient
	private String streetName;

	@Transient
	private String villageName;

	@Transient
	private String buildingNumber;

	@Transient
	private String unitNumber;

	@Transient
	private List<HouseRoom> houseRooms;

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getCityAreaName() {
		return cityAreaName;
	}

	public void setCityAreaName(String cityAreaName) {
		this.cityAreaName = cityAreaName;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getVillageName() {
		return villageName;
	}

	public void setVillageName(String villageName) {
		this.villageName = villageName;
	}

	public String getBuildingNumber() {
		return buildingNumber;
	}

	public void setBuildingNumber(String buildingNumber) {
		this.buildingNumber = buildingNumber;
	}

	public String getUnitNumber() {
		return unitNumber;
	}

	public void setUnitNumber(String unitNumber) {
		this.unitNumber = unitNumber;
	}

	public List<HouseRoom> getHouseRooms() {
		return houseRooms;
	}

	public void setHouseRooms(List<HouseRoom> houseRooms) {
		this.houseRooms = houseRooms;
	}

	public Integer getFloors() {
		return floors;
	}

	public void setFloors(Integer floors) {
		this.floors = floors;
	}

	public Integer getCurrentFloor() {
		return currentFloor;
	}

	public void setCurrentFloor(Integer currentFloor) {
		this.currentFloor = currentFloor;
	}

	public String getHouseDirection() {
		return houseDirection;
	}

	public void setHouseDirection(String houseDirection) {
		this.houseDirection = houseDirection;
	}

	public String getHouseNumber() {
		return houseNumber;
	}

	public void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
	}

	public String getHouseType() {
		return houseType;
	}

	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}

	public String getHouseStatus() {
		return houseStatus;
	}

	public void setHouseStatus(String houseStatus) {
		this.houseStatus = houseStatus;
	}

	public Unit getUnit() {
		return unit;
	}

	public void setUnit(Unit unit) {
		this.unit = unit;
	}

	public Village getVillage() {
		return village;
	}

	public void setVillage(Village village) {
		this.village = village;
	}

	public Building getBuilding() {
		return building;
	}

	public void setBuilding(Building building) {
		this.building = building;
	}

	public String getRowKey() {
		return rowKey;
	}

	public void setRowKey(String rowKey) {
		this.rowKey = rowKey;
	}

	public HouseSourceEnum getHouseSource() {
		return houseSource;
	}

	public void setHouseSource(HouseSourceEnum houseSource) {
		this.houseSource = houseSource;
	}

	public List<HouseRoom> getRooms() {
		return rooms;
	}

	public void setRooms(List<HouseRoom> rooms) {
		this.rooms = rooms;
	}

	public String getHouseId() {
		return houseId;
	}

	public void setHouseId(String houseId) {
		this.houseId = houseId;
	}

}
