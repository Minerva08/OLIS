<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage.css">
<script src="${cpath }/resources/js/mypage.js"></script>

<section>
   <div class="saleList_component df">
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
      
      <div class="wishList_right">
         <div class="wishList_logo">관심상품</div>
         <div class="wishList_box">
            <ul>
               <c:forEach var="dto" items="${wishlist }">
                  <li>
                     <div class="item_info df">
                        <div class="item_img"><img src="${dto.wish_img }" width="80px"></div>
                        <div class="item_detail ffcl jcce">
                           <div class="item_brand"><a href="">${dto.wish_brand }</a></div>
                           <div class="item_name">${dto.wish_model_name }</div>
                           <div class="item_size">${dto.wish_size }</div>
                        </div>
                     </div>
                     <div class="button_box jcfe ffcl">
                        <div class="button_btn df" data-modelNum="${dto.wish_model_num}">
                           <div class="buy_logo jcce aice" data-modelNum="${dto.wish_model_num}">
                              <span data-modelNum="${dto.wish_model_num}">구매</span>
                           </div>
                           <div class="buy_price jcce" data-modelNum="${dto.wish_model_num}">
                              <span data-modelNum="${dto.wish_model_num}"><fmt:formatNumber value="${dto.wish_price }" pattern="###,###"/></span>
                              <span data-modelNum="${dto.wish_model_num}">즉시 구매가</span>
                           </div>
                        </div>
                        <div class="deleteBtn jcfe" data-idx="${dto.wish_idx }">삭제</div>
                     </div>
                  </li>
               </c:forEach>
            </ul>
         </div>
         	<c:if test="${fn:length(wishlist) >= 1 }">
				<c:set var="pageCount" value="${count}" />
				<c:set var="result" value="${pageCount % 10 == 0 ? pageCount / 10 : pageCount / 10 + 1}"/>
				<fmt:parseNumber var="section" value="${(param.page + 1) / 5 }" integerOnly="true" />
				<c:set var="begin" value="${section != 0 ? section * 5 : section * 5 + 1 }" />
				<fmt:parseNumber var="end" value="${pageCount/10 < begin + 4 ? pageCount/10 + 1 : begin + 5 }" integerOnly="true"/>
				<c:set var="prev" value="${section != 0 }" />
				<fmt:parseNumber var="result_5" value="${result / 5 }" integerOnly="true"/>
				<fmt:parseNumber var="end_5" value="${end / 5 }" integerOnly="true"/>
				<c:set var="next" value="${result_5 != end_5 && fn:length(wishlist) == 10}" />
				<fmt:parseNumber var="pr" value="${pageCount/10 < begin + 4 ? pageCount/10 - 1 : begin + 3 }" integerOnly="true"/>
				<div class="paging jcce">
					<c:if test="${prev }">
						<a class="paging_pn jcce" href="${cpath }/myPage/wishList?page=${pr}">이전</a>
					</c:if>
					<c:forEach var="i" begin="${begin }" end="${end }">
						<a class="paging_i" data-page="${i }"
						   href="${cpath }/myPage/wishList?page=${i - 1}">${i }</a>
					</c:forEach>
					<c:if test="${next }">
						<a class="paging_pn jcce" href="${cpath }/myPage/wishList?page=${end}">다음</a>
					</c:if>
				</div>
			</c:if>
      </div>
   </div>
</section>

<script>
	console.log(${pageCount})
	console.log(${begin})
	console.log(${end / 5})
	console.log(${end1})
	console.log(${result / 5})
	console.log(${next})
	const nowPage = ${page}
	const paging_i = document.querySelectorAll('.paging_i')
	pageCheck()
   const nowurl = window.location.pathname
   nowpage(nowurl)
   const wishmsg = '${msg}'
   getmsg(wishmsg)
   const buyBtn = document.querySelectorAll('.wishList_right>.wishList_box>ul>li>.button_box>.button_btn')
   const deleteBtn = document.querySelectorAll('.wishList_right>.wishList_box>ul>li>.button_box>.deleteBtn')
   deleteBtn.forEach(btn => {
      btn.addEventListener('click', onDelete)
   })
   buyBtn.forEach(btn => {
      btn.addEventListener('click', onBuy)
   })
</script>
<%@ include file="../footer.jsp"%>
