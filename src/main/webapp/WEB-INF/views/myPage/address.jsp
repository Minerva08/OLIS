<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage.css">
<script src="${cpath }/resources/js/mypage.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<section class="myPage_address df">
   	<section class="address_section df">
	  
	  	<div class="myPage_left">
			<h2><a href="${cpath }/myPage/home_myPage">마이 페이지</a></h2>
			<div>
				<span>쇼핑 정보</span>
				<ul>
					<li><a href="${cpath }/myPage/buyList">구매 내역</a></li>
					<li><a href="${cpath }/myPage/saleList">판매 내역</a></li>
					<li><a href="${cpath }/myPage/wishList?page=0">관심 상품</a></li>
				</ul>
			</div>
			<div>
				<span>내 정보</span>
				<ul>
					<li><a href="${cpath }/myPage/info">프로필 정보</a></li>
					<li><a href="${cpath }/myPage/address">주소록</a></li>
					<li><a href="${cpath }/myPage/shopping?page=0">장바구니</a></li>
					<li><a href="${cpath }/myPage/point">포인트</a></li>
				</ul>
			</div>
		</div>
	   
	   	<div class="address_right">
	   		
	   		<div class="address_div1 jcsb">
	   			<strong>주소록</strong>
	   			<button id="address_addBtn">+새 배송지 추가</button>
	   		</div>
	   		<c:if test="${addressDefault.address_name ne null }">
	   			
		   		<div class="address_div2 df aice jcsb">
		   			<div class="address_div2_info df">
		   				<ul class="ffcl">
		   					<li>${addressDefault.address_name }<span>기본배송지</span></li>
		   					<li>${addressDefault.address_pnum }</li>
		   					<li>${ fn:replace(addressDefault.address, "//", " ") }</li>
		   				</ul>
		   			</div>
		   			
		   			<div class="address_div2_btn df">
		   				<button class="modify_address_df" 
		   				data-user_email="${addressDefault.user_email }"
		   				data-address="${addressDefault.address }"
		   				data-address_name="${addressDefault.address_name }"
		   				data-address_pnum="${addressDefault.address_pnum }"
		   				data-default_address="${addressDefault.default_address }"
		   				data-address_idx="${addressDefault.address_idx }"
		   				>수정</button>
		   				<button class="address_delete" data-address_idx="${addressDefault.address_idx }">삭제</button>
		   			</div>
		   		</div>
	   		</c:if>
	   		
	   		<hr id="address_hr">
	   		
	   		<div>
	   			<c:forEach var="dto" items="${address }">
		   			<div class="address_div_forEach df aice jcsb">
			   			<div class="address_div2_info df">
			   				<ul class="ffcl">
			   					<li>${dto.address_name }</li>
			   					<li>${dto.address_pnum }</li>
			   					<li>${ fn:replace(dto.address, "//", " ") }</li>
			   				</ul>
			   			</div>
			   			
			   			<div class="address_div2_btn df">
			   				<button class="modify_address" 
			   				data-user_email="${dto.user_email }"
	   						data-address="${dto.address }"
	   						data-address_name="${dto.address_name }"
	   						data-address_pnum="${dto.address_pnum }"
	   						data-default_address="${dto.default_address }"
	   						data-address_idx="${dto.address_idx }"
	   						>수정</button>
			   				<button class="address_delete" data-address_idx="${dto.address_idx }">삭제</button>
			   			</div>
	   				</div>
	   			</c:forEach>
	   		</div>
	   		
	   	</div>
	   	
    </section>
       
</section>

<!-- ----------------------------------------------- -->

<div class="address_overlay"></div>

<div id="address_modal_Box">
	<div class="modal_address_my">
         <div class="modal_address_div1_my">
            <span id="modal_address_id">주소 추가하기</span>
         </div>
         
         <form id="modal_address_form_my">
            <div class="modal_address_section_my">
               
               <div class="modal_address_div2_my">
                  <ul>
                     <li class="ffcl">
                        <strong class="li_child1_my">이름</strong>
                        <input placeholder="수령인 이름" type="text" name="user_name" class="address_alert">
                     </li>
                     <li class="ffcl">
                        <strong class="li_child1_my">휴대폰 번호</strong>
                        <input placeholder="-없이 입력" type="number" name="user_pnum2" class="address_alert">
                     </li>
                     <li class="ffcl">
                        <div class="li_child1_my jcsb">
                           <strong id="postcode_innerText">우편번호</strong>
                           <input type="button" id="postcode" value="우편번호">
                        </div>
                        <input placeholder="우편 번호를 검색하세요" id="postcode_input" readonly="readonly" class="address_alert" name="postcode">
                     </li>
                     <li class="ffcl">
                        <strong class="li_child1_my">주소</strong>
                        <input placeholder="우편 검색시 자동입력 됩니다" id="roadAddress" readonly="readonly" class="address_alert" name="user_address">
                     </li>
                     <li class="ffcl">
                        <strong class="li_child1_my">상세주소</strong>
                        <input placeholder="건물,아파트 동/호수 입력" id="detailAddress" class="address_alert" name="address_detail">
                     </li>
                  </ul>
               </div>
               
               <div class="modal_address_div3_my">
                  <label class="aice" style="cursor: pointer;">
                     <input type="checkbox" style="zoom: 1.5" name="" id="default_check_address">
                     <span id="default_check_address_ment">기본배송지로 설정</span>
                  </label>   
               </div>
               
               <div class="modal_address_div4_my">
                  <input type="button" id="backAddressModal_my" value="취소">
                  <button id="AddressModalsubmit_my">저장 하기</button>
               </div>
            </div>
            <input type="hidden" name="user_email" value="${login.user_email }">
            <input type="hidden" name="address_idx">
         </form>

     	 <span id="guide" style="color:#999;display:none"></span>
     </div>
</div>

<script type="text/javascript">
	const address_delete = document.querySelectorAll('.address_delete')
	//각 주소별 삭제버튼
	address_delete.forEach(ev => {
		ev.addEventListener('click', deleteAddress)
	})
	
	const addressDefault = '${addressDefault.default_address}'
	console.log(addressDefault)
	const nowurl = window.location.pathname
	const default_check_address = document.getElementById('default_check_address')
	const default_check_address_ment = document.getElementById('default_check_address_ment')
	
	nowpage(nowurl)
	const modal_address_id = document.getElementById('modal_address_id')
	const address_overlay = document.querySelector('.address_overlay')
	const backAddressModal_my = document.getElementById('backAddressModal_my')
	const modal_address = document.querySelector('.modal_address_my')
	const address_modal_Box = document.getElementById('address_modal_Box')
	const address_addBtn = document.getElementById('address_addBtn')
	const address_alert = document.querySelectorAll('.address_alert')
	const modal_address_form_my = document.getElementById('modal_address_form_my')
	address_addBtn.addEventListener('click', addressAddBtn)
	address_overlay.onclick = backAddress
	backAddressModal_my.onclick = backAddress
	postcode.onclick = DaumAPIproduct
	
	//modal_address_form_my.onsubmit = insertAddress
	modal_address_form_my.addEventListener('submit', insertAddress)
		
	const modify_address_df = document.querySelector('.modify_address_df')
	modify_address_df.addEventListener('click', modify_addressBtn_df)
	const modify_address = document.querySelectorAll('.modify_address')
	
	//등록된 주소지수정
	modify_address.forEach(event => {
		event.addEventListener('click', modify_addressBtn)
	})
	const postcode_innerText = document.getElementById('modal_address_form_my')
</script>

<%@ include file="../footer.jsp"%>