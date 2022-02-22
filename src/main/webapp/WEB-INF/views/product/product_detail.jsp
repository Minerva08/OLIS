<%@page language = "java" contentType = "text/html; charset=UTF-8"
pageEncoding = "UTF-8" %>
<%@include file = "../header.jsp" %>

<script src="${cpath }/resources/js/product.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<section class="">
	<div id="scrollEvent_div">
		<ul>
			<li class="ffcl">
				<strong>${dto.product_brand }</strong>
				<span>${dto.product_name }</span>
			</li>
			<li class="aice jcce">
				<button id="wishBtnClone">🤍관심상품</button>
				<button id="keepBtnClone">장바구니담기</button>
				<button id="buyBtnClone">즉시구매</button>
			</li>
		</ul>
	</div>

   <div class="product_detail_component df">
      <div class="product_detail_left ffcl">
         <div class="aice jcce">
            <img data-n="-1" class="left_bar" src="${cpath }/resources/img/left_bar.svg" width="30">
            <div class="imgbox df">
               <img class="product_img_select" src="${dto.product_img1 }">
               <img class="product_img_select hidden" src="${dto.product_img2 }">
               <img class="product_img_select hidden" src="${dto.product_img3 }">         
            </div>    
            <img data-n="1" class="right_bar" src="${cpath }/resources/img/right_bar.svg" width="30">
         </div>
         <div class="product_detail_left_div_ul">
            <ul class="product_img_count df">
               
            </ul>
         </div>
      </div>
      <div>
         <div class="product_detail_right_top ffcl">
            <div>
               <span>${dto.product_brand }</span>
            </div>
            <div>
               <span>${dto.product_name }</span>
            </div>
            <div class="jcsb">
               <span>사이즈</span>
               <span id="product_Allsize" style="cursor: pointer;">모든사이즈▽</span>
            </div>
            
            <div class="product_size_dropdown hiddenNone df">
            	<c:forEach var="dto" items="${item }">
            		<div class="All_size_dto">${dto.item_size }</div>
            	</c:forEach>
            </div>
            
            <hr class="product_detail_right_hr">
            
            <div class="jcsb aice">
               <span>구매 가격</span>
               <span>${new_price }</span>
            </div>
         </div>
         
         <div class="product_detail_btn ffcl">
            <div class="jcsb">
               <button id="keepbtn" data-keep="keep">장바구니담기</button>
               <button id="buybtn">즉시구매</button>
            </div>
            <div>
               <button id="wishbtn">🤍관심상품</button>
            </div>
         </div>
         
         <div><span>상품정보</span></div>
         
         <hr class="product_detail_right_hr">
         
         <div class="product_detail_info">
            <ul class="df">
               <li>
                  <span>모델번호</span>
                  <span>${dto.product_model_num }</span>
               </li>
               <li>
                  <span>상품 출시일</span>
                  <span>${dto.product_upload }</span>
               
               </li>
               <li>
                  <span>컬러</span>
                  <span>${dto.product_color }</span>
               </li>
               <li>
                  <span>즉시구매가</span>
                  <span>${new_price }</span>
               </li>
            </ul>
         </div>
         
         <hr class="product_detail_right_hr">
         
         <div class="product_detail_right_bottom">
            <div><span>구매전 꼭확인해주세요!</span></div>
            <ul>
               <li class="li_dropdown">
                  <div class="jcsb">
                     <span>배송기간 안내</span>
                     <span>▽</span>
                  </div>
                  <pre class="product_pre hiddenNone">${txts[0] }</pre>
               </li>
               <li class="li_dropdown">
                  <div class="jcsb">
                     <span>검수 안내</span>
                     <span>▽</span>
                  </div>
                  <pre class="product_pre hiddenNone">${txts[1] }</pre>
               </li>
               <li class="li_dropdown">
                  <div class="jcsb">
                     <span>구매 환불/취소/교환안내</span>
                     <span>▽</span>
                  </div>
                  <pre class="product_pre hiddenNone">${txts[2] }</pre>
               </li>
            </ul>
         </div>
         
         <div class="product_detail_right_bottom_p">
            <p>
               <img src="http://192.168.1.100:1234/policy/정품보증.png" width="30px" height="30px">
               <span>100%정품 보증</span>
               <div>OLIS에서 검수한 상품이 정품이 아닐 경우, 구매가의 3배를 보상합니다.</div>
            </p>
            <p>
               <img src="http://192.168.1.100:1234/policy/다중검수.png" width="30px" height="30px">
               <span>엄격한 다중 검수</span>
               <div>모든 상품은 검수센터에 도착한 후, 상품별 전문가 그룹의 체계적인 시스템을 거쳐 검수를 진행합니다.</div>
            </p>
            <p>
               <img src="http://192.168.1.100:1234/policy/정품인증.png" width="30px" height="30px">
               <span>정품 인증 패키지</span>
               <div>검수에 합격한 경우에 한하여 OLIS의 정품 인증 패키지가 포함된 상품이 배송됩니다.</div>
            </p>
         </div>
         
         <hr class="product_detail_right_hr">
      </div>
   </div>
   <hr class="product_detail_hr">
   <div class="recommend">
   		<div class="rec_title">추천상품</div>
   		<div class="rec_list">
   			<ul class="df" style="margin-left: 0px;">
   				<c:forEach var="ob" items="${list }">
	   				<li>
		  				<div class="item">
							<div class="img jcce aice" data-modelnum="${ob.product_model_num}"><img src="${ob.product_img1}" width="100%" data-modelnum="${ob.product_model_num}"></div>
							<div class="brand">${ob.product_brand }</div>
							<div class="name" data-modelnum="${ob.product_model_num}">
								 <c:choose>
							        <c:when test="${fn:length(ob.product_name) > 40}">
							         	<c:out value="${fn:substring(ob.product_name,0,41)}"/>....
							        </c:when>
							        <c:otherwise>
							         	<c:out value="${ob.product_name}"/>
							        </c:otherwise> 
						         </c:choose>
							</div>
							<div class="price"><fmt:formatNumber value="${ob.product_price }" pattern="###,###"></fmt:formatNumber> 원</div>
							<div class="now">즉시 구매가</div> 
							<div class="wish">❤ ${ob.product_wish_count} 회</div>
						</div>
	   				</li>
   				</c:forEach>
   			</ul>
   		</div>
		<button class="rec_leftBtn" value="300"></button>
		<button class="rec_rightBtn" value="300"></button>
   </div>
