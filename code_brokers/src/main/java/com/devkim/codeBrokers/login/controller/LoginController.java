package com.devkim.codeBrokers.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devkim.codeBrokers.login.service.LoginService;
import com.devkim.codeBrokers.util.LoginStatus;

@Controller
public class LoginController {
	@Autowired
	LoginService loginService;
	
	@RequestMapping("/loginForm.login")
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping("/login.login")
	public String loginCheck(HttpSession session, HttpServletRequest req, String id, String password, Model model) {		
		String view = "";
		int result = 0;

		result = loginService.loginCheck(session, id, password);
		String referer = req.getHeader("referer");
		String cp = req.getContextPath();
		int indexPath = referer.indexOf(cp);
		String path = referer.substring(indexPath + 13);
	
		if (result == LoginStatus.OK) {
			session.setAttribute("id", id);
			view = "redirect:/" + path;
		} else if (result == LoginStatus.NOT_MEMBER) {
			model.addAttribute("msg", "아이디가 존재하지 않습니다.");
			model.addAttribute("redirectUrl", path);
			view = "loginFail";
		} else {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			model.addAttribute("redirectUrl", path);
			view = "loginFail";
		}
	
		return view;
	}
	
	@RequestMapping("/logout.login")
	public String logout(HttpSession session, HttpServletRequest req, String password) {
		session.invalidate();	
		String referer = req.getHeader("referer");
		String cp = req.getContextPath();
		int indexPath = referer.indexOf(cp);
		String path = referer.substring(indexPath + 13);
		
		return "redirect:/" + path;
	}
}
