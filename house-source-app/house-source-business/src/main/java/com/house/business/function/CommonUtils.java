package com.house.business.function;

import javax.servlet.http.HttpServletRequest;

public class CommonUtils {

	
	public static String getRemortIP(HttpServletRequest request) {
		  if (request.getHeader("x-forwarded-for") == null) {
		   return request.getRemoteAddr();
		  }
		  return request.getHeader("x-forwarded-for");
		}
	
}
