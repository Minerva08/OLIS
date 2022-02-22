package com.itbank.model;

/*
WISH_IDX	NUMBER
WISH_SIZE	VARCHAR2(255 BYTE)
WISH_COLOR	VARCHAR2(500 BYTE)
WISH_PRICE	NUMBER
WISH_IMG	VARCHAR2(500 BYTE)
WISH_USER_NICKNAME	VARCHAR2(255 BYTE)
WISH_MODEL_NUM	VARCHAR2(255 BYTE)
WISH_BRAND	VARCHAR2(255 BYTE)
WISH_MODEL_NAME	VARCHAR2(255 BYTE)
*/

public class WishListDTO {

	private int wish_idx;
	private int wish_price;
	private String wish_size;
	private String wish_color;
	private String wish_img;
	private String wish_user_nickname;
	private String wish_model_num;
	private String wish_brand;
	private String wish_model_name;
	
	public int getWish_idx() {
		return wish_idx;
	}
	public void setWish_idx(int wish_idx) {
		this.wish_idx = wish_idx;
	}
	public int getWish_price() {
		return wish_price;
	}
	public void setWish_price(int wish_price) {
		this.wish_price = wish_price;
	}
	public String getWish_size() {
		return wish_size;
	}
	public void setWish_size(String wish_size) {
		this.wish_size = wish_size;
	}
	public String getWish_color() {
		return wish_color;
	}
	public void setWish_color(String wish_color) {
		this.wish_color = wish_color;
	}
	public String getWish_img() {
		return wish_img;
	}
	public void setWish_img(String wish_img) {
		this.wish_img = wish_img;
	}
	public String getWish_user_nickname() {
		return wish_user_nickname;
	}
	public void setWish_user_nickname(String wish_user_nickname) {
		this.wish_user_nickname = wish_user_nickname;
	}
	public String getWish_model_num() {
		return wish_model_num;
	}
	public void setWish_model_num(String wish_model_num) {
		this.wish_model_num = wish_model_num;
	}
	public String getWish_brand() {
		return wish_brand;
	}
	public void setWish_brand(String wish_brand) {
		this.wish_brand = wish_brand;
	}
	public String getWish_model_name() {
		return wish_model_name;
	}
	public void setWish_model_name(String wish_model_name) {
		this.wish_model_name = wish_model_name;
	}
	
}
