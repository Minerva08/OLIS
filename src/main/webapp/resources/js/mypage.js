function nowpage(url) {
	const mypage_a = document.querySelectorAll('.myPage_left > div > ul > li > a')
	for (let i = 0; i < mypage_a.length; i++) {
		if (mypage_a[i].getAttribute('href').split('?')[0] + '' == url + '') {
			mypage_a[i].style.color = 'black'
			mypage_a[i].style.fontWeight = 'bold'
			return
		}
	}
}

function clickHandler(event) {
	for (let i = 0; i < border_bottom.length; i++) {
		if (i === +event.target.dataset.n) {
			border_bottom[i].classList.add('border_bottom')
			border_bottom[i].style.paddingBottom = '0px'
			border_bottom[i].firstElementChild.style.color = 'red'
			border_bottom[i].lastElementChild.style.color = 'black'
			border_bottom[i].lastElementChild.style.fontWeight = 'bold'
		}
		else {
			border_bottom[i].classList.remove('border_bottom')
			border_bottom[i].style.paddingBottom = '2px'
			border_bottom[i].firstElementChild.style.color = 'black'
			border_bottom[i].lastElementChild.style.color = 'gray'
			border_bottom[i].lastElementChild.style.fontWeight = ''
		}
	}
}
function profileUpload(event) {
	let target = event.target
	let file = target.files[0]
	var reader = new FileReader();
    reader.readAsDataURL(file); //파일을 읽는 메서
    reader.onload =  function() {
    	const img = document.querySelector('.profile_div1>form>label>img')
    	console.log(img)
    	console.log(reader.result)
    	img.src = reader.result
    	if (infoimg != img.src + '') {
    		flagimg = true
    	}
	}
}

function imgModifyandDeletebtn(event) {
	
	if (event.target.dataset.btn + '' == '0') {
		if (flagimg) {
			info_img_modify.onsubmit()
		}
		else {
			event.preventDefault()
			alert('프로필 이미지를 변경해 주세요')
			return
		}
	}
	else {
		if (confirm('정말 프로필 사진을 삭제 하시겠습니까?')) {
			location.href = cpath + '/infoimgDelete'
		}
		else return
	}
	
}

function addressAddBtn(event) {
	modal_address_id.innerText = '주소 추가하기'
	address_overlay.style.display = 'block'
	address_overlay.style.zIndex = '49'
	modal_address.style.opacity = '1'
	modal_address.style.zIndex = '5'
	address_modal_Box.style.zIndex = '50'
	address_modal_Box.style.opacity = '1'
	document.body.style.overflow = 'hidden'
//	for (let i = 0; i < address_alert.length; i++) {
//		address_alert[i].value = ''
//	}
	if (addressDefault == '') {
		default_check_address.checked = true
		//default_check_address.disabled = true
		default_check_address_ment.innerText = '기본 배송지로 등록됩니다'
	}
	else {
		default_check_address.checked = false
		//default_check_address.disabled = false
		default_check_address_ment.innerText = '기본 배송지 설정'			
	}
}

function modify_addressBtn_df(event) {
//	console.log(addressDefault)
//	if (addressDefault == '') {
//		return
//	}
	modify_addressBtn(event)
}

function modify_addressBtn(event) {
	modal_address_form_my.removeEventListener('submit', insertAddress)
	modal_address_form_my.addEventListener('submit', updateAddress)
	modal_address_id.innerText = '주소 수정하기'
	address_overlay.style.display = 'block'
	address_overlay.style.zIndex = '49'
	modal_address.style.opacity = '1'
	modal_address.style.zIndex = '5'
	address_modal_Box.style.zIndex = '50'
	address_modal_Box.style.opacity = '1'
	document.body.style.overflow = 'hidden'
	const data = event.target.dataset
	const idx = data.address_idx
	const user_email = data.user_email
	const address = data.address
	const address_name = data.address_name
	const address_pnum = data.address_pnum
	const default_address = data.default_address
	if (addressDefault == default_address) {
		default_check_address.checked = true
		default_check_address.disabled = true
		default_check_address_ment.innerText = '기본 배송지 입니다'
	}
	else {
		default_check_address.checked = false
		default_check_address.disabled = false
		default_check_address_ment.innerText = '기본 배송지 설정'	
	}
	document.querySelector('input[name="postcode"]').value = address.substr(0, 5)
	document.querySelector('input[name="user_address"]').value = address.substr(6).split('//')[0]
	document.querySelector('input[name="address_detail"]').value = address.split('//')[1]
	document.querySelector('input[name="user_pnum2"]').value = address_pnum
	document.querySelector('input[name="user_email"]').value = user_email
	document.querySelector('input[name="user_name"]').value = address_name
	document.querySelector('input[name="address_idx"]').value = idx
}

