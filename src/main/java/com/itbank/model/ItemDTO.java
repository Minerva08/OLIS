package com.itbank.model;
/*
PRODUCT_MODEL_NUM
ITEM_SIZE
ITEM_INVEN
 */
public class ItemDTO {
	
	private String product_model_num;
	private String item_size;
	private String item_place;
	private int item_delibery;
	private int item_inven;
	
	public String getItem_place() {
		return item_place;
	}
	public void setItem_place(String item_place) {
		this.item_place = item_place;
	}
	public int getItem_delibery() {
		return item_delibery;
	}
	public void setItem_delibery(int item_delibery) {
		this.item_delibery = item_delibery;
	}
	public String getProduct_model_num() {
		return product_model_num;
	}
	public void setProduct_model_num(String product_model_num) {
		this.product_model_num = product_model_num;
	}
	public String getItem_size() {
		return item_size;
	}
	public void setItem_size(String item_size) {
		this.item_size = item_size;
	}
	public int getItem_inven() {
		return item_inven;
	}
	public void setItem_inven(int item_inven) {
		this.item_inven = item_inven;
	}
	
	
}
