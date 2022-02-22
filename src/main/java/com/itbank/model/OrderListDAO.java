package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface OrderListDAO {

	@Insert("insert into orderlist ("
			+ "PRODUCT_MODEL_NUM, "
			+ "ORDER_COLOR, "
			+ "ORDER_PRICE, "
			+ "ORDER_SIZE, "
			+ "ORDER_ORDERNUM, "
			+ "ORDER_PRODUCT_IMG, "
			+ "ORDER_NICKNAME, "
			+ "ORDER_ADDRESS) values ("
			+ "#{product_model_num}, "
			+ "#{order_color}, "
			+ "#{order_price}, "
			+ "#{order_size}, "
			+ "#{order_ordernum}, "
			+ "#{order_product_img}, "
			+ "#{order_nickname}, "
			+ "#{order_address})")
	int orderInsert(HashMap<String, Object> ordto);

	@Select("select * from orderlist where order_nickname=#{order_nickname}")
	List<OrderListDTO> getOrderList(OrderListDTO oldto);

	@Update("update orderlist set ORDER_CHECK='sold' where "
			+ "ORDER_NICKNAME=#{order_nickname} and "
			+ "ORDER_ORDERNUM=#{order_ordernum} and "
			+ "ORDER_SIZE=#{order_size}")
	int orderlistSoldUpdate(OrderListDTO or);

	List<OrderListDTO> getOrderList1(HashMap<String, Object> map);

}
