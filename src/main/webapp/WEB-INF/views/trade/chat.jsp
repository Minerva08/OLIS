<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<div class="chat_screen hiddenNone">
	<div class="opponent_title"></div>
	<div class="chat_closeBtn">⨉</div>
	<div class="component">
		<div class="chat_talkBox">
		</div>
	</div>
	<div class="chat_input">
		<input name="sendMsg" placeholder="채팅 입력" autofocus>
		<input type="button" class="sendBtn" value="전송">
	</div>
</div>

<div class="chatList hidden">
	<div class="title">채팅목록</div>
	<div class="list">
	</div>
</div>
<script>
	let writer_name = ''
	let writer_profile = ''
	let room_idx = ''
	let recipient = ''
	const self_name = '${login.user_nickname }'
	const self_profile = '${login.user_profile_img }'
	const sendBtn = document.querySelector('.chat_screen >.chat_input > .sendBtn')
	const sendMsg = document.querySelector('.chat_screen > .chat_input > input[name="sendMsg"]')
	const chat_closeBtn = document.querySelector('.chat_screen > .chat_closeBtn')
	const chat_screen = document.querySelector('.chat_screen')
	const chat_content = document.querySelector('.chat_screen > .component > .chat_talkBox')
	let opponent_title = document.querySelector('.chat_screen > .opponent_title')
	let ws
	if(login != '') {
		ws =  new SockJS(cpath + '/chat?self_name=' + self_name)
		ws.onmessage = onMessage
		ws.onopen = function(msg) {}
		ws.onclose = function(msg) {}
		ws.onerror = function(msg) {}
	}
	
	
	let opponentMsg = ''
	let selfMsg = ''
	chat_closeBtn.addEventListener('click', function offChat() {
		chat_screen.classList.add('hiddenNone')
	})
	sendMsg.addEventListener('keydown', keyHandler)

	
</script>