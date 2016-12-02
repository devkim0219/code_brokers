package com.devkim.codeBrokers.bbs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String list(int pageNum, String category, Model model) {
		bbsService.list(pageNum, category, model);
		return "list";
	}
	
	@RequestMapping("/writeForm.bbs")
	public String writeForm(String category, Model model) {
		model.addAttribute("category", category);
		return "writeForm";
	}
	
	@RequestMapping("/write.bbs")
	public String write(HttpSession session, BBSDto article, String category) {
		article.setId((String)session.getAttribute("id"));
		article.setCategory(category);
		bbsService.write(article);
		return "redirect:/list.bbs?pageNum=1&category=" + category;
	}
	
	@RequestMapping("/content.bbs")
	public String content(String pageNum, String articleNum) {
		bbsService.content(articleNum);
		return "content";
	}
	
	@RequestMapping("/test.bbs")
	public String test() {
		return "test";
	}
	
}
