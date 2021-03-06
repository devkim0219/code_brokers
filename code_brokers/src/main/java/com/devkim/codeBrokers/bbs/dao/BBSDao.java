package com.devkim.codeBrokers.bbs.dao;

import java.util.HashMap;
import java.util.List;

import com.devkim.codeBrokers.bbs.dto.BBSDto;

public interface BBSDao {
	public void write(BBSDto article);
	public int getArticleCount(String category);
	public List<BBSDto> getArticles(HashMap<Object, Object> paramMap);
	public BBSDto content(String articleNum);
	public void upHit(String articleNum);
	public void delete(String articleNum);
	public BBSDto getUpdateArticle(String articleNum);
	public void update(BBSDto article);
}
