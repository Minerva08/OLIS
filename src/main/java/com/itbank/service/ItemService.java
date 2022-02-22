package com.itbank.service;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ItemDAO;
import com.itbank.model.ItemDTO;
import com.itbank.model.ProductDTO;

@Service
public class ItemService {

	@Autowired private ItemDAO dao;
	
	public List<ItemDTO> selectItem(String param) {
		return dao.selectItem(param);
	}

	public List<ItemDTO> getList() {
		return dao.selectList();
	}

	public int insert(HashMap<String, Object> map) {
		return dao.insert(map);
	}

}