function backAddress() {
	address_overlay.style.display = 'none'
	address_overlay.style.zIndex = '-1'
	modal_address.style.opacity = '0'
	modal_address.style.zIndex = '-1'
	address_modal_Box.style.opacity = '0'
	address_modal_Box.style.zIndex = '-1'
	document.body.style.overflowY = 'scroll'
	modal_address_form_my.addEventListener('submit', insertAddress)
	modal_address_form_my.removeEventListener('submit', updateAddress)
}

function insertAddress(event) {
	console.log('인서트')
    event.preventDefault()
   
        if (address_alert[0].value == '') {
            alert('이름을 입력해주세요')
            return
        }
        if (address_alert[1].value == '') {
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
    
    const postcode = document.querySelector('input[name="postcode"]').value
    const user_address = document.querySelector('input[name="user_address"]').value
    const address_detail = document.querySelector('input[name="address_detail"]').value
    let default_address = 'N'
    	
    const url = cpath + '/myPage/addinsertAddress'
    const opt = {
        method: 'POST',
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            address_pnum: document.querySelector('input[name="user_pnum2"]').value,
            user_email: document.querySelector('input[name="user_email"]').value,
            address_name: document.querySelector('input[name="user_name"]').value,
            address: postcode + ' ' + user_address + '//' + address_detail,
            default_address: default_check_address.checked == true ? default_address = 'Y' : default_address = 'N',
        }),
    }
    fetch(url, opt)
        .then(resp => resp.text())
        .then(row => {
        	console.log(default_check_address.checked)
            if (row == '1') {
                location.href = cpath + '/myPage/address'
              
            }
            else if (row == '2') {
            	alert('새주소지가 기본 배송지로 등록되었습니다')
            	location.href = cpath + '/myPage/address'
            }
            else {
            	alert('주소 등록 실패')
            }
        })
}

