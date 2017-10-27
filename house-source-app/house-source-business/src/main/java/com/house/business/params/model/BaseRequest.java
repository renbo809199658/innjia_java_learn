package com.house.business.params.model;

import java.io.Serializable;
import java.util.Map;

import org.iframework.commons.utils.validator.ValidatorUtils;

/**
 * 请求基础类
 * @author wangjiarong
 * @date 2017-7-25
 *
 */
public class BaseRequest implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1111111111111111L;

	/** 账户openid **/
	protected String accountOpenId;
	
	public String getAccountOpenId() {
		return accountOpenId;
	}
	public void setAccountOpenId(String accountOpenId) {
		this.accountOpenId = accountOpenId;
	}
    public BaseRequest setMapDatas(Map<String, String> params) {
        if (ValidatorUtils.isNotEmpty(params.get("accountOpenId"))) {
            this.setAccountOpenId(params.get("accountOpenId"));
        }
        return this;
    }
    public String getModelName()
	{
    	String modelName = getClass().getName();
    	return modelName.substring(modelName.lastIndexOf(".") + 1, modelName.lastIndexOf(".") + 2).toLowerCase() + 
    			modelName.substring(modelName.lastIndexOf(".") + 2);
	}

}
