package com.house.service.utils;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.iframework.commons.utils.log.Log;
import org.iframework.support.domain.pager.Pager;

import com.alibaba.fastjson.JSONObject;

/**
 * 分页工具实现类
 * 
 * @author shenpeng
 * 
 */
@SuppressWarnings("serial")
public class PagerImplCus implements Pager {
	/**
	 * 每页显示的记录数
	 */
	private int pageSize;

	/**
	 * 总页数
	 */
	private int pageCount;

	/**
	 * 记录总数
	 */
	private int recordCount;

	/**
	 * 当前页
	 */
	private int page;

	/**
	 * 参数过滤条件保留
	 */
	private HashMap<String, String> filter = new HashMap<String, String>();

	/**
	 * 分页查询字符串（可带过滤条件）
	 */
	private String queryString;

	public PagerImplCus() {
	}

	public PagerImplCus(HttpServletRequest request) {
		try {
//			String encoding = request.getCharacterEncoding();
			this.page = NumberUtils.toInt(request.getParameter("pageNum"));
			this.pageSize = NumberUtils.toInt(request.getParameter("numPerPage"));
			if (this.pageSize == 0) {
				this.pageSize = 50;
			}
			String queryString = "";
			@SuppressWarnings("unchecked")
			Map<String, String[]> parm = request.getParameterMap();
			for (String key : parm.keySet()) {
				Object val = parm.get(key);
				if (val != null) {
					String[] v = (String[]) val;
					String value = StringUtils.trimToEmpty(v[0]);
//					String value_decode = URLDecoder.decode(value, encoding);
//					String value_encode = URLEncoder.encode(value, encoding);
					filter.put(key, value);
					queryString += key + "=" + value + "&";
				}
			}
			this.queryString = StringUtils.substringBeforeLast(queryString, "&");
		} catch (Exception e) {
			Log.e(e.getMessage(),e);
		}
	}

	public PagerImplCus(int page, int pageSize) {
		this.page = page;
		this.pageSize = pageSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize < 1 ? 0 : pageSize;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
		if (pageSize < 1)
			pageCount = 1;
		else
			pageCount = recordCount % pageSize == 0 ? (recordCount / pageSize) : (recordCount / pageSize + 1);
	}

	public int getPage() {
		return page < 1 ? 1 : page;
	}

	public void setPage(int page) {
		this.page = page < 1 ? 1 : page;
	}

	public HashMap<String, String> getFilter() {
		return this.filter;
	}

	public String getQueryString() {
		return this.queryString;
	}

	public Map<String,Integer> toMap() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("page", this.page);
		map.put("pageSize", this.pageSize);
		map.put("pageCount", this.pageCount);
		map.put("recordCount", this.recordCount);
		return map;
	}

	public String toJsonString() {
		if (this.page > 0 && this.pageSize > 0) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("page", this.page);
			map.put("pageSize", this.pageSize);
			map.put("pageCount", this.pageCount);
			map.put("recordCount", this.recordCount);
			return JSONObject.toJSONString(map);
		}
		return null;

	}
}