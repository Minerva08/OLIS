package com.itbank.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

/*
USER_EMAIL	VARCHAR2(255 BYTE)
USER_PW	VARCHAR2(255 BYTE)
USER_NICKNAME	VARCHAR2(255 BYTE)
USER_PNUM	VARCHAR2(50 BYTE)
USER_PROFILE_IMG	VARCHAR2(500 BYTE)
USER_GENDER	VARCHAR2(10 BYTE)
USER_JOIN_DATE	DATE
MEMBER_OUT	VARCHAR2(3 BYTE) 
 */

public class MemberDTO {
	
	private int point;
	private String user_email;
	private String user_pw;
	private String user_nickname;
	private String user_pnum;
	private MultipartFile upload;
	private String user_profile_img;
	private String user_gender;
	private Date user_join_date;
	private String member_out;
	private String grade;
	   
	@Override
	public String toString() {
		return String.format("%s %s %s %s %s %s %s %s %s", user_email,user_pw,user_nickname,
				user_pnum,user_profile_img,user_gender,user_join_date,member_out,upload);
	}
	
	
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_pnum() {
		return user_pnum;
	}

	public void setUser_pnum(String user_pnum) {
		this.user_pnum = user_pnum;
	}

	public String getUser_profile_img() {
		return user_profile_img;
	}

	public void setUser_profile_img(String user_profile_img) {
		this.user_profile_img = user_profile_img;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public Date getUser_join_date() {
		return user_join_date;
	}

	public void setUser_join_date(Date user_join_date) {
		this.user_join_date = user_join_date;
	}

	public String getMember_out() {
		return member_out;
	}

	public void setMember_out(String member_out) {
		this.member_out = member_out;
	}

}
