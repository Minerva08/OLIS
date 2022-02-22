package com.itbank.model;

/*
USER_EMAIL	VARCHAR2(255 BYTE)
ADDRESS	VARCHAR2(500 BYTE)
ADDRESS_NAME	VARCHAR2(255 BYTE)
ADDRESS_PNUM	VARCHAR2(255 BYTE)
DEFAULT_ADDRESS	VARCHAR2(5 BYTE) 
 */

public class AddressDTO {
	
	private String user_email;
	private String address;
	private String address_name;
	private String address_pnum;
	private String default_address;
	private int address_idx;
	
	public int getAddress_idx() {
		return address_idx;
	}
	public void setAddress_idx(int address_idx) {
		this.address_idx = address_idx;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}
	public String getAddress_pnum() {
		return address_pnum;
	}
	public void setAddress_pnum(String address_pnum) {
		this.address_pnum = address_pnum;
	}
	public String getDefault_address() {
		return default_address;
	}
	public void setDefault_address(String default_address) {
		this.default_address = default_address;
	}
	
	
}
