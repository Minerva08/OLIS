function getJson() {
	const url = cpath + '/getProductList'
	const opt = {
		method: 'GET'
	}
	const json = fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		console.log(json)
		return json
	})
	return json
}
function searchJson(search) {
	console.log(search)
	const url = cpath + '/searchList?search=' + search
	const opt = {
		method: 'GET'
	}
	const json = fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		return json
	})
	return json
}
function render(target,json) {
	target.innerHTML = ''
	let dom = ''
	let pageDom = ''
	
	json.then(arr => {
		if(arr[0] == null) {
			target.innerHTML = '<div class="nullMsg jcce">상품이 비어있습니다!!!!</div>'
		}
		pageEnd = arr.length / 20
		if(arr.length % 20 != 0) {
			pageEnd += 1
		}
		pageEnd = Math.floor(pageEnd)
		if(pageEnd == 0) {
			pageEnd = 1
		}
 		pageDom +=	`<ul class="jcce">`
		pageDom +=		`<span class="pro_prevBtn">◀</span>`
		for(let i = pageStart; i <= pageEnd; i++) {
			if(page == i-1) {
				pageDom +=	`<li value="${i-1}" style="font-weight:bold;">${i}</li>`
			}
			else {
				pageDom +=	`<li value="${i-1}">${i}</li>`
			}
			if(i == pageStart + 4) {
				i = pageEnd
			}
		}
		pageDom +=		`<span class="pro_nextBtn">▶</span>`
		pageDom +=	`</ul>`
		let start = page * 20
		let end = start + 20
		if(arr[0] != null){
			for(let i = start; i < end; i++) {
				const price = arr[i].product_price.toLocaleString('ko-KR')
				dom += '<div class="item">'
				dom += `<div class="img jcce aice" data-modelnum="${arr[i].product_model_num}"><img src="${arr[i].product_img1}" width="100%" data-modelnum="${arr[i].product_model_num}"></div>`
				dom += `<div class="brand">${arr[i].product_brand }</div>`
				dom += `<div class="name" data-modelnum="${arr[i].product_model_num}">${arr[i].product_name}</div>`
				dom += `<div class="price">${price }원</div>`
				dom += `<div class="now">즉시 구매가</div> `
				dom += `<div class="wish">❤ ${arr[i].product_wish_count} 회</div>`
				dom += '</div>'
				if(i == arr.length - 1) {
					i = end 
				}
			}
			target.innerHTML = dom
		}
		pageTarget.innerHTML = pageDom
		const imgs = document.querySelectorAll('.img')
		const names = document.querySelectorAll('.name')
		const addBox_closeBtn = document.querySelectorAll('.product > .product_main > .right_productList > .add_category > ul > li > span')
		const pageBtn = document.querySelectorAll('.product>.product_main>.right_productList>.page>ul>li')
		const pro_prevBtn = document.querySelector('.product>.product_main>.right_productList>.page>ul>.pro_prevBtn')
		const pro_nextBtn = document.querySelector('.product>.product_main>.right_productList>.page>ul>.pro_nextBtn')
		pro_prevBtn.addEventListener('click', onPro_prevBtn)
		pro_nextBtn.addEventListener('click', onPro_nextBtn)
		imgs.forEach(dto => {
			dto.addEventListener('click', clickDetail)
		
		})
		names.forEach(dto => {
			dto.addEventListener('click', clickDetail)
		})
		addBox_closeBtn.forEach(btn => {
			btn.addEventListener('click',closeAddBox)
		})
		pageBtn.forEach(btn => {
			btn.addEventListener('click', clickPageBtn)
		})
		
	})
	window.scrollTo(0,0)
}
function onCategory(event) {
	box = event.target
	while(box.classList.contains('category_box') == false) {
		box = box.parentNode
	}
	const title = box.firstChild.nextSibling.children[1]
	const div = box.firstChild.nextSibling.children[2]
	const plus = box.children[1].children[0]
	
	if(div.classList.contains('hiddenNone')) {
		plus.innerText = '–'
		plus.parentNode.style.top = '5px'
		title.classList.add('hiddenNone')
		div.classList.remove('hiddenNone')
		box.style.alignItems = 'normal'
	}
	else if(title.previousElementSibling === event.target || plus === event.target){
		plus.innerText = '+'
		box.parentNode.style.top = '20px'
		title.classList.remove('hiddenNone')
		div.classList.add('hiddenNone')
		box.style.alignItems = 'center'
	}
}
function clackMainLi(event) {
	page = 0
	// 이벤트 전체가 아닌 선택한 요소만 이벤트 발생
	event.stopPropagation()
	// checkbox 요소 찾는 알고리즘
	let target = event.target
	console.log(target)
	if(target.value == null || target.value == '0') {
		console.log('ddd')
		while(target.value != '0') {
			target = target.parentNode
		}
		while(target.value == null || target.value == '0') {
			target = target.children[0]
		}
	}
	// 필터 적용되는 요소
	const checkBoxValue = target.value
	const key = checkBoxValue.split('=')[0]
	const value = checkBoxValue.split('=')[1]
	// ============
	
	
	// 체크박스가 이미 체크 되어있을 때 체크 닫기 후
	if(target.checked == true) {
		sortBtnNomal()
		json = getJson()
		filterArr = []
		// 체크 해제한 값 필터
		filterKey = filterKey.filter(ob => ob != checkBoxValue)
		// 체크 해제한 카테고리 박스 필터 후 그리기
		categoryArr = categoryArr.filter(ob => ob != target.nextElementSibling.innerText)
		target.checked = false
		// 선택된 카테고리가 없으면 초기 제이슨으로 렌더
		if(filterKey.length == 0) {
			sortBtnNomal()
			render(item_box, json)
		}
		else {
			// 선택된 카테고리가 있으면 필터링 된 배열로 렌더링
			render(item_box, filtering(filterKey, json, target))
		}
		// 메인 카테고리 체크 박스 풀었을 때 서브 카테고리 닫기
		let subCheck = target.parentNode.nextElementSibling
		if(subCheck != null && subCheck.classList.contains('sub_category')){ 
			subCheck.classList.add('hiddenNone')		
		}
		// 서브 카테고리 체크 박스 풀었을 때 서브 카테고리 닫기
		subCheck = target.parentNode.parentNode.parentNode
		if(subCheck.classList.contains('sub_category')) {
			subCheck.classList.add('hiddenNone')
		}
		// 카테고리 체크 박스 풀면  그 체크박스의 이름과 카테고리 선택한 박스의 이름이 같으면 지우기
		let choose_sub = target
		// 체크박스 선택이 없으면 서브 카테고리의 이름을 기본으로 넣는다 
		while(choose_sub.classList.contains('product_category') == false) {
			choose_sub = choose_sub.parentNode
		}
		choose_sub = choose_sub.previousElementSibling
		choose_sub.style.fontWeight = 'normal'
		choose_sub.innerText = '모든 카테고리'
	}
	else {
		offCheck(target)
		target.checked = true
		let choose_sub = target
		// 서브 카테고리에 선택한 체크 박스의 이름을 넣는다 
		while(choose_sub.classList.contains('product_category') == false) {
			choose_sub = choose_sub.parentNode
		}
		choose_sub = choose_sub.previousElementSibling
		choose_sub.style.fontWeight = 'bold'
		choose_sub.innerText = target.nextElementSibling.innerText
		// 다른 카테고리를 선택했으므로 정렬 초기화
		sortBtnNomal()
		json = getJson()
		// 선택되어 있는 체크박스만  카테고리 선택된 박스에 넣는다 
		filterArr = []
		filterKey = []
		categoryArr = []
		checkBoxList.forEach(box => {
			if(box.checked == true) {
				// 배열을 초기화 후 선택된 체크박스만 배열에 넣어둔다(선택 취소한 값 빼기)
				filterKey.unshift(box.value)
				categoryArr.push(box.nextElementSibling.innerText)
			}
		})
		
		// 선택한 것이 카테고리 박스 중 카테고리 필터이면 선택한 체크박스를 제외한 서브 카테고리는 숨기고
		// 선택한 체크박스의 div와 서브 박스를 연다
		let categoryKind = target
		while(categoryKind.classList.contains('category_box') == false) {
			categoryKind = categoryKind.parentNode
		}
		if(categoryKind.id == 'category') {
			sub_category.forEach(box => {
				box.classList.add('hiddenNone')
			})
		}
		let subCheck = target.parentNode.nextElementSibling
		if(subCheck != null && subCheck.classList.contains('sub_category')){
			subCheck.classList.remove('hiddenNone')				
		}
		subCheck = target.parentNode.parentNode.parentNode
		if(subCheck.classList.contains('sub_category')) {
			subCheck.classList.remove('hiddenNone')
		}
		// 선택된 박스 그리기
		render(item_box, filtering(filterKey, json, target))
	}
	// 추가 박스를 비우고 categoryArr에 있는 요소 그리기
	add_box.innerHTML = ''
	categoryArr.forEach(item => {
		add_box.innerHTML += '<li class="df"><div>' + item + '</div><span>⨉</span></li>'
	})	
}
function clickSortBtn(event) {
	sortBtnNomal()
	let cnt = 0
	checkBoxList.forEach(box => {
		if(box.checked == true) {
			cnt += 1
		}
	})
	if(cnt == 0) {
		filterArr = json
	}
	// 정렬하는 함수 호출!
	const sortKind = event.target.value
	const arr = getSort(filterArr, sortKind)
	render(item_box, arr)
	sortBtnSet(event.target)
}
function sortBtnNomal() {
	sortBtn.forEach(btn => {
		btn.style.backgroundColor = '#f4f4f4'
		btn.style.color = 'black'
		btn.style.fontWeight = 'normal'
	})
}
function sortBtnSet(target) {
	target.style.backgroundColor = '#FEF7F6'
	target.style.color = '#F15746'
	target.style.fontWeight = 'bold'
}
function getSort(filterArr, kind) {
	return json.then(ob => {
		const name = kind.split('/')[0]
		const asc = kind.split('/')[1]
		if(filterArr == json) {
			if(asc == 'asc') {
				return ob.sort((a, b) => a[name] > b[name] ? 1 : -1)	
			}
			else {
				return ob.sort((a, b) => a[name] > b[name] ? -1 : 1)
			}
		}
		else{	// json 이 아니라면 json 객체가 아니기 때문에 then()으로 못 쓰기 때문에 조건문 사용
			if(asc == 'asc') {
				return filterArr.sort((a, b) => a[name] > b[name] ? 1 : -1)	
			}
			else {
				return filterArr.sort((a, b) => a[name] > b[name] ? -1 : 1)
			}
		} 
			
	})
}
function filtering(filterKey, json, target) {
	// 처음 필터링에는 초기 제이슨으로 필터 시킨 후 배열에 카테고리 값이 있으면 그 값으로 필터링
	return json.then(arr => {
		for(let i = 0; i < filterKey.length; i++) {
			let key = filterKey[i].split('=')[0]
			console.log(key)
			console.log(arr)
			let value = filterKey[i].split('=')[1]
			const priceInput = document.querySelectorAll('input[name="price"]')
			let priceChecked = ''
			let priceName = '' 
			priceInput.forEach(input => {
				if(input.checked == true) {
					priceChecked = input.value
					priceName = input.name
				}
			}) 
			if(i == 0) {
				if(filterKey[i] == priceChecked) {
					filterArr = arr.filter(ob => {
						let flag1 = ob['product_' + priceName] > key + '0000'
						let flag2 = flag1 && ob['product_' + priceName] < value + '0000'
						return flag2
					})
				}
				else {
					filterArr = arr.filter(ob => ob['product_' + key] == value)
				}
			}
			else {
				if(filterKey[i] == priceChecked) {
					filterArr = filterArr.filter(ob => {
						let flag1 = ob['product_' + priceName] > key + '0000'
						let flag2 = flag1 && ob['product_' + priceName] < value + '0000'
						return flag2
					})
				}
				else {
					filterArr = filterArr.filter(ob => ob['product_' + key] == value)
				}
			}
		}
		return filterArr 
	})
}
function offCheck(kind) {
	let target = kind
	while(target.classList.contains('category_box') == false) {
		target = target.parentNode
	}
	// 본인 요소의 카테고리틀  체크 풀기
	categoryBox.forEach(box => {
		if(box.id == target.id) {
			const text = '.product > .product_main > .left_category >#' + box.id + ' > .title > .product_category > .main_category > li  input[type="checkbox"]'
			const category = document.querySelectorAll(text)
			category.forEach(box => {
				box.checked = false
			})
		}
	})
}
function closeAddBox(event) {
	filterKey = []
	sortBtnNomal()
	filterArr = []
	let target = event.target
	const closeBoxName = target.previousElementSibling.innerText
	target.parentNode.classList.add('hidden')
	checkBoxList.forEach(box => {
		if(box.checked == true && closeBoxName == box.nextElementSibling.innerText) {
			box.checked = false
			filterKey = filterKey.filter(ob => ob != box.value)
			let choose_sub = box
			// 체크박스 선택이 없어 서브 카테고리의 이름을 기본으로 넣는다 
			while(choose_sub.classList.contains('product_category') == false) {
				choose_sub = choose_sub.parentNode
			}
			choose_sub = choose_sub.previousElementSibling
			choose_sub.style.fontWeight = 'normal'
			choose_sub.innerText = '모든 카테고리'
		}
		if(box.checked == true) {
			filterKey.unshift(box.value)
		}
	})
	if(filterKey.length == 0) {
		// 선택된 카테고리가 없으면 초기 제이슨으로 렌더
		render(item_box, json)
	}
	else {
		render(item_box, filtering(filterKey, json))
	}
}
function clickPageBtn(event) {
	const target = event.target
	page = target.value
	if(filterKey.length == 0) {
		// 선택된 카테고리가 없으면 초기 제이슨으로 렌더
		render(item_box, json)
	}
	else {
		render(item_box, filtering(filterKey, json))
	}
}
function onPro_prevBtn(event) {
	if(pageStart == 1) {
		return
	}
	pageStart -= 5
	page = pageStart + 1
	if(filterKey.length == 0) {
		// 선택된 카테고리가 	없으면 초기 제이슨으로 렌더
		render(item_box, json)
	}
	else {
		render(item_box, filtering(filterKey, json))
	}
}
function onPro_nextBtn(event) {
	pageStart += 5 
	page = pageStart - 1
	if(pageEnd < pageStart) {
		pageStart -= 5 
		page = pageStart + 1
		return
	}
	if(filterKey.length == 0) {
		// 선택된 카테고리가 없으면 초기 제이슨으로 렌더
		render(item_box, json)
	}
	else {
		render(item_box, filtering(filterKey, json))
	}
}

