<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage.css">
<script src="${cpath }/resources/js/mypage.js"></script>

<section class="buyList_section">
	<div class="buyList_component df">
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
		
		<div class="buyList_right">
			<div class="buyList_r_div1"><h2>판매내역</h2></div>
			
			<div class="buyList_r_div2">
				<ul class="jcsa aice">
					<li class="event_li" data-n="0">
						<span id="sale_cnt1" data-n="0">0</span>
						<span data-n="0">판매중</span>
					</li>
					<li class="event_li" data-n="1">
						<span id="sale_cnt2" data-n="1">0</span>
						<span data-n="1">판매종료</span>
					</li>
					<li class="event_li" data-n="2">
						<span id="sale_cnt3" data-n="2">0</span>
						<span data-n="2">판매내역</span>
					</li>
				</ul>
				
				<div class="r_div2_div1 jcce">
					<div class="aice">
						<div><input type="date" name="input_date1"></div>
						<span>~</span>
						<div><input type="date" name="input_date2"></div>
						<div><span id="date_span">조회</span></div>
					</div>
				</div>
				
				<div class="r_div2_div2">
					
					<div class="r_div2_div2_nav aice jcsb">
					<div class="aice">
						<input type="text" placeholder="카테고리 검색" id="input_search" onkeyup="salesearch_number()">
						<input type="button" value="초기화" id="reset_search">
					</div>
						<div class="df">
							<div class="aice jcfe">
								<span data-sort="up" id="sale_sort_span">최신순</span>
								<img id="sort_span_img" src="${cpath }/resources/img/data.svg" width="15">
							</div>
							<div class="aice jcfe">
								<span data-price="up" id="sale_sort_price">가격순</span>
								<img id="sort_price_img" src="${cpath }/resources/img/data.svg" width="15">
							</div>
						</div>
					</div>
					
					<div class="r_div2_div2_content">
					
						<ul class="salelist_box_ul">
	
								
							
						</ul>
						<div class="jcce">
							<input class="more_btninput" type="button" value="더 보기" name="more_view">
						</div>
					</div>
				</div>
				
			</div>
			
		</div>
	</div>
	
	<section class="myPage_modify modifyMoadal hiddenNone">
		<div class="modify_component">
			<form id="form" method="POST" action="${cpath }/TradeSaleUpdate" enctype="multipart/form-data">
			</form>
		</div>
	</section>
	
	<div class="modify_overlay hiddenNone"></div>
	
</section>

<script type="text/javascript" charset="utf-8">
	// 이미지 삭제 카운트
	// 선택자 잡기
	const more_view = document.querySelector('input[name="more_view"]') // 더보기 버튼
	const sort_span_img = document.getElementById('sort_span_img') // 정렬이미지1
	const sort_price_img = document.getElementById('sort_price_img') // 정렬이미지2
	const randertarget = document.querySelector('.salelist_box_ul') // 랜더 타겟
	const border_bottom = document.querySelectorAll('.event_li') // 돔 li
	const sale_sortTrade_span = document.getElementById('sale_sort_span') // 최신순 정렬
	const sale_sort_price = document.getElementById('sale_sort_price') // 가격순 정렬
	const input_date1 = document.querySelector('input[name="input_date1"]') // 달력1
	const input_date2 = document.querySelector('input[name="input_date2"]') // 달력2
	const date_span = document.getElementById('date_span') // 날짜 조회 버튼
	const input_search = document.getElementById('input_search') // 검색 인풋
	const reset_search = document.getElementById('reset_search') // 초기화 인풋
	const myPage_modify = document.querySelector('.myPage_modify')
	const modify_overlay = document.querySelector('.modify_overlay')
	const hidden_trade_idx = document.getElementById('hidden_trade_idx')
	
	const form = document.querySelector('#form')
	
	// 변수
	const saleAlldto = ${salejson } // 컨트롤러가주는 데이터
	const salearr = getArrjson(saleAlldto) // json parse
	const nowurl = window.location.pathname // 현제 페이지
	let salefilter = [] // salearr 필터용 배열
	let salepage = 0 // 더보기 페이지 값 
	let data_ch = 0 // 클릭 이벤트 체크 값
	let updown = 'up'
	let updownprice = 'up'
	
	// 이벤트 주기
	border_bottom.forEach(e => { // 클릭 이벤트
			e.addEventListener('click', clickHandler)
			if (e.dataset.n == 0) e.addEventListener('click', saleIng)
			if (e.dataset.n == 1) e.addEventListener('click', saleAnd)
			if (e.dataset.n == 2) e.addEventListener('click', saleAll)
		})
	more_view.addEventListener('click', saleFetch) // 더보기 이벤트 주기
	sale_sortTrade_span.onclick = salesortTrade // 정렬 이벤트
	sale_sort_price.onclick = salesortPrice //정렬 이벤트
	date_span.onclick = dateSort // 조회 이벤트
	reset_search.addEventListener('click', resetsearch) // 초기화 이벤트
	modify_overlay.onclick = closeInsert
	
	
	// 페이지 로딩시 발동
	nowpage(nowurl)
	border_bottom[0].click()
	document.getElementById('sale_cnt1').innerText = salearr.filter(v => v.trade_sold == 'x').length
	document.getElementById('sale_cnt2').innerText = salearr.filter(v => v.trade_sold == 'sold').length
	document.getElementById('sale_cnt3').innerText = salearr.length
</script>

<%@ include file="../footer.jsp"%>