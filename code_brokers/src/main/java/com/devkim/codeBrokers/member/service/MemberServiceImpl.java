package com.devkim.codeBrokers.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devkim.codeBrokers.member.dao.MemberDao;
import com.devkim.codeBrokers.member.dto.MemberDto;


@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public void insertMember(MemberDto memberDto) {
		memberDao.insertMember(memberDto);
	}

}
