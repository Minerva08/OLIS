<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<form enctype="multipart/form-data" method="POST">
	<p>카테고리:
		<select name="notice_category">
			<option value="공지">공지</option>
			<option value="이벤트 발표">이벤트 발표</option>
			<option value="쇼룸/전시안내">쇼룸/전시안내</option>
			<option value="전시">전시</option>
			<option value="쇼룸">쇼룸</option>
			
		</select>
	</p>
	<p>등록날짜 :<input type="date" name="notice_date"></p>
	<p>공지사항 제목 :<input type="text" name="notice_title"></p>
	<p><input type="file" name="upload"><p>
	<button>등록</button>
</form>
</body>
</html>