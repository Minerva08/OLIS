package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.OrderListDAO;
import com.itbank.model.OrderListDTO;

@Service
public class OrderListService {

	@Autowired private OrderListDAO dao;
	
	public int orderInsert(HashMap<String, Object> ordto) {
		return dao.orderInsert(ordto);
	}

	public List<OrderListDTO> getOrderList(OrderListDTO oldto) {
		return dao.getOrderList(oldto);
	}

	public int orderlistSoldUpdate(OrderListDTO or) {
		return dao.orderlistSoldUpdate(or);
	}

	public List<OrderListDTO> getOrderList(HashMap<String, Object> map) {
		return dao.getOrderList1(map);
	}

}