// ======================product_detail========================
function checkSelectAll()  {
    
    // 모든 체크 체크박스
    const checkboxes = document.querySelectorAll('input[name="product_checkbox"]');
    
    // 선택된 체크박스
    const checked = document.querySelectorAll('input[name="product_checkbox"]:checked');
    
    // 전체동의 체크박스
    const selectAll = document.querySelector('input[name="selectall"]');
    
    if(checkboxes.length === checked.length)  {
      selectAll.checked = true;
    }else {
      selectAll.checked = false;
    }
  
  }
  
  function selectAll(selectAll)  {
    const checkboxes = document.getElementsByName('product_checkbox');
    
    checkboxes.forEach((checkbox) => {
      checkbox.checked = selectAll.checked
    })
  }
  
function clickDetail(event) { // 상품 리스트에서 클릭시 상품디테일로 이동 함수
    const modelnum = event.target.dataset.modelnum
    console.log(modelnum)
    location.href = cpath + '/product/product_detail?modelnum=' + modelnum //+ '?idx=0'
}

function imgDTOcount(img1, img2) { // 슬라이드 횟수 여부 파악함수
    const imgCount = document.querySelector('.product_img_count')
    let dom = '<li class="li_background"></li>'
    let num = '100%'
    imglast = 1
    if (img1 != '') {
        dom += '<li class="li_background"></li>'
        num = '50%'
        imglast = 2
    }
    if (img2 != '') {
        dom += '<li class="li_background"></li>'
        num = '33.3%'
        imglast = 3
    }
    imgCount.innerHTML = dom
    ul_li = imgCount.childNodes
    ul_li.forEach(li => {
        li.style.width = num
    })
    ul_li[0].style.backgroundColor = 'black'
}

