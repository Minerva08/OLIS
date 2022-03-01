<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="${cpath }/resources/js/center.js"></script>
<section class="noticed df">

	<section class="center_left" >
		<ul>
			<li>
				<h1>고객센터</h1>
			</li>
			<li>
				<a id="notice_detail" href="${cpath }/center/home_notice?page=0">공지사항</a>		
			</li>
			<li>
				<a href="${cpath }/center/QnA?page=0">자주 묻는 질문</a>			
			</li>
		</ul>
	</section>
	
	
	<section class="notice_right">
		<div class="notice_top">
			<h3>공지사항</h3>
		</div>
		
		<div class="notice_content" >
			<div class="detail_top">
				<p style="margin-bottom: 0;font-size: 13px;">${fn:substring(dto.notice_date,0,4)}.${fn:substring(dto.notice_date,5,7)}.${fn:substring(dto.notice_date,8,10)}</p>
				<p style="margin-top: 0;font-size: 15px;">[${dto.notice_category}]${dto.notice_title }</p>
			</div>
			<pre id="content_notice">${dto.notice_content }</pre>			
			
		</div>
		<div class="jcce">
			<button id="back">목록보기</button>
		</div>
		
	</section>
	
	
</section>
<script>
	

	const back = document.getElementById('back')
	window.onload=function(){
		const detail = document.getElementById('notice_detail')
		detail.style.color='black'
		detail.style.fontWeight='bold'
		
	}
	back.onclick=go_list
	
	
</script>


<%@ include file="../footer.jsp"%>
