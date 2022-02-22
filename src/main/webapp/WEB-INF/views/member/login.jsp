<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/member.css">

<script src="${cpath }/resources/js/member.js"></script>

 <section class="member_login_main">
        <div class="login_content">
            <div class="login_logo jcce aice"><span>OLIS</span></div>
            <form method="POST">
                <p>이메일 주소</p>
                <div class="input_email">
                    <input type="email" name="user_email" placeholder="e-mail" required="required">
                </div>
                
                <p>비밀번호</p>
                <div class="input_pw">
                    <input type="password" name="user_pw" placeholder="password" autocomplete="off" required="required">
                </div>
           
                <div class="login_div jcce aice">
	                <button id="login">로그인</button>                
                </div>

            </form>
          
            <ul  class ="login_bottom">
                <li><a href = "${cpath }/member/join">이메일 가입</a></li>
                <li><a href = "${cpath }/member/find_email">이메일 찾기</a></li>
                <li><a href = "${cpath }/member/find_pw">비밀번호 찾기</a></li>
            </ul>
           
        </div>
</section>

<script>
	const user_login = document.getElementById('login')
	const user_msg = '${msg}'
	const user_email = document.querySelector('input[name="user_email"]')
	const user_pw = document.querySelector('input[name="user_pw"]')
	console.log(user_msg)
	if (user_msg != '') {
		alert(user_msg)
	}
	user_pw.addEventListener('keydown', function(event) {
		user_login.style.backgroundColor = 'black'
	})
</script>

<%@ include file="../footer.jsp"%>