package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface ItemDAO {

	@Select("select * from item where PRODUCT_MODEL_NUM=#{param}")
	List<ItemDTO> selectItem(String param);

	@Select("select * from item where userid")
	List<ItemDTO> selectList();
	
	@Insert("insert into item values(#{product_model_num}, #{item_size}, #{item_inven}, #{item_place},#{item_delibery})")
    int insert(HashMap<String, Object> map);

}
