<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script src="${cpath }/resources/js/home.js"></script>


	<section class="home">	<!-- main, header, footer 태그에는 css 넣어주지 말기 -->
		<div class="home_component">	<!-- 클래스명 앞의 home은 다른 페이지는  login_component 이런 식으로 넣어주기  -->
			<div class="event_animation">
				<button class="event_leftBtn" id="prevBtn" value="-1"></button>
				<button class="event_rightBtn" id="nextBtn" value="1"></button>
				<!-- 라디오  슬라이드-->
				<div class="home_radio jcce">
					<input type="radio" name="radio" value="1" checked="checked" id="home_slide1">
					<input type="radio" name="radio" value="2" id="home_slide2">
					<input type="radio" name="radio" value="3" id="home_slide3">
					<input type="radio" name="radio" value="4" id="home_slide4">
					<input type="radio" name="radio" value="5" id="home_slide5"> 
				</div>
				<ul class="event_ul df">
					<li id="1"><img src="https://kream-phinf.pstatic.net/MjAyMjAxMThfMTQz/MDAxNjQyNDk2NjE5Nzgw.6kYdwSHKdLaO8ol6RDjh6fnOVzXOGRtWecbJraP3eBsg.rg1OlezQaMXWMcPlsB2u1WzzoN1F4m4C29uv5Uovst0g.PNG/a_b83763b6c2c34f409dc6c16493c13174.png?type=m_2560" width="100%"></li>
					<li id="2" class="hidden"><img src="https://kream-phinf.pstatic.net/MjAyMjAxMjBfMzIg/MDAxNjQyNjc1MzU0MDk5.uD7UAj_LBd8gtNrSgIT0tq6t0EnKPCmsf7NRSdwXdwsg.ldNON-DwpuG0HUyDdc4LVUtDIAmbbl9UvFVsad0EVyMg.PNG/a_38b058c0b5e74e8cb58e809f68457300.png?type=m_2560" width="100%"></li>
					<li id="3" class="hidden"><img src="https://kream-phinf.pstatic.net/MjAyMjAxMjFfNDgg/MDAxNjQyNzYwNTAyMzE0.8CBPKGv2MT5sxFykVFGbAUlRFIZUqy6mRT78FOYkcT4g.due6eDpDtJuZnl60DPcVjfIKibjJDp3mUVkw4xg6RMAg.PNG/a_95f7ef35f3e14b81a86c33f7a353baa0.png?type=m_2560" width="100%"></li>
					<li id="4" class="hidden"><img src="https://kream-phinf.pstatic.net/MjAyMjAxMTRfMTEy/MDAxNjQyMTQ4MjczNjA0.jIQ-euMuZCVb4MYBQ6Gc82qspujKnQweMcnDKoP66G8g.sEwCxUv3LQioMpIqI8aLtzQorLa1hNMq6qK4sZIRB4kg.JPEG/a_0c4e012651784218a6b4797be5342901.jpg?type=m_2560" width="100%"></li>
					<li id="5" class="hidden"><img src="https://kream-phinf.pstatic.net/MjAyMjAxMjFfMjc5/MDAxNjQyNzU0MzYzODU0.t1DPN6MZAWZiLjMloKFnCQAy4EhiyuddR3XZWBAKcfgg.N93Z6hRH2mliekIISqPLEnBWG-THh_3yKm9h37VTRuIg.JPEG/a_6e69010b1ec147f6a6945ac80dd14a3d.jpg?type=m_2560" width="100%"></li>
				</ul>
				<div class="home_radio_bullets">
					<label for="home_slide1">&nbsp;</label>
					<label for="home_slide2">&nbsp;</label>
					<label for="home_slide3">&nbsp;</label>
					<label for="home_slide4">&nbsp;</label>
					<label for="home_slide5">&nbsp;</label>
				</div>
			</div>
			
			<div id="product1" class="home_product">
				<div class="product_title">
					<div class="title">New In</div>
					<div class="sub_title">신규 등록 상품</div>
				</div>		
				<div class="product_list_wrap">
					<div class="product_itemList df"></div>
				</div>
			</div>
			<div id="product1_add" class="product_add jcce aice">더보기</div>
			<div class="home_event1">
				<img src="https://kream-phinf.pstatic.net/MjAyMjAxMjFfMTAy/MDAxNjQyNzU0MzE2ODI1.mRW6Re-PExQYl1yFgR9_hbsnbym8gHhbRgbg6AgeMmAg.3Jp414T2Kn_fJkApeRW5sDtzMZTICiCq92r18VCPFiMg.JPEG/a_9a4ab639bb6848c18b901795403d7568.jpg?type=m_2560" width="100%">
			</div>
	<!-- 		===================================================== -->
			<div id="product2" class="home_product">
				<div class="product_title">
					<div class="title">Hot In</div>
					<div class="sub_title">인기 상품</div>
				</div>		
				<div class="product_list_wrap">
					<div class="product_itemList df"></div>
				</div>
			</div>
			<div id="product2_add" class="product_add jcce aice">더보기</div>
			<div class="home_event1">
				<img src="https://kream-phinf.pstatic.net/MjAyMjAxMTRfMTEy/MDAxNjQyMTQ4MjczNjA0.jIQ-euMuZCVb4MYBQ6Gc82qspujKnQweMcnDKoP66G8g.sEwCxUv3LQioMpIqI8aLtzQorLa1hNMq6qK4sZIRB4kg.JPEG/a_0c4e012651784218a6b4797be5342901.jpg?type=m_2560" width="100%">
			</div>
	<!-- 		========================================================== -->
			<div id="product3" class="home_product">
			<div class="product_title">
				<div class="title">Ep In</div>
				<div class="sub_title">가격 높은 상품</div>
			</div>		
			<div class="product_list_wrap">
				<div class="product_itemList df"></div>
			</div>
			</div>
			<div id="product3_add" class="product_add jcce aice">더보기</div>
			<div class="home_event1">
				<img src="https://kream-phinf.pstatic.net/MjAyMjAxMjRfMTA5/MDAxNjQzMDE3MDM3MTUx.7WuV7cc0OdyV9CRmsM4ZA8e1cEIah2Igj-qiwDSAGwMg.DrBDw1BtjLqZe0FMWjO7XCiX_KycIGf_aOBmbXRz6ugg.JPEG/a_8cc13b5a8004402ba64b9a5451b771ff.jpg?type=m_2560" width="100%">
			</div> 
		</div>
	</section>  





