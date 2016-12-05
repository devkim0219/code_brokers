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
	
	@RequestMapping("/login.login")
	public String loginCheck(HttpSession session, String path, String id, String password) {		
		int result = 0;
		result = loginService.loginCheck(session, id, password);
		
		if (result == LoginStatus.OK) {
			session.setAttribute("id", id);
		}
		return "redirect:/";
	}
	
	@RequestMapping("/logout.login")
	public String logout(HttpSession session, String password) {
		session.invalidate();
		
		return "redirect:/";
	}
}
