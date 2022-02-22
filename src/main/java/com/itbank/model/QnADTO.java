package com.itbank.model;

import org.springframework.web.multipart.MultipartFile;

/*
QNA_IDX	NUMBER
QNA_CATEGORY	VARCHAR2(200 BYTE)
QNA_TITLE	VARCHAR2(255 BYTE)
QNA_CONTENT	VARCHAR2(2000 BYTE)
 */

public class QnADTO {
	
	private int qna_idx;
	private String qna_category;
	private String qna_title;
	private String qna_content;
	private MultipartFile upload;

	@Override
	public String toString() {
		return String.format("[%d %s %s %s]", qna_idx,qna_category, qna_title,qna_content);
	}
	
	

	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public int getQna_idx() {
		return qna_idx;
	}
	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}
	public String getQna_category() {
		return qna_category;
	}
	public void setQna_category(String qna_category) {
		this.qna_category = qna_category;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

}
