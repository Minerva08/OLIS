package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ChatDAO;
import com.itbank.model.ChatDTO;

@Service
public class ChatService {
	@Autowired private ChatDAO dao;
	public int insert(HashMap<String, String> map) {
		return dao.insert(map);
	}
	public List<ChatDTO> selectList(String user_nickname) {
		return dao.selectList(user_nickname);
	}
	public List<ChatDTO> selectListAll(String self_name, int room_idx, String opponent_name) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("self_name", self_name);
		map.put("room_idx", room_idx);
		map.put("opponent_name", opponent_name);
		return dao.selectListAll(map);
	}

}