function updateAddress() {
	event.preventDefault()
    const dto = event.target.dataset.dto
    for (let i = 0; i < address_alert.length; i++) {
        if (address_alert[0].value == '') {
            alert('이름을 입력해주세요')
            return
        }
        if (address_alert[1].value == '') {
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
	const idx = event.target.dataset.address_idx
	console.log(idx)
    const postcode = document.querySelector('input[name="postcode"]').value
    const user_address = document.querySelector('input[name="user_address"]').value
    const address_detail = document.querySelector('input[name="address_detail"]').value
    let default_address = 'N'
    const url = cpath + '/myPage/updateAddress'
    const opt = {
        method: 'PUT',
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            address_pnum: document.querySelector('input[name="user_pnum2"]').value,
            user_email: document.querySelector('input[name="user_email"]').value,
            address_name: document.querySelector('input[name="user_name"]').value,
            address: postcode + ' ' + user_address + '//' + address_detail,
            default_address: default_check_address.checked == true ? default_address = 'Y' : default_address = 'N',
            address_idx: document.querySelector('input[name="address_idx"]').value,
            modify: 'mf'
        }),
    }
    fetch(url, opt)
        .then(resp => resp.text())
        .then(row => {
        	console.log(row)
            if (row == '1') {
                location.href = cpath + '/myPage/address'
            }
            else {
            	alert('주소 수정실패')
            }
        })
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

function deleteAddress(event) {
	if (confirm("선택한 주소를 삭제하시겠습니까?")) {
		const idx = event.target.dataset.address_idx
		const url = cpath + '/deleteAddress?idx=' + idx
		const opt = {
				method: 'DELETE'
		}
		fetch(url, opt)
		.then(resp => resp.text())
		.then(row => {
			if (row == 0) {
				alert('삭제 실패')
			}
			else {
				location.href = cpath + '/myPage/address'
			}
		})		
	}
}


//=====================인포==============================
 
function selectBtn_pw(event) {
	if (event.target.dataset.c == undefined) {
		profile_divhidden_password.classList.remove('hiddenNone')
		profile_btn_password.style.display = 'none'
	}
	else {
		profile_divhidden_password.classList.add('hiddenNone')
		profile_btn_password.style.display = 'block'
		document.querySelector('input[name="user_pw"]').value = ''
		document.querySelector('input[name="user_pw2"]').value = ''
		document.getElementById('Info_pw_ck1').innerText = ''
		document.getElementById('Info_pw_ck2').innerText = ''
	}
}

function selectBtn_nick(event) {
	if (event.target.dataset.c == undefined) {
		profile_divhidden_nickname.classList.remove('hiddenNone')
		profile_btn_nickname.style.display = 'none'	
	}
	else {
		profile_divhidden_nickname.classList.add('hiddenNone')
		profile_btn_nickname.style.display = 'block'	
			document.getElementById('Info_nick_ck').innerText = ''
				document.querySelector('input[name="user_nickname"]').value = ''
	}
}

function selectBtn_pnum(event) {
	if (event.target.dataset.c == undefined) {
		profile_divhidden_pnum.classList.remove('hiddenNone')
		profile_btn_pnum.style.display = 'none'		
	}
	else {
		profile_divhidden_pnum.classList.add('hiddenNone')
		profile_btn_pnum.style.display = 'block'	
			document.querySelector('input[name="user_pnum"]').value = ''
	}
}

function selectBtn_out(event) {
	if (event.target.dataset.c == undefined) {
		profile_divhidden_out.classList.remove('hiddenNone')
		profile_btn_out.style.display = 'none'
	}
	else {
		profile_divhidden_out.classList.add('hiddenNone')
		profile_btn_out.style.display = 'block'	
			document.querySelector('input[name="checked2"]').checked = false
			document.querySelector('input[name="checked1"]').checked = false
	}
}
	
function updateFetch(event) {
	let data = ''
	let name = ''
		
	const user_pw = event.target.dataset.pw
	if (user_pw != undefined && flagpw1 == true && flagpw2 == true && document.querySelector('input[name="user_pw"]').value != '') {
		data = document.querySelector('input[name="user_pw"]').value
		name = 'user_pw'
	}
	const user_nickname = event.target.dataset.nick
	if (user_nickname != undefined && flagnick == true && document.querySelector('input[name="user_nickname"]').value != '') {
		data = document.querySelector('input[name="user_nickname"]').value
		name = 'user_nickname'
	}
	const user_pnum = event.target.dataset.pnum
	if (user_pnum != undefined && document.querySelector('input[name="user_pnum"]').value.length == 11) {
		data = data = document.querySelector('input[name="user_pnum"]').value
		name = 'user_pnum'
	}
	if (data == '' && name == '') {
		if (user_nickname != undefined && document.querySelector('input[name="user_nickname"]').value != '') {
			alert('중복 체크해주세요')
			return
		}
		alert('입력 정보를 확인해주세요')
		return
	}

	Info_param.setAttribute('name', name)
	Info_param.setAttribute('value', data)
	
	Info_form.submit();
	
}

function getmsg(msg) {
	if (msg != '') {
		alert('수정 실패 했습니다')
	}
}

function memberOut() {
	
	const checking = document.querySelectorAll('input[name="agree"]')
	let check_c=0
	checking.forEach(check=>{
		if(check.checked==true){
			check_c++
		}
	})
	if(check_c==2){
		Info_param.setAttribute('name', 'member_out')
		Info_param.setAttribute('value', 'Y')
		
		if (confirm('정말 회원 탈퇴 하시겠습니까?')) {
			Info_form.submit();
		}
	}
	else{
		alert('탈퇴동의 해주세요')
		return
	}
	
	
}
function checkSelectAll()  {
    
    // 모든 체크 체크박스
    const checkboxes = document.querySelectorAll('input[name="agree"]');
    
    // 선택된 체크박스
    const checked = document.querySelectorAll('input[name="agree"]:checked');
    
    // 전체동의 체크박스
    const selectAll = document.querySelector('input[name="selectall"]');
    
    if(checkboxes.length === checked.length)  {
      selectAll.checked = true;
    }else {
      selectAll.checked = false;
    }
  
  }
  
  function selectAll(selectAll)  {
    const checkboxes = document.getElementsByName('agree');
    
    checkboxes.forEach((checkbox) => {
      checkbox.checked = selectAll.checked
    })
  }





function password_checked_info() {
	const arr = ['!', '@', '#', '$', '%', '^', '&', '*']
	const p_v = document.querySelector('input[name="user_pw"]').value
	const pw_ck = document.querySelector('input[name="user_pw2"]').value
	let flag = false
	for (let i = 0; i < p_v.length; i++) {
		if (arr.includes(p_v[i])) {
			flag = true
		}	
	}
	if (!(p_v != '' && 8 <= p_v.length <= 15 && flag)) {
		document.getElementById('Info_pw_ck1').innerText = ' 적합하지않는 비밀번호 입니다'
		document.getElementById('Info_pw_ck1').style.color = 'red'
			flagpw1 = false
	}
	else {
		document.getElementById('Info_pw_ck1').innerText = ' 조건에 맞습니다'
		document.getElementById('Info_pw_ck1').style.color = 'blue'
		flagpw1 = true
	}
	if (pw_ck != '' && p_v != '') {
		if (p_v === pw_ck) {
			document.getElementById('Info_pw_ck2').innerText = ' 일치'
			document.getElementById('Info_pw_ck2').style.color = 'blue'
				flagpw2 = true
		}
		else {
			document.getElementById('Info_pw_ck2').innerText = ' 불일치'
			document.getElementById('Info_pw_ck2').style.color = 'red'
				flagpw2 = false
		}		
	}
}

function duplicate_nick_info(event) {
    if (document.querySelector('input[name="user_nickname"]').value == '') {
    	document.getElementById('Info_nick_ck').innerText = '닉네임을 입력하세요'
    	document.getElementById('Info_nick_ck').style.color = 'red'
        return
    }
    let url = cpath + '/nickname_check?user_nickname=' + document.querySelector('input[name="user_nickname"]').value
    const opt = {
        method: 'GET'
    }
    fetch(url, opt)
        .then(resp => resp.text())
        .then(row => {
            if (row == 1) {
            	document.getElementById('Info_nick_ck').innerText = '닉네임 중복입니다'
            	document.getElementById('Info_nick_ck').style.color = 'red'
            		flagnick = false
            }
            else {
            	document.getElementById('Info_nick_ck').innerText = '사용가능 닉네임'
            	document.getElementById('Info_nick_ck').style.color = 'blue'
            		flagnick = true
            }
        })
}

function onDelete(event) {
	   location.href = cpath + '/deleteWishList?page=' + nowPage + '&idx=' + event.target.dataset.idx
}

function onBuy(event) {
   location.href = cpath + '/product/product_detail?modelnum=' + event.target.dataset.modelnum
}
// =================================================================
function getArrjson(arr) {
	
	const arr1 = JSON.stringify(arr)
	const arr2 = JSON.parse(arr1)
	let arr3 = []
	arr2.forEach(dto => {
		arr3.push(JSON.parse(dto))
	})
	return arr3
}

// sale ===============================================================
function rander(target, arr) {
	target.innerHTML = ''
	arr.forEach(dto => {
		const price = (dto.trade_price).toLocaleString('ko-KR')	
		let dom =	`<li class="saleList_box_li jcsb" data-sold="${dto.trade_sold }">`
			dom +=		`<div class="jcce aice">`
			dom +=			`<img class="saleList_box_img" src="${dto.trade_img1 }" width="80">`
				
			dom +=			`<div>`
			dom +=				`<ul class="salelist_content_ul">`
			dom +=					`<li class="df">`
			dom +=						`<span>판매 날짜</span>`
			dom +=						`<span>${dto.trade_upload_date }</span>`
			dom +=					`</li>`
			dom +=					`<li class="df">`
			dom +=						`<span>판매 가격</span>`
			dom +=						`<span>${price }</span>`
			dom +=					`</li>`
			dom +=					`<li class="df">`
			dom +=						`<span>카테고리</span>`
			dom +=						`<span>${dto.trade_category }</span>`
			dom +=					`</li>`
			dom +=				`</ul>`											
			dom +=			`</div>`
			dom +=		`</div>`
				
			dom +=			`<div class="salelist_box_ul_btns jcce aice" data-sold="${dto.trade_sold }">`									
			dom +=				`<button class="salelist_sold_btns" data-idx="${dto.trade_idx}">판매완료</button>`
			dom +=				`<button class="salelist_modify_btns" 
			data-idx="${dto.trade_idx }" 
			data-productname="${dto.trade_product_name }" 
			data-tradecontent="${dto.trade_content}"
			data-dtoprice="${dto.trade_price}" 
			data-price="${price}"
			data-category="${dto.trade_category}" 
			data-title="${dto.trade_title}"
			data-tradeimg1="${dto.trade_img1}"
			data-tradeimg2="${dto.trade_img2}"
			data-tradeimg3="${dto.trade_img3}"
			>수정</button>`
			dom +=				`<button class="salelist_delete_btns" data-idx="${dto.trade_idx}">삭제</button>`
			dom +=			`</div>`
			dom +=		`</li>`
		target.innerHTML += dom
		
	})
	// 수정 삭제 판매완료 버튼	이벤트 주기
	const salelist_modify_btns = document.querySelectorAll('.salelist_modify_btns')
	const salelist_sold_btns = document.querySelectorAll('.salelist_sold_btns')
	const salelist_delete_btns = document.querySelectorAll('.salelist_delete_btns')
	salelist_modify_btns.forEach(ev => {
		ev.addEventListener('click', salelistModifyBtn)
	})
	salelist_sold_btns.forEach(ev => {
		ev.addEventListener('click', salelistSoldBtn)
	})
	salelist_delete_btns.forEach(ev => {
		ev.addEventListener('click', salelistDeleteBtn)
	})
	// 반복 li의 백그라운드 줄 이벤트 처리
	const saleList_box_li = document.querySelectorAll('.saleList_box_li')
	saleList_box_li.forEach(ev => {
		if (ev.dataset.sold == 'sold') {
			ev.style.opacity = '0.5'
		}
	})
	const salelist_box_ul_btns = document.querySelectorAll('.salelist_box_ul_btns')
	salelist_box_ul_btns.forEach(ev => {
		if (ev.dataset.sold == 'sold') {
			ev.children[0].style.backgroundColor = 'black'
			ev.children[0].removeEventListener('click', salelistSoldBtn)
			ev.children[2].style.backgroundColor = 'black'
			ev.children[2].removeEventListener('click', salelistDeleteBtn)
			ev.children[1].style.backgroundColor = 'black'
			ev.children[1].removeEventListener('click', salelistModifyBtn)
		}
	})
}
function imgUpload(event) {
	let target = event.target
	let file = target.files[0]
	var reader = new FileReader();
    reader.readAsDataURL(file); //파일을 읽는 메서
    reader.onload =  function() {
    	const remove = document.createElement('span')
    	const img = document.createElement('img')
    	img.src = reader.result
    	img.classList.add('uploadImg')
    	remove.innerHTML = '⨉'
    	remove.classList.add('imgRemoveBtn')
		target.parentNode.parentNode.appendChild(remove)
		target.parentNode.parentNode.appendChild(img)
		target.parentNode.style.display = 'none'
		remove.addEventListener('click', imgRemove)
	}
}
function imgRemove(event) {
	let target = event.target
	target.previousElementSibling.style.display = 'inherit'
	target.previousElementSibling.children[1].value = ''
	target.nextElementSibling.style.display = 'none'
	target.nextElementSibling.remove()
	target.remove()
}

function closeInsert() {
	myPage_modify.classList.add('hiddenNone')
   modify_overlay.classList.add('hiddenNone')
   document.body.style.overflowY = 'scroll'
   form.innerHTML = ''
}
/*
data-idx="${dto.trade_idx }" 
data-productname="${dto.trade_product_name }" 
data-tradecontent="${dto.trade_content}" 
data-price="${dto.trade_price}" 
data-category="${dto.trade_category}" 
data-title="${dto.trade_title}"
data-tradeimg1="${dto.trade_img1}"
data-tradeimg2="${dto.trade_img2}"
data-tradeimg3="${dto.trade_img3}"
*/
function salelistModifyBtn(event) {
	document.body.style.overflowY = 'hidden'
	myPage_modify.classList.remove('hiddenNone')
	modify_overlay.classList.remove('hiddenNone')
	let dom = ''
	let target = event.target
	const idx = target.dataset.idx
	const img1 = target.dataset.tradeimg1
	const img2 = target.dataset.tradeimg2
	const img3 = target.dataset.tradeimg3
	const title = target.dataset.title
	const category = target.dataset.category
	const content = target.dataset.tradecontent
	const price = target.dataset.price
	dom += `<div class="img_box jcsb">`
	dom += `	<div class="imgs jcce aice ffcl">`
	dom += `		<label class="jcce aice hiddenNone">`
	dom += `			<input class="hiddenNone" type="file" name="upload">`
	dom += `			<span>사진 선택</span>`
	dom += `		</label>`
	dom += ` 		<span class="imgRemoveBtn">⨉</span>`
	dom += `		<img class="uploadImg" src="${img1}">`
	dom += `	</div>`
	dom += `	<div class="imgs jcce aice ffcl">`
	dom += `		<label class="jcce aice">`
	dom += `			<input class="hiddenNone" type="file" name="upload2">`
	dom += `			<span>사진</span>`
	dom += `		</label>`
		if(img2 != null) {
			dom += ` 		<span class="imgRemoveBtn">⨉</span>`
			dom += `		<img class="uploadImg" src="${img2}">`
		}
	dom += `	</div>`
	dom += `	<div class="imgs jcce aice ffcl">`
	dom += `		<label class="jcce aice">`
	dom += `			<input class="hiddenNone" type="file" name="upload3">`
	dom += `			<span>사진</span>`
	dom += `		</label>`
		if(img3 != null) {
			dom += ` 		<span class="imgRemoveBtn">⨉</span>`
			dom += `		<img class="uploadImg" src="${img3}">`
		}
	dom += `	</div>`
	dom += `</div>`
	dom += `<div class="write_box">`
	dom += `	<div class="title ffcl">`
	dom += `		<span class="thema">제목</span>`
	dom += `		<input type="text" name="trade_title" value="${title}" placeholder="제목을 입력해주세요">`
	dom += `	</div>`
	dom += `	<div class="category ffcl">`
	dom += `		<span class="thema">카테고리</span>`
	dom += `		<select name="trade_category" value="${category}">`
	dom += `			<option value="의류">의류</option>`
	dom += `			<option value="가방">가방</option>`
	dom += `			<option value="신발">신발</option>`
	dom += `			<option value="액세서리">액세서리</option>`
	dom += `			<option value="지갑">지갑</option>`
	dom += `		</select>`
	dom += `	</div>`
	dom += `	<div class="content ffcl">`
	dom += `		<span class="thema">게시글 내용</span>`
	dom += `		<textarea name="trade_content" placeholder="내용을 작성해주세요">${content}</textarea>`
	dom += `	</div>`
	dom += `	<div class="price jcfe">`
	dom += `		<input type="text" name="trade_price1" value="${price}" onkeyup="inputNumberFormat(this)">`
	dom += `		<input type="hidden" name="trade_price">`
	dom += `		<span class="aice">원</span>`
	dom += `	</div>`
	dom += `</div>`
	dom += `<input class="modifyBtn" type="submit" value="수정하기">`
	dom += `<input type="hidden" name="trade_idx" value="${idx}" id="hidden_trade_idx">`
	form.innerHTML = dom
	const imgs = document.querySelectorAll('.myPage_modify > .modify_component > form > .img_box input[type="file"]')
	const imgRemoveBtn = document.querySelectorAll('.imgRemoveBtn')
	imgRemoveBtn.forEach(btn => {
		btn.addEventListener('click', imgRemove)
	})
	imgs.forEach(img => {
		img.addEventListener('change', imgUpload)
	})
	form.addEventListener('submit', stringToPrice) 
	
	
}
function stringToPrice() {
	const price1 = document.querySelector('input[name="trade_price1"]')
	const price = document.querySelector('input[name="trade_price"]')
	const newPrice = price1.value.replace(/,/gi, '')
	price.value = +newPrice
}
function salelistSoldBtn() {
	if (confirm('판매 확정 하시겠습니까?')) {
		location.href = cpath + '/salelistSoldUpdate?idx=' + event.target.dataset.idx
	}
}

function salelistDeleteBtn(event) {
	if (confirm('삭제 하시겠습니까?')) {
		location.href = cpath + '/salelistDelete?idx=' + event.target.dataset.idx + ''
	}
}

function saleFetch() {
	const url = cpath + '/getSaleList?page=' + salepage
	const opt = {method:'GET'}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		console.log(json)
		if (json.length == 0 || saleAlldto.length < 10) {
			more_view.classList.add('hiddenNone')
		}
		json.forEach(dto => {
			salefilter.push(dto)
		})
		if (data_ch == 0) {
			salefilter = salefilter.filter(v => v.trade_sold == 'x')
			rander(randertarget, salefilter)
			salepage += 12
			return
		}
		if (data_ch == 1) {
			salefilter = salefilter.filter(v => v.trade_sold == 'sold')
			rander(randertarget, salefilter)
			salepage += 12
			return
		}
		if (data_ch == 2) {
			rander(randertarget, salefilter)
			salepage += 12
		}
	})	
}
function saleIng() {
	data_ch = 0
	salepage = 0
	salefilter = []
	saleFetch()
	more_view.classList.remove('hiddenNone')
}
function saleAnd() {
	data_ch = 1
	salepage = 0
	salefilter = []
	saleFetch()
	more_view.classList.remove('hiddenNone')
}
function saleAll() {
	data_ch = 2
	salepage = 0
	salefilter = []
	saleFetch()
	more_view.classList.remove('hiddenNone')
}

