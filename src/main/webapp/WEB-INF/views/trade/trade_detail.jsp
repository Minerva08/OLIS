<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script src="${cpath }/resources/js/trade.js"></script>
   <div class="trade_detail_header">
      <div class="trade_detail_topScroll">
         <div>
            <div class="scrollInfo">
               <div class="detail_topSubTitle">
                  <span class="engSub">Seller Info</span>&nbsp;
                  <span class="korSub">판매자 정보</span>
               </div>
               <div class="detail_pro">
                  <img src="${dto.trade_user_profile }">
                  <div>${dto.trade_writer }</div>
               </div>
             </div>
               
            <div class="scrollInfo_pro">
               <div class="detail_topSubTitle">
                  <span class="engSub">Product Info</span>&nbsp;
                  <span class="korSub">제품 정보</span>
               </div>
               <div class="detail_proName">상품명 : ${dto.trade_title}/${dto.trade_product_name}</div>
               <div class="detail_category"><button id="detail_cate" data-contain="${dto.trade_category}" onclick="detail_cateToGo()">#카테고리 : ${dto.trade_category}</button></div>
            </div>
         </div>
         <div class="detail_chatBtn" data-idx="${dto.trade_idx }">판매자와 대화</div>
      </div>
   </div>
<section class="trade_detail_sec">
   
   <div class="trade_detail_main">
      <div class="trade_detail_mainBox">
         <div class="trade_detail_info">
         
            <div class="trade_detail_infoImg ffcl">
            	<div class="imgframe aice jcce">
	            	<img data-n="-1" class="left_bar" src="${cpath }/resources/img/left_bar.svg" width="30">
	            	<div class="imgbox df" style="width:500px; height: 600px;">
	               		<img class="trade_img_select" src="${dto.trade_img1 }" style="width:500px; height: 600px;">
	               		<c:if test="${dto.trade_img2 ne null}">
	               			<img class="trade_img_select " src="${dto.trade_img2 }" style="width:500px; height: 600px;">
	               		</c:if>
	               		<c:if test="${dto.trade_img3 ne null}">
	               			<img class="trade_img_select" src="${dto.trade_img3 }" style="width:500px; height: 600px;">         
	           			</c:if>
	           		</div>    
	            	<img data-n="1" class="right_bar" src="${cpath }/resources/img/right_bar.svg" width="30">
            	</div>
            
               <div class="img_paging df">
	               	<p data-img="1" id="1">🟣</p>
	               	<c:if test="${dto.trade_img2 ne null}">
	               		<p data-img="2" id="2">⚪</p>
	               	</c:if>
	               	<c:if test="${dto.trade_img3 ne null}">
	               		<p data-img="3" id="3">⚪</p>
	               	</c:if>
               </div> 
            </div>
            
            
            <div class="trade_detail_infoBox">
               <div>
                  <div class="detail_infoBox_prof">
                     <div class="infoBox_prof">         
                        <img src="${dto.trade_user_profile }">
                        <div class="prof_name">
                           <div>판매자</div>
                           <div>${dto.trade_writer }</div>                        
                        </div>
                     </div>
                     <div class="detail_chatBtn" data-idx="${dto.trade_idx }">판매자와 대화</div>
                  </div>
                  <div class="detail_category df">
                  	<button id="detail_cate" data-contain="${dto.trade_category}" onclick="detail_cateToGo()">#카테고리 : ${dto.trade_category}</button>
                  	<c:if test="${login.grade eq 'admin'}">
                  		<button id="trade_delete" data-idx="${dto.trade_idx }">삭제</button>
                  	</c:if>
                  </div>
               
               </div>
               <div id="detail_content">
               	  <div class="df">
	                  <div class="title ffcl">
	                  	<span style="font-weight: 600;">제목</span>
	                  	<span>${dto.trade_title}</span>
	                  </div>
                  </div>
                  <div class="content">
                  	<div>내용</div>
                  	<div>${dto.trade_content}</div>
                  </div>
               </div>   
            </div>
            
            <!-- 댓글 part -->
            <!-- 댓글 쓰기 -->
            <div class="trade_detail_replySec">
                  <div class="trade_detail_reply">
                     <div class="trade_detail_reply_user">
                        <c:if test="${empty login.user_profile_img }">
                           <img src="http://ipon.co.kr/common/img/default_profile.png">
                        </c:if>
                        <c:if test="${not empty login.user_profile_img}">
                           <img src="${login.user_profile_img}">
                        </c:if>
                     </div>
                     
                     <div class="replyChatFormDiv">                  
                        <form class="replyChatForm">
                           <input type="hidden" id="isLogin" name="tradeReply_user_nick"  value="${login.user_nickname}">
                           <c:if test="${empty login.user_profile_img}">
                              <input type="hidden" name="tradeReply_user_profile" value="http://ipon.co.kr/common/img/default_profile.png">
                           </c:if>
                           <c:if test="${not empty login.user_profile_img}">
                              <input type="hidden" name="tradeReply_user_profile" value="${login.user_profile_img}">
                           </c:if>
                           
                           <textarea name="tradeReply_comment" placeholder="공개 댓글 추가..."></textarea>
                           <input type="hidden"  id="reply_trade_idx" name="trade_idx" value="${dto.trade_idx}">               
                           <input  class="replyChatFormBtn" type="submit" value="확인">
                        </form>
                     </div>
                  </div>
                     <!-- 댓글보기 -->
                     <div class="replyList"></div>
            </div>   
         </div>   
      </div>
   </div>
