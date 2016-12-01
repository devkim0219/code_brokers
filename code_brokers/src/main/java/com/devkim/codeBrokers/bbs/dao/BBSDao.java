package com.devkim.codeBrokers.bbs.dao;

import java.util.HashMap;
import java.util.List;

import com.devkim.codeBrokers.bbs.dto.BBSDto;

public interface BBSDao {
	public void write(BBSDto article);
	public int getArticleCount(String category);
	public List<BBSDto> getArticles(HashMap<Object, Object> paramMap);
}
