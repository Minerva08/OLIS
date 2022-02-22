package com.itbank.model;

import java.sql.Date;

public class ChatDTO {
	private int chat_idx;
	private String opponent_name;
	private String opponent_content;
	private String opponent_profile;
	private String self_name;    
	private String self_content;        
	private String self_profile;       
	private Date send_date;
	private int room_idx;
	
	public int getRoom_idx() {
		return room_idx;
	}
	public void setRoom_idx(int room_idx) {
		this.room_idx = room_idx;
	}
	public int getChat_idx() {
		return chat_idx;
	}
	public void setChat_idx(int chat_idx) {
		this.chat_idx = chat_idx;
	}
	public String getOpponent_name() {
		return opponent_name;
	}
	public void setOpponent_name(String opponent_name) {
		this.opponent_name = opponent_name;
	}
	public String getOpponent_content() {
		return opponent_content;
	}
	public void setOpponent_content(String opponent_content) {
		this.opponent_content = opponent_content;
	}
	public String getOpponent_profile() {
		return opponent_profile;
	}
	public void setOpponent_profile(String opponent_profile) {
		this.opponent_profile = opponent_profile;
	}
	public String getSelf_name() {
		return self_name;
	}
	public void setSelf_name(String self_name) {
		this.self_name = self_name;
	}
	public String getSelf_content() {
		return self_content;
	}
	public void setSelf_content(String self_content) {
		this.self_content = self_content;
	}
	public String getSelf_profile() {
		return self_profile;
	}
	public void setSelf_profile(String self_profile) {
		this.self_profile = self_profile;
	}
	public Date getSend_date() {
		return send_date;
	}
	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}
	
	
}