<script>
	ajaxItemList1()
	ajaxItemList2()
	ajaxItemList3()

	const addBtn1 = document.querySelector('.home > .home_component > #product1_add')
	const addBtn2 = document.querySelector('.home > .home_component > #product2_add')
	const addBtn3 = document.querySelector('.home > .home_component > #product3_add')
	const prevBtn = document.getElementById('prevBtn')
	const nextBtn = document.getElementById('nextBtn')
	const eventUl = document.querySelector('.event_ul') 
	const liList = document.querySelectorAll('.home > .home_component > .event_animation > ul > li')
	const radioList = document.querySelectorAll('.home > .home_component >.event_animation> .home_radio input')
	const wrap1 = document.querySelector('.home > .home_component > #product1')
	const wrap2 = document.querySelector('.home > .home_component > #product2')
	const wrap3 = document.querySelector('.home > .home_component > #product3')
	
	let addHeight2 = 520
	let addHeight3 = 520
	 
	let btnValue = 1
	prevBtn.onclick = onPrev
	nextBtn.onclick = onNext
	setInterval(onNext,5000)
	addBtn1.onclick = addList
	addBtn2.onclick = addList
	addBtn3.onclick = addList
	
	radioList.forEach(radio => {
		radio.onclick = radioClick
	})
	
</script>
	
<%@ include file="footer.jsp" %>
