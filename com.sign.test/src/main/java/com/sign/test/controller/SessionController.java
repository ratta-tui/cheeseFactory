package com.sign.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sign.test.vo.User;

@Controller
public class SessionController {
	
	@RequestMapping(value ="/login", method= RequestMethod.GET)
	public String login() {
		System.out.println("로그인 페이지 정상");
		return "statics/login";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "statics/signup";
	}
}
