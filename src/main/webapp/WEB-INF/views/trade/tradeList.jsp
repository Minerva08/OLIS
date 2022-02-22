<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script src="${cpath }/resources/js/trade.js"></script>
<section class="trade">
	<div class="trade_header jcce ffcl">
		<form class="jcce ffro" action="${cpath }/trade/tradeList">
			<input type="search" name="trade_search" placeholder="찾으실 물건을 검색하세요" value="${param.trade_search }">
			<input type="submit" value="검색">
		</form>
		<div class="trade_sort">
			<ul class="df">
				<li class="trade_idx"><a href="${cpath }/trade/tradeList?order=trade_idx">최신 순</a></li>
				<li class="trade_like_count"><a href="${cpath }/trade/tradeList?order=trade_like_count">인기 순</a></li>
				<li class="category_down">카테고리
					<ul class="df">
						<li class="의류"><a href="${cpath }/trade/tradeList?category=의류">의류</a></li>
						<li class="가방"><a href="${cpath }/trade/tradeList?category=가방">가방</a></li>
						<li class="신발"><a href="${cpath }/trade/tradeList?category=신발">신발</a></li>
						<li class="액세서리"><a href="${cpath }/trade/tradeList?category=액세서리">액세서리</a></li>
						<li class="지갑"><a href="${cpath }/trade/tradeList?category=지갑">지갑</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<div class="trade_main">
		<div class="list_box fw">
			<c:forEach var="dto" items="${list }">
				<div class="item" data-idx="${dto.trade_idx}" data-sold="${dto.trade_sold }">
					<div class="item_img"><img src="${dto.trade_img1}"> </div>
					<div class="user aice">
						<div class="user_profile"><img src="${dto.trade_user_profile}" width="28px"></div>
						<div class="user_name">${dto.trade_writer} </div>
					</div>
					<div class="item_title">${dto.trade_title} </div>
					<div class="item_like_count">
						<span class="like">🤍</span>
						<span>${dto.trade_like_count}</span>
					</div>
					<span>상품가격 : <fmt:formatNumber value="${dto.trade_price}" pattern="###,###"></fmt:formatNumber>원</span>
					
				</div>
			</c:forEach>
			<c:if test="${empty list }">
				<div class="emptyList" style="font-size: 30px; color: grey;margin: 30px auto;">
					검색한 내용의 게시글이 없습니다
				</div>
			</c:if>
		</div>
		<fmt:parseNumber var="section" value="${(param.page - 1) / 5 }" integerOnly="true" />
		<c:set var="begin" value="${section * 5 + 1 }" />
		<c:set var="end" value="${count < begin + 4  ? count : begin + 4 }" />
		<c:set var="prev" value="${section != 0 }" />
		<c:set var="next" value="${count / 5 != end / 5 }" />
		<div class="page jcce">
			<ul class="df">
				<c:if test="${prev == true}">
					<li><a href="${cpath }/trade/tradeList?order=${param.order}&trade_search=${param.trade_search}&page=${begin - 1}">◀</a></li>
				</c:if>
				<c:if test="${prev == false}">
					<li><a>◀</a></li>
				</c:if>
				<c:if test="${count == 0}">
					<li>
						<a href="${cpath }/trade/tradeList?order=${param.order}&trade_search=${param.trade_search}&page=1">1</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${begin }" end="${end }">
					<li>
						<a href="${cpath }/trade/tradeList?order=${param.order}&trade_search=${param.trade_search}&page=${i}">${i }</a>
					</li>
				</c:forEach>
				<c:if test="${next == true}">
					<li><a href="${cpath }/trade/tradeList?order=${param.order}&trade_search=${param.trade_search}&page=${end + 1}">▶</a></li>
				</c:if>
				<c:if test="${next == false}">
					<li><a>▶</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</section>

<!-- insert modal -->