function imgHandler(event) {
    imgnext += +event.target.dataset.n
    if (imgnext < 0 || imgnext == imglast) {
        if (imgnext < 0) imgnext = 0
        else if (imgnext == 1) imgnext = 0
        else if (imgnext == imglast) imgnext -= 1
        return
    }
    for (let i = 0; i < ul_li.length; i++) {
        if (imgnext == i) {
            ul_li[i].style.backgroundColor = 'black'
            imgSelect[i].classList.remove('hidden')
            const width = imgSelect[i].width
            const height = imgSelect[i].height
            imgbox.style.width = width + 'px'
            imgbox.style.height = height + 'px'
        }
        else {
            ul_li[i].style.backgroundColor = ''
            imgSelect[i].classList.add('hidden')
        }
    }
}

function preHandler() {
    let target = event.target
    while (target.classList.contains('li_dropdown') == false) {
        target = target.parentNode
    }
    let flag = target.children[1].classList.contains('hiddenNone')
    if (flag == true) {
        target.children[1].classList.remove('hiddenNone')
        target.children[0].style.borderBottom = '1px solid black'
        target.children[0].children[0].style.fontWeight = 'bold'
        return
    }
    if (flag == false) {
        target.children[1].classList.add('hiddenNone')
        target.children[0].style.borderBottom = ''
        target.children[0].children[0].style.fontWeight = ''
        return
    }
}

