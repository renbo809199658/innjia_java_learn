package com.house.business.enums;

/**
 * 会员性别类型枚举类<br>
 * MALE("男"), FEMALE("女"),SECRECY("保密")
 * 
 * @author shenpeng
 * 
 */
public enum SexType {

	MALE("男"), FEMALE("女"), SECRECY("保密");

	// 枚举说明
	private String desc;

	/**
	 * 私有的构造方法
	 */
	private SexType(String desc) {
		this.desc = desc;
	}

	/**
	 * 获取说明内容
	 */
	public String getDesc() {
		return desc;
	}
}
