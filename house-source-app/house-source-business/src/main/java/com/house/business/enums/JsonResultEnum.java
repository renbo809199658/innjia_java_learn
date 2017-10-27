package com.house.business.enums;

/**
 * json返回值状态枚举类<br>
 * SUCCESS("200"), FAILURE("300"), TIMEOUT("301"), EXCEPTION("500");
 * 
 * @author fanjunjian
 * 
 */
public enum JsonResultEnum {

	SUCCESS("200"), FAILURE("300"), TIMEOUT("301"), EXCEPTION("500");

	// 枚举说明
	private String desc;

	/**
	 * 私有的构造方法
	 */
	private JsonResultEnum(String desc) {
		this.desc = desc;
	}

	/**
	 * 获取说明内容
	 */
	public String getDesc() {
		return desc;
	}
}
