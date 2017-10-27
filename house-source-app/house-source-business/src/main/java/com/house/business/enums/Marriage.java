package com.house.business.enums;

/**
 * 婚姻类型枚举类<br>
 * MARRIED("已婚"), SPINSTERHOOD("未婚");
 * 
 * @author maojunjie
 * 
 */
public enum Marriage {
	MARRIED("已婚"), SPINSTERHOOD("未婚");

	// 枚举说明
	private String desc;

	/**
	 * 私有的构造方法
	 */
	private Marriage(String desc) {
		this.desc = desc;
	}

	/**
	 * 获取说明内容
	 */
	public String getDesc() {
		return desc;
	}
}
