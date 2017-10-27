package com.house.business.function;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.Properties;

import org.apache.log4j.helpers.Loader;

public class RemoteResourceUtils {
	// 服务器IP
	public static String ZJFQ_ADDR;
	public static String OLD_OFF;

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
	static  {
		readFromPropertiesFile();

	}
	
	   protected static void readProperties(String fileName)
	   {
	       Properties prop = new Properties();
	     try
	     {
	        InputStream in = new BufferedInputStream(new FileInputStream(fileName));
	        prop.load(in);
	       
		//	ResourceBundle conf = ResourceBundle.getBundle("remoteResource");
			ZJFQ_ADDR = prop.getProperty("zjfq.ip");
			OLD_OFF = prop.getProperty("oldOFF");
			ZJFQ_PORT = prop.getProperty("zjfq.port");
			zjfq_changeMobileCallBack=prop.getProperty("zjfq.changeMobileCallBack");
			
			ZHSH_ADDR = prop.getProperty("zhsh.ip");
			ZHSH_PORT = prop.getProperty("zhsh.port");
			zhsh_changeMobileCallBack=prop.getProperty("zhsh.changeMobileCallBack");
	        in.close();
	     }
	     catch (Exception e)
	     {
	       handleError(e);
	     }
	   }
	   
	   protected static void readFromPropertiesFile()
	   {
	     URL url = Loader.getResource("remoteResource.properties");
	     try {
	       if (url != null)
	       {
	         String systemEncoding = new OutputStreamWriter(new ByteArrayOutputStream()).getEncoding();
	         String urlpath = "";
	         if ((systemEncoding == null) || (systemEncoding.trim().length() < 1)) {
	           urlpath = URLDecoder.decode(url.getPath(), "UTF-8");
	         } else {
	           urlpath = URLDecoder.decode(url.getPath(), systemEncoding);
	         }
	         
	         String fileRealFileSystemPath = new File(urlpath).getAbsolutePath();
	         readProperties(fileRealFileSystemPath);
	       }
	       else
	       {
	         throw new Exception("remoteResource.properties");
	       }
	     }
	     catch (UnsupportedEncodingException e) {}catch (Exception e)
	     {
	       handleError(e);
	     }
	   }
	   public static void handleError(Throwable t)
	   {
	     t.printStackTrace();
	   }
}
