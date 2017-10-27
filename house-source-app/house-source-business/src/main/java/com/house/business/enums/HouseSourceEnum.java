package com.house.business.enums;

public enum HouseSourceEnum {
	INNJIA_SHEYI("舍艺"), INNJIA_HARDWARE("硬件"), INNJIA_FINANCE("金融"), INNJIA_RENT("租管");

	// 枚举说明
	private String desc;

	/**
	 * 私有的构造方法
	 */
	private HouseSourceEnum(String desc) {
		this.desc = desc;
	}

	/**
	 * 获取说明内容
	 */
	public String getDesc() {
		return desc;
	}
}
