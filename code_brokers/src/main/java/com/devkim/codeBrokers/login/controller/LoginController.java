package com.devkim.codeBrokers.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.core.ApplicationContext;
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
	
	ApplicationContext appContext;
	HashMap<String, String> appId = null;
	
	@RequestMapping("/login.login")
	public String loginCheck(HttpSession session, HttpServletRequest req, String id, String password, Model model) {		
		String view = "";
		int result = 0;

		result = loginService.loginCheck(session, id, password);
		String referer = req.getHeader("referer");
		String cp = req.getContextPath();
		int indexPath = referer.indexOf(cp);
		String path = referer.substring(indexPath + 13);
		
		appContext.setAttribute("appId", appId);
		String sessionId = (String)session.getAttribute("id");
		appId.put(id, sessionId);

		if (result == LoginStatus.OK) {
			session.setAttribute("id", id);
			if (appId.get(id) == id) {
				appId.remove(id);
				appId.put(id, sessionId);
				model.addAttribute("msg", "이미 해당 아이디로 접속중입니다.");
				model.addAttribute("redirectUrl", path);
				view = "loginFail";
			}
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