</section>

<!-- 모달 영역 입니다 -->

<div class="product_modal_BuySlide">
   <div class="modal_buybox">
   
      <div class="product_detail_modal_buy1">
         <div class="modal_buy_div1 jcce">
            <span>SIZE 선택</span>
         </div>
         <div class="modal_buy_div2">
            <ul>
               <li>${dto.product_brand }</li>
               <li>${dto.product_name }</li>
            </ul>
         </div>
         <div class="modal_buy_div3">
            <c:forEach var="item_dto" items="${item }">
               <div class="buy_item_dto jcce aice" data-size="${item_dto.item_size }" data-delibery="${item_dto.item_delibery }">
                  <span>${item_dto.item_size }</span>
               </div>
            </c:forEach>
         </div>
         <div class="modal_buy_div4 jcce aice">
            <button class="product_closeBtn">취소</button>
            <button id="product_buyBtn1">구매 동의</button>
         </div>
      </div>
      
      <div class="product_detail_modal_buy2">
         <div class="modal_buy_step2_div1 jcce">
            <span>구매 동의</span>
         </div>
         
         <div class="modal_buy_step2_div2">
            <ul>
               <li>${dto.product_brand }</li>
               <li>${dto.product_name }</li>
            </ul>
         </div>
         
         <div class="modal_buy_step2_div3">
            <ul>
           		<li style="height: 29px;">
           			<label class="df"><input type='checkbox' name='selectall' onclick='selectAll(this)'/> 전체동의<br /></label>
           		</li>
            
               <li class="checkinputli jcsb aice">
                  <label class="jcsb aice">
                     <span class="ffcl">
                        <span>구매하려는 상품이 맞습니다.</span>
                        <span>상품이미지, 모델번호, 출시일, 상품명, 사이즈를 한 번 더 확인했습니다.</span>                  
                     </span>
                     <input type="checkbox" name="product_checkbox" onclick='checkSelectAll()'>
                  </label>
               </li>
               
               <li class="checkinputli jcsb aice">
                  <label class="jcsb aice">
                     <span class="ffcl">
                        <span>국내/해외에서 발매한 정품 새상품입니다</span>
                        <span>모든 구성품이 그대로이며, 한 번도 착용하지 않은 정품 새상품입니다 국내 발매 상품 여부는 확인드리지 않습니다.</span>                  
                     </span>
                     <input type="checkbox" name="product_checkbox"onclick='checkSelectAll()'>
                  </label>
               </li>
               
               <li class="checkinputli jcsb aice">
                  <label class="jcsb aice">
                     <span class="ffcl">
                        <span>제조사에게 불량으로 인정하지 않는 기준은 하자로 판단하지 않습니다.</span>
                        <span>박스/패키지와 상품 컨디션에 민갑하시다면 검수 기준을 반드시 확인하시기 바랍니다</span>                  
                     </span>
                     <input type="checkbox" name="product_checkbox" onclick='checkSelectAll()'>
                  </label>   
               </li>
               
               <li class="checkinputli jcsb aice">
                  <label class="jcsb aice">
                     <span class="ffcl">
                        <span>OLIS의 최신 이용정책을 모두 확인하였으며, 구매를 계속합니다</span>
                        <span>건전하고 안전한 거래를 위해 반드시 숙지해야 할 미입고, 패널티, 부정거래 등의 이용정책을 확인했습니다</span>                  
                     </span>
                     <input type="checkbox" name="product_checkbox" onclick='checkSelectAll()'>
                  </label>
               </li>
               
            </ul>
         </div>
         
         <div class="modal_buy_step2_div4 jcce aice">
            <button id="product_backBtn">이전</button>
            <button id="product_buyBtn2">결제 계속</button>
         </div>
      </div>
      
      <div class="product_detail_modal_buy3">
         <div class="modal_buy_step3_div1 jcce">
            <span>결제 확인</span>
         </div>
         
         <div class="modal_buy_step3_div2">
            <ul>
               <li>${dto.product_brand }</li>
               <li>${dto.product_name }</li>
            </ul>
         </div>
         
            <div class="modal_buy_step3_div3">
               <ul>
                  <li>
                     <span>상품 정보 확인</span>
                     <div class="jcsb">
                        <div class="ffcl">
                           <span>컬러</span>
                           <span>${dto.product_color }</span>
                        </div>
                        <div class="ffcl">
                           <span>사이즈</span>
                           <span id="size_span"></span>
                        </div>
                        <div class="ffcl">
                           <span>출시일</span>
                           <span>${dto.product_upload }</span>
                        </div>
                     </div>
                  </li>
               
                  <li class="jcce ffcl">
                     <div class="jcsb">
                        <span>배송 주소</span>
                        <span id="add_address">+주소지 추가</span>
                     </div>
                     <select name="select_address" required="required">
                        <option selected="selected" disabled="disabled" value="null">주소를 선택해주세요</option>
                        <c:forEach var="ad" items="${address }">
                           <option value="${ad.address }">${fn:replace(ad.address, '//', ' ') }</option>
                        </c:forEach>
                     </select>
                   </li>
                   
                  <li class="ffcl jcce">
                     <span>최종 주문 정보</span>
                     <div class="jcsb aice">
                        <span>결제 금액</span>
                        <span>${new_price }</span>                        
                     </div>
                     <div class="jcsb aice">
                        <span>배송비</span>
                        <span id="buy_selectdelibery">5000</span>                        
                     </div>
                  	<div class="jcsb aice">
                  		<span class="">
                 			<span>현재포인트 : ©${login.point }P</span>
                 			<input id="usepoint_ck" type="text" onkeyup="pointMinus(this)" placeholder="사용할 포인트 입력"> P
                  		</span>
	                     <span id="point_label" style="height: 21.6px;"></span>
                  	</div>
                     <div class="jcsb aice">
                        <span>총 결제금액</span>
                        <span id="usepoint_price"><fmt:formatNumber value="${dto.product_price + 5000 }" pattern="###,###"/></span>
                     </div>
                  </li>
                  
                  <li class="ffcl jcce">
                     <div class="jcsb">
                        <span>결제 방법</span>
                     </div>
                     <select name="select_buycard" required="required">
                        <option selected="selected" disabled="disabled" value="null">결제 방법을 선택해주세요</option>
                
                           <option value="카카오페이">카카오페이</option>
                        
                     </select>
                  </li>
                  
                  <li>
                     <div>
                        <label class="jcsb aice">
                           <span>구매 조건을 모두 확인하였으며, 거래 진행에 동의합니다.</span>
                           <input type="checkbox" name="last_check_buy">                        
                        </label>
                     </div>
                  </li>
      
               </ul>
            </div>
            
            <div class="modal_buy_step3_div4 jcce aice">
               <input id="modal_buy_step3_div4_input" type="button" class="product_closeBtn" value="결제 취소">
               <button id="product_lastBtn">결제 하기</button>
            </div>
            
            <input type="hidden" name="buy_price" value="${dto.product_price }">
            <input type="hidden" name="buy_size" value="">
            <input type="hidden" name="buy_nickname" value="${login.user_nickname }">
            <input type="hidden" name="buy_model_num" value="${dto.product_model_num }">
            <input type="hidden" name="buy_color" value="${dto.product_color }">
      </div>
      
      <div class="modal_address">
         <div class="modal_address_div1">
            <span>주소 추가하기</span>
         </div>
         
         <form id="modal_address_form">
            <div class="modal_address_section">
               
               <div class="modal_address_div2">
                  <ul>
                     <li class="ffcl">
                        <strong class="li_child1">이름</strong>
                        <input placeholder="수령인 이름" type="text" name="user_name" class="address_alert">
                     </li>
                     <li class="ffcl">
                        <strong class="li_child1">휴대폰 번호</strong>
                        <input placeholder="-없이 입력" type="number" name="user_pnum2" class="address_alert">
                     </li>
                     <li class="ffcl">
                        <div class="li_child1 jcsb">
                           <strong>우편번호</strong>
                           <input type="button" id="postcode" value="우편번호">
                        </div>
                        <input placeholder="우편 번호를 검색하세요" id="postcode_input" readonly="readonly" class="address_alert" name="postcode">
                     </li>
                     <li class="ffcl">
                        <strong class="li_child1">주소</strong>
                        <input placeholder="우편 검색시 자동입력 됩니다" id="roadAddress" readonly="readonly" name="user_address">
                     </li>
                     <li class="ffcl">
                        <strong class="li_child1">상세주소</strong>
                        <input placeholder="건물,아파트 동/호수 입력" id="detailAddress" class="address_alert" name="address_detail">
                     </li>
                  </ul>
               </div>
               
               <div class="modal_address_div3">
                  <label class="aice" style="cursor: pointer;">
                     <input type="checkbox" value="default" style="zoom: 1.5" name="" id="default_check_address">
                     <span>기본배송지로 설정</span>
                  </label>   
               </div>
               
               <div class="modal_address_div4">
                  <input type="button" id="backAddressModal" value="이전">
                  <button id="AddressModalsubmit">저장 하기</button>
               </div>
            </div>
            <input type="hidden" name="user_email" value="${login.user_email }">
      </form> 

      <span id="guide" style="color:#999;display:none"></span>
      </div>
      
      
   </div>
