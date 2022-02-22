function nowpage(url) {
	console.log(url)
	
   const mypage_a = document.querySelectorAll('.noticed> .center_left > ul > li > a')

   for (let i = 0; i < mypage_a.length; i++) {
	   console.log(mypage_a[i].getAttribute('href'))
      if (mypage_a[i].getAttribute('href')== url) {
         mypage_a[i].style.color = 'black'
         mypage_a[i].style.fontWeight = 'bold'
         return
      }
   }
}

function pageing_page_notice(url) {
   const pageing_a = document.querySelectorAll('.noticed> .notice_right > .notice_pageing> a')

   for (let i = 0; i < pageing_a.length; i++) {
	
      if (pageing_a[i].getAttribute('href')== url) {
    
         pageing_a[i].style.color = 'black'
         pageing_a[i].style.fontWeight = 'bold'
         return
      }
   }
}

function pageing_page_qna(url) {
	
	   const qna_a = document.querySelectorAll('.noticed>.qna_right >.qna_pageing > a')
	   
	   for (let i = 0; i < qna_a.length; i++) {
		
	      if (qna_a[i].getAttribute('href')== url) {
	    	 
	         qna_a[i].style.color = 'black'
        	 qna_a[i].style.fontWeight = 'bold'
	         return
	      }
	   }
	}


function filter_pageing(url){
	const qna_a = document.querySelectorAll('.noticed>.qna_right >.qna_pageing > a')
	   for (let i = 0; i < qna_a.length; i++) {
		   let pageno ='?'+qna_a[i].getAttribute('href').split('?')[1]
		
		  if (pageno== url) {
	    	 
	         qna_a[i].style.color = 'black'
     	 qna_a[i].style.fontWeight = 'bold'
	         return
	      }
	   }
}

function notice_showcontent(event){
	const idx = event.target.dataset.idx
	location.href=cpath+'/center/notice_detail/'+idx
}



function qna_showcontent(event){
	let target = event.target
	
	while(target.nodeName != 'DIV') {
		target = target.parentNode
	}
	
	const content = target.nextElementSibling
	if(content.classList.contains('hiddenNone')){
		content.classList.remove('hiddenNone')
	}
	else{
		content.classList.add('hiddenNone')
	}
	
}


function getDomFromDTO(dto) {
	console.log(dto)
	let dom='<div class="filters" style="font-size:16px">'
	for(key in dto){
		let value = dto[key]
		
		if(key == 'qna_content'){
			value=''
		}
		if(key =='qna_idx'){
			value=''
		}
		if(key =='qna_category'){
			
			dom+='<div class="df filter_title" style="width:100%; height:65px; border-bottom: 1px solid #ebebeb;"><p style="font-weight:bold; margin-right:30px;display: flex;align-items: center;  ">'
			dom+=value
			dom+='</p>'
		}
		
		if(key =='qna_title'){
			dom+='<p style=" cursor: pointer; margin-right:30px;display: flex;align-items: center;">'
			dom+=value
			dom+='</p></div>'
		}
		if(key =='path'){
			dom+='<pre id="filter_contents" class="hiddenNone" style=" border-bottom: 1px solid #ebebeb; padding:25px; background-color:#fafafa; white-space: pre-line; font-size:14px;">'
			dom+=value
			dom+='</pre>'
		}
		
	}
	dom+='</div>'
	
	return dom
}

function go_all(){
	all.style.backgroundColor='black'
	all.style.color='white'
	all.style.fontWeight='bolder'
}
function go_same(){
	same.style.backgroundColor='black'
	same.style.color='white'
	same.style.fontWeight='bolder'
}
function go_buy(){
	buy.style.backgroundColor='black'
	buy.style.color='white'
	buy.style.fontWeight='bolder'
}
function go_sell(){
	sell.style.backgroundColor='black'
	sell.style.color='white'
	sell.style.fontWeight='bolder'
}
function go_policy(){
	policy.style.backgroundColor='black'
	policy.style.color='white'
	policy.style.fontWeight='bolder'
}


function out_all(){
	all.style.backgroundColor='white'
	all.style.color='darkgrey'
	all.style.fontWeight='normal'
}
function out_policy(){
	policy.style.backgroundColor='white'
	policy.style.color='darkgrey'
	policy.style.fontWeight='normal'
}

function out_sell(){
	sell.style.backgroundColor='white'
	sell.style.color='darkgrey'
	sell.style.fontWeight='normal'
}

function out_same(){
	same.style.backgroundColor='white'
	same.style.color='darkgrey'
	same.style.fontWeight='normal'
}

function out_buy(){
	buy.style.backgroundColor='white'
	buy.style.color='darkgrey'
	buy.style.fontWeight='normal'
}

function policy_filter(event){
	go_policy()
	out_all()
	out_sell()
	out_buy()
	out_same()
			
				
		const qna_category = policy.value
		const url=cpath+'/QnA_filter/'+qna_category
		const opt={
				method:'GET'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {	
			
			list.innerHTML = ''	
			pageing.innerHTML=''// 대상의 내부 태그를 제거하고
			json.list.forEach(dto => {		// 배열의 각각을 dto라고 하면
				const dom = getDomFromDTO(dto)	// dto를 이용해서 태그형태 문자열로 변환하고
				list.innerHTML += dom			// 그 문자열을 대상의 내부에 HTML 태그형식으로 삽입
				
			})
				
			const filter_title = document.querySelectorAll('.filter_title')
			
			filter_title.forEach(event=>{
				let click=0
				event.addEventListener('click',qna_showcontent)
			})
		
			let size=0
			if(json.count>=63){
				size=9
			}
			else if(json.count<63 && json.count%7!=0){
				size=Math.floor(json.count/7)+1
			}
			else if(json.count<63 && json.count%7 == 0){
				size=json.count/7
			}
			
			for(let i=1;i<=size;i++){
				const a = document.createElement('a')
				a.innerText=i
				a.href=cpath+'/center/이용정책?page='+i
				if(i==1){
					a.style.fontWeight='bold'
				}
				pageing.appendChild(a)
				
			}
			if(json.count>63){
				const next = document.createElement('a')
				next.innerText='▶'
				next.href=cpath+'/center/이용정책?page='+(+size+1)
				pageing.appendChild(next)
			}
		}) 
}

