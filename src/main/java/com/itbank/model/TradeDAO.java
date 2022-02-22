package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface TradeDAO {

	int insert(TradeDTO dto);

	List<TradeDTO> getList(HashMap<String, Object> map);

	int insertReply(HashMap<String, String> dto);

	@Select("select * from trade where trade_idx=#{idx}")
	TradeDTO selectOne(int idx);

	List<TradeReplyDTO> selectRep(int trade_idx);

	int modifyReply(HashMap<String, Object> map);

	int deleteReply(int tradeReply_idx);

	@Delete("delete trade where trade_idx=#{idx}")
	int salelistDelete(int idx);

	@Update("update trade set TRADE_SOLD='sold', TRADE_SOLD_DATE=#{trade_sold_date} where trade_idx=#{trade_idx}")
	int salelistSoldUpdate(TradeDTO td);

	int myPagesaleUpdte(TradeDTO dto);

	int likeCount(HashMap<String, Object> map);

	int trade_delete(int trade_idx);

	
}
