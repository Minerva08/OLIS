package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface WishListDAO {

	@Insert("insert into wishlist ("
			+ "WISH_SIZE, "
			+ "WISH_COLOR, "
			+ "WISH_PRICE, "
			+ "WISH_IMG, "
			+ "WISH_USER_NICKNAME, "
			+ "WISH_MODEL_NUM, "
			+ "WISH_BRAND, "
			+ "WISH_MODEL_NAME) values ("
			+ "#{wish_size}, "
			+ "#{wish_color}, "
			+ "#{wish_price}, "
			+ "#{wish_img}, "
			+ "#{wish_user_nickname}, "
			+ "#{wish_model_num}, "
			+ "#{wish_brand}, "
			+ "#{wish_model_name})") 
	int wishItemInsert(HashMap<String, Object> map);

	List<WishListDTO> getWishList(HashMap<String, Object> map);

	int wishItemdelete(HashMap<String, Object> map);

	@Select("SELECT COUNT(*) FROM wishlist where WISH_USER_NICKNAME=#{nick}")
	int getCount(String nick);
}
