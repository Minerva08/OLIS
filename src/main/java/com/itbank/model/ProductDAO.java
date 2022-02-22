package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ProductDAO {
	
	@Select("select * from product where PRODUCT_MODEL_NUM=#{param}")
	ProductDTO selectOne(String param);

	List<ProductDTO> getList(HashMap<String, Object> map);
	
	int insert(ProductDTO dto);
	
	@Select("select DISTINCT product_brand from product")
	List<ProductDTO> brandList();

}
