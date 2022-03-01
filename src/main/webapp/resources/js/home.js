function ajaxItemList1() {
	const itemList = document.querySelector('.home > .home_component > #product1 > .product_list_wrap > .product_itemList')
	const url = cpath + '/homeItemList/product_upload/desc' 
	const opt = {
		method: 'GET'
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		const dom = getDom(json)
		itemList.innerHTML = dom
	})
}
function ajaxItemList2() {
	const itemList = document.querySelector('.home > .home_component > #product2 > .product_list_wrap > .product_itemList')
	const url = cpath + '/homeItemList/product_wish_count/desc' 
	const opt = {
		method: 'GET'
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		const dom = getDom(json)
		itemList.innerHTML = dom
	})
}
function ajaxItemList3() {
	const itemList = document.querySelector('.home > .home_component > #product3 > .product_list_wrap > .product_itemList')
	const url = cpath + '/homeItemList/product_price/desc' 
	const opt = {
		method: 'GET'
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		const dom = getDom(json)
		itemList.innerHTML = dom
	})
}

function onPrev() {
	if(btnValue == 1) {
		return
	}
	btnValue += +prevBtn.value
	liList.forEach(item => {
		if(item != document.getElementById(`${btnValue}`)){
			item.classList.add('hidden')
		}
	})
	document.getElementById(`${btnValue}`).classList.remove('hidden')
	radioList.forEach(input => {
		input.checked = false
		const label = document.querySelectorAll('.home > .home_component >.event_animation> .home_radio_bullets>label')
		label.forEach(la => {
			la.style.backgroundColor = '#EFEFEF'
		})
	})
	document.querySelector(`.home > .home_component >.event_animation> .home_radio input:nth-child(${btnValue})`).checked = true
	document.querySelector(`.home > .home_component >.event_animation> .home_radio_bullets>label:nth-child(${btnValue})`).style.backgroundColor = 'lightcoral'
}

function onNext() {
	if(btnValue == 5) {
		btnValue = 0
	}
	btnValue += +nextBtn.value
	liList.forEach(item => {
		if(item != document.getElementById(`${btnValue}`)){
			item.classList.add('hidden')
		}
	})
	document.getElementById(`${btnValue}`).classList.remove('hidden')
	radioList.forEach(input => {
		input.checked = false
		const label = document.querySelectorAll('.home > .home_component >.event_animation> .home_radio_bullets>label')
		label.forEach(la => {
			la.style.backgroundColor = '#EFEFEF'
		})
	})
	document.querySelector(`.home > .home_component > .event_animation> .home_radio input:nth-child(${btnValue})`).checked = true
	document.querySelector(`.home > .home_component >.event_animation> .home_radio_bullets>label:nth-child(${btnValue})`).style.backgroundColor = 'black'
}

function radioClick(event) {
	const radio = event.target
	const label = document.querySelectorAll('.home > .home_component >.event_animation> .home_radio_bullets>label')
	label.forEach(la => {
		la.style.backgroundColor = '#EFEFEF'
	})
	radio.checked = true
	liList.forEach(other => {
		other.classList.add('hidden')
	})
	btnValue = +radio.value
	document.getElementById(`${btnValue}`).classList.remove('hidden')
	document.querySelector(`.home > .home_component >.event_animation> .home_radio_bullets>label:nth-child(${btnValue})`).style.backgroundColor = 'black'
}


function addList(event) {
	if(event.target == addBtn1) {
		if(addBtn1.innerText=='더보기'){
			console.log('p1',addHeight1)
			addHeight1 += 453
			console.log('p2',addHeight1)
			wrap1.style.height = addHeight1 + 'px'
			
		}
		else if(addBtn1.innerText=='접기'){
			console.log('m1',addHeight1)
			addHeight1 -= 453
			console.log('m2',addHeight1)
			wrap1.style.height = addHeight1 + 'px'
			if(addHeight1==520){
				addBtn1.innerText=''
				addBtn1.innerText='더보기'
			}

		}
		if(addHeight1 >= 1900) {
			console.log(3,addHeight1)
			addBtn1.innerText=''
			addBtn1.innerText='접기'
			return
		}
	}
	else if(event.target == addBtn2) {
		addHeight2 += 460
		wrap2.style.height = addHeight2 + 'px'
		if(addHeight2 == 1900) {
			addBtn2.style.display = 'none'
			return
		}
	}
	else if(event.target == addBtn3) {
		addHeight3 += 460
		wrap3.style.height = addHeight3 + 'px'
		if(addHeight3 == 1900) {
			addBtn3.style.display = 'none'
			return
		}
	}
}
function clickDetail(event) { // 상품 리스트에서 클릭시 상품디테일로 이동 함수
    const modelnum = event.target.dataset.modelnum
    location.href = cpath + '/product/product_detail?modelnum=' + modelnum
}

function getDom(json) {
	let dom = ''
	json.forEach(dto => {
		const price = dto.product_price.toLocaleString('ko-KR')
		dom += `<div class="item_box">`
		dom += `<div class="item_img"><img src="${dto.product_img1}" width="270px" data-modelnum="${dto.product_model_num}"></div>`
		dom += `<div class="item_brand" data-modelnum="${dto.product_model_num}">${dto.product_brand}</div>`
		dom += `<div class="item_title" data-modelnum="${dto.product_model_num}">${dto.product_name}</div>`
		dom += `<div class="item_price">${price}원</div>`
		dom += `<div>즉시 구매가</div>`
		dom += `</div>`
		
	})	  
	const itemImg = document.querySelectorAll('.item_img')
	const itemBrand = document.querySelectorAll('.item_title')
	itemImg.forEach(item => {
		item.addEventListener('click', clickDetail)
	})
	itemBrand.forEach(item => {
		item.addEventListener('click', clickDetail)
	})
	return dom
}