</section>

<script>
const leftbar = document.querySelector('.left_bar') // 이미지 핸들러 왼쪽바 선택자
const rightbar = document.querySelector('.right_bar') // 이미지 핸들러 오른쪽 선택자
const imgSelect = document.querySelectorAll('.trade_img_select') // 이미지 선택자
const imgbox = document.querySelector('.imgbox') // 이미지 div 선택자
const imgframe = document.querySelector('.imgframe') // 이미지 div 선택자
const imgpage = document.querySelectorAll('.img_paging > p')
const trade_delete = document.getElementById('trade_delete')

trade_delete.onclick=delete_content


imgpage.forEach(btn=>{
	console.log(btn)
		btn.style.margin='20px'
		btn.onclick=function(event){
			let imgNum = event.target.dataset.img
			//let nextCh= event.target.parentNode.childNodes[imgNum].nextSibling
			
			for(let i=0; i<imgpage.length;i++){
				if(imgNum != imgpage[i].id){
					imgpage[i].innerText=""
					imgpage[i].innerText="⚪"
				}
				else{
					btn.innerText=''
					btn.innerText='🟣'
				}
			}
			if(imgNum==1){
				imgbox.style.marginLeft=(-1000*(imgNum-1))+'px'
				console.log('img_btn : ',imgbox.style.marginLeft)
				
			}
			if(imgNum==2){
				imgbox.style.marginLeft=(-1000*(imgNum-1))+'px'
				console.log('img_btn : ',imgbox.style.marginLeft)
			}
			if(imgNum==3){
				imgbox.style.marginLeft=(-1000*(imgNum-1))+'px'
				console.log('img_btn : ',imgbox.style.marginLeft)
			}
			
		}
	})  
	
	
let imgcount = ''

