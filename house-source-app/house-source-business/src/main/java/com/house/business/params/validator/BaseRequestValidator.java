package com.house.business.params.validator;

import org.iframework.support.spring.validator.BaseFormValidator;
import org.iframework.support.spring.validator.BaseSpringValidationSupport;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.house.business.params.model.BaseRequest;

/**
 * 菜单模型验证类
 * 
 * @author shenpeng
 * 
 */
@Component("baseRequestValidator")
public class BaseRequestValidator extends BaseFormValidator<BaseRequest, String> {

	@Override
	public void validate(Object target, Errors errors) {
		BaseSpringValidationSupport.rejectIfEmptyOrWhitespace(errors, "accountOpenId", "accountOpenId", "账户openid不能为空");
	}

}