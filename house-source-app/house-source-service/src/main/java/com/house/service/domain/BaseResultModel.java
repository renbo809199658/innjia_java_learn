package com.house.service.domain;

import java.io.Serializable;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.iframework.commons.utils.validator.ValidatorUtils;
import org.springframework.validation.ObjectError;

import com.alibaba.fastjson.JSONObject;

/**
 * 返回JSON格式结果模型
 * 
 * @author shenpeng
 * 
 */
public class BaseResultModel implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * 请求执行状态码
	 */
	private BaseStatusCode code;
	/**
	 * 请求执行反馈信息
	 */
	private String msg;
	/**
	 * 返回模型对象
	 */
	private Object data;
	/**
	 * 返回排序对象
	 */
	private Object order;
	/**
	 * 返回分页对象
	 */
	private Object pager;
	/**
	 * 返回错误信息集合
	 */
	private List<ObjectError> objectErrors;

	/**
	 * 构造方法
	 * 
	 * @param code
	 *            请求执行状态
	 * @param msg
	 *            请求执行反馈信息
	 */
	public BaseResultModel(BaseStatusCode code, String msg) {
		this.code = code;
		this.msg = msg;
	}
	
	/**
	 * 构造方法
	 * 
	 * @param code
	 *            请求执行状态
	 * @param msg
	 *            请求执行反馈信息
	 */
	public BaseResultModel(BaseStatusCode code, String msg, Object data) {
		this.code = code;
		this.msg = msg;
		this.data = data;
	}

	/**
	 * 构造方法
	 * 
	 * @param code
	 *            请求执行状态
	 * @param msg
	 *            请求执行反馈信息
	 * @param data
	 *            返回对象数据(可以是json格式)
	 * @param objectErrors
	 *            返回错误信息集合
	 */

	public BaseResultModel(BaseStatusCode code, String msg, Object data, List<ObjectError> objectErrors) {
		this.code = code;
		this.msg = msg;
		this.data = data;
		this.objectErrors = objectErrors;
	}
	
	/**
	 * @param code
	 *            请求执行状态
	 * @param msg
	 *            请求执行反馈信息
	 * @param data
	 *            对象数据(可以是json格式)
	 * @param order
	 *            排序对象(可以是json格式)
	 * @param pager
	 *            分页对象(可以是json格式)
	 */
	public BaseResultModel(BaseStatusCode code, String msg, Object data, Object order, Object pager) {
		this.code = code;
		this.msg = msg;
		this.data = data;
		this.order = order;
		this.pager = pager;
	}

	/**
	 * @param code
	 *            请求执行状态
	 * @param msg
	 *            请求执行反馈信息
	 * @param data
	 *            对象数据(可以是json格式)
	 * @param order
	 *            排序对象(可以是json格式)
	 * @param pager
	 *            分页对象(可以是json格式)
	 * @param objectErrors
	 *            返回错误信息集合
	 */
	public BaseResultModel(BaseStatusCode code, String msg, Object data, Object order, Object pager,
			List<ObjectError> objectErrors) {
		this.code = code;
		this.msg = msg;
		this.data = data;
		this.order = order;
		this.pager = pager;
		this.objectErrors = objectErrors;
	}

	public BaseStatusCode getCode() {
		return code;
	}

	public void setCode(BaseStatusCode code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public Object getOrder() {
		return order;
	}

	public void setOrder(Object order) {
		this.order = order;
	}

	public Object getPager() {
		return pager;
	}

	public void setPager(Object pager) {
		this.pager = pager;
	}

	public List<ObjectError> getObjectErrors() {
		return objectErrors;
	}

	public void setObjectErrors(List<ObjectError> objectErrors) {
		this.objectErrors = objectErrors;
	}

	/**
	 * 返回JSON字符串
	 */
	public String toJsonString() {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("code", code.getDesc());
		Map<String, Object> res = new LinkedHashMap<String, Object>();
		res.put("msg", msg);
		if (ValidatorUtils.isNotEmpty(this.data)) {
			res.put("data", this.data);
		}
		if (ValidatorUtils.isNotEmpty(this.order)) {
			res.put("order", this.order);
		}
		if (ValidatorUtils.isNotEmpty(this.pager)) {
			res.put("pager", this.pager);
		}
		if (ValidatorUtils.isNotEmpty(this.objectErrors)) {
			Map<String, String> errors = new HashMap<String, String>();
			for (ObjectError objectError : objectErrors) {
				errors.put(objectError.getCode(), objectError.getDefaultMessage());
			}
			res.put("errors", errors);
		}
		map.put("res", res);
		return JSONObject.toJSONString(map);
	}

}