</div>

<!-- -------------------------------------------- -->

<div class="product_detail_modal_wish">
   <div class="modal_wish_div1 jcce">
      <span>관심 상품 추가</span>
   </div>
   <div class="modal_wish_div2">
      <ul>
         <li>${dto.product_brand }</li>
         <li>${dto.product_name }</li>
      </ul>
   </div>
   <div class="modal_wish_div3">
      <c:forEach var="item_dto" items="${item }">
         <div class="wish_item_dto jcce aice" data-size="${item_dto.item_size }">
            <span data-size="${item_dto.item_size }">🤍</span>
            <span data-size="${item_dto.item_size }">${item_dto.item_size }</span>
         </div>
      </c:forEach>
   </div>
   <div class="modal_wish_div4 jcce aice">
      <button class="product_closeBtn">확인</button>
   </div>
</div>
<!-- ===============================장바구니 -->
<div class="product_detail_modal_shopping">
   <div class="modal_shopping_div1 jcce">
      <span>장바구니 추가</span>
   </div>
   <div class="modal_shopping_div2">
      <ul>
         <li>${dto.product_brand }</li>
         <li>${dto.product_name }</li>
      </ul>
   </div>
   <div class="modal_shopping_div3">
      <c:forEach var="item_dto" items="${item }">
         <div class="shopping_item_dto jcce aice" data-size="${item_dto.item_size }">
            <span data-size="${item_dto.item_size }">${item_dto.item_size }</span>
         </div>
      </c:forEach>
   </div>
   <div class="modal_shopping_div4 jcce aice">
      <button class="product_closeBtn">확인</button>
   </div>
