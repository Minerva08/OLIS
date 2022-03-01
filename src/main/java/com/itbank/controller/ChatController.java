package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.model.ChatDTO;
import com.itbank.model.MemberDTO;
import com.itbank.service.ChatService;
@Controller
public class ChatController {
	
	@Autowired private ChatService cs;
	
	@GetMapping("/chatList")
	@ResponseBody
	public List<ChatDTO> chatList(HttpSession session) {
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		System.out.println(dto.getUser_nickname());
		return cs.selectList(dto.getUser_nickname());
	}
	
	@PostMapping("/insertMsg")
	@ResponseBody
	public int insertMsg(@RequestBody HashMap<String, String> map) {
		return cs.insert(map);
	}
	
	@GetMapping("/chatContent")
	@ResponseBody
	public List<ChatDTO> chatContent(String self_name, int room_idx, String opponent_name) {
		System.out.println(room_idx);
		return cs.selectListAll(self_name, room_idx, opponent_name);
	}
}
