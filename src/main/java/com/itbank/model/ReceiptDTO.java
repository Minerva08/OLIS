package com.itbank.model;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/*
RECEIPT_IDX	NUMBER
USER_NICKNAME	VARCHAR2(255 BYTE)
RECEIPT_ORDERNUM	VARCHAR2(255 BYTE)
RECEIPT_ORDERDATE	DATE
RECEIPT_TOTALPRICE	NUMBER
RECIPT_DELIBERY	NUMBER
*/

public class ReceiptDTO {

	private int receipt_idx;
	private int receipt_totalprice;
	private int receipt_delibery;
	private String receipt_ordernum;
	private String user_nickname;
	private String receipt_address;
	private String receipt_img;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern ="yyyy-MM-dd")
	private Date receipt_orderDate;
	

	
	
	
	
	public String getReceipt_img() {
		return receipt_img;
	}
	public void setReceipt_img(String receipt_img) {
		this.receipt_img = receipt_img;
	}
	
	public String getReceipt_address() {
		return receipt_address;
	}
	public void setReceipt_address(String receipt_address) {
		this.receipt_address = receipt_address;
	}
	public int getReceipt_idx() {
		return receipt_idx;
	}
	public void setReceipt_idx(int receipt_idx) {
		this.receipt_idx = receipt_idx;
	}
	public int getReceipt_totalprice() {
		return receipt_totalprice;
	}
	public void setReceipt_totalprice(int receipt_totalprice) {
		this.receipt_totalprice = receipt_totalprice;
	}
	public int getReceipt_delibery() {
		return receipt_delibery;
	}
	public void setReceipt_delibery(int receipt_delibery) {
		this.receipt_delibery = receipt_delibery;
	}
	public String getReceipt_ordernum() {
		return receipt_ordernum;
	}
	public void setReceipt_ordernum(String receipt_ordernum) {
		this.receipt_ordernum = receipt_ordernum;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public Date getReceipt_orderDate() {
		return receipt_orderDate;
	}
	public void setReceipt_orderDate(Date receipt_orderDate) {
		this.receipt_orderDate = receipt_orderDate;
	}
	
}
