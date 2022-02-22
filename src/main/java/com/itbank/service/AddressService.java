package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.AddressDAO;
import com.itbank.model.AddressDTO;

@Service
public class AddressService {

	@Autowired AddressDAO dao;

	public int addinsertAddress(HashMap<String, Object> map) {
		return dao.addinsertAddress(map);
	}

	public List<AddressDTO> getAddress(String email) {
		return dao.getAddress(email);
	}

	public int updateAddress(HashMap<String, Object> map) {
		return dao.updateAddress(map);
	}

	public AddressDTO selectOne(HashMap<String, Object> map) {
		return dao.selectOne(map);
	}

	public int deleteAddress(int idx) {
		return dao.deleteAddress(idx);
	}

}
