function onSearch() {
	console.log('d')
	if(searchComponent.style.opacity == 0) {
		searchComponent.style.opacity = '1'
		searchComponent.style.zIndex = '55'
		searchComponent.style.top = '0'
		header_overlay.style.display = 'block'
		document.querySelector('.header').style.zIndex = '48'
		document.body.style.overflow = 'hidden'
	}
}
function closeSearch() {
	searchComponent.style.opacity = '0'
	searchComponent.style.zIndex = '47'
	searchComponent.style.top = '-300px'
	header_overlay.style.display = 'none'
	document.body.style.overflowY = 'scroll'
}

function nospace(event) {
	//input에서 입력받은 문자의 공백제거 정규식 적용해 value값 저장
	console.log('nospace',event.target.value)
    event.target.value = event.target.value.replace(/(\s*)/g, "")    	
}

function onMsg(event) {
	const msgBox = document.querySelector('.chatList')
	if(msgBox.classList.contains('hidden') == false) {
		msgBox.style.right = '-250px'
		msgBox.classList.add('hidden')
		chat_screen.classList.add('hiddenNone')
	}
	else {
		msgBox.style.right = '0'
		msgBox.classList.remove('hidden')
		chatList()
	}
	
}