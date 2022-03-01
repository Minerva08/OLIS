<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script src="${cpath }/resources/js/member.js"></script>

<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/member.css">

<section class = "join_section">
    	<div class="join_div">
	       		 <div class="jcce aice"><span class="join_span">회원가입</span></div>
		
	        	<div>
		            <p>이메일 주소*<span id="join_authMsg" style="font-size: 13px;"></span></p>
		            <div class="df">
		                <input type="text" class="email" placeholder="e-mail" autofocus="autofocus" autocomplete="on">
			            			            
		                <div>
			                <input type="button" id="duplicate_email_btn" value="인증">	                
		                </div>
		                
			            
		            </div>	        	
	        	</div>
	        	
			<form class="join_authForm hiddenNone">
				<div class="join_authDiv ffcl">
					<div class="df">	
						<div id="join_sendMailMsg"></div>
						<div class="join_authTimer"></div>
					</div>
					<div class="df aice">
						<input id="join_auth_child1" type="text" name="join_auth" placeholder="인증번호">
						<input type="submit" id="join_authNumberBtn" value="인증확인">
					</div>
				</div>
				
			</form>
	        	
	        <form method="POST" action="${cpath }/member/join">
	        	<div>
		            <p id="pw_length_checked">비밀번호*</p>
		            <div class="pw">
		                <input name="user_pw" type="password" id="password_1" class="user_pw" placeholder="비밀번호" autocomplete="off" onkeyup="password_checked_join()"  maxlength="15">
		            </div>
		            <span id="pw_span_ment">비밀번호 생성 조건 : !@#$%^&*특수문자포함 길이8~15이하</span>
	        	</div>
				
				<div>
		            <p id="pw2_checked_join">비밀번호 확인*</p>
		            <div class="pw_c">
		                <input type="password" id="password_2" class="user_pw_check" name="user_pw_check"placeholder="비밀번호 확인" autocomplete="off" onkeyup="password_checked_join()">
		            	<p id="alert2" style="display: none;"></p>
		            </div>
				</div>
					
				<div>
		            <p id="join_nic_checked">닉네임</p>
		            <div class="nickname df">
		                <input type="text" name="user_nickname" placeholder="nickname" autocomplete="off">
		                <div>
			                <input type="button" id="duplicate_nick_btn" value="중복확인">	                
		                </div>	
		            </div>
				</div>		
		
				<div>
		            <p>전화번호*</p>
		            <div class="pnum">
		                <input class="input_numberNone input_numberNone" type="number" name="user_pnum" placeholder="'-'을 제외하고 입력해주십시오" oninput="joinOnInput(this, 11)">
		            </div>
		        </div>
	            
	            <div>
		            <p>성별</p>
		            <div class="gender">
		                <label><input data-n="1" type="radio" name="user_gender" value="male">남성</label>
		                <label><input data-n="2" type="radio" name="user_gender" value="female">여성</label>
		            </div>	            
	            </div>
				
	           <div>
		           <button id="join">가입하기</button>	           
	           </div>
	            <input type="hidden" name="user_email">
	        </form>
    
    	</div>
    </section>
    
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	const joinmsg = '${msg}'
	if (joinmsg != '') {
		alert(joinmsg)
	}
	const pw_length_checked = document.getElementById('pw_length_checked')
	const pw2_checked_join = document.getElementById('pw2_checked_join')
	const join_nic_checked = document.getElementById('join_nic_checked')
	
	const email1 = document.querySelector('input[name="user_email"]')
	const email = document.querySelector('.email')
	email.addEventListener('keyup', nospace)
	email.addEventListener('keyup',join_value_check)
	const pw = document.querySelector('input[name="user_pw"]')
	pw.addEventListener('keyup', nospace)
	pw.addEventListener('keyup',join_value_check)
	const pw_check = document.querySelector('input[name="user_pw_check"]')
	pw_check.addEventListener('keyup', nospace)
	pw_check.addEventListener('keyup',join_value_check)
	const nickname = document.querySelector('input[name="user_nickname"]')
	nickname.addEventListener('keyup', nospace)
	nickname.addEventListener('keyup',join_value_check)
	const pnum = document.querySelector('input[name="user_pnum"]')
	pnum.addEventListener('keyup', nospace)
	pnum.addEventListener('keyup',join_value_check)
	
	let genderflag = false
	const gender = document.querySelectorAll('input[name="user_gender"]')
	console.log(gender)
	gender.forEach(ev => {
		ev.addEventListener('click', join_value_check)
	})
	const btn1 = document.querySelector('#duplicate_email_btn')
	const btn2 = document.querySelector('#duplicate_nick_btn')
	const msg_nick = document.querySelector('#msg_nick')
	const msg_email = document.querySelector('#msg_email')
	const join = document.getElementById('join')
	const element_wrap = document.getElementById('wrap');
	let count=0
	
	let emailflag = false
    let nicflag = false
    let pw1flag = false
    let pw2flag = false

    
    //회원가입 이메일 인증
//  const join_emailForm = document.querySelector('.join_emailForm')
 	const join_sendMailMsg = document.getElementById('join_sendMailMsg')
	const join_authForm = document.querySelector('.join_authForm')
	const join_authMsg = document.getElementById('join_authMsg')
  let second = 300 //인증번호 입력시간
  let interval =0
	//window.onload=onload_join
	btn1.addEventListener('click', joinSendMailHandler)
  join_authForm.onsubmit = joinAuthMailHandler
	
	
	btn2.onclick =duplicate_nick
	join.onclick = go_join
	//$('.user_pw').focusout(join_pw)
    //$('.user_pw_check').blur(join_pwcheck)
    //$('#user_addressdetail').focusout(join_end)
</script>


<%@ include file="../footer.jsp"%>


