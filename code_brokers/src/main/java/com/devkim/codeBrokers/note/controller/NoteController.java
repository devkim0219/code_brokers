package com.devkim.codeBrokers.note.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoteController {
	
	@RequestMapping("/note.note")
	public String note() {
		return "note";
	}
	
	
}
