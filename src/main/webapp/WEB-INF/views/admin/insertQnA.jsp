<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<form enctype="multipart/form-data" method="POST">
	<p>카테고리:
		<select name="qna_category">
			<option value="이용정책">이용정책</option>
			<option value="공통">공통</option>
			<option value="구매">구매</option>
			<option value="판매">판매</option>			
		</select>
	</p>

	<p>qna제목 :<input type="text" name="qna_title"></p>
	<p><input type="file" name="upload"><p>
	<button>등록</button>
</form>
</body>
</html>