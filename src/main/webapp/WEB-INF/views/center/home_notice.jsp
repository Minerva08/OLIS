<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script src="${cpath }/resources/js/center.js"></script>
<section class="noticed df">

	<section class="center_left" >
		<ul>
			<li>
				<h1>고객센터</h1>
			</li>
			<li>
				<a id="notice_check" href="${cpath }/center/home_notice?page=1">공지사항</a>		
			</li>
			<li>
				<a href="${cpath }/center/QnA?page=1">자주 묻는 질문</a>			
			</li>
		</ul>
	</section>
	<section class="notice_right">
		<div class="notice_top">
			<h3>공지사항</h3>
		</div>
		
	 	<div class="notice_list">
			<c:forEach var="dto" items="${list}">
				<div class="df idx" data-idx="${dto.notice_idx}">
					<p data-idx="${dto.notice_idx}">[${dto.notice_category}]</p>
					<p data-idx="${dto.notice_idx}">${dto.notice_title}</p>
				</div>
			</c:forEach>
		</div>
		
		
		<div id="notice_pageing" class="df notice_pageing">
			<c:if test="${pre}">
				<a href="${cpath}/center/home_notice?page=${begin-1}">＜</a>
			</c:if>
			<c:forEach var="i" begin="${begin}" end="${end}" >
				<a href="${cpath}/center/home_notice?page=${i}">${i}</a>
			</c:forEach>
			<c:if test="${next }">
				<a href="${cpath }/center/home_notice?page=${end+1}">＞</a>
			</c:if>
		</div>
	</section>
</section>

<script>

	

	const div = document.querySelectorAll('.idx')
	
	div.forEach(event=>{
		event.addEventListener('click',notice_showcontent)
	})
	
	window.onload=function(){
		const notice_check = document.getElementById('notice_check')
		notice_check.style.color="black"
		notice_check.style.fontWeight="bold"
	}
	let nowurl = window.location.pathname
	nowurl+=window.location.search
	pageing_page_notice(nowurl)
	const nowurl2=window.location.pathname+'?page=0'
	nowpage(nowurl2)
	
	
	

</script>


<%@ include file="../footer.jsp"%>
