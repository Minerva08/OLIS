package com.itbank.model;


import java.text.SimpleDateFormat;
import java.util.Date;

/*
EVENT_IDX	NUMBER
EVENT_TITLE	VARCHAR2(255 BYTE)
EVENT_CONTENT	VARCHAR2(1000 BYTE)
EVENT_DATE_START	DATE
EVENT_DATE_END	DATE
EVENT_IMG	VARCHAR2(500 BYTE) 
 */



public class EventDTO {
	
//	EVENT_IDX
//	EVENT_TITLE
//	EVENT_CONTENT
//	EVENT_DATE_START
//	EVENT_DATE_END
//	EVENT_IMG
	
	private int event_idx;
	private String event_title;
	private String event_content;
	private Date event_date_start;
	private Date event_date_end;
	private String event_img;
	
	
	private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
	
	private int cntPage = 4;

	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("%s %s", event_title,event_content);
	}
	public EventDTO() {
		
	}
	public EventDTO(int total, int nowPage, int cntPerPage ) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}
	
	private void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
	private void calcStartEndPage(int nowPage, int cntPage) {
		//시작, 끝 페이지 계산
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage))* cntPage);
		if(getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if(getStartPage() < 1) {
			setStartPage(1);
		}
	}
	private void calcLastPage(int total, int cntPerPage) {
		//제일 마지막 페이지 계산
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getCntPage() {
		return cntPage;
	}
	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	
	//////////////////////////////////////////////////////////////////
	public int getEvent_idx() {
		return event_idx;
	}
	public void setEvent_idx(int event_idx) {
		this.event_idx = event_idx;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	
	public Date getEvent_date_start() {
		return event_date_start;
	}
	public void setEvent_date_start(Date event_date_start) {
		
		this.event_date_start = event_date_start;
	}
	public Date getEvent_date_end() {
		return event_date_end;
	}
	public void setEvent_date_end(Date event_date_end) {
		this.event_date_end = event_date_end;
	}
	public String getEvent_img() {
		return event_img;
	}
	public void setEvent_img(String event_img) {
		this.event_img = event_img;
	}
	
}
