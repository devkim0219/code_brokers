package com.devkim.codeBrokers.login.dao;

import java.util.List;

import com.devkim.codeBrokers.login.dto.LoginDto;

public interface LoginDao {
	public List<LoginDto> loginCheck(String id);
}
