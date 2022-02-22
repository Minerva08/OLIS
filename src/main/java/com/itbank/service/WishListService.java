package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.WishListDAO;
import com.itbank.model.WishListDTO;

@Service
public class WishListService {

	@Autowired private WishListDAO dao;
	
	public int wishItemInsert(HashMap<String, Object> map) {
		return dao.wishItemInsert(map);
	}

	public List<WishListDTO> getWishList(HashMap<String, Object> map) {
		return dao.getWishList(map);
	}

	public int wishItemdelete(HashMap<String, Object> map) {
		return dao.wishItemdelete(map);
	}

	public int getCount(String nick) {
		return dao.getCount(nick);
	}
}