function salesortTrade(event) {
	sort_price_img.setAttribute('src', cpath + '/resources/img/data.svg')
	if (event.target.dataset.sort == updown) {
		updown = 'down'
		sort_span_img.setAttribute('src', cpath + '/resources/img/data_t.svg')
		const arr = salefilter.sort((a, b) => a.trade_upload_date < b.trade_upload_date ? 1 : -1)
		rander(randertarget, arr)
	}
	else {
		updown = 'up'
		sort_span_img.setAttribute('src', cpath + '/resources/img/data_b.svg')	
		const arr = salefilter.sort((a, b) => b.trade_upload_date > a.trade_upload_date ? -1 : 1)
		rander(randertarget, arr)
	}
}
function salesortPrice(event) {
	sort_span_img.setAttribute('src', cpath + '/resources/img/data.svg')
	if (event.target.dataset.price == updownprice) {
		updownprice = 'down'
		sort_price_img.setAttribute('src', cpath + '/resources/img/data_t.svg')
		const arr = salefilter.sort((a, b) => b.trade_price - a.trade_price)		
		rander(randertarget, arr)
	}
	else {
		updownprice = 'up'
		sort_price_img.setAttribute('src', cpath + '/resources/img/data_b.svg')
		const arr = salefilter.sort((a, b) => a.trade_price - b.trade_price)
		rander(randertarget, arr)
	}
}
function dateSort() {
	sort_span_img.setAttribute('src', cpath + '/resources/img/data.svg')
	sort_price_img.setAttribute('src', cpath + '/resources/img/data.svg')
	if (input_date1 != '' && input_date2 != '') {
		const arr = salearr.filter(v => input_date1.value <= v.trade_upload_date && v.trade_upload_date <= input_date2.value)
		console.log(arr)
		rander(randertarget, arr)
	}
}
function salesearch_number() {
	sort_span_img.setAttribute('src', cpath + '/resources/img/data.svg')
	sort_price_img.setAttribute('src', cpath + '/resources/img/data.svg')
	const arr = salearr.filter(v => v.trade_category == input_search.value)
	if (arr.length != 0) {
		rander(randertarget, arr)
	}
}
function resetsearch() {
	sort_span_img.setAttribute('src', cpath + '/resources/img/data.svg')
	sort_price_img.setAttribute('src', cpath + '/resources/img/data.svg')
	border_bottom[0].click()
	input_search.value = ''
}
// order=========================================================================================================================
function orrander(target, arr) {
	target.innerHTML = ''
	arr.forEach(dto => {
		console.log(dto.order_Date)
		const price = (dto.order_price).toLocaleString('ko-KR')
		let dom =	`<li class="saleList_box_li jcsb" data-sold="${dto.order_check }">`
			dom +=		`<div class="jcce aice">`
			dom +=			`<img class="saleList_box_img" src="${dto.order_product_img}" width="80">`
				
			dom +=			`<div>`
			dom +=				`<ul class="salelist_content_ul">`
			
			dom +=					`<li class="df">`
			dom +=						`<span>구매날짜</span>`
			dom +=						`<span>${dto.order_Date}</span>`
			dom +=					`</li>`
			dom +=					`<li class="df">`
			dom +=						`<span class="">주문 번호</span>`
			dom +=						`<span>${dto.order_ordernum }</span>`
			dom +=					`</li>`
			dom +=					`<li class="df">`
			dom +=						`<span>상품 가격</span>`
			dom +=						`<span>${price}</span>`
			dom +=					`</li>`
			dom +=					`<li class="df">`
			dom +=						`<span>사이즈/컬러</span>`
			dom +=						`<span>${dto.order_size }/${dto.order_color}</span>`
			dom +=					`</li>`	
			dom +=				`</ul>`											
			dom +=			`</div>`
			dom +=		`</div>`
				
			dom +=			`<div class="salelist_box_ul_btns jcce aice" data-sold="${dto.order_check }">`									
			dom +=				`<button class="salelist_sold_btns" data-nick="${dto.order_nickname}" data-ordernum="${dto.order_ordernum}" data-size="${dto.order_size}" data-point="${dto.order_price}">구매확정</button>`
		
			dom +=			`</div>`
			dom +=		`</li>`
		target.innerHTML += dom
	})
	// 수정 삭제 판매완료 버튼	이벤트 주기
	const salelist_modify_btns = document.querySelectorAll('.salelist_modify_btns')
	const salelist_sold_btns = document.querySelectorAll('.salelist_sold_btns')
	salelist_sold_btns.forEach(ev => {
		ev.addEventListener('click', orderlistSoldBtn)
	})
	// 반복 li의 백그라운드 줄 이벤트 처리
	const saleList_box_li = document.querySelectorAll('.saleList_box_li')
	saleList_box_li.forEach(ev => {
		if (ev.dataset.sold == 'sold') {
			ev.style.opacity = '0.5'
		}
	})
	const salelist_box_ul_btns = document.querySelectorAll('.salelist_box_ul_btns')
	salelist_box_ul_btns.forEach(ev => {
		if (ev.dataset.sold == 'sold') {
			ev.children[0].style.backgroundColor = 'black'
			ev.children[0].removeEventListener('click', orderlistSoldBtn)
		}
	})
}

