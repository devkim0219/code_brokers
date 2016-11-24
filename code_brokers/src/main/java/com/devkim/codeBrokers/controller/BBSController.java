package com.devkim.codeBrokers.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BBSController {
	
	@RequestMapping("/index.cbs")
	public String home(Model model) {
		return "index";
	}
	
	@RequestMapping("/joinForm.cbs")
	public String joinForm() {
		return "joinForm";
	}
	
	@RequestMapping("/join.cbs")
	public String join() {
		return "joinOK";
	}
	
	@RequestMapping("/login.cbs")
	public String login() {
		return "";
	}
	
	@RequestMapping("/test.cbs")
	public String test() {
		return "test";
	}
	
}
