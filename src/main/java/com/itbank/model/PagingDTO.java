package com.itbank.model;

public class PagingDTO {
	private int offset;
	private int section;
	private int begin;
	private int total;
	private int end;
	private boolean pre;
	private boolean next;
	private int cntPerPage;
	private String search_event;

	public PagingDTO(int nowPage, int cntPerPage, int total, String search_event) {
		setOffset(offset(nowPage, cntPerPage));
		setSection(section(nowPage));
		setBegin(begin(nowPage));
		setTotal(total);
		setEnd(end(nowPage, total, cntPerPage));
		setPre(pre(nowPage));
		setNext(next(nowPage, total, cntPerPage));
		setCntPerPage(cntPerPage);
		setSearch_event(search_event);

	}

	public int offset(int nowPage, int cntPerPage) {
		int offset = (nowPage - 1) * cntPerPage;
		return offset;
	}

	public int section(int nowPage) {
		int section = (nowPage - 1) / 5;
		return section;
	}

	public int begin(int nowPage) {
		int begin = 1;
		if (section(nowPage) != 0) {
			begin = section(nowPage) * 5 + 1;
			return begin;
		}

		return begin;
	}

	public int buttons(int total, int cntPerPage) {
		int buttons = 0;
		if (total % cntPerPage == 0) {
			buttons = total / cntPerPage;
		} else {
			buttons = (total / cntPerPage) + 1;
		}
		return buttons;
	}

	public int end(int nowPage, int total, int cntPerPage) {
		int end = begin(nowPage) + 4;
		int btn = buttons(total, cntPerPage);
		if (end >= btn) {
			end = btn;
		}
		return end;
	}

	public boolean pre(int nowPage) {
		boolean pre;
		if (section(nowPage) != 0) {
			pre = true;
		} else {
			pre = false;
		}
		return pre;
	}

	public boolean next(int nowPage, int total, int cntPerPage) {
		boolean next;
		if (buttons(total, cntPerPage) != end(nowPage, total, cntPerPage)) {
			next = true;
		} else {
			next = false;
		}
		return next;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getSection() {
		return section;
	}

	public void setSection(int section) {
		this.section = section;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public boolean isPre() {
		return pre;
	}

	public void setPre(boolean pre) {
		this.pre = pre;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public String getSearch_event() {
		return search_event;
	}

	public void setSearch_event(String search_event) {
		this.search_event = search_event;
	}

}