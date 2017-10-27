package com.house.business.function;

import java.io.Serializable;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.iframework.commons.utils.validator.ValidatorUtils;
import org.springframework.validation.ObjectError;

import com.alibaba.fastjson.JSONObject;

/**
 * 普通ajax调用返回JSON格式结果模型
 * 
 * @author fanjunjian
 * 
 */
public class JsonResultModel implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * 请求执行状态
	 * 200:成功，300:失败，301:超时，500:出错
	 */
	private String statusCode;
	/**
	 * 请求执行反馈信息
	 */
	private String message;
	/**
	 * 返回模型对象
	 */
	private Object data;
	/**
	 * 返回错误信息集合
	 */
	private List<ObjectError> objectErrors;

	/**
	 * 构造方法
	 */
	public JsonResultModel() {
	}

	/**
	 * 构造方法
	 * 
	 * @param status
	 *            请求执行状态
	 */
	public JsonResultModel(String statusCode) {
		this.statusCode = statusCode;
	}

	/**
	 * 构造方法
	 * 
	 * @param status
	 *            请求执行状态
	 * @param info
	 *            请求执行反馈信息
	 */
	public JsonResultModel(String statusCode, String message) {
		this.statusCode = statusCode;
		this.message = message;
	}

	/**
	 * 构造方法
	 * 
	 * @param status
	 *            请求执行状态
	 * @param info
	 *            请求执行反馈信息
	 * @param data
	 *            返回对象数据(可以是json格式)
	 */
	public JsonResultModel(String statusCode, String message, Object data) {
		this.statusCode = statusCode;
		this.message = message;
		this.data = data;
	}
	
	/**
	 * 构造方法
	 * 
	 * @param status
	 *            请求执行状态
	 * @param info
	 *            请求执行反馈信息
	 * @param data
	 *            返回对象数据(可以是json格式)
	 * @param objectErrors
	 *            返回错误信息集合
	 */
	public JsonResultModel(String statusCode, String message, Object data, List<ObjectError> objectErrors) {
		this.statusCode = statusCode;
		this.message = message;
		this.data = data;
		this.objectErrors = objectErrors;
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
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
		if (ValidatorUtils.isNotEmpty(this.statusCode)) {
			map.put("statusCode", this.statusCode);
		}
		if (ValidatorUtils.isNotEmpty(this.statusCode)) {
			map.put("message", this.message);
		}
		if (ValidatorUtils.isNotEmpty(this.objectErrors)) {
			Map<String, String> errors = new HashMap<String, String>();
			for (ObjectError objectError : objectErrors) {
				errors.put(objectError.getCode(), objectError.getDefaultMessage());
			}
			map.put("errors", errors);
		}
		if (ValidatorUtils.isNotEmpty(this.data)) {
			map.put("data", data);
		}
		return JSONObject.toJSONString(map);
	}

	/**
	 * 将验证错误信息集合转换成字符串消息传递给前台显示
	 * 
	 * @param objectErrors
	 *            验证错误信息集合
	 * @return 返回JSON格式错误消息字符串
	 */
	public static String toMessage(List<ObjectError> objectErrors) {
		StringBuffer stringBuffer = new StringBuffer();
		if (objectErrors != null) {
			for (int i = 0; i < objectErrors.size() ; i++) {
				stringBuffer.append(objectErrors.get(i).getDefaultMessage());
				if (i < (objectErrors.size()-1)) {
					stringBuffer.append("<br/>");
				}
			}
		}
		return stringBuffer.toString();
	}
	
}
