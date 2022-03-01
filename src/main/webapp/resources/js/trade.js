function imgCount(img1,img2){
	console.log(img1)
	console.log(img2)
	
	const imgpage = document.querySelector('.img_paging')
	console.log(imgpage)
	let dom = '<input type="radio" value="1" checked>'
	imglast=1;
	
	if(img1 !=''){
		dom +='<input type="radio" value="2">'
		imglast=2
	}
	if(img2 !=''){
		dom+='<input type="radio" value="3">'
		imglast=3
	}
	imgpage.innerHTML=dom
	imgcount = imgpage.childNodes
	console.log(imgcount[0].value)
	imgpage.forEach(btn=>{
		btn.style.margin='20px'
		btn.onclick=function(){
			for(let i=0; i<imgcount.length;i++){
				if(btn.value != imgcount[i].value){
					imgcount[i].checked=false;
				}
			}
			
			
		}
	})
}


function check_admin(){
	console.log(trade_delete)
	if(login_grade=='admin'){
		trade_delete.onclick=delete_content
	}
	else{
		trade_delete.classList.add('hidden')
	}
}


function delete_content(event){
	let con_num = event.target.dataset.idx
	location.href=cpath+'/trade?trade_idx='+con_num
   
}


function categoryOnDown(event) {
	event.stopPropagation()
	const target = document.querySelector('.trade > .trade_header > .trade_sort > ul > .category_down > ul > li:first-child')
	let cnt = 80
	let first = 1
	if(target.style.opacity == 0) {
		console.log('if')
		categorys.forEach(li => {
			console.log(li.id)
			if(li.className == '지갑'){
				cnt += 90
			}
			else {
				cnt += 60					
			}
			if(first == 1) {
				cnt = 80					
			}
			li.style.opacity = '1'
			li.style.marginLeft = cnt + 'px'
			first = 2
		})
	}
	else {
		categorys.forEach(li => {
			console.log(cnt)
			li.style.opacity = '0'
			li.style.marginLeft = '80px'
		})
	}
}

function locateDetail(event) {
	event.stopPropagation()
	let target = event.target
	if(target.classList.contains('like')) {
		return
	}
	while(target.classList.contains('item')==false){
		target = target.parentNode
	}
	const idx = target.dataset.idx
	console.log(idx)
	location.href = cpath + '/trade/trade_detail?idx=' + idx
}

function likeCheck(event) {
	   target = event.target
	   let intTarget= parseInt(target.nextElementSibling.innerText)
	   let numberCount=target.nextElementSibling
	   let plus = intTarget+1
	   let trade_idx =target.parentNode.parentNode.dataset.idx
	   while(target.classList.contains('item_like_count') == false){
	      target = target.parentNode
	   }
	   target = target.children[0]
	   
	   if(login !=''){
	         if(target.innerText.indexOf('❤') != '-1') {
	            target.innerText = '🤍'
	            const url=cpath+'/trade/likeCount?trade_like_count=-1&trade_idx='+trade_idx
	            const opt={
	                  method:'GET'
	            }
	            fetch(url,opt)
	            .then(resp=>resp.text())
	            .then(text=>{
	               if(text =='1') numberCount.innerText=intTarget-1
	            })
	         }
	         else {
	            target.innerText = '❤'
	               const url=cpath+'/trade/likeCount?trade_like_count=1&trade_idx='+trade_idx
	               const opt={
	                  method:'GET'
	            }
	            fetch(url,opt)
	            .then(resp=>resp.text())
	            .then(text=>{
	               if(text =='1')numberCount.innerText=intTarget+1
	               
	            })
	         }
	      }
	   else{
	         alert('로그인 후 가능한 기능입니다.')
	         location.href=cpath+'/member/login'
	   }
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
    	remove.classList.add('imgRemoveBtn')
    	remove.innerHTML = '⨉'
		target.parentNode.parentNode.appendChild(remove)
		target.parentNode.parentNode.appendChild(img)
		target.parentNode.style.display = 'none'
		remove.addEventListener('click', imgRemove)
	}
    console.log(target.value)
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
   modal.classList.add('hiddenNone')
   trade_overlay.style.display = 'none'
   document.body.style.overflowY = 'scroll'
}

function onInsert() {
	if (login == '') {
		location.href = cpath + '/member/login'
		return
	}
   modal.classList.remove('hiddenNone')
   trade_overlay.style.display = 'block'
   document.body.style.overflow = 'hidden'
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

//=====================중고거래 가격 설정

function inputNumberFormat(obj) {
	console.log(obj.nextElementSibling.nextElementSibling)
	console.log(obj)
	console.log(obj.value)
    obj.value = comma(uncomma(obj.value));
	
    
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

//====================================detail
function down(ob) {
   console.log(ob.value)
   value = ob.value
}
function getReply(json){
   let dom=``
   dom+=`<div>`
   dom+=`<div>`
   dom+=`<div><img src="${json.tradeReply_user_profile}"></div>`
   dom+=`</div>`
   dom+=`<div class="repInfo">`
   dom+=`<div class="reply_nick">${json.tradeReply_user_nick}</div>`
   dom+=`<div class="detail_comment">${json.tradeReply_comment}</div>`
      
   dom+=`<div class="trade_detail_btnList">`
   if(isLogin.value == json.tradeReply_user_nick) {
      dom += `<button class="detail_modifyBtn" data-idx="${json.tradeReply_idx}">수정</button>`
      dom += `<button class="detail_delBtn" data-idx="${json.tradeReply_idx}">삭제</button>`   
   }
   dom+=`</div>`
   dom+=`</div>`
   dom+=`</div>`
   dom+=`</div>`
   return dom;
}

function render(target,dom){
   target.innerHTML +=dom;
}