function onBuy() {
	if (login == '') {
		location.href = cpath + '/member/login'
		return
	}
    if (product_modal_BuySlide.style.opacity = '0') {
        product_modal_BuySlide.style.transitionDuration = '0.5s'
        product_modal_BuySlide.style.opacity = '1'
        product_modal_BuySlide.style.zIndex = '4'
        product_overlay.style.display = 'block'
        document.querySelector('.header').style.zIndex = '2'
        document.body.style.overflow = 'hidden'
    }
}

function onWish() {
	if (login == '') {
		location.href = cpath + '/member/login'
		return
	}
    if (product_detail_modal_wish.style.opacity = '0') {
        product_detail_modal_wish.style.transitionDuration = '0.5s'
        product_detail_modal_wish.style.opacity = '1'
        product_detail_modal_wish.style.zIndex = '4'
        product_overlay.style.display = 'block'
        document.querySelector('.header').style.zIndex = '2'
        document.body.style.overflow = 'hidden'
    }   	
	wish_item_dto.forEach(dto => {
		for (let i = 0; i < size.length; i++) {
			if (dto.dataset.size == size[i]) {
				dto.style.border = '2px solid black'
			    dto.classList.add('wish')
			    dto.children[0].innerText = '❤'
			}
		}
	})
    
}

