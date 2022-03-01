<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script src="${cpath }/resources/js/center.js"></script>
<section class="noticed df">

	<section class="center_left" >
		<ul>
			<li >
				<h1>고객센터</h1>
			</li>
			<li>
				<a href="${cpath }/center/home_notice?page=0">공지사항</a>
			</li>
			
			<li>
				<a id="center_left_filter" href="${cpath }/center/QnA?page=0">자주 묻는 질문</a>	
			</li>
		</ul>
	</section>
	
	<section class="qna_right">
		<div class="qna_top">
			<h3>자주 묻는 질문</h3>
		</div>
		<div id="filter_qna" class="df">
			<a href="${cpath}/center/QnA?page=0"><button id="all">전체</button></a>
			<button id="policy" value="이용정책">이용정책</button>
			<button id="same" value="공통">공통</button>
			<button id="buy" value="구매">구매</button>
			<button id="sell" value="판매">판매</button>
		
		</div>
		
		<div class="qna_list">
			
			<c:forEach var="dto" items="${list}">
				
					<div class="df idx" data-idx="${dto.qna_idx}">
						<p data-idx="${dto.qna_idx}" style="margin-right:30px; font-weight: bold;">${dto.qna_category}</p>
						<p data-idx="${dto.qna_idx}">${dto.qna_title }</p>
					</div>
					<pre class="qna_content hiddenNone">${dto.qna_content}</pre>
			</c:forEach>
		</div>
		
		<div id="qna_pageing" class="df qna_pageing">
			<c:if test="${pre}">
				<a href="${cpath}/center/공통?page=${begin-9}">◀</a>
			</c:if>
			<c:forEach var="i" begin="${begin}" end="${end}" >
				<a href="${cpath}/center/공통?page=${i}">${i}</a>
			</c:forEach>
			<c:if test="${next }">
				<a href="${cpath }/center/공통?page=${end+1}">▶</a>
			</c:if>
		</div>
		
		
	</section> 
	
	   
</section>
<script>
	const all = document.getElementById('all')
	const policy = document.getElementById('policy')
	const same = document.getElementById('same')
	const buy = document.getElementById('buy')
	const sell = document.getElementById('sell')
	const list = document.querySelector('.qna_list')
	const pageing = document.getElementById('qna_pageing')
	let size=0
	let btn_f = 0
	
	window.onload=go_same()
	window.addEventListener('load',filter_load())
	let nowurl = window.location.search
	console.log()
	filter_pageing(nowurl)
	const div = document.querySelectorAll('.idx')
	div.forEach(event=>{
			event.addEventListener('click',qna_showcontent)
	})
	
	
	
	 policy.onclick=policy_filter
	 same.onclick=same_filter
	 buy.onclick=buy_filter
	 sell.onclick=sell_filter



</script>

<%@ include file="../footer.jsp"%>