<section class="trade_insert insertMoadal hiddenNone">
	<div class="insert_component">
		<form id="form" method="POST" action="${cpath }/trade/trade_insert" enctype="multipart/form-data">
			<div class="img_box jcsb">
				<div class="imgs jcce aice ffcl">
					<label class="jcce aice">
						<input class="hiddenNone" type="file" name="upload" required>
						<span>사진 선택</span>
					</label>
				</div>
				<div class="imgs jcce aice ffcl">
					<label class="jcce aice">
						<input class="hiddenNone" type="file" name="upload2">
						<span>사진</span>
					</label>
				</div>
				<div class="imgs jcce aice ffcl">
					<label class="jcce aice">
						<input class="hiddenNone" type="file" name="upload3">
						<span>사진</span>
					</label>
				</div>
			</div>
			
			<div class="write_box">
				<div class="title ffcl">
					<span class="thema">제목</span>
					<input type="text" name="trade_title" placeholder="제목을 입력해주세요">
				</div>
				<div class="category ffcl">
					<span class="thema">카테고리</span>
					<select name="trade_category">
						<option value="의류">의류</option>
						<option value="가방">가방</option>
						<option value="신발">신발</option>
						<option value="액세서리">액세서리</option>
						<option value="지갑">지갑</option>
					</select>
				</div>
				<div class="content ffcl">
					<span class="thema">게시글 내용</span>
					<textarea name="trade_content" placeholder="내용을 작성해주세요"></textarea>
				</div>
				<div class="price jcfe">
					<input type="text" name="trade_price1" onkeyup="inputNumberFormat(this)">
					<input type="hidden" name="trade_price">
					<span class="aice">원</span>
				</div>
			</div>
			<input class="insertBtn" type="submit" value="등록하기">
		</form>
	</div>
</section>
<div class="writeBtn aice jcce">등록</div>
<div class="trade_overlay"></div>

<script>
	const form = document.querySelector('#form')
	const modal = document.querySelector('.trade_insert')
	const trade_overlay = document.querySelector('.trade_overlay')
	const insertBtn = document.querySelector('.writeBtn')
	const sortBtn = document.querySelectorAll('.trade > .trade_header > .trade_sort > ul >li')
	const imgs = document.querySelectorAll('.trade_insert > .insert_component > form > .img_box input[type="file"]')
	const like = document.querySelectorAll('.trade > .trade_main > .list_box > .item > .item_like_count > .like')
	const detail_idx = document.querySelectorAll('.trade > .trade_main > .list_box > .item')
	const pageList = document.querySelectorAll('.trade > .trade_main >.page>ul>li>a')
	const category_down = document.querySelector('.category_down')
	const categorys = document.querySelectorAll('.trade > .trade_header > .trade_sort > ul > .category_down > ul > li')
	
	const orderParam = '${param.order}'
	const pageParam = '${param.page}'
	const categoryParam = '${param.category}'
	
	if(orderParam != null) {
		sortBtn.forEach(btn => {
			if(btn.className == orderParam) {
			   btn.style.backgroundColor = '#FEF7F6'
			   btn.style.color = '#F15746'
			   btn.style.fontWeight = 'bold'
			}
		})
	}
	
	if(categoryParam != null) {
		categorys.forEach(btn => {
			btn.style.backgroundColor = '#F4F4F4'
		   btn.style.color = 'black'
		   btn.style.fontWeight = 'normal'
			if(btn.className == categoryParam) {
				
			   btn.style.backgroundColor = '#FEF7F6'
			   btn.style.color = '#F15746'
			   btn.style.fontWeight = 'bold'
			   btn.parentNode.parentNode.style.backgroundColor = '#FEF7F6'
			   btn.parentNode.parentNode.style.color = '#F15746'
			   btn.parentNode.parentNode.style.fontWeight = 'bold'
			}
		})
	}
	
	if(pageParam != '') {
		pageList.forEach(li => {
			if(pageParam == li.innerText) {
				li.style.fontWeight = 'bold'
				li.style.color = 'blue'
			}
		})
	}
	
	else {
		pageList.forEach(li => {
			if('1' == li.innerText) {
				li.style.fontWeight = 'bold'
				li.style.color = 'blue'
			}
		})
	}
	
	detail_idx.forEach(div => {
		if(div.dataset.sold == 'sold') {
			div.style.opacity = '0.5'
			div.innerHTML += '<div class="soldOut">SOLD OUT</div>'
		}
		if(div.dataset != null) {
			div.addEventListener('click', locateDetail)
		}
	})
	
	like.forEach(btn => {
		btn.addEventListener('click', likeCheck)
	})
	imgs.forEach(img => {
		img.addEventListener('change', imgUpload)
	})
	form.onsubmit = function() {
		const price = document.querySelector('input[name="trade_price"]')
		const newPrice = price.value.replace(/,/gi, '')
		price.value = +newPrice
	}
	category_down.addEventListener('click', categoryOnDown)
	insertBtn.onclick = onInsert
	trade_overlay.onclick = closeInsert
</script>
<%@ include file="../footer.jsp"%>