function onkeep() {
	if (login == '') {
		location.href = cpath + '/member/login'
		return
	}
	if (product_detail_modal_shopping.style.opacity = '0') {
        product_detail_modal_shopping.style.transitionDuration = '0.5s'
        product_detail_modal_shopping.style.opacity = '1'
        product_detail_modal_shopping.style.zIndex = '4'
        product_overlay.style.display = 'block'
        document.querySelector('.header').style.zIndex = '2'
        document.body.style.overflow = 'hidden'
    } 
}

function selectshoppingItem(event) {
	closeModalproduct()
	let target = event.target
    while (target.classList.contains('shopping_item_dto') == false) {
        target = target.parentNode
    }
    const datasize = target.dataset.size
    const url = cpath + '/shoppinginsert'
    const opt = {
		method: 'POST',
		headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
        	shopping_price: price,
        	shopping_size: datasize,
        	shopping_color: color,
        	shopping_img: img,
        	shopping_user_nickname: user_nickname,
        	shopping_model_num: model_num,
        	shopping_model_name: model_name,
        	shopping_brand: model_brand, 
        }),
    }
    fetch(url, opt)
    .then(resp => resp.text())
    .then(row => {
    	console.log(row)
    	if (row == 1) {
    		keepBtnClone.innerText = '담았습니다'
    		keepbtn.innerText = '담았습니다'
    		keepBtnClone.style.backgroundColor = 'black'
    		keepbtn.style.backgroundColor = 'black'
    	}
    })
    
}

