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
 * 房间房门
 * 
 * @author wangchaoqun
 * @date ：2017年8月15日 上午11:35:17
 */
@Entity
@Table(name = "house_room")
@org.hibernate.annotations.Table(appliesTo = "house_room", comment = "房间房门")
public class HouseRoom extends BaseHibernateModelSupport {

	private static final long serialVersionUID = 2222307086619316369L;
	/**
	 * key
	 */
	@Column(columnDefinition = "varchar(1024)  comment 'key'")
	private String rowKey;
	/**
	 * 房门名称
	 */
	@Column(columnDefinition = "varchar(32)  comment '房门名称'")
	private String roomName;
	/**
	 * 房门Id
	 */
	@Column(columnDefinition = "varchar(64)  comment '房门ID'")
	private String roomId;
	/**
	 * 房源编号
	 */
	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.REFRESH }, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "houseId")
	private House house;

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public House getHouse() {
		return house;
	}

	public void setHouse(House house) {
		this.house = house;
	}

	public String getRowKey() {
		return rowKey;
	}

	public void setRowKey(String rowKey) {
		this.rowKey = rowKey;
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

}
