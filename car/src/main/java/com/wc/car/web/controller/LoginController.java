package com.wc.car.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wc.car.model.User;
import com.wc.car.service.UserService;

@Controller
@RequestMapping("")
public class LoginController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "login.html", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		return "login";
	}

	@RequestMapping(value = "login.html", method = RequestMethod.POST)
	public String login(HttpServletRequest request, User user) {
		User vUser = userService.validaUser(user);
		if (vUser != null) {
			request.setAttribute("message", "成功");
		} else {
			request.setAttribute("message", "失败");
		}
		return "login";
	}

}
