package com.itbank.model;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.web.multipart.MultipartFile;

/*
PRODUCT_MODEL_NUM	VARCHAR2(255 BYTE)
PRODUCT_PRICE	NUMBER
PRODUCT_CATEGORY	VARCHAR2(255 BYTE)
PRODUCT_GENDER	VARCHAR2(10 BYTE)
PRODUCT_BRAND	VARCHAR2(255 BYTE)
PRODUCT_WISH_COUNT	NUMBER
PRODUCT_UPLOAD	DATE
PRODUCT_IMG2	VARCHAR2(500 BYTE)
PRODUCT_IMG3	VARCHAR2(500 BYTE)
PRODUCT_IMG1	VARCHAR2(500 BYTE)
PRODUCT_NAME	VARCHAR2(200 BYTE)
PRODUCT_COLOR	VARCHAR2(255 BYTE)
 */

public class ProductDTO {
	private String product_model_num;
	private int product_price;
	private int product_wish_count;
	private String product_category;
	private String product_gender;
	private String product_brand;
	private MultipartFile upload;
	private MultipartFile upload2;
	private MultipartFile upload3;
	private String product_name;
	private String product_color;
	private Date product_upload;
	private String product_img1;
	private String product_img2;
	private String product_img3;
	private String product_big_category;
	
	
	
	public String getProduct_big_category() {
		return product_big_category;
	}
	public void setProduct_big_category(String product_big_category) {
		this.product_big_category = product_big_category;
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
	public String getProduct_img1() {
		return product_img1;
	}
	public void setProduct_img1(String product_img1) {
		this.product_img1 = product_img1;
	}
	public String getProduct_img2() {
		return product_img2;
	}
	public void setProduct_img2(String product_img2) {
		this.product_img2 = product_img2;
	}
	public String getProduct_img3() {
		return product_img3;
	}
	public void setProduct_img3(String product_img3) {
		this.product_img3 = product_img3;
	}
	public String getProduct_color() {
		return product_color;
	}
	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}
	public String getProduct_model_num() {
		return product_model_num;
	}
	public void setProduct_model_num(String product_model_num) {
		this.product_model_num = product_model_num;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public String getProduct_gender() {
		return product_gender;
	}
	public void setProduct_gender(String product_gender) {
		this.product_gender = product_gender;
	}
	public String getProduct_brand() {
		return product_brand;
	}
	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}
	public int getProduct_wish_count() {
		return product_wish_count;
	}
	public void setProduct_wish_count(int product_wish_count) {
		this.product_wish_count = product_wish_count;
	}
	public String getProduct_upload() {
		return new SimpleDateFormat("yyyy-MM-dd").format(product_upload);
	}
	public void setProduct_upload(Date product_upload) {
		this.product_upload = product_upload;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
}
