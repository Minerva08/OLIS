package com.itbank.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.service.ItemService;

@Controller
public class ItemController {
	
	@Autowired private ItemService is;
	
	@PostMapping("/nogadaItem_insert")
	@ResponseBody
	public int nogada(@RequestBody HashMap<String, Object> map) {
		System.out.println(map);
		for(String key : map.keySet()) {
			System.out.println("key : " + key + ", value : " + map.get(key));
		}
		return is.insert(map);
	}
	
}
