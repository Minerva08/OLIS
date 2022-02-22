<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage.css">
<script src="${cpath }/resources/js/mypage.js"></script>

<section class="myPage">
	<div class="myPage_component">
		<!-- info_ 로 시작할것. -->
		<div class="myPage_left">
			<h2>
				<a href="${cpath }/myPage/home_myPage">마이 페이지</a>
			</h2>
			<c:if test="${login.grade ne 'admin' }">
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
			</c:if>
			
			<c:if test="${login.grade eq 'admin' }">
				<div>
					<span>관리자</span>
					<ul>
						<li><a href="${cpath}/admin/insertProduct">상품추가</a></li>
						<li><a href="${cpath}/admin/insertNotice">공지사항 등록</a></li>
						<li><a href="${cpath}/admin/insertQnA">문의사항 등록</a></li>
						<li><a href="${cpath }/trade/trade?page=1">중고거래 게시글 관리</a></li>
						<li><a href="${cpath }/admin/join_admin">관리자 추가</a></li>
					</ul>
				</div>
			</c:if>
			
		</div>

		<div class="myPage_right">
			
				<div class="myPage_info aice jcsb">
					<div class="df">
						<img src="${login.user_profile_img }" width="100" height="100">
						<div class="ffcl">
							<strong>${login.user_nickname }</strong>
							<p>${login.user_email }</p>
							<a id="cpath_infoBtn" href="${cpath }/myPage/info"><button id="cpath_infoBtn">프로필 수정</button></a>
						</div>
					</div>
					<div class="ffcl aice jcce">
						<a class="myPage_memberClass" href="${cpath }/myPage/point"><strong>${login.point }p</strong></a>
						<span>포인트</span>
					</div>
				</div>
				
				<div class="buyA jcsb aice">
					<h3>구매 내역</h3>
					<a href="${cpath }/myPage/buyList">더보기</a>
				</div>
				
				<div class="buyInfo aice">
					<div class="ffcl aice">
						<span>구매확정</span>
						<span id="buy_cnt1"></span>						
					</div>
					<div class="ffcl aice">
						<span>결제내역</span>
						<span id="buy_cnt2"></span>	
					</div>
					<div class="ffcl aice">
						<span>구매내역</span>
						<span id="buy_cnt3"></span>
					</div>
				</div>
				
				<div class="saleA jcsb aice">
					<h3>판매 내역</h3>
					<a href="${cpath }/myPage/saleList">더보기</a>
				</div>
				
				<div class="saleInfo aice">
					<div class="ffcl aice">
						<span>판매중</span>
						<span id="sale_cnt1"></span>
					</div>
					<div class="ffcl aice">
						<span>판매종료</span>
						<span id="sale_cnt2"></span>
					</div>
					<div class="ffcl aice">
						<span>판매내역</span>
						<span id="sale_cnt3"></span>
					</div>
				</div>

		
		</div>
	</div>
</section>

<script>
	const orlist = ${orjson}
	const relist = ${rejson}
	const orarr = getArrjson(orlist)
	const rearr = getArrjson(relist)
	document.getElementById('buy_cnt1').innerText = orarr.filter(v => v.trade_sold == 'x').length
	document.getElementById('buy_cnt2').innerText = rearr.length
	document.getElementById('buy_cnt3').innerText = orarr.length
	
	const saleAlldto = ${salejson }
	const salearr = getArrjson(saleAlldto)
	document.getElementById('sale_cnt1').innerText = salearr.filter(v => v.trade_sold == 'x').length
	document.getElementById('sale_cnt2').innerText = salearr.filter(v => v.trade_sold == 'sold').length
	document.getElementById('sale_cnt3').innerText = salearr.length
</script>

<%@ include file="../footer.jsp"%>
