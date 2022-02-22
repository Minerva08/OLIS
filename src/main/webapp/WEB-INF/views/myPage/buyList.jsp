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
			<div class="buyList_r_div1"><h2>구매내역</h2></div>
			
			<div class="buyList_r_div2">
				<ul class="jcsa aice">
					<li class="event_li" data-n="0">
						<span id="buy_cnt1" data-n="0">0</span>
						<span data-n="0">구매확정</span>
					</li>
					<li class="event_li" data-n="1">
						<span id="buy_cnt2" data-n="1">0</span>
						<span data-n="1">결제내역</span>
					</li>
					<li class="event_li" data-n="2">
						<span id="buy_cnt3" data-n="2">0</span>
						<span data-n="2">구매내역</span>
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
							<input type="text" placeholder="주문번호 검색" id="input_search" onkeyup="buysearch_number()">
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
					
						<ul class="buylist_box_ul">

						</ul>
						<div class="jcce">
							<input class="more_btninput" type="button" value="더 보기" name="more_view">
						</div>
					</div>
				</div>
				
			</div>
			
		</div>
	</div>
</section>

<script type="text/javascript">
	// 선택자
	const randertarget = document.querySelector('.buylist_box_ul') // 랜더 타겟
	const more_view = document.querySelector('input[name="more_view"]') // 더보기
	const sort_span_img = document.getElementById('sort_span_img') // 정렬 이미지1
	const sort_price_img = document.getElementById('sort_price_img') // 정렬 이미지2
	const border_bottom = document.querySelectorAll('.event_li') // 이벤트 li
	const sale_sortTrade_span = document.getElementById('sale_sort_span') // 정렬 버튼1
	const sale_sort_price = document.getElementById('sale_sort_price') // 정렬 가격
	const input_date1 = document.querySelector('input[name="input_date1"]') // 날짜1
	const input_date2 = document.querySelector('input[name="input_date2"]') // 날짜2
	const date_span = document.getElementById('date_span') // 날짜 조회
	const input_search = document.getElementById('input_search') // 검색 인풋
	const reset_search = document.getElementById('reset_search')
	
	
	// 변수
	const orlist = ${orjson}
	console.log(orlist)
	const relist = ${rejson}
	console.log(relist)
	const orarr = getArrjson(orlist)
	const rearr = getArrjson(relist)
	const nowurl = window.location.pathname
	
	let updown = 'up'
	let updownprice = 'up'	
	let orfilter = []
	let refilter = []
	let salepage = 0
	let data_ch = 0
	
	// 이벤트 주기	
	border_bottom.forEach(e => { // 클릭 이벤트
			e.addEventListener('click', clickHandler)
			if (e.dataset.n == 0) e.addEventListener('click', buyCheck)
			if (e.dataset.n == 1) e.addEventListener('click', buyReceipt)
			if (e.dataset.n == 2) e.addEventListener('click', buyAll)
		})
	more_view.addEventListener('click', getfetchbuy) // 더보기 이벤트
	sale_sortTrade_span.onclick = buysort // 정렬1
	sale_sort_price.onclick = buysortPrice // 정렬2
	date_span.onclick = buydateSort // 조회 이벤트
	reset_search.addEventListener('click', resetsearch) // 초기화
		
	// 페이지 요청시 발동
	nowpage(nowurl)
	border_bottom[0].click()
	document.getElementById('buy_cnt1').innerText = orarr.filter(v => v.order_check == 'N').length
	document.getElementById('buy_cnt2').innerText = rearr.length
	document.getElementById('buy_cnt3').innerText = orarr.length
</script>

<%@ include file="../footer.jsp"%>