let click = 0
leftbar.onclick=function(){
	let move_f = 1000;
	let px = parseInt(imgbox.style.marginLeft.slice(0,(imgbox.style.marginLeft.length-2)))
	console.log(px)
	if(imgbox.style.marginLeft == '0px' || imgbox.style.marginLeft ==''){
		imgbox.style.marginLeft='0px'
		console.log('left :',imgbox.style.marginLeft)
		return
	}
	else{
		imgbox.style.marginLeft = (px+move_f)+'px'
		console.log('left :',imgbox.style.marginLeft)
	}
	
	if(imgbox.style.marginLeft=='0px'){
		console.log('여기')
		imgpage[0].innerText=''
		imgpage[0].innerText='🟣'
		
		for(let i=1;i<imgpage.length;i++){
			imgpage[i].innerText=''
			imgpage[i].innerText='⚪'
		}
	
	}
	else if(imgbox.style.marginLeft=='-1000px'){
	
		imgpage[0].innerText=''
		imgpage[0].innerText='⚪'
	
		
		imgpage[1].innerText=''
		imgpage[1].innerText='🟣'
		
		if(imgpage.length==3){
			console.log('here')
			console.log(imgpage[2].innerText)
			imgpage[2].innerText=''
			imgpage[2].innerText='⚪'
		}
		
	}
	else if(imgbox.style.marginLeft=='-2000px'){
		for(let i=0;i<imgpage.length-1;i++){
			imgpage[i].innerText=''
			imgpage[i].innerText='⚪'
			
		}
		
		imgpage[2].innerText=''
		imgpage[2].innerText='🟣'
		
	}
	
	
	
	
}

rightbar.onclick=function(){
	let move_n=-1000
	console.log('move_n',move_n)
	console.log(imgSelect.length)
	let px = parseInt(imgbox.style.marginLeft.slice(0,(imgbox.style.marginLeft.length-2)))
	console.log(px)
	if(imgSelect.length==1){
		return
	}
	
	if(imgbox.style.marginLeft==(-1000*(imgSelect.length-1))+'px'){
		imgbox.style.marginLeft = +(-1000*(imgSelect.length-1))+'px'
		console.log('right :',imgbox.style.marginLeft)
		
	}
	else{
		if(imgbox.style.marginLeft==''){
			px=0
		}
		console.log(px)
		imgbox.style.marginLeft=(px+move_n)+'px'
		console.log('right:',imgbox.style.marginLeft)
	}
	if(imgbox.style.marginLeft=='-1000px'){
		console.log('여기')
		imgpage[0].innerText=''
		imgpage[0].innerText='⚪'
		
		imgpage[1].innerText=''
		imgpage[1].innerText='🟣'
		
		if(imgpage.length==3){
			imgpage[2].innerText=''
			imgpage[2].innerText='⚪'
			
		}
	}
	else if(imgbox.style.marginLeft=='-2000px'){
		for(let i=0;i<imgpage.length-1;i++){
			imgpage[i].innerText=''
			imgpage[i].innerText='⚪'
			
		}
		
		imgpage[2].innerText=''
		imgpage[2].innerText='🟣'
		
	}
	

}


	
</script>
<script>
	const chatBtn = document.querySelectorAll('.detail_chatBtn')
	const login_nickname = '${login.user_nickname}'
	writer_name= '${dto.trade_writer}'
	writer_profile= '${dto.trade_user_profile}'
	recipient = '${dto.trade_writer}'
	chatBtn.forEach(btn => {
		btn.addEventListener('click', onChatting)
	})
	opponent_title.innerText = writer_name
