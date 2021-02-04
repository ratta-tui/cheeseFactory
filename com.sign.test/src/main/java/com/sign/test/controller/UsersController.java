package com.sign.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sign.test.mapper.UserMapper;
import com.sign.test.vo.User;

@Controller
public class UsersController {
	
    @Autowired
    private UserMapper userMapper;
    
    
    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String create(@ModelAttribute User user) {
        userMapper.insertUser(user);
        userMapper.insertAuthority(user.getEmail(), "ROLE_USER");
        return "redirect:/statics/login";
    }
    
    
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String index(Model model) {
        List<User> users = userMapper.selectUsers();
        model.addAttribute("users", users);
        return "admins/index";
    }
}


/*
 * ResponseBody == 결과 값을 바로 html body로 뿌려주는 역할
 * 
 * RequestMapping의 경우 
 * 어노테이션 및에 있는 함수 타입 (핸드러 리턴타입) 이 String 이라면 리턴하는 값을 jsp 파일 또는 html 파일이름으로 인식을 해서 
 * 그 리턴 이름에 맞는 파일을 뿌려줌  +++ ViewResolver 의 상태는 not null 
 *  							>>>> ViewResolver? : servelt-context.xml 에 prefix/ suffix 같은 것들이 ViewResolver 의 설정임. 
 * 
 * 그런데, ResponseBody가 붙으면  요청이 들어오는 페이지로 
 * 리턴에 대한 값 그 자체를 보내서 나타내 준다! 
 *  다만 String으로 하는 redirect foward 는 쓸 수 있음! 그러면 ViewResolver에 따른 설정을 따름!  >> 노노노 걍 리스폰스 바디 어노테이션 끼고 다른 페이지 열 생각을 마셈 
 */