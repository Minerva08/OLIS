package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface ReceiptDAO {

	@Insert("insert into receipt ("
			+ "USER_NICKNAME, "
			+ "RECEIPT_ORDERNUM, "
			+ "RECEIPT_TOTALPRICE, "
			+ "RECEIPT_DELIBERY, "
			+ "RECEIPT_ADDRESS, RECEIPT_IMG) values ("
			+ "#{user_nickname}, "
			+ "#{receipt_ordernum}, "
			+ "#{receipt_totalprice}, "
			+ "#{receipt_delibery},"
			+ "#{receipt_address},"
			+"#{receipt_img})")
	int receiptInsert(HashMap<String, Object> redto);

	@Select("select * from receipt where user_nickname=#{user_nickname} order by receipt_idx desc")
	List<ReceiptDTO> getReceipt(ReceiptDTO redto);

	List<ReceiptDTO> getReceiptmore(HashMap<String, Object> map);

}
