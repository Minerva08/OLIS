package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ShoppingDAO;
import com.itbank.model.ShoppingDTO;

@Service
public class ShoppingService {

	@Autowired private ShoppingDAO dao;
	
	public int shoppinginsert(HashMap<String, Object> map) {
		return dao.shoppinginsert(map);
	}

	public List<ShoppingDTO> getListshopping(HashMap<String, Object> map) {
		return dao.getListshopping(map);
	}

	public int shoppingKeepDelete(int idx) {
		return dao.shoppingKeepDelete(idx);
	}

	public int getCount(String nick) {
		return dao.getCount(nick);
	}

}
