// 채팅 목록 불러오기
function chatList() {
	const url = cpath + '/chatList'
	const opt = {
		method: 'GET'
	}
	fetch(url,opt)
	.then(resp => resp.json())
	.then(json => {
		chatRender(json)
		
	})
}
// 채팅 내용 불러오기
function chatContent() {
	const url = cpath + '/chatContent?room_idx=' + room_idx + '&self_name=' + self_name + '&opponent_name=' + writer_name
	const opt = {
		method: 'GET'
	}
	fetch(url,opt)
	.then(resp => resp.json())
	.then(json => {
		screenRender(json)
	})
}
// 채팅창 띄우기
function onScreen(event) {
	
	
	target = event.target
	while(target.classList.contains('chat_box')==false) {
		target = target.parentNode
	}
	const idx = target.dataset.idx
	const name = target.dataset.name
	writer_name = name
	room_idx = idx
	
		
	opponent_title.innerText = name
	recipient = name
	
	
	if(chat_screen.classList.contains('hiddenNone') == false) {
		chat_screen.classList.add('hiddenNone')
		chat_content.innerText =''
	}
	else {
		chat_screen.classList.remove('hiddenNone')
		chat_content.innerText =''
		chatContent(idx, self_name)
	}
}
// 채팅창에 그리기
function screenRender(json) {
	chat_content.innerHTML = ''
	const target = document.querySelector('.chatList > .list')
	const user = []
	let dom = ''
	const chat_notice = document.createElement('div')
	chat_notice.classList.add('chat_notice')
	chat_notice.innerText = '거래를 원하시면 채팅을 보내세요!!!!'
	chat_content.appendChild(chat_notice)
	json.forEach(arr => {
		// 담겨있는 채팅 내용인 json을 
		// 다른 객체에 필요한 것들만 담는다
		const ob = {}
		ob.content =  arr['self_content']
		ob.name = arr['self_name']
		ob.idx = arr['room_idx']
		user.push(ob)
		
	})
	user.forEach(ob => {
		const talk_box = document.createElement('div')
		const name = document.createElement('div')
		const message = document.createElement('span')
		// 자신이 보낸 건 오른 쪽에 배치하는 css클래스 
		if(ob.name == self_name) {
			talk_box.classList.add('self')
			selfMsg = ob.content
		} 
		else {
			talk_box.classList.add('opponent')
			opponentMsg = ob.content
		}
		name.innerText = ob.name
		message.innerText = ob.content
		talk_box.appendChild(name)
		talk_box.appendChild(message)
		
		chat_content.appendChild(talk_box)
		
	})
}
// 채팅 목록 그리기
function chatRender(json) {
	const target = document.querySelector('.chatList > .list')
	target.innerHTML = ''
	const user = []
	let dom = ''
		//
	json.forEach(arr => {
		const ob = {}
		// 마지막 대화내용 담기
		ob.content =  arr['self_content']
		
		// 상대인 것 찾기
		if(arr['opponent_name'] != self_name) {
			ob.name = arr['opponent_name']
			if(arr['profile'] == null) ob.profile = 'http://ipon.co.kr/common/img/default_profile.png'
			else 					   ob.profile = arr['opponent_profile']
		}
		if(arr['self_name'] != self_name) {
			ob.name = arr['self_name']
			if(arr['profile'] == null) 	ob.profile = 'http://ipon.co.kr/common/img/default_profile.png'
			else 						ob.profile = arr['self_profile']
		}
		ob.idx = arr['room_idx']
		user.push(ob)
	})
	user.forEach(ob => {
		dom += `<div class="chat_box df" data-idx="${ob.idx}" data-name="${ob.name}">`
				dom += `<div class="profile jcce aice"><img src="${ob.profile}"></div>`
				dom += `<div class="content ffcl">`
					dom += `<div class="user_name">${ob.name}</div>`
					dom += `<div class="last_talk aice">${ob.content}</div>`
				dom += `</div>`
		dom += `</div>`
	})
	target.innerHTML = dom
	const chatBoxList = document.querySelectorAll('.chatList > .list > .chat_box')
	chatBoxList.forEach(box => {
		box.addEventListener('dblclick',onScreen)
	})
	
}

function onMessage(event) {
	const talk_box = document.createElement('div')
	const name = document.createElement('div')
	const message = document.createElement('span')
	if(JSON.parse(event.data).username == self_name) {
		talk_box.classList.add('self')
		selfMsg = JSON.parse(event.data).message
		insertMsg()
	} 
	else {
		talk_box.classList.add('opponent')
	}
	
	name.innerText = JSON.parse(event.data).username
	message.innerText = JSON.parse(event.data).message
	
	talk_box.appendChild(name)
	talk_box.appendChild(message)
	
	// 보낸사람과 상대가 같으면 그리기
	if(chat_screen.classList.contains('hiddenNone') == false  
			&& JSON.parse(event.data).username == chat_screen.children[0].innerText){
		chat_content.appendChild(talk_box)
		chat_content.scroll({top: chat_content.scrollHeight, behavior: `smooth`})
	}
	// 내가 보낸 거 그리기
	if(chat_screen.classList.contains('hiddenNone') == false 
			&& JSON.parse(event.data).username == self_name) {
		chat_content.appendChild(talk_box)
		chat_content.scroll({top: chat_content.scrollHeight, behavior: `smooth`})
	}
	chatList()
}
function keyHandler(event) {
	if (event.key == 'Enter') {
		sendHandler(event)
		const target = document.querySelector('.chatList > .list')
		target.innerHTML = ''
	}
}
function sendHandler(event) { 
	const message = sendMsg.value
	sendMsg.value = ''
	const payload = {
		username : self_name,
		message : message,
		opponent: recipient,
	}
	ws.send(JSON.stringify(payload))
	sendMsg.focus()
}
function onChatting() {
	if(login == '') {
		alert('로그인 후 가능한 서비스 입니다')
		location.href = cpath + '/member/login'
		return 
	}
	if(login_nickname == writer_name) {
		alert('본인 게시판입니다')
		return
	}
	room_idx = event.target.dataset.idx
	
	if(chat_screen.classList.contains('hiddenNone')) {
		chat_screen.classList.remove('hiddenNone')
		chatContent()
		sendMsg.focus()
	}
	else {
		chat_screen.classList.add('hiddenNone')
	}
	
}

function insertMsg() {
	const url = cpath + '/insertMsg'
	const ob = {
		'self_name': self_name,
		'self_content':  selfMsg,
		'opponent_name': writer_name,
		'opponent_content': opponentMsg,
		'room_idx': room_idx,
	}
	console.log(ob)
	selfMsg = ''
	opponentMsg = ''
	const opt = {
		method: 'POST',
		body: JSON.stringify(ob),
		headers: {
			'Content-Type': 'application/json; charset=utf-8'
		}
	}
	fetch(url, opt)
	.then(resp => resp.text())
	.then(text => {
		if(text == 1) {
			console.log('작성 성공')
		}
		else {
			console.log('작성 실패')
		}
	})
}