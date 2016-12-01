package com.devkim.codeBrokers.login.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devkim.codeBrokers.login.dao.LoginDao;
import com.devkim.codeBrokers.login.dto.LoginDto;
import com.devkim.codeBrokers.util.LoginStatus;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	LoginDao loginDao;
	
	@Override
	public int loginCheck(HttpSession session, String id, String password) {
		int loginStatus = 0;
		List<LoginDto> result = loginDao.loginCheck(id);
		
		if (result.size() != 0) {
			LoginDto loginDto = result.get(0);
			if (password.equals(loginDto.getPassword())) {
				loginStatus = LoginStatus.OK;
				session.setAttribute("nickname",loginDto.getNickname());
			} else {
				loginStatus = LoginStatus.PASS_FAIL;
			}
		} else {
			loginStatus = LoginStatus.NOT_MEMBER;
		}
		return loginStatus;
	}

}