function closeModalproduct() {
    product_modal_BuySlide.style.transitionDuration = '0s'
    product_detail_modal_wish.style.transitionDuration = '0s'
    product_detail_modal_shopping.style.transitionDuration = '0s'
    backAddress()
    backBtn()
    product_modal_BuySlide.style.opacity = '0'
    product_modal_BuySlide.style.zIndex = '-1'
    product_detail_modal_wish.style.opacity = '0'
    	product_detail_modal_shopping.style.opacity = '0'
    product_detail_modal_wish.style.zIndex = '-1'
    	product_detail_modal_shopping.style.zIndex = '-1'
    	product_overlay.style.display = 'none'
    document.body.style.overflowY = 'scroll'
    checkinput.forEach(ck => {
        ck.checked = false
    })
    product_buyBtn2.style.backgroundColor = 'white'
    product_buyBtn2.style.color = 'black'
    product_buyBtn2.removeEventListener('click', gobuyBtn2)
}

function selectBuyItem(event) {
    let target = event.target
    let data = target.dataset.size
    selectdelibery = target.dataset.delibery
    while (target.classList.contains('buy_item_dto') == false) {
        target = target.parentNode
        data = target.dataset.size
    }
    document.getElementById('buy_selectdelibery').innerText = selectdelibery
    size_span.innerText = data
    selectbuySize = data
    buy_size_input.setAttribute('value', data)
    const flag1 = target.classList.contains('selectBuy')
    let flag2 = false
    if (!flag1) {
        target.classList.add('selectBuy')
        target.style.border = '2px solid black'
        product_buyBtn1.addEventListener('click', gobuyBtn1)
        product_buyBtn1.style.backgroundColor = 'black'
        product_buyBtn1.style.color = 'white'

        buy_item_dto.forEach(ck => {
            if (ck != target) {
                ck.classList.remove('selectBuy')
                ck.style.border = '0.5px solid #dadada'
            }
        })
        flag2 = true
    }
    else {
        target.classList.remove('selectBuy')
        target.style.border = '0.5px solid #dadada'
    }
    if (!flag2) {
        product_buyBtn1.removeEventListener('click', gobuyBtn1)
        product_buyBtn1.style.backgroundColor = 'white'
        product_buyBtn1.style.color = 'black'
    }
}

function selectWishItem(evevt) {
    let target = event.target
    while (target.classList.contains('wish_item_dto') == false) {
        target = target.parentNode
    }
    const datasize = target.dataset.size
    console.log(datasize)
    const flag = target.classList.contains('wish')
    if (flag) {
        target.style.border = '0.5px solid #dadada'
        target.classList.remove('wish')
        target.children[0].innerText = '🤍'
        	const url1 = cpath + '/wishItemdelete?wish_model_num=' + model_num + '&wish_size=' + datasize
        	const opt1 = {
        		method: 'DELETE'
        }
        fetch(url1, opt1)
        .then(resp => resp.text())
        .then(row => {
        	if (row == 1) {
        		for(let i = 0; i < size.length; i++) {
        			  if(size[i] === datasize)  {
        				  console.log(datasize)
        				  console.log(size)
        			    size.splice(i, 1);
        			    i--;
        			  }
        			}
        		console.log(size)
        	}
        })
    }
    else {
        target.style.border = '2px solid black'
        target.classList.add('wish')
        target.children[0].innerText = '❤'
        	const url = cpath + '/wishIteminsert'
        	const optinsert = {
        	method: 'POST',
        	headers: {
        		"Content-Type": "application/json",
        	},
        	body: JSON.stringify({
        		wish_size: datasize,
        		wish_color: color,
        		wish_price: price,
        		wish_img: img,
        		wish_user_nickname: user_nickname,
        		wish_model_num: model_num,
        		wish_brand: model_brand,
        		wish_model_name: model_name
        	}),
        }
        fetch(url, optinsert)
            .then(resp => resp.text())
            .then(row => {
            	size.push(datasize)
                console.log(size)
            })
    }
}

