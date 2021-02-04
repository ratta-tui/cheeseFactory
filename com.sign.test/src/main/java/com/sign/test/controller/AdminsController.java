package com.sign.test.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sign.test.mapper.UserMapper;
import com.sign.test.vo.User;

@Controller
public class AdminsController {

	@Autowired
	private UserMapper userMapper;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String index(Model model) {
		List<User> users = userMapper.selectUsers();
		model.addAttribute("users", users);
		return "admins/index";
	}

	@RequestMapping(value = "/admins/role/{userId}/{role}")
	public String changeRole(@PathVariable int userId, @PathVariable String role) {
		toggleRole(userId, role);
		return "redirect:/admin";
	}
	
	private void toggleRole(int userId, String role) {
		User user = userMapper.selectUserById(userId);
		if (! user.hasRole(role))
			userMapper.insertAuthority(user.getEmail(), "ROLE_" + role.toUpperCase());
		else
			userMapper.deleteAuthority(user.getEmail(), "ROLE_" + role.toUpperCase());
	}

}




