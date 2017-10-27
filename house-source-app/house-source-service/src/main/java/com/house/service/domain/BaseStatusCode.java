package com.house.service.domain;

/**
 * 手机异步请求结果状态码枚举类<br>
 * SUCCESS("000"), FAILURE("100"), TIMEOUT("301"), NOTFOUND("404"),
 * EXCEPTION("500")
 * 
 * @author shenpeng
 * 
 */
public enum BaseStatusCode {
	SUCCESS("000"), 
	FAILURE("100"), 
	TIMEOUT("301"), 
	NOTFOUND("404"), 
	EXCEPTION("500");

	// 枚举说明
	private String desc;

	/**
	 * 私有的构造方法
	 */
	private BaseStatusCode(String desc) {
		this.desc = desc;
	}

	/**
	 * 获取说明内容
	 */
	public String getDesc() {
		return desc;
	}
}
