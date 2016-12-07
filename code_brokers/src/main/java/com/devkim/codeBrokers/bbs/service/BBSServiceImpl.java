package com.devkim.codeBrokers.bbs.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.devkim.codeBrokers.bbs.dao.BBSDao;
import com.devkim.codeBrokers.bbs.dto.BBSDto;
import com.devkim.codeBrokers.util.Page;

@Service
public class BBSServiceImpl implements BBSService {
	@Autowired
	BBSDao bbsDao;
	
	@Autowired
	Page page;
	
	BBSDto article;
	List<BBSDto> articleList;
	HashMap<Object, Object> paramMap;
	
	@Override
	public void write(BBSDto article) {
		bbsDao.write(article);		
	}

	@Override
	public Model list(int pageNum, String category, Model model) {
		int totalCount = 0;
		int pageSize = 10;
		int pageBlock = 10;
		
		totalCount = bbsDao.getArticleCount(category);
		page.paging(pageNum, totalCount, pageSize, pageBlock, category);
		paramMap = new HashMap<>();
		paramMap.put("startRow", page.getStartRow());
		paramMap.put("category", category);
		articleList = bbsDao.getArticles(paramMap);
		
		model.addAttribute("pageCode", page.getsb().toString());
		model.addAttribute("articleList", articleList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("category", category);
		
		return model;
	}
	
	public Model content(String articleNum, Model model) {
		bbsDao.upHit(articleNum);
		article = bbsDao.content(articleNum);
		model.addAttribute("article", article);
		return model;
	}

	@Override
	public void delete(String articleNum) {
		bbsDao.delete(articleNum);		
	}

	@Override
	public BBSDto getUpdateArticle(String articleNum, Model model) {
		article = bbsDao.getUpdateArticle(articleNum);
		model.addAttribute("article", article);
		return article;
	}

	@Override
	public void update(BBSDto article) {
		bbsDao.update(article);		
	}
	
}
