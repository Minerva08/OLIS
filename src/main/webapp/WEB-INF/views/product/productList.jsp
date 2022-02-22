<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script src="${cpath }/resources/js/product.js"></script>

<div class="product_header">
	<c:if test="${empty search and empty category }">
		<div class="shop_logo jcce"><h2>SHOP</h2></div>
	</c:if>
	<c:if test="${not empty search }">
		<form action="${cpath }/product/productList">
			<div class="shop_search jcce">
				<input type="search" name="search" value="${search }">
			</div>
		</form>
	</c:if>
	<c:if test="${not empty category }">
		<form action="${cpath }/product/productList">
			<div class="shop_search jcce">
				<input type="search" name="search" value="${categoryValue}">
			</div>
		</form>
	</c:if>
	<div class="product_sort">
		<ul class="df">
			<li>⇶</li>
			<li><a><button class="sortBtn" value="product_wish_count/desc">상품 인기 순</button></a></li>
			<li><a><button class="sortBtn" value="product_upload/desc">상품 최신 순</button></a></li>&nbsp&nbsp
			<li><a><button class="sortBtn" value="product_price/desc">높은 가격 순</button></a></li>
			<li><a><button class="sortBtn" value="product_price/asc">낮은 가격 순</button></a></li>
		</ul>
	</div> 
</div> 

<main class="product">
	<div class="product_main df">
		<div class="left_category">
			<div class="filter_title">필터</div>
			<div id="category" class="category_box">
				<div class="title">
					<span class="main_title">카테고리</span>
					<span class="sub_title">모든 카테고리</span>
					<div class="product_category hiddenNone">
						<ul class="main_category">
							<li>
								<label><input type="checkbox" value="big_category=의류"><span>의류</span></label>
								<ul class="sub_category hiddenNone">
									<li><label><input type="checkbox" value="category=아우터"><span>아우터</span></label></li>
									<li><label><input type="checkbox" value="category=상의"><span>상의</span></label></li>
									<li><label><input type="checkbox" value="category=바지"><span>바지</span></label></li>
									<li><label><input type="checkbox" value="category=모자"><span>모자</span></label></li>
								</ul>
							</li>
							<li><label><input type="checkbox" value="category=가방"><span>가방</span></label></li>
							<li><label><input type="checkbox" value="category=신발"><span>신발</span></label></li>
							<li>
								<label><input type="checkbox" value="big_category=액세서리"><span>액세서리</span></label>
								<ul class="sub_category hiddenNone">
									<li><label><input type="checkbox" value="category=목걸이"><span>목걸이</span></label></li>
									<li><label><input type="checkbox" value="category=반지"><span>반지</span></label></li>
									<li><label><input type="checkbox" value="category=시계"><span>시계</span></label></li>
									<li><label><input type="checkbox" value="category=귀걸이"><span>귀걸이</span></label></li>
								</ul>
							</li>
							<li><label><input type="checkbox" value="category=지갑"><span>지갑</span></label></li>
						</ul>
					</div>
				</div>
				<div class="plus">
					<span>+</span>
				</div>
			</div>
			<div id="brand" class="category_box">
				<div class="title">
					<span class="main_title">브랜드</span>
					<span class="sub_title">모든 브랜드</span>
					<div class="product_category hiddenNone">
						<ul class="main_category over">
							<c:forEach var="proOb" items="${brandList }">
								<li>
									<label>
										<input type="checkbox" value="brand=${proOb.product_brand}">
										<span>${proOb.product_brand }</span>
									</label>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="plus">
					<span>+</span>
				</div>
			</div>
			<div id="gender" class="category_box">
				<div class="title">
					<span class="main_title">성별</span>
					<span class="sub_title">모든 성별</span>
					<div class="product_category hiddenNone">
						<ul class="main_category">
							<li><label><input type="checkbox" value="gender=남성"><span>남성</span></label></li>
							<li><label><input type="checkbox" value="gender=여성"><span>여성</span></label></li>
							<li><label><input type="checkbox" value="gender=공용"><span>공용</span></label></li>
						</ul>
					</div>
				</div>
				<div class="plus">
					<span>+</span>
				</div>
			</div>
			<div id="price" class="category_box"> 
				<div class="title">
					<span class="main_title">가격</span>
					<span class="sub_title">모든 가격</span>
					<div class="product_category hiddenNone">
						<ul class="main_category">
							<li><label><input type="checkbox" name="price" value="0=10"><span>10만원 이하</span></label></li>
							<li><label><input type="checkbox" name="price" value="10=30"><span>10만원 - 30만원 이하</span></label></li>
							<li><label><input type="checkbox" name="price" value="30=50"><span>30만원 - 50만원 이하</span></label></li>
							<li><label><input type="checkbox" name="price" value="50=99999"><span>50만원 이상</span></label></li>
						</ul>
					</div>
				</div>
				<div class="plus"> 
					<span>+</span>
				</div>
			</div>
		</div>
		<div class="right_productList fw">
			<div class="add_category">
				<ul class="df">
				</ul>
			</div>
			<div class="list df fw"></div>
			<div class="page jcce"></div>
		</div>  
	</div>
