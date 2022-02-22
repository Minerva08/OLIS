<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage.css">
<script src="${cpath }/resources/js/mypage.js"></script>

<section class="account_section df">
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
		
		<div class="account_right">
			<div class="shopping_title">
				<strong>장바구니</strong>
			</div>
			
			<div>
				<ul>
					<c:forEach var="dto" items="${list }">
						<li class="shopping_forEach_li jcsb">
							<div class="aice">
								<div class="shopping_li_div1">
									<img src="${dto.shopping_img }" width="80">
								</div>
								<div class="shopping_li_div2 ffcl">
									<span id="shopping_li_brand">${dto.shopping_brand }</span>
									<span id="shopping_li_modelname">${dto.shopping_model_name }</span>
									<span id="shopping_li_size">${dto.shopping_size }</span>
								</div>
							</div>
							<div class="shopping_li_div3 ffcl">
								<div class="shopping_btn df" data-modelnum="${dto.shopping_model_num }" data-idx="${dto.shopping_idx }">
									<strong data-modelnum="${dto.shopping_model_num }" data-idx="${dto.shopping_idx }">구매</strong>
									<div class="ffcl" data-modelnum="${dto.shopping_model_num }" data-idx="${dto.shopping_idx }">
										<span data-modelnum="${dto.shopping_model_num }" data-idx="${dto.shopping_idx }"><fmt:formatNumber value="${dto.shopping_price }" pattern="###,###"/></span>
										<span data-modelnum="${dto.shopping_model_num }" data-idx="${dto.shopping_idx }">즉시구매가</span>
									</div>
								</div>
								<span class="shopping_delete_btn" data-idx="${dto.shopping_idx }">삭제</span>
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
							<a class="paging_pn jcce" href="${cpath }/myPage/shopping?page=${pr}">이전</a>
						</c:if>
						<c:forEach var="i" begin="${begin }" end="${end }">
							<a class="paging_i" data-page="${i }"
							   href="${cpath }/myPage/shopping?page=${i - 1}">${i }</a>
						</c:forEach>
						<c:if test="${next }">
							<a class="paging_pn jcce" href="${cpath }/myPage/shopping?page=${end}">다음</a>
						</c:if>
					</div>
				</c:if>
		</div>
</section>

<script type="text/javascript">
	const nowPage = ${page}
	const paging_i = document.querySelectorAll('.paging_i')
	pageCheck()
	const nowurl = window.location.pathname
	console.log(nowurl)
	const shopping_btn = document.querySelectorAll('.shopping_btn')
	const shopping_delete_btn = document.querySelectorAll('.shopping_delete_btn')
	shopping_btn.forEach(ev => {
		ev.addEventListener('click', (event) => {
			console.log(+event.target.dataset.modelnum)
			location.href = cpath + '/product/product_detail?param=' + event.target.dataset.modelnum + '&idx=' + (+event.target.dataset.idx)
		})
	})
	
	shopping_delete_btn.forEach(ev => {
		ev.addEventListener('click', (event) => {
			location.href = cpath + '/shoppingKeepDelete?page='+ nowPage +'&idx=' + event.target.dataset.idx
		})
	})
	
	nowpage(nowurl)
</script>

<%@ include file="../footer.jsp"%>
