package com.itbank.model;

import java.util.HashMap;
import java.util.List;

public interface ChatDAO {

	public int insert(HashMap<String, String> map);
	
	public List<ChatDTO> selectList(String user_nickname);
	
	public List<ChatDTO> selectListAll(HashMap<String, Object> map);
}