function orderlistSoldBtn(event) {
	if (confirm('구매 확정 하시겠습니까?')) {
		location.href = cpath + '/orderlistSoldUpdate?nick=' + event.target.dataset.nick + '&ordernum=' + event.target.dataset.ordernum + '&size=' + event.target.dataset.size + '&point=' + event.target.dataset.point
	}
}

function getfetchbuy() {
	if (data_ch == 0 || data_ch == 2) {
		const url = cpath + '/getfetchbuy?page=' + salepage
		const opt = {method:'GET'}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log('getfetchbuy : ',json)
			if (json.length == 0 || orlist.length < 10) {
				more_view.classList.add('hiddenNone')
			}
			json.forEach(dto => {
				orfilter.push(dto)
			})
			if (data_ch == 0) {
				orfilter = orfilter.filter(v => v.order_check == 'sold')
				const buy_checking_count = document.getElementById('buy_cnt1')
				let count = orfilter.length
				buy_checking_count.innerText=''
				buy_checking_count.innerText=count
				buy_checking_count.style.color='red'
					
				orrander(randertarget, orfilter)
				return
			}
			if (data_ch == 2) {
				orrander(randertarget, orarr)
			}
		})	
		salepage += 10		
	}
	else {
		const url = cpath + '/getfetchreceipt?page=' + salepage
		const opt = {method:'GET'}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
			if (json.length == 0 || relist.length < 10) {
				more_view.classList.add('hiddenNone')
			}
			json.forEach(dto => {
				refilter.push(dto)
			})
			rerander(randertarget, refilter)
		})	
		salepage += 10
	}
}
//구매확정
function buyCheck() {
	data_ch = 0
	salepage = 0
	orfilter = []
	refilter = []
	getfetchbuy()
	more_view.classList.remove('hiddenNone')
}
//결제내역
function buyReceipt() {
	data_ch = 1
	salepage = 0
	orfilter = []
	refilter = []
	getfetchbuy()
	more_view.classList.remove('hiddenNone')
}
//구매내역 - 구매확정 페이지
function buyAll() {
	data_ch = 2
	salepage = 0
	orfilter = []
	refilter = []
	getfetchbuy()
	more_view.classList.remove('hiddenNone')
}