function backBtn() {
    product_detail_modal_buy1.style.opacity = '1'
    product_detail_modal_buy1.style.zIndex = '0'
    product_detail_modal_buy2.style.opacity = '0'
    product_detail_modal_buy2.style.zIndex = '-1'
    product_detail_modal_buy3.style.opacity = '0'
    product_detail_modal_buy3.style.zIndex = '-1'
    checkinput.forEach(ck => {
        ck.checked = false
    })
}

function gobuyBtn1() {
    product_detail_modal_buy1.style.opacity = '0'
    product_detail_modal_buy1.style.zIndex = '-1'
    product_detail_modal_buy2.style.opacity = '1'
    product_detail_modal_buy2.style.zIndex = '0'
}

function gobuyBtn2() {
    product_detail_modal_buy2.style.opacity = '0'
    product_detail_modal_buy2.style.zIndex = '-1'
    product_detail_modal_buy3.style.opacity = '1'
    product_detail_modal_buy3.style.zIndex = '0'
}

function checkinputCount(event) {
    let flag = true
    checkinput.forEach(ck => {
        if (ck.checked != true) flag = false
    })
    if (flag) {
        product_buyBtn2.style.backgroundColor = 'black'
        product_buyBtn2.style.color = 'white'
        product_buyBtn2.addEventListener('click', gobuyBtn2)
    }
    else {
        product_buyBtn2.style.backgroundColor = 'white'
        product_buyBtn2.style.color = 'black'
        product_buyBtn2.removeEventListener('click', gobuyBtn2)
    }
}

function productAddaddress() {
    product_detail_modal_buy3.style.opacity = '0'
    product_detail_modal_buy3.style.zIndex = '-1'
    modal_address.style.opacity = '1'
    modal_address.style.zIndex = '0'
}

function backAddress() {
    product_detail_modal_buy3.style.opacity = '1'
    product_detail_modal_buy3.style.zIndex = '0'
    modal_address.style.opacity = '0'
    modal_address.style.zIndex = '-1'
    address_alert.forEach(v => {
        v.value = null
    })
    default_check_address.checked = false
}

