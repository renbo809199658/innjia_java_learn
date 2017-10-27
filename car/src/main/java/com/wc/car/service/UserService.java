package com.wc.car.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wc.car.dao.UserDao;
import com.wc.car.model.User;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	public List<User> findUsers() {
		return userDao.findUser();
	}

	public User validaUser(User user) {
		try {
			return userDao.getUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
