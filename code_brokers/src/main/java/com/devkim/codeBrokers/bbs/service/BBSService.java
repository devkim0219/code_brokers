package com.devkim.codeBrokers.bbs.service;

import org.springframework.ui.Model;

import com.devkim.codeBrokers.bbs.dto.BBSDto;

public interface BBSService {
	public void write(BBSDto article);
	public Model list(int pageNum, String category, Model model);
	public Model content(String articleNum, Model model);
	public void delete(String articleNum);
	public void upHit(String articleNum);
	public BBSDto getUpdateArticle(String articleNum, Model model);
	public void update(BBSDto article);
}
