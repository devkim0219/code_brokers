package com.devkim.codeBrokers.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devkim.codeBrokers.login.service.LoginService;
import com.devkim.codeBrokers.util.LoginStatus;

@Controller
public class LoginController {
	@Autowired
	LoginService loginService;
	
	@RequestMapping("/login.cbs")
	public String loginCheck(HttpSession session, String id, String password) {		
		int result = 0;
		String view = "login_fail";
		result = loginService.loginCheck(session, id, password);
		
		if (result == LoginStatus.OK) {
			System.out.println("로그인 성공^^");
			session.setAttribute("id", id);
			view = "redirect:/index.cbs";
		}
		return view;
	}
}
