package com.itbank.chat;

import java.net.URLDecoder;
import java.util.HashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class ChatComponent extends TextWebSocketHandler {

	private HashMap<String, WebSocketSession> sessionMap = new HashMap<String, WebSocketSession>();
	private ObjectMapper mapper = new ObjectMapper();

	@Override // 연결이 성립되면 (접속이 유지되면) 호출되는 함수
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String uri = session.getUri().toString(); // 접속에 사용된 주소를 가져온다
		String id = uri.split("self_name=")[1]; // 주소에서 파라미터 형식의 id를 추출한다
		id = URLDecoder.decode(id, "UTF-8"); // UTF-8로 인코딩하여 한글도 처리할 수 있도록한다

		sessionMap.put(id, session);

	}

	@Override // 메세지를 받으면 서버가 수행하는 메서드
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		@SuppressWarnings("unchecked")
		HashMap<String, String> payload = mapper.readValue(message.getPayload(), HashMap.class);
		System.out.println(payload);
		for (String wss : sessionMap.keySet()) { // 리스트에 저장된 모든 세션중에서
			boolean flag = wss.equals(payload.get("opponent"));
			boolean flag2 = wss.equals(payload.get("username"));
			WebSocketSession sc = sessionMap.get(wss);

			if (flag2) {
				sc.sendMessage(new TextMessage(message.getPayload())); // 아이디를 포함하는 대상에게만 메시지 전송
			}
			if (flag) {
				sc.sendMessage(new TextMessage(message.getPayload())); // 아이디를 포함하는 대상에게만 메시지 전송
			}
		}
	}

	@Override // 연결이 종료되면 수행하는 메서드
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String uri = session.getUri().toString(); // 접속에 사용된 주소를 가져온다
		String id = uri.split("self_name=")[1]; // 주소에서 파라미터 형식의 id를 추출한다
		id = URLDecoder.decode(id, "UTF-8");

		sessionMap.remove(id);
		System.out.println(sessionMap);
	}

}