</main>
<script>

// 	========================productList==========================
	const sortList = document.querySelectorAll('.product_header > .product_sort > ul > li button')
	const checkBoxList = document.querySelectorAll('input[type="checkbox"]')
	const search = '${search}' 
	const paramCategory = '${category}'
	const product_header = document.querySelector('.product_header')
	const product = document.querySelector('.product')
	if(search != null) {
		product_header.style.height = '129px'
		product.style.marginTop = '270px'
	}
	else {
		product_header.style.height = '112px'
		product.style.marginTop = '252px'
	}
	if(paramCategory != null){
		product_header.style.height = '129px'
		product.style.marginTop = '270px'
	}
	else {
		product_header.style.height = '112px'
		product.style.marginTop = '252px'
	}
	const item_box = document.querySelector('.product > .product_main > .right_productList > .list') 
	const categoryBox = document.querySelectorAll('.product > .product_main > .left_category  .category_box')
	const titleBox = document.querySelectorAll('.product > .product_main > .left_category > .category_box > .title')
	const main_ul_list = document.querySelectorAll('.product > .product_main > .left_category > .category_box > .title > .product_category > ul > li')
	const sub_ul_list = document.querySelectorAll('.product > .product_main > .left_category > .category_box > .title > .product_category > ul > li > ul > li')
	const main_category = document.querySelectorAll('.product > .product_main > .left_category > .category_box > .title > .product_category > .main_category > li')
	const sub_category =  document.querySelectorAll('.product > .product_main > .left_category > .category_box > .title > .product_category > .main_category > li > ul')
	const sortBtn = document.querySelectorAll('.sortBtn')
	const listAll = document.querySelectorAll('.product > .product_main > .left_category > .category_box > .title > .product_category li')
	const add_box = document.querySelector('.product > .product_main > .right_productList > .add_category > ul')
	const add_category = document.querySelectorAll('.product > .product_main > .right_productList > .add_category > ul > li')
	const pageTarget = document.querySelector('.product>.product_main>.right_productList>.page')
	const checkBoxInput = document.querySelectorAll('.product>.product_main>.left_category>.category_box>.title>.product_category>ul>li input')
	let page = 0
	let pageStart = 1 
	let pageEnd
	let prev
	let next
	let categoryArr = []
	// ajax로 받아온 json 저장
	let json = ''
	
	if(search != '') {
		json = searchJson(search)
	}
	else {
		json = getJson()
	}
	
	// 리스트 띄어주는 함수(대상, 객체배열)	
	let filterKey = []
	if(paramCategory != '') {
	      filterKey.unshift(paramCategory)
	      categoryArr.push('${categoryValue}')
	      add_box.innerHTML = ''
	      categoryArr.forEach(item => {
	         add_box.innerHTML += '<li class="df"><div>' + item + '</div><span>⨉</span></li>'
	      })   
	      checkBoxList.forEach(box =>{
	         if(box.value == paramCategory) {
	            box.checked = true
	            let target = box
	            while(target.classList.contains('product_category') == false){
	               target = target.parentNode
	            }
	            target.classList.remove('hiddenNone')
	            target.previousElementSibling.classList.add('hiddenNone')
	         }
	      })
	      render(item_box, filtering(filterKey, json))
	   }
	render(item_box, json)
	let filterArr =json
	// 정렬하는 함수
	sortBtn.forEach(btn => {
		btn.addEventListener('click',clickSortBtn)
	})
	
	// 카테고리 열리는 함수
	categoryBox.forEach(box => {
		box.onclick = onCategory
	})
	// 카테고리 카테고리 클릭시 필터
	listAll.forEach(li => {
		li.addEventListener('click', clackMainLi)
	})
	checkBoxInput.forEach(box => {
		box.addEventListener('click', clackMainLi)
	})
	
</script>
 
<%@ include file="../footer.jsp"%>