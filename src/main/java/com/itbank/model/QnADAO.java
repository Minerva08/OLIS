package com.itbank.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface QnADAO {

	@Select("select * from qna" + 
			"   where 1=1" + 
			"    order by qna_idx" + 
			"    offset #{offset} rows" + 
			"    fetch first 7 rows only")
	ArrayList<QnADTO> getAllList(int offset);
	
	@Select("select count(*) count from qna")
	int getAllListCount();


	@Select("select * from qna" + 
			"   where qna_category=#{qna_category}" + 
			"    order by qna_idx" + 
			"    offset #{offset} rows" + 
			"    fetch first 7 rows only")
	List<QnADTO> FilterList(String qna_category, int offset);

	
	@Select("select * from qna" + 
			"   where qna_category=#{qna_category}" + 
			"    order by qna_idx" + 
			"    offset 0 rows" + 
			"    fetch first 7 rows only")
	List<QnADTO> getFilterList(String qna_category);
	
	@Select("select count(*) count from qna where qna_category=#{qna_category}")
	int getFilterCount(String qna_category);

	
	
	
	@Select("select * from qna" + 
			"   where qna_category='이용정책'" + 
			"    order by qna_idx" + 
			"    offset #{offset} rows" + 
			"    fetch first 7 rows only")
	List<QnADTO> list_p(int offset);

	@Select("select count(*) count from qna where qna_category='이용정책'")
	int count_p();
	
	
	
	
	@Select("select * from qna" + 
			"   where qna_category='공통'" + 
			"    order by qna_idx" + 
			"    offset #{offset} rows" + 
			"    fetch first 7 rows only")
	List<QnADTO> list_s(int offset);
	
	@Select("select count(*) count from qna where qna_category='공통'")
	int count_s();

	
	

	@Select("select * from qna" + 
			"   where qna_category='판매'" + 
			"    order by qna_idx" + 
			"    offset #{offset} rows" + 
			"    fetch first 7 rows only")
	List<QnADTO> list_sell(int offset);
	@Select("select count(*) count from qna where qna_category='판매'")
	int count_sell();

	
	
	
	@Select("select * from qna" + 
			"   where qna_category='구매'" + 
			"    order by qna_idx" + 
			"    offset #{offset} rows" + 
			"    fetch first 7 rows only")
	List<QnADTO> list_b(int offset);
	@Select("select count(*) count from qna where qna_category='구매'")
	int count_b();

	int insertqna(QnADTO dto);

	
	
}
