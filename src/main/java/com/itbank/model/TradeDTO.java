package com.itbank.model;

import java.sql.Date;
import org.springframework.web.multipart.MultipartFile;
import com.fasterxml.jackson.annotation.JsonFormat;

//TRADE_IDX	NUMBER
//TRADE_WRITER	VARCHAR2(255 BYTE)
//TRADE_PRODUCT_NAME	VARCHAR2(255 BYTE)
//TRADE_IMG1	VARCHAR2(255 BYTE)
//TRADE_IMG2	VARCHAR2(255 BYTE)
//TRADE_IMG3	VARCHAR2(255 BYTE)
//TRADE_UPLOAD_DATE	DATE
//TRADE_SOLD	VARCHAR2(10 BYTE)
//TRADE_CONTENT	VARCHAR2(500 BYTE)
//TRADE_PRICE	NUMBER
//TRADE_CATEGORY	VARCHAR2(255 BYTE)
//TRADE_SOLD_DATE	DATE
//TRADE_TITLE	VARCHAR2(255 BYTE)

public class TradeDTO {
	private int trade_idx;
	private String trade_writer;
	private String trade_user_profile;
	private String trade_product_name;
	private MultipartFile upload;
	private MultipartFile upload2;
	private MultipartFile upload3;
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("%d %s %s %s", trade_idx, trade_writer,trade_user_profile, trade_product_name);
	}
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern ="yyyy-MM-dd")
	private Date trade_upload_date;
	
	private String trade_sold;
	private String trade_content;
	private int trade_price;
	private String trade_price1;
	private String trade_category;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern ="yyyy-MM-dd")
	private Date trade_sold_date;
	private String trade_title;
	private String trade_img1;
	private String trade_img2;
	private String trade_img3;
	private int trade_like_count;
	
	
	
	
	public String getTrade_price1() {
		return trade_price1;
	}
	public void setTrade_price1(String trade_price1) {
		this.trade_price1 = trade_price1;
	}
	public int getTrade_like_count() {
		return trade_like_count;
	}
	public void setTrade_like_count(int trade_like_count) {
		this.trade_like_count = trade_like_count;
	}
	public String getTrade_user_profile() {
		return trade_user_profile;
	}
	public void setTrade_user_profile(String trade_user_profile) {
		this.trade_user_profile = trade_user_profile;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public MultipartFile getUpload2() {
		return upload2;
	}
	public void setUpload2(MultipartFile upload2) {
		this.upload2 = upload2;
	}
	public MultipartFile getUpload3() {
		return upload3;
	}
	public void setUpload3(MultipartFile upload3) {
		this.upload3 = upload3;
	}
	public String getTrade_img1() {
		return trade_img1;
	}
	public void setTrade_img1(String trade_img1) {
		this.trade_img1 = trade_img1;
	}
	public String getTrade_img2() {
		return trade_img2;
	}
	public void setTrade_img2(String trade_img2) {
		this.trade_img2 = trade_img2;
	}
	public String getTrade_img3() {
		return trade_img3;
	}
	public void setTrade_img3(String trade_img3) {
		this.trade_img3 = trade_img3;
	}
	public int getTrade_idx() {
		return trade_idx;
	}
	public void setTrade_idx(int trade_idx) {
		this.trade_idx = trade_idx;
	}
	public String getTrade_writer() {
		return trade_writer;
	}
	public void setTrade_writer(String trade_writer) {
		this.trade_writer = trade_writer;
	}
	public String getTrade_product_name() {
		return trade_product_name;
	}
	public void setTrade_product_name(String trade_product_name) {
		this.trade_product_name = trade_product_name;
	}
	public Date getTrade_upload_date() {
		return trade_upload_date;
	}
	public void setTrade_upload_date(Date trade_upload_date) {
		this.trade_upload_date = trade_upload_date;
	}
	public String getTrade_sold() {
		return trade_sold;
	}
	public void setTrade_sold(String trade_sold) {
		this.trade_sold = trade_sold;
	}
	public String getTrade_content() {
		return trade_content;
	}
	public void setTrade_content(String trade_content) {
		this.trade_content = trade_content;
	}
	public int getTrade_price() {
		return trade_price;
	}
	public void setTrade_price(int trade_price) {
		this.trade_price = trade_price;
	}
	public String getTrade_category() {
		return trade_category;
	}
	public void setTrade_category(String trade_category) {
		this.trade_category = trade_category;
	}
	public Date getTrade_sold_date() {
		return trade_sold_date;
	}
	public void setTrade_sold_date(Date trade_sold_date) {
		this.trade_sold_date = trade_sold_date;
	}
	public String getTrade_title() {
		return trade_title;
	}
	public void setTrade_title(String trade_title) {
		this.trade_title = trade_title;
	}
	
	
}