function same_filter(event){
	out_all()
 	out_policy()
 	out_sell()
 	out_buy()
 	go_same()
 			
	const qna_category = same.value
	const url=cpath+'/QnA_filter/'+qna_category
	const opt={
			method:'GET'
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {	
		
		list.innerHTML = ''		// 대상의 내부 태그를 제거하고
		pageing.innerHTML=''
		json.list.forEach(dto => {		// 배열의 각각을 dto라고 하면
		
			const dom = getDomFromDTO(dto)	// dto를 이용해서 태그형태 문자열로 변환하고
			list.innerHTML += dom			// 그 문자열을 대상의 내부에 HTML 태그형식으로 삽입
			
		})
			
		const filter_title = document.querySelectorAll('.filter_title')
		
		filter_title.forEach(event=>{
			let click=0
			event.addEventListener('click',qna_showcontent)
		})
		
		let size=0
		if(json.count>=63){
			size=9
		}
		else if(json.count<63 && json.count%7!=0){
			size=Math.floor(json.count/7)+1
		}
		else if(json.count<63 && json.count%7 == 0){
			size=json.count/7
		}
		
		for(let i=1;i<=size;i++){
			const a = document.createElement('a')
			a.innerText=i
			a.href=cpath+'/center/공통?page='+i
			if(i==1){
				a.style.fontWeight='bold'
			}
			pageing.appendChild(a)
			
		}
		if(json.count>63){
			const next = document.createElement('a')
			next.innerText='▶'
			next.href=cpath+'/center/공통?page='+(+size+1)
			pageing.appendChild(next)
			
			
		}
	}) 
}

function buy_filter(event){
	 go_buy()
	 out_all()
	 out_sell()
	 out_policy()
	 out_same()
	 
		const qna_category = buy.value
		const url=cpath+'/QnA_filter/'+qna_category
		const opt={
				method:'GET'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {	
			
			list.innerHTML = ''		// 대상의 내부 태그를 제거하고
			pageing.innerHTML=''
			
			json.list.forEach(dto => {		// 배열의 각각을 dto라고 하면
			
				const dom = getDomFromDTO(dto)	// dto를 이용해서 태그형태 문자열로 변환하고
				list.innerHTML += dom			// 그 문자열을 대상의 내부에 HTML 태그형식으로 삽입
				
			})
				
			const filter_title = document.querySelectorAll('.filter_title')
	
			filter_title.forEach(event=>{
				let click=0
				event.addEventListener('click',qna_showcontent)
			})
			
		
			let size=0
			if(json.count>=63){
				size=9
			}
			else if(json.count<63 && json.count%7!=0){
				size=Math.floor(json.count/7)+1
			}
			else if(json.count<63 && json.count%7 == 0){
				size=json.count/7
			}
			
			for(let i=1;i<=size;i++){
				const a = document.createElement('a')
				a.innerText=i
				a.href=cpath+'/center/구매?page='+i
				if(i==1){
					a.style.fontWeight='bold'
				}
				pageing.appendChild(a)
				
			}
			if(json.count>63){
				const next = document.createElement('a')
				next.innerText='▶'
				next.href=cpath+'/center/구매?page='+(+size+1)
				pageing.appendChild(next)
				
				
			}
		}) 
}

function sell_filter(){
	out_all()
	out_same()
	out_buy()
	out_policy()
	go_sell()
	
	const qna_category = sell.value
	const url=cpath+'/QnA_filter/'+qna_category
	const opt={
			method:'GET'
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {	
		
		list.innerHTML = ''		// 대상의 내부 태그를 제거하고
		pageing.innerHTML=''
		console.log(json.count)
		json.list.forEach(dto => {		// 배열의 각각을 dto라고 하면
		
			const dom = getDomFromDTO(dto)	// dto를 이용해서 태그형태 문자열로 변환하고
			list.innerHTML += dom			// 그 문자열을 대상의 내부에 HTML 태그형식으로 삽입
			
		})
		
		const filter_title = document.querySelectorAll('.filter_title')

		filter_title.forEach(event=>{
			let click=0
			event.addEventListener('click',qna_showcontent)
		})
		
		let size=0
		if(json.count>=63){
			size=9
		}
		else if(json.count<63 && json.count%7!=0){
			size=Math.floor(json.count/7)+1
		}
		else if(json.count<63 && json.count%7 == 0){
			size=json.count/7
		}
		
		for(let i=1;i<=size;i++){
			const a = document.createElement('a')
			a.innerText=i
			a.href=cpath+'/center/판매?page='+i
			if(i==1){
				a.style.fontWeight='bold'
			}
			pageing.appendChild(a)
			
		}
		if(json.count>63){
			const next = document.createElement('a')
			next.innerText='▶'
			next.href=cpath+'/center/판매?page='+(+size+1)
			pageing.appendChild(next)
			
			
		}
	}) 
}

function filter_load(){
	const left_link = document.getElementById('center_left_filter')
	left_link.style.color='black'
	left_link.style.fontWeight='bold'
}
