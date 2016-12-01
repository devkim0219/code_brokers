package com.devkim.codeBrokers.bbs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.devkim.codeBrokers.bbs.dto.BBSDto;
import com.devkim.codeBrokers.bbs.service.BBSService;

@Controller
public class BBSController {
	@Autowired
	BBSService bbsService;
	
	@RequestMapping("/index.bbs")
	public String main() {
		return "index";
	}
	
	@RequestMapping("/list.bbs")
	public String list(@RequestParam int pageNum, String category, Model model) {
		bbsService.list(pageNum, category, model);
		return "index";
	}
	
	@RequestMapping("/writeForm.bbs")
	public String writeForm() {
		return "writeForm";
	}
	
	@RequestMapping("/write.bbs")
	public String write(HttpSession session, BBSDto article, String category) {
		article.setId((String)session.getAttribute("id"));
		System.out.println("--------> category : " + category);
		article.setCategory(category);
		bbsService.write(article);
		return "redirect:/list.bbs?pageNum=1";
	}
	
	@RequestMapping("/test.bbs")
	public String test() {
		return "test";
	}
	
}