function buysort(event) {
	sort_price_img.setAttribute('src', cpath + '/resources/img/data.svg')
	if (event.target.dataset.sort == updown) {
		updown = 'down'
		if (data_ch == 0 || data_ch == 2) {
			sort_span_img.setAttribute('src', cpath + '/resources/img/data_t.svg')
			const arr = orfilter.sort((a, b) => a.order_Date > b.order_Date ? -1 : 1)
			console.log(arr)
			orrander(randertarget, arr)
		}
		else {
			sort_span_img.setAttribute('src', cpath + '/resources/img/data_t.svg')
			const arr = refilter.sort((a, b) => a.receipt_orderDate > b.receipt_orderDate ? -1 : 1)
			console.log(arr)
			rerander(randertarget, arr)
		}
	}
	else {
		updown = 'up'
		if (data_ch == 0 || data_ch == 2) {
			sort_span_img.setAttribute('src', cpath + '/resources/img/data_b.svg')
			const arr = orfilter.sort((a, b) => b.order_Date < a.order_Date ? 1 : -1)
			console.log(arr)
			orrander(randertarget, arr)
		}
		else {
			sort_span_img.setAttribute('src', cpath + '/resources/img/data_b.svg')
			const arr = refilter.sort((a, b) => b.receipt_orderDate < a.receipt_orderDate ? 1 : -1)
			console.log(arr)
			rerander(randertarget, arr)
		}
	}
}


