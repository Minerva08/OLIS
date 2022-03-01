package com.itbank.model;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/*
PRODUCT_MODEL_NUM	VARCHAR2(255 BYTE)
ORDER_COLOR	VARCHAR2(255 BYTE)
ORDER_PRICE	VARCHAR2(255 BYTE)
ORDER_SIZE	VARCHAR2(255 BYTE)
ORDER_ORDERNUM	VARCHAR2(255 BYTE)
ORDER_CHECK	VARCHAR2(5 BYTE)
*/

public class OrderListDTO {

	private int order_price;
	private String product_model_num; 
	private String order_color;
	private String order_size;
	private String order_ordernum;
	private String order_check;
	private String order_nickname;
	private String order_product_img;
	private String order_address;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern ="yyyy-MM-dd")
	private Date order_Date;
	@Override
		public String toString() {
			// TODO Auto-generated method stub
			return String.format("%s",order_Date);
		}
	
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public Date getOrder_Date() {
		return order_Date;
	}
	public void setOrder_Date(Date order_Date) {
		this.order_Date = order_Date;
	}
	public String getOrder_product_img() {
		return order_product_img;
	}
	public void setOrder_product_img(String order_product_img) {
		this.order_product_img = order_product_img;
	}
	public String getOrder_nickname() {
		return order_nickname;
	}
	public void setOrder_nickname(String order_nickname) {
		this.order_nickname = order_nickname;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public String getProduct_model_num() {
		return product_model_num;
	}
	public void setProduct_model_num(String product_model_num) {
		this.product_model_num = product_model_num;
	}
	public String getOrder_color() {
		return order_color;
	}
	public void setOrder_color(String order_color) {
		this.order_color = order_color;
	}
	public String getOrder_size() {
		return order_size;
	}
	public void setOrder_size(String order_size) {
		this.order_size = order_size;
	}
	public String getOrder_ordernum() {
		return order_ordernum;
	}
	public void setOrder_ordernum(String order_ordernum) {
		this.order_ordernum = order_ordernum;
	}
	public String getOrder_check() {
		return order_check;
	}
	public void setOrder_check(String order_check) {
		this.order_check = order_check;
	}

}
