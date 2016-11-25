package com.devkim.codeBrokers.member.dto;

public class MemberDto {
	private String id;
	private String password;
	private String email;
	private String nickname;
	private String mailPermit;
	private String notePermit;
	private String joinDate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMailPermit() {
		return mailPermit;
	}
	public void setMailPermit(String mailPermit) {
		this.mailPermit = mailPermit;
	}
	public String getNotePermit() {
		return notePermit;
	}
	public void setNotePermit(String notePermit) {
		this.notePermit = notePermit;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", password=" + password + ", email=" + email + ", nickname=" + nickname
				+ ", mailPermit=" + mailPermit + ", notePermit=" + notePermit + ", joinDate=" + joinDate + "]";
	}
		
}
