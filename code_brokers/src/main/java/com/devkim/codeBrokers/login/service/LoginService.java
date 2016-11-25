package com.devkim.codeBrokers.login.service;

import javax.servlet.http.HttpSession;

public interface LoginService {
	public int loginCheck(HttpSession session, String id, String password);
}