function DaumAPIproduct() {
    new daum.Postcode({
        oncomplete: function (data) {
            var roadAddr = data.roadAddress;
            var extraRoadAddr = '';
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
            }

            if (data.buildingName !== '' && data.apartment === 'Y') {
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }

            if (extraRoadAddr !== '') {
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            postcode_input.value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            var guideTextBox = document.getElementById("guide");

            if (data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            }
            else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

function insertAddress(event) {
    event.preventDefault()
    for (let i = 0; i < address_alert.length; i++) {
        if (address_alert[0].value == '') {
            alert('이름을 입력해주세요')
            return
        }
        if (address_alert[1].value == '' && address_alert[1].length == 11) {
            alert('휴대폰 번호를 입력해주세요')
            return
        }
        if (address_alert[2].value == '') {
            alert('우편 번호를 검색하세요')
            return
        }
        if (address_alert[3].value == '') {
            alert('상세 주소를 입력하세요')
            return
        }
    }
    const postcode = document.querySelector('input[name="postcode"').value
    const user_address = document.querySelector('input[name="user_address"').value
    const address_detail = document.querySelector('input[name="address_detail"').value
    let default_address = 'N'
    const url = cpath + '/myPage/addinsertAddress'
    const opt = {
        method: 'POST',
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            address_pnum: document.querySelector('input[name="user_pnum2"').value,
            user_email: document.querySelector('input[name="user_email"').value,
            address_name: document.querySelector('input[name="user_name"').value,
            address: postcode + ' ' + user_address + '//' + address_detail,
            default_address: default_check_address.checked == true ? default_address = 'Y' : default_address = 'N',
        }),
    }
    fetch(url, opt)
        .then(resp => resp.text())
        .then(row => {
            if (row == '1') {
                select_address.innerHTML += '<option>' + postcode + ' ' + user_address + ' ' + address_detail + '</option>'
            }
        })
    backAddress()
}


function scrollEventDiv() {
    now_scroll = window.scrollY || document.documentElement.scrollTop
    if (now_scroll > 300) {
        scrollEvent_div.style.opacity = '1'
        scrollEvent_div.style.zIndex = '1'
    }
    else {
        scrollEvent_div.style.opacity = '0'
        scrollEvent_div.style.zIndex = '-1'
    }
}

function lastBuyproduct() {
	if (select_address.value == 'null') { // 주소 확인
        alert('주소를 선택해주세요')
        return
    }
    if (select_buycard.value == 'null') { // 결제 방법 확인
        alert('결제 방법을 선택해주세요')
        return
    }
    if (last_check_buy.checked == false) { // 결제 동의 확인
        alert('결제 동의 해주세요')
        return
    }
 
   // var IMP = window.IMP; // 생략가능
   //console.log(IMP)
    IMP.init('imp18930114');

    IMP.request_pay({
        pg: 'kakao',
        pay_method: 'card',
        merchant_uid: 'merchant_' + new Date().getTime(),
        name: '상품명 : ' + model_name,
        amount: price,
        buyer_name: user_nickname,
        buyer_postcode: '123-456',
        
    }, function (rsp) {      // callback함수
        console.log('rsp',rsp);
        if (rsp.success) {
            var msg = '결제가 완료되었습니다.';
            msg += '결제 금액 : ' + rsp.paid_amount;
            
            const url = cpath + '/orderReceiptInsert'
            const opt = {
                method: 'POST',
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    // 영수증 필드
                	receipt_totalprice: price + (+selectdelibery),
                	receipt_delibery: +selectdelibery,
                	user_nickname: user_nickname,
                	address: select_address.value,
                	receipt_img : img,
                	// 오더리스트 필드
                	order_price: price1,
                	product_model_num: model_num,
                	order_color: color,
                	order_size: selectbuySize,
                	order_product_img: img,
                	
                	// 포인트 사용여부
                	point: usepoint_ck.value != '' ? usepoint_ck.value : '0',
                	idx: modelidx != '0' ? modelidx : '0'	
                }),
            }
            fetch(url, opt)
            .then(resp => resp.text())
            .then(row => {
            	
            	if (row == 1) {
            		alert(msg)
            		location.href = cpath + '/product/product_detail?modelnum=' + model_num+'&idx=0'        		
            	}
            	else {
            		alert('결제에 실패 했습니다.')
            		location.href = cpath + '/product/product_detail?modelnum=' + model_num+'&idx=0'
            	}
            })

        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
        }
        alert(msg);
    });
}

function getmsg(msg) {
	if (msg != '') {
		alert(msg)
	}
}

function sizeDropDiv() {
	if (product_size_dropdown.classList.contains('hiddenNone')) {
		product_size_dropdown.classList.remove('hiddenNone')
	}
	else {
		product_size_dropdown.classList.add('hiddenNone')
	}
}

function recSlideLeft(event) {
	let value = event.target.value
	console.log(rec_ul.style.marginLeft)
	if(rec_ul.style.marginLeft == '0px') {
		return
	}
	gg += +value
	rec_ul.style.marginLeft = gg + 'px'
}
function recSlideRight(event) {
	let value = event.target.value
	gg -= +value
	rec_ul.style.marginLeft = gg + 'px'
}

function pointMinus(ob) {
	const total = document.querySelector('#usepoint_price')
	
	const obPoint = ob.value
	if(obPoint > loginPoint) {
		ob.value = loginPoint
	}
	total.innerText = +totalPrice - +ob.value
	price = +totalPrice - +ob.value
}