function buysortPrice(event) {
	sort_span_img.setAttribute('src', cpath + '/resources/img/data.svg')
	if (event.target.dataset.price == updownprice) {
		updownprice = 'down'
		if (data_ch == 0 || data_ch == 2) {
			sort_price_img.setAttribute('src', cpath + '/resources/img/data_t.svg')
			const arr = orfilter.sort((a, b) => a.order_price - b.order_price)		
			orrander(randertarget, arr)
		}
		else {
			sort_price_img.setAttribute('src', cpath + '/resources/img/data_t.svg')
			const arr = refilter.sort((a, b) => a.receipt_totalprice - b.receipt_totalprice)		
			rerander(randertarget, arr)
		}
	}
	else {
		updownprice = 'up'
		if (data_ch == 0 || data_ch == 2) {
			sort_price_img.setAttribute('src', cpath + '/resources/img/data_b.svg')
			const arr = orfilter.sort((a, b) => b.receipt_totalprice - a.receipt_totalprice)		
			rorander(randertarget, arr)
		}
		else {
			sort_price_img.setAttribute('src', cpath + '/resources/img/data_b.svg')
			const arr = refilter.sort((a, b) => b.receipt_totalprice - a.receipt_totalprice)		
			rerander(randertarget, arr)
		}
	}
}

