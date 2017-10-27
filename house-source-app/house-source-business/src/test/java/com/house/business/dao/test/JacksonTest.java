package com.house.business.dao.test;

import org.codehaus.jackson.map.ObjectMapper;
import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;

import com.house.business.dao.test2.DGOU;
import com.house.business.model.UserDto;
 
public class JacksonTest {

	@Test
	public void read() throws Exception {
		String json = "{\"cityAreaName\":\"黄浦区\",\"streetAddress\":\"张大屌\"}";

		/**
		 * ObjectMapper支持从byte[]、File、InputStream、字符串等数据的JSON反序列化。
		 */
		ObjectMapper mapper = new ObjectMapper();
		UserDto user = mapper.readValue(json, UserDto.class);
		System.out.println(user);
	}
	@Before
	public void jj(){
		System.out.println("big dick");
	}
	@After
	public void cunt(){
		System.out.println("big cunt");
	}
	@BeforeClass
	public static void mimi(){
		Loi loi = new Loi();
		DGOU dgou = new DGOU();
		System.out.println("big mimi");
	}
	@Ignore
	public static void ig(){
		System.out.println("big mimi");
	}
}
