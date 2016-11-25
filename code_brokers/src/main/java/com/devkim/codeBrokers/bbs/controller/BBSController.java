package com.devkim.codeBrokers.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BBSController {
	
	@RequestMapping("/index.cbs")
	public String main(Model model) {
		return "index";
	}
	
	@RequestMapping("/test.cbs")
	public String test() {
		return "test";
	}
	
}
