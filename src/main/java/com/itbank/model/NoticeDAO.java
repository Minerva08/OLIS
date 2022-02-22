package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface NoticeDAO {
	
	@Select("select * from notice where notice_idx=#{idx}")
	NoticeDTO getnoticeOne(int idx);

	@Select("select count(*) count from notice")
	int count();

	@Select("select * from notice" + 
			"   where 1=1" + 
			"    order by notice_idx" + 
			"    offset #{offset} rows" + 
			"    fetch first 7 rows only")
	List<NoticeDTO> getnoticeList(int offset);

	int insertNotice(NoticeDTO dto);

}
