<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<form enctype="multipart/form-data" method="POST">
	<p>이벤트명:<input type="text" name="event_title"></p>
	<p>이벤트 내용:<input type="text" name="event_content"></p>
	<p>이벤트 시작일:<input type="date" name="event_date_start"></p>
	<p>이벤트 종료일 :<input type="date" name="event_date_end"></p>
	<p><input type="file" name="upload"><p>
	<button>등록</button>
</form>
</body>
</html>