</script>
<script>
   const detail_cate = document.getElementById('detail_cate');
   const replyList = document.querySelector('.replyList')
   const isLogin = document.getElementById('isLogin')
   const replyChatForm= document.querySelector('.replyChatForm')
   const replyChat = document.querySelector('.trade_detail_reply>.replyChatFormDiv>form>textarea')
   const tradeReply_user_profile = document.querySelector('input[name="tradeReply_user_profile"]')
   const trade_idx = document.getElementById('reply_trade_idx')
   const detail_modifyBtn = document.getElementById('detail_modifyBtn')
   let value
   //detail header scroll
   let detail_scroll = window.scrollY || document.documentElement.scrollTop
   window.addEventListener('scroll',scrollEventDiv)
   const trade_detail_topScroll = document.querySelector('.trade_detail_topScroll')
   
   function scrollEventDiv(){
      detail_scroll = window.scrollY || document.documentElement.scrollTop
      if(detail_scroll >550){
         trade_detail_topScroll.style.opacity ='1'
         trade_detail_topScroll.style.zIndex='2'
      }
      else{
         trade_detail_topScroll.style.opacity ='0'
         trade_detail_topScroll.style.zIndex='-1'
      }
   }
   //비로그인일때 login창으로 다시 이동.
   replyChat.onclick=function(event){
      if(isLogin.value== ''){
         location.href=cpath +'/member/login'
      }
   }
   
   //댓글쓰기.
   replyChatForm.onsubmit=function(event){
      event.preventDefault()
      const url = cpath +'/trade/tradeReply'
      const opt={
         method:'POST',
         headers:{
            "Content-Type": "application/json",
         },
         body:JSON.stringify({
               
               'tradeReply_user_nick': isLogin.value,
               'tradeReply_user_profile': tradeReply_user_profile.value,
               'tradeReply_comment': replyChat.value,
               'trade_idx': trade_idx.value + ''               
         }),
      }
      
      replyChat.innerText=''
      fetch(url,opt)
      .then(resp=>resp.text())
      .then(row=>{
         //일단 댓글 올리기 insert
         console.log(row)
      
         //글올리면 새로고침
         location.reload();
      })
   }
   
   //카테고리클릭시 카테고리창으로
   function detail_cateToGo(){
      let contain = detail_cate.dataset.contain
      console.log(contain)
      location.href=cpath+'/trade/tradeList?category='+contain
   }
   
   
   //댓글보기
   function viewReply(){
      console.log(trade_idx.value)
      const url = cpath+'/trade/viewReply?trade_idx='+trade_idx.value;
      const opt={
         method:"GET"
      }
      fetch(url,opt)
      .then(resp=>resp.json())
      .then(json=>{
      //댓글 잘날라옴.
         console.log(json)
      json.forEach(dto=>{
         render(replyList, getReply(dto))
      })
      const detail_modifyBtnList= document.querySelectorAll('.detail_modifyBtn')
      const detail_delBtnList = document.querySelectorAll('.detail_delBtn')
      const detail_modifyBtn = document.querySelector('.detail_modifyBtn')
      const detail_delBtn = document.querySelector('.detail_delBtn')
      
      //수정버튼
      detail_modifyBtnList.forEach(item=>{
         item.addEventListener("click",modifyReply)
      })
      //삭제버튼
      detail_delBtnList.forEach(item=>{
         item.addEventListener("click",deleteReply)
      })
      
      const detail_comment = document.querySelectorAll('.detail_comment')
      
      //1.수정버튼 클릭시.
      function modifyReply(event){
       	 if(event.target.innerText=='확인'){
              const url=cpath+'/trade/modifyComm?tradeReply_comment='+value+'&tradeReply_idx='+event.target.dataset.idx
              const opt={
                 method:'GET'   
              }
              fetch(url,opt)
              .then(resp=>resp.json())
              .then(json=>{
                 console.log(json)
                 location.reload()
           
              })
         	  return
         }
         event.target.innerText='확인'
         const target = event.target
         const item = target.parentNode.previousElementSibling
            let inner = item.innerText  //inner변수에 저장
            item.innerHTML='' //기존 값 지우기.
            item.innerHTML+='<input class="newInner" value="'+inner+'" onkeyup="down(this)">'
            value = inner
            //inner = 131313 으로 들어온다.
            
      }
   })
   }
   /////////////////////////////////////////////////////////         
            
   //댓글삭제버튼 클릭시.
   function deleteReply(event){
      console.log(event.target.dataset.idx)
      const idx=event.target.dataset.idx
      let res=confirm("정말 댓글을 삭제하시겠습니까?")
      if(res ==1){
         const url = cpath+'/trade/deleteReply/'+idx
         const opt={
               method:'GET'
         }
         fetch(url,opt)
         .then(resp=>resp.json())
         .then(json=>{
            console.log(json)
            location.reload()
            console.log(window.scrollTo())
            window.scrollTo(0,10)
         })
      }
   }
   
  window.onload=viewReply
   
   
   
</script>
<%@ include file="../footer.jsp"%>