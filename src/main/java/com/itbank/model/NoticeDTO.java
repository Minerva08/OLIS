package com.itbank.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

/*
NOTICE_IDX	NUMBER
NOTICE_CATEGORY	VARCHAR2(200 BYTE)
NOTICE_DATE	DATE
NOTICE_CONTENT	VARCHAR2(2000 BYTE)
NOTICE_TITLE	VARCHAR2(255 BYTE)
*/

public class NoticeDTO {
	
	private int notice_idx;
	private String notice_category;
	private String notice_content;
	private String notice_title;
	private Date notice_date;
	private MultipartFile upload;
	
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getNotice_category() {
		return notice_category;
	}
	public void setNotice_category(String notice_category) {
		this.notice_category = notice_category;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	
}