function buydateSort() {
	sort_span_img.setAttribute('src', cpath + '/resources/img/data.svg')
	sort_price_img.setAttribute('src', cpath + '/resources/img/data.svg')
	if (input_date1 != '' && input_date2 != '') {
		if (data_ch == 0 || data_ch == 2) {
			const arr = orarr.filter(v => input_date1.value <= v.order_Date && v.order_Date <= input_date2.value)
			orrander(randertarget, arr)
		}
		else {
			const arr = rearr.filter(v => input_date1.value <= v.receipt_orderDate && v.receipt_orderDate <= input_date2.value)
			rerander(randertarget, arr)
		}
	}
}

function buysearch_number() {
	sort_span_img.setAttribute('src', cpath + '/resources/img/data.svg')
	sort_price_img.setAttribute('src', cpath + '/resources/img/data.svg')
	const arr = orarr.filter(v => v.order_ordernum == input_search.value)
	if (arr.length != 0) {
		orrander(randertarget, arr)
	}
}
//receipt=====================================================================================================
function rerander(target, arr) {
	target.innerHTML = ''
	arr.forEach(dto => {
		const price = (dto.receipt_totalprice).toLocaleString('ko-KR')
		let dom =	`<li class="buy_receipt_dto df aice jcsb">`
			dom +=		`<div class="jcce aice">`
			dom +=			`<img class="receipt_box_img" src="${dto.receipt_img}" width="80">`
			dom +=			`<div>`
			dom +=				`<ul class="buy_receipt_ul">`
			dom +=					`<li class="df">`
			dom +=						`<span>결제날짜</span>`
			dom +=						`<span>${dto.receipt_orderDate}</span>`
			dom +=					`</li>`
			dom +=					`<li class="df">`
			dom +=						`<span class="">주문 번호</span>`
			dom +=						`<span>${dto.receipt_ordernum }</span>`
			dom +=					`</li>`
			dom +=					`<li class="df">`
			dom +=						`<span>배송비</span>`
			dom +=						`<span>${dto.receipt_delibery}</span>`
			dom +=					`</li>`
			dom +=					`<li class="df">`
			dom +=						`<span>구매금액</span>`
			dom +=						`<span>${dto.receipt_totalprice }</span>`
			dom +=					`</li>`	
			dom +=					`<li class="df">`
			dom +=						`<span>총 결제 금액</span>`
			dom +=						`<span>${dto.receipt_totalprice+ dto.receipt_delibery }</span>`
			dom +=					`</li>`	
			dom +=				`</ul>`											
			dom +=			`</div>`
			dom +=		`</div>`
			dom +=	`</li>`	
		target.innerHTML += dom
	})
}

function pageCheck() {
		paging_i.forEach(va => {
			if (va.dataset.page == nowPage + 1) {
				va.style.backgroundColor = '#dadada'
			}
		})
	}

