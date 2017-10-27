package com.wc.car.common.jdbc;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

public class TransCodingUtils {
	public static String transcoding(String name) {
		if(StringUtils.isEmpty(name)){
			return "";
		}
		try {
			return new String(name.getBytes("ISO-8859-1"), "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}
	
	public static String camel4underline(String param){  
        Pattern  p=Pattern.compile("[A-Z]");  
        if(param==null ||param.equals("")){  
            return "";  
        }  
        StringBuilder builder=new StringBuilder(param);  
        Matcher mc=p.matcher(param);  
        int i=0;  
        while(mc.find()){  
            builder.replace(mc.start()+i, mc.end()+i, "_"+mc.group().toLowerCase());  
            i++;  
        }  
  
        if('_' == builder.charAt(0)){  
            builder.deleteCharAt(0);  
        }  
        return builder.toString();  
    }  
}
