package com.devkim.codeBrokers.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devkim.codeBrokers.member.dto.MemberDto;
import com.devkim.codeBrokers.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/joinForm.cbs")
	public String joinForm() {
		return "joinForm";
	}
	
	@RequestMapping("/join.cbs")
	public String join(MemberDto memberDto) {
		memberService.insertMember(memberDto);
		return "joinOK";
	}
}