</div>

<div class="product_overlay"></div>

<script type="text/javascript" charset="utf-8">
   	const leftbar = document.querySelector('.left_bar') // 이미지 핸들러 왼쪽바 선택자
   	const rightbar = document.querySelector('.right_bar') // 이미지 핸들러 오른쪽 선택자
  	const imgSelect = document.querySelectorAll('.product_img_select') // 이미지 선택자
	const imgbox = document.querySelector('.imgbox') // 이미지 div 선택자
   	const li_dropdown = document.querySelectorAll('.li_dropdown') // 구매 설명 드롭다운 li
   	const product_pre = document.querySelectorAll('.product_pre') // 구매 설명 드롭다운 선택자
   	const buyBtn = document.getElementById('buybtn') // 구매 버튼 선택자
   	const wishbtn = document.getElementById('wishbtn') // 관심 버튼 선택자
   	const keepbtn = document.getElementById('keepbtn') // 장바구니 버튼 선택자
	const buyBtnClone = document.getElementById('buyBtnClone') // 구매 클론 선택자
   	const wishBtnClone = document.getElementById('wishBtnClone') // 관심 클론 선택자
   	const keepBtnClone = document.getElementById('keepBtnClone') // 장바구니 클론 선택자
   	const shopping_item_dto = document.querySelectorAll('.shopping_item_dto') // 장바구니 아이템 선택자
   	const product_closeBtn = document.querySelectorAll('.product_closeBtn') // 모달 close 버튼 선택자들
	const product_Allsize = document.getElementById('product_Allsize') // 사이즈 드롭다운 버튼 선택자
	const product_size_dropdown = document.querySelector('.product_size_dropdown') // 사이즈 드롭다운 div
	const scrollEvent_div = document.getElementById('scrollEvent_div') // 스크롤 이벤트 div 선택자
	const checkinput = document.querySelectorAll('input[name="product_checkbox"]') // 구매 동의 인풋 선택자
   	const checkinputli = document.querySelectorAll('.checkinputli') // 구매 동의 설명 li
   	const size_span = document.getElementById('size_span') // 사이즈 innerText ?
   	
   	const product_modal_BuySlide = document.querySelector('.product_modal_BuySlide') // 구매 모달 선택자
   	const product_detail_modal_buy1 = document.querySelector('.product_detail_modal_buy1') // 구매 모달1 선택자
   	const product_detail_modal_buy2 = document.querySelector('.product_detail_modal_buy2') // 구매 모달2 선택자
   	const product_detail_modal_buy3 = document.querySelector('.product_detail_modal_buy3') // 구매 모달3 선택자   
   	const product_detail_modal_wish = document.querySelector('.product_detail_modal_wish') // 관심 모달 선택자
   	const product_detail_modal_shopping = document.querySelector('.product_detail_modal_shopping') // 장바구니 모달 선택자
   	const modal_address = document.querySelector('.modal_address') // 주소 모달 선택자
   	const add_address = document.getElementById('add_address') // 주소 추가 클릭 선택자
   	const backAddressModal = document.getElementById('backAddressModal') // 주소 이전 버튼 선택자
   	const modal_address_form = document.getElementById('modal_address_form') // 주소 모달 폼 선택자
   	const address_alert = document.querySelectorAll('.address_alert') // 주소 값 비었는지 확인 선택자
   	const default_check_address = document.getElementById('default_check_address') // 기본 배송지 버튼 선택자
   	const postcode = document.getElementById('postcode') // 우편번호 선택자
   	const postcode_input = document.getElementById('postcode_input') // 주소 인풋 선택자
   	const select_address = document.querySelector('select[name="select_address"]') // 주소 select 선택자
	const product_overlay = document.querySelector('.product_overlay') // 오버레이 선택자  	
   	const product_buyBtn1 = document.getElementById('product_buyBtn1') // 구매 스텝 버튼1 선택자
   	const product_buyBtn2 = document.getElementById('product_buyBtn2') // 구매 스텝 버튼2 선택자
   	const product_lastBtn = document.getElementById('product_lastBtn') // 구매 마지막 버튼 선택자
   	const product_backBtn = document.getElementById('product_backBtn') // 구매 이전 버튼 선택자
	const buy_item_dto = document.querySelectorAll('.buy_item_dto') // 모달 구매 아이템들 선택자
   	const wish_item_dto = document.querySelectorAll('.wish_item_dto') // 관심 모달 아이템들 선택자
   	const buy_size_input = document.querySelector('input[name="buy_size"]') // 구매 사이즈 아이템 선택자
   	const last_check_buy = document.querySelector('input[name="last_check_buy"]') // 구매 마지막 동의 인풋 선택자
  	const select_buycard = document.querySelector('select[name="select_buycard"]')
   	const rec_leftBtn = document.querySelector('.rec_leftBtn')
   	const rec_rightBtn = document.querySelector('.rec_rightBtn')
   	const rec_ul = document.querySelector('section > .recommend > .rec_list > ul')
   	const onDetail = document.querySelectorAll('.rec_list > ul > li > .item > div')
   	const usepoint_ck = document.getElementById('usepoint_ck')
   	const point_label = document.getElementById('point_label')
   	const usepoint_price = document.getElementById('usepoint_price')
   	const loginPoint = '${login.point}'
   	const totalPrice = '${dto.product_price + 5000 }'
   	
   	onDetail.forEach(box => {
	   	box.addEventListener('click',clickDetail)
   	})
   	rec_leftBtn.addEventListener('click', recSlideLeft)
   	rec_rightBtn.addEventListener('click', recSlideRight)
   	let gg = 300
   	// 변수
	const img1 = '${dto.product_img2}' // dto 이미지2
	const img2 = '${dto.product_img3}' // dto 이미지3
	let imglast = 0 // 마지막 이미지 확인 변수
	let imgnext = 0 // 이미지 카운트
	const wishsize = '${size}'
    const color = '${dto.product_color }'
    let price = ${dto.product_price + 5000}
    const price1 = ${dto.product_price}
    const img = '${dto.product_img1 }'
    const model_num = '${dto.product_model_num }'
    const model_brand = '${dto.product_brand }'
    const model_name = '${dto.product_name }'
    
    const modelidx = ${idx} + ''
    console.log(modelidx)
    
	const user_nickname = '${login.user_nickname}'
   	const width = imgSelect[0].width // 이미지 div 너비
   	const height = imgSelect[0].height // 이미지 div 높이
   	const userpoint = ${login.point}
   	imgbox.style.width = width + 'px' // 이미지 박스 너비 주기
   	imgbox.style.height = height + 'px' // 이미지 박스 높이 주기
	let size = wishsize.split(",") // 관심 사이즈 구분
	let selectbuySize = '' // 구매 사이즈
	let now_scroll = window.scrollY || document.documentElement.scrollTop // 현재 스크롤 위치
	let ul_li = '' // 바텀 보드 선택자
	let selectdelibery = ''
	let order_address = ''
	
   	// 이벤트 및 페이지 요청시발동
	imgDTOcount(img1, img2) // 이미지 여부 확인후 슬라이드 횟수 파악함수
	leftbar.addEventListener('click', imgHandler) // 이미지 핸들러 왼쪽
   	rightbar.addEventListener('click', imgHandler) // 이미지 핸들러 오른쪽
   	buyBtn.onclick = onBuy // 구매 버튼 이벤트
   	wishbtn.onclick = onWish // 관심 버튼 이벤트
   	keepbtn.onclick = onkeep // 장바구니 버튼 이벤트
   	buyBtnClone.onclick = onBuy // 구매 버튼 클론 이벤트
   	wishBtnClone.onclick = onWish // 관심 버튼 클론 이벤트
   	keepBtnClone.onclick = onkeep // 장바구니 버튼 클론 이벤트
	window.addEventListener('scroll', scrollEventDiv) // 스크롤 hiddenNone 이벤트
   	product_Allsize.onclick = sizeDropDiv // 사이즈 드롭다운 이벤트
   	product_backBtn.onclick = backBtn // 구매 이전 버튼 이벤트
    add_address.onclick = productAddaddress // 주소 추가 이벤트
    backAddressModal.onclick = backAddress // 주소추가 이전 버튼 이벤트
    postcode.onclick = DaumAPIproduct // 우편번호 검색 api
    modal_address_form.onsubmit = insertAddress // 주소 추가 이벤트
    product_lastBtn.onclick = lastBuyproduct // 구매 최종 결제 이벤트 api
   	product_overlay.onclick = closeModalproduct // 오버레이 클릭시 close 이벤트
   	
   	li_dropdown.forEach(pre => { // 상품구매 확인 드롭다운
      	pre.addEventListener('click', preHandler)
   	})
   	product_closeBtn.forEach(btn => { // 모달 close 클릭 이벤트
      	btn.addEventListener('click', closeModalproduct)
   	})
   	buy_item_dto.forEach(btn => { // 구매 아이템 클릭 이벤트
      	btn.addEventListener('click', selectBuyItem)
   	})
   	wish_item_dto.forEach(btn => { // 관심 아이템 클릭 이벤트
      	btn.addEventListener('click', selectWishItem)
   	})
   	shopping_item_dto.forEach(btn => { // 장바구니 인서트 클릭 이벤트
      	btn.addEventListener('click', selectshoppingItem)
   	})
   	checkinputli.forEach(ck => { // 구매 전 확인 동의 체크 이벤트
      	ck.addEventListener('click', checkinputCount)
   	})
   	
</script>

<%@ include file="../footer.jsp"%>