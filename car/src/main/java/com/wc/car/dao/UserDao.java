package com.wc.car.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.wc.car.common.jdbc.EntityDao;
import com.wc.car.common.jdbc.JdbcEntityDao;
import com.wc.car.common.jdbc.Page;
import com.wc.car.model.User;

@Repository
@EntityDao(Table = "userInfo")
public class UserDao extends JdbcEntityDao<User, Long> {

	public Page<User> findRolePage(Page<User> page, User user) {
		StringBuffer sb = new StringBuffer();
		sb.append(" select * from user where 1 = 1");
		page = findPage(page, sb.toString());
		return page;
	}

	public List<User> findUser() {
		String sql = " select * from user";
		return find(sql);
	}

	public User getUser(User user) {
		StringBuffer sb = new StringBuffer();
		sb.append(" select * from userInfo where 1=1 ");
		sb.append(" and username= ? ");
		sb.append(" and password= ? ");
		return get(sb.toString(), user.getUsername(), user.getPassword());
	}

}
