package com.house.sys.conf;

import java.util.ResourceBundle;

/**
 * 系统静态配置信息
 */
public class Conf {
	// --------------------------------基本路径&资源配置------------------------------------------
	/**
	 * 基本资源访问路径
	 */
	public static String BASE_PATH;
	/**
	 * 基本资源访问路径
	 */
	public static String BASE_RES_PATH;
	// --------------------------------本地图片上传路径默认配置------------------------------------------
	/**
	 * 本地图片保存根目录
	 */
	public static String IMG_BASE_PATH;
	/**
	 * 本地图片保存路径
	 */
	public static String IMG_SAVE_PATH;

	/**
	 * 本地图片零时保存路径
	 */
	public static String IMG_TEMP_PATH;

	/**
	 * 本地图片访问地址
	 */
	public static String IMG_ACCESS_PATH;
	// --------------------------------图片FTP上传路径&帐号的默认配置-------------------------------------------
	/**
	 * FTP图片保存路径
	 */
	public static String FTP_IMG_SAVE_PATH;
	/**
	 * FTP图片访问地址
	 */
	public static String FTP_IMG_ACCESS_PATH;


	static {
		ResourceBundle conf = ResourceBundle.getBundle("config");
		BASE_PATH = conf.getString("BASE_PATH");
		BASE_RES_PATH = conf.getString("BASE_RES_PATH");
		IMG_BASE_PATH = conf.getString("IMG_BASE_PATH");
		IMG_SAVE_PATH = conf.getString("IMG_SAVE_PATH");
		IMG_TEMP_PATH = conf.getString("IMG_TEMP_PATH");
		IMG_ACCESS_PATH = conf.getString("IMG_ACCESS_PATH");
		FTP_IMG_SAVE_PATH = conf.getString("FTP_IMG_SAVE_PATH");
		FTP_IMG_ACCESS_PATH = conf.getString("FTP_IMG_ACCESS_PATH");
	}

	public static String getValue(String key){
		return ResourceBundle.getBundle("config").getString(key);
	}
}
