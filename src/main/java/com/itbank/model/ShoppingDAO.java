package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface ShoppingDAO {

	@Insert("insert into shopping ("
			+ "SHOPPING_SIZE, "
			+ "SHOPPING_COLOR, "
			+ "SHOPPING_PRICE, "
			+ "SHOPPING_IMG, "
			+ "SHOPPING_USER_NICKNAME, "
			+ "SHOPPING_MODEL_NUM, "
			+ "SHOPPING_MODEL_NAME, "
			+ "SHOPPING_BRAND) values ("
			+ "#{shopping_size}, "
			+ "#{shopping_color}, "
			+ "#{shopping_price}, "
			+ "#{shopping_img}, "
			+ "#{shopping_user_nickname}, "
			+ "#{shopping_model_num}, "
			+ "#{shopping_model_name}, "
			+ "#{shopping_brand})")
	int shoppinginsert(HashMap<String, Object> map);

	List<ShoppingDTO> getListshopping(HashMap<String, Object> map);

	@Delete("delete shopping where shopping_idx=#{idx}")
	int shoppingKeepDelete(int idx);

	@Select("SELECT COUNT(*) FROM shopping where SHOPPING_USER_NICKNAME=#{nick}")
	int getCount(String nick);

}
