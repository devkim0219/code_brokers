package com.devkim.codeBrokers.member.service;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.devkim.codeBrokers.member.dao.MemberDao;
import com.devkim.codeBrokers.member.dto.MemberDto;

public class UserService implements UserDetailsService{
	@Autowired
	MemberDao memberDao;
	
	@SuppressWarnings("null")
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		MemberDto memberDto = memberDao.getUserByID(id);
		
		if (memberDto == null) {
			throw new UsernameNotFoundException("No user found with id " + memberDto.getId());
		}
		
		Collection<SimpleGrantedAuthority> roles = new ArrayList<>();
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		UserDetails user = new User(id, memberDto.getPassword(), roles);
		
		return user;
	}

}
