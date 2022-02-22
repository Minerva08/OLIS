package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ReceiptDAO;
import com.itbank.model.ReceiptDTO;

@Service
public class ReceiptService {

	@Autowired private ReceiptDAO dao;
	
	public int receiptInsert(HashMap<String, Object> redto) {
		return dao.receiptInsert(redto);
	}

	public List<ReceiptDTO> getReceipt(ReceiptDTO redto) {
		return dao.getReceipt(redto);
	}

	public List<ReceiptDTO> getReceiptmore(HashMap<String, Object> map) {
		return dao.getReceiptmore(map);
	}


}
