package com.itbank.model;

/*
shopping_idx number default shopping_seq.nextval PRIMARY key,
shopping_size VARCHAR2(255 BYTE) not null,
shopping_color VARCHAR2(255 BYTE) not null,
shopping_price number not null,
shopping_img VARCHAR2(500 BYTE) not null,
shopping_user_nickname VARCHAR2(255 BYTE) not null,
shopping_model_num VARCHAR2(255 BYTE) not null,
shopping_model_name VARCHAR2(255 BYTE) not null,
shopping_brand VARCHAR2(255 BYTE) not null, 
*/

public class ShoppingDTO {

	private int shopping_idx;
	private int shopping_price;
	private String shopping_size;
	private String shopping_color;
	private String shopping_img;
	private String shopping_user_nickname;
	private String shopping_model_num;
	private String shopping_model_name;
	private String shopping_brand;
	public int getShopping_idx() {
		return shopping_idx;
	}
	public void setShopping_idx(int shopping_idx) {
		this.shopping_idx = shopping_idx;
	}
	public int getShopping_price() {
		return shopping_price;
	}
	public void setShopping_price(int shopping_price) {
		this.shopping_price = shopping_price;
	}
	public String getShopping_size() {
		return shopping_size;
	}
	public void setShopping_size(String shopping_size) {
		this.shopping_size = shopping_size;
	}
	public String getShopping_color() {
		return shopping_color;
	}
	public void setShopping_color(String shopping_color) {
		this.shopping_color = shopping_color;
	}
	public String getShopping_img() {
		return shopping_img;
	}
	public void setShopping_img(String shopping_img) {
		this.shopping_img = shopping_img;
	}
	public String getShopping_user_nickname() {
		return shopping_user_nickname;
	}
	public void setShopping_user_nickname(String shopping_user_nickname) {
		this.shopping_user_nickname = shopping_user_nickname;
	}
	public String getShopping_model_num() {
		return shopping_model_num;
	}
	public void setShopping_model_num(String shopping_model_num) {
		this.shopping_model_num = shopping_model_num;
	}
	public String getShopping_model_name() {
		return shopping_model_name;
	}
	public void setShopping_model_name(String shopping_model_name) {
		this.shopping_model_name = shopping_model_name;
	}
	public String getShopping_brand() {
		return shopping_brand;
	}
	public void setShopping_brand(String shopping_brand) {
		this.shopping_brand = shopping_brand;
	}
	
	
}
