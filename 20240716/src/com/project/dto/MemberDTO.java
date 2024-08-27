package com.project.dto;

import java.sql.Timestamp;

public class MemberDTO {
	private int no; 
	private String email;
	private String password;
	private String nickname;
	private Timestamp create_at;
	
	public MemberDTO() {
	}
	
	public MemberDTO(String email, String password, String nickname) {
		this.email = email;
		this.password = password;
		this.nickname = nickname;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Timestamp getCreate_at() {
		return create_at;
	}
	public void setCreate_at(Timestamp create_at) {
		this.create_at = create_at;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [no=" + no + ", email=" + email + ", password=" + password + ", nickname=" + nickname
				+ ", create_at=" + create_at + "]";
	}
	
}
