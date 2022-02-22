package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;


import com.itbank.model.ProductDTO;
import com.itbank.service.ProductService;

@Controller
public class HomeController {
	
	@Autowired private ProductService ps;

	
	
	@ResponseBody
	@GetMapping("/homeItemList/{order}/{sort}")
	public List<ProductDTO> homeItemList(@PathVariable String order, @PathVariable String sort) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("order", order);
		map.put("sort", sort);
		return ps.selectList(map);
	}
}
