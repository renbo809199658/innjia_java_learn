package com.house.business.enums;

/**
 * 学历类型枚举类<br>
 * ABOVEMASTER("硕士及以上"), BACHELOR("本科"),COLLEGE("大专"), BELOWHIGHSCHOOL("高中及以下");
 * 
 * @author maojunjie
 * 
 */
public enum Education {
	ABOVEMASTER("硕士及以上"), BACHELOR("本科"), COLLEGE("大专"), BELOWHIGHSCHOOL("高中及以下");

	// 枚举说明
	private String desc;

	/**
	 * 私有的构造方法
	 */
	private Education(String desc) {
		this.desc = desc;
	}

	/**
	 * 获取说明内容
	 */
	public String getDesc() {
		return desc;
	}
}
