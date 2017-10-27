package com.house.service.utils;

import java.util.ResourceBundle;

public class RemoteResourceUtils {
	// 服务器IP
	public static String ZJFQ_ADDR;

	// 端口号
	public static String ZJFQ_PORT;

	// 修改手机回调接口

	public static String zjfq_changeMobileCallBack;
	
	
	
	// 服务器IP
	public static String ZHSH_ADDR;

	// 端口号
	public static String ZHSH_PORT;

	// 修改手机回调接口

	public static String zhsh_changeMobileCallBack;

	/**
	 * 初始化
	 */
	static {

		ResourceBundle conf = ResourceBundle.getBundle("remoteResource");
		ZJFQ_ADDR = conf.getString("zjfq.ip");
		ZJFQ_PORT = conf.getString("zjfq.port");
		zjfq_changeMobileCallBack=conf.getString("zjfq.changeMobileCallBack");
		
		ZHSH_ADDR = conf.getString("zhsh.ip");
		ZHSH_PORT = conf.getString("zhsh.port");
		zhsh_changeMobileCallBack=conf.getString("zhsh.changeMobileCallBack");
	}

}
