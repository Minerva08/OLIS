package com.itbank.model;


/*
 * tradeReply_idx  number default TRADEREPLY_SEQ.nextval primary key,
    tradeReply_user_nick VARCHAR2(500) not null,
    tradeReply_user_profile VARCHAR2(500) not null,
    tradeReply_comment VARCHAR2(500) not null,
    trade_idx number not null,
 * */
public class TradeReplyDTO {
	private int tradeReply_idx,trade_idx;
	private String tradeReply_user_nick,tradeReply_user_profile,tradeReply_comment;
	public int getTradeReply_idx() {
		return tradeReply_idx;
	}
	public void setTradeReply_idx(int tradeReply_idx) {
		this.tradeReply_idx = tradeReply_idx;
	}
	public int getTrade_idx() {
		return trade_idx;
	}
	public void setTrade_idx(int trade_idx) {
		this.trade_idx = trade_idx;
	}
	public String getTradeReply_user_nick() {
		return tradeReply_user_nick;
	}
	public void setTradeReply_user_nick(String tradeReply_user_nick) {
		this.tradeReply_user_nick = tradeReply_user_nick;
	}
	public String getTradeReply_user_profile() {
		return tradeReply_user_profile;
	}
	public void setTradeReply_user_profile(String tradeReply_user_profile) {
		this.tradeReply_user_profile = tradeReply_user_profile;
	}
	public String getTradeReply_comment() {
		return tradeReply_comment;
	}
	public void setTradeReply_comment(String tradeReply_comment) {
		this.tradeReply_comment = tradeReply_comment;
	}
	
	

}
