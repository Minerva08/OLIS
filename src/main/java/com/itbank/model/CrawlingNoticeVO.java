package com.itbank.model;

import java.sql.Date;

import lombok.Data;

@Data
public class CrawlingNoticeVO {

	private String notice_title;
	private String notice_category;
	private Date notice_date;
	
	
}
