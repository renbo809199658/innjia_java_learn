package com.house.business.enums;

/**
 * 短信类型枚举类<br>
 * HTML("HTML格式"), TEXT("TEXT格式")
 * 
 * @author shenpeng
 * 
 */
public enum SmsType {

	HTML("HTML格式"), TEXT("TEXT格式");

	// 枚举说明
	private String desc;

	/**
	 * 私有的构造方法
	 */
	private SmsType(String desc) {
		this.desc = desc;
	}

	/**
	 * 获取说明内容
	 */
	public String getDesc() {
		return desc;
	}
}
