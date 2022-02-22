<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage.css">
<script src="${cpath }/resources/js/mypage.js"></script>

<section class="point_section df">
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
		
		<div class="point_right">
				<h3>포인트</h3>
			<div class="user_point">
				<p>사용 가능한 포인트</p>
				<p>${login.point}P</p>
			</div>
			<p>포인트 적립 방법은 구매내역 에서 구매확정시 발생하며 상품 금액에 1% 적립됩니다</p>
		</div>

</section>

<script type="text/javascript">
	const nowurl = window.location.pathname
	nowpage(nowurl)
</script>

<%@ include file="../footer.jsp"%>