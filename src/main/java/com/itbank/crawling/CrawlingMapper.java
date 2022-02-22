package com.itbank.crawling;

import java.util.List;

import com.itbank.model.CrawlingNoticeVO;

public interface CrawlingMapper {
	public void insertNotice(List<CrawlingNoticeVO> list);

}
