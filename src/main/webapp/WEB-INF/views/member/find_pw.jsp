<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css"
	href="${cpath }/resources/css/member.css">

<section class="member_find_pw">
	<div class="member_find_pw_div">
		<div class="member_top jcce aice">
			<span>비밀번호 찾기</span>
		</div>
		<div class="ment ffcl">
			<div>가입 시 등록하신 이메일을 입력하시면,</div>
			<div>이메일로 인증번호 를 전송해 드립니다.</div>

		</div>
		<form class="find_pw_form">
			<span>이메일 주소</span>
			<div class="component">
				<input type="email" name="user_email" class="email" id="email"
					placeholder="예)dorami@dorami.co.kr" required autofocus
					autocomplete="off"> <input type="submit" id="send_messege"
					value="인증번호 전송">
			</div>
		</form>
		<div class="find_pw_sendLoading hiddenNone">
			인증번호 발송중<span id="dotSpan" style="font-weight: bold;"></span>
		</div>
		<div id="find_pw_sendMailMsg"></div>

		<form id="find_pw_authMailForm" class="find_pw_hidden hiddenNone">
			<div class="find_pw_authBox">
				<div>
					<span>인증 번호 입력</span>
					<div class="find_pw_authTimer"></div>
				</div>
				<div class="find_pw_success_auth">
					<input type="text" name="find_pw_auth" placeholder="인증번호를 입력하세요">
					<input type="submit" value="인증" id="ininin">
				</div>
			</div>
		</form>

		<form id="find_pw_changePwForm" class="find_pw_hidden hiddenNone">
			<div id="find_pw_authMailMsg"></div>
			<span id="pw_span_ment">비밀번호 생성 조건 : !@#$%^&*특수문자포함 길이8~15이하</span>
			<div>
				<span id="find_newPassword">새 비밀번호</span>
			</div>
			<div class="ffcl">
				<input id="find_newPassword_input1" type="password"
					name="find_pw_newPass" placeholder="새비밀번호" maxlength="15"
					onkeyup="password_checked_join()" autocomplete="off"> <input
					id="find_newPassword_input2" type="password"
					name="find_pw_newPassCk" placeholder="새비밀번호확인" maxlength="15"
					onkeyup="password_checked_join()" autocomplete="off"> <input
					id="find_newPassword_submit" type="submit" value="비밀번호 변경">
			</div>
			<div id="find_pw_Msg"></div>
		</form>
	</div>
</section>

<script>
	  
	function loading(){	
		if(dotSpan.innerText=='......'){
			dotSpan.innerText=''
		}
		dotSpan.innerText+='.'
	}
	  
	  
	function timer() {
		let min = Math.floor(second / 60) + ''
		let sec = second % 60 + ''
		if(min.length < 2)  min = '0' + min
		if(sec.length < 2)  sec = '0' + sec
		
		const format = min + ' : ' + sec
		const div = document.querySelector('.find_pw_authTimer')
		div.innerText = format
		if(second <= 0) {
		      div.style.color = 'red'
		      clearInterval(interval)
		      authMailForm.querySelector('input').placeholder = '유효시간이 지났습니다'
		      authMailForm.querySelector('input').disabled = 'disabled'
		
		      authMailMsg.innerText = '인증번호를 다시 발송해주세요'
		        authMailMsg.style.color = 'red'
		  		}
		  		second -= 1
	  	}
	   
	// 이메일이 존재하는지 확인
	const emailCheckHandler = (email)=> {
	const url = cpath +'/email_check?user_email='+email.value;
	const opt={
	      method:'GET'
		}
		fetch(url,opt)
	   	.then(resp=>resp.json())
	   	.then(json=>{
	    console.log(json)
	      	if(json.color=='blue'){
	         alert('일치하는 이메일이 없습니다.')   // 일치하는 이메일이 없으면
	         return                  // 중단
	      }
	      find_pw_form.classList.add('hiddenNone')
	      find_pw_sendLoading.classList.remove('hiddenNone')
	      setInterval(loading,500)
	      sendNumber(email)   // 일치하는 이메일이 있으면 진행  
	   })
	}
	   
	const sendNumber = function(email) {
		const url = cpath + '/mailto/' + email.value + '/'
	    const opt = {
	    	method: 'GET'
	    	}
	    	console.log('인증번호 발송')
	      	fetch(url, opt)
	      	.then(resp => resp.json())
	      	.then(json => {
	        //console.log(json)
	        sendMailMsg.innerText = json.message
	        sendMailMsg.style.color = json.status == 'OK' ? 'blue' : 'red'
	        if(json.status == 'OK') {
	       		find_pw_sendLoading.classList.add('hiddenNone')
	       	  	clearInterval()
	            find_pw_form.classList.add('hiddenNone')
	            authMailForm.classList.remove('hiddenNone')
	            interval = setInterval(timer, 1000)    // setInterval(함수, ms)
	            second = 300   // 메일을 보내고 나면 시간을 초기화한다
	            authMailForm.querySelector('input').disabled = ''
	            authMailForm.querySelector('input').placeholder = '인증번호를 입력하세요'
	            authMailForm.querySelector('input').focus()
	            authMailMsg.innerText = ''
	         }
	      })
	   }
	   
	   
	   function authMailHandler(event) {
	      event.preventDefault()
	      if(second <= 0) {
	         alert('유효시간이 지났습니다. 다시 메일을 보내주세요')
	         return   // 유효시간이 만료되었다면 이후 코드를 진행하지 않는다
	      }
	      const auth = event.target.querySelector('input[name="find_pw_auth"]')
	     
	      const url = cpath + '/getAuthResult/' + auth.value + '/'
	      const opt = {
	         method: 'GET'
	      }
	      fetch(url, opt)
	      .then(resp => resp.json())
	      .then(json => {
	      sendMailMsg.innerText = ''
	      authMailMsg.innerText = json.message
	        
	      if(json.status == 'OK') {
	         	authMailMsg.style.color = 'blue'
	         	auth.disabled = 'disabled'
	         	// 인증에 통과했을 경우 진행할 수 있는 다음 버튼을 보여주거나, 기타 처리를 하면 된다
	        	clearInterval(interval)
	       		document.querySelector('.find_pw_authTimer').innerHTML = ''
	        	//비밀번호 변경
	         	changePwForm.classList.remove('hiddenNone')
	    		authMailForm.classList.add('hiddenNone')
	         	const email2 = document.createElement('input')
	         	email2.type = 'hidden'
	         	email2.name = 'user_email'
	         	email2.value = user_email
	         	changePwForm.appendChild(email2)
	         	changePwForm.onsubmit = changePw
	      	}
	      	else {
	         	authMailMsg.style.color = 'red'
	         	auth.select()
	      		}
	   		})
	   }

	  //인증이 되면 비번을 바꿀것.
	   const changePw = function(event){
	      event.preventDefault()
	      const user_email = event.target.querySelector('input[type="hidden"]').value
	      const newPass = document.querySelector('input[name="find_pw_newPass"]')
	      const newPassCheck = document.querySelector('input[name="find_pw_newPassCk"]')
	     
	      if(pw1flag == false || pw2flag == false){
	         alert('비밀번호를 다시 확인해주세요')
	         return
	      }
	      const url = cpath +'/changePw/'+newPass.value+'/'+user_email + '/'
	      console.log(url)
	      const opt={
	            method:"GET"
	      }
	      console.log(url)
	      changePwMsg.innerText=''
	      fetch(url,opt)
	      .then(resp=>resp.json())
	      .then(json=>{
	         console.log(json)
	         if(json ==1){
	            alert('비밀번호 변경 완료되었습니다.')
	            location.href=cpath+'/member/login'
	        }
	         else{
	            changePwMsg.innerText='변경 실패'
	            changePwMsg.style.color='red';
	            alert('비밀번호 변경 실패하였습니다.')
	            history.go(-1)
	         }
	      })   
	     
	   }
	  
	  
	  
	   //마지막 sendMail
	   function sendMailHandler(event) {
	     
	      event.preventDefault()
	
	      //email 입력
	      const email = event.target.querySelector('input[name="user_email"]')
	       emailCheckHandler(email)
		user_email = email.value
	   }   
	  
	  
	  function password_checked_join() {
	   		find_newPassword.innerText = '새 비밀번호'
	   		find_newPassword.style.color = 'black'
		const arr = ['!', '@', '#', '$', '%', '^', '&', '*']
		const p_v = find_newPassword_input1.value
		let flag = false
		for (let i = 0; i < p_v.length; i++) {
			if (arr.includes(p_v[i])) {
				flag = true
			}	
		}
		if (p_v != '' && 8 <= p_v.length <= 15 && flag) {
			find_newPassword.innerText = '새 비밀번호 조건에 적합 합니다'
				find_newPassword.style.color = 'blue'
				pw1flag = true	
		}
		else {
			find_newPassword.innerText = '새 비밀번호 조건에 맞지 않습니다'
				find_newPassword.style.color = 'red'
				pw1flag = false
		}
		if (find_newPassword_input2.value != '') {
			if (p_v === find_newPassword_input2.value) {
				find_newPassword.innerText = '새 비밀번호 일치'
					find_newPassword.style.color = 'blue'
					pw2flag = true
			}
			else {
				find_newPassword.innerText = '새 비밀번호 불일치'
					find_newPassword.style.color = 'red'
					pw2flag = false
			}		
		}
		
	}
	   
	  function password_button_color() {
		  if (find_newPassword_input1.value != '' && find_newPassword_input2 != '') {
			  document.getElementById('find_newPassword_submit').style.backgroundColor='black'	
		  }
		  else {
			  document.getElementById('find_newPassword_submit').style.backgroundColor='#ebebeb'
		  }
	  }
	  
	   const find_newPassword_input1 = document.getElementById('find_newPassword_input1')
		const find_newPassword_input2 = document.getElementById('find_newPassword_input2')
		const find_newPassword = document.getElementById('find_newPassword')
		const find_pw_form=document.querySelector('.find_pw_form')
		const sendMailMsg = document.getElementById('find_pw_sendMailMsg')
		const authMailForm = document.getElementById('find_pw_authMailForm')
		const authMailMsg = document.getElementById('find_pw_authMailMsg')
		const changePwForm = document.getElementById('find_pw_changePwForm')
		const changePwMsg = document.getElementById('find_pw_Msg')
		const find_pw_sendLoading = document.querySelector('.find_pw_sendLoading')
		const dotSpan=document.getElementById('dotSpan')

    	let pw1flag = false
   		 let pw2flag = false
		let user_email = ''
		let second =300 //인증번호 입력 시간
		let interval =0
     const component = document.querySelector('.component')
     
     find_newPassword_input1.addEventListener('keydown' , password_button_color)
     find_newPassword_input2.addEventListener('keydown' , password_button_color)
    document.getElementById('email').addEventListener('keyup', function buttonBlackandWhite() {
    	if (document.getElementById('email').value == '') {
    		document.getElementById('send_messege').style.backgroundColor='#ebebeb'		
    	}
    	else {
    		document.getElementById('send_messege').style.backgroundColor='black'
    	}
    })
     document.querySelector('input[name="find_pw_auth"]').addEventListener('keyup', function buttonBlackandWhite() {
    	if (document.querySelector('input[name="find_pw_auth"]').value == '') {
    		document.getElementById('ininin').style.backgroundColor='#ebebeb'		
    	}
    	else {
    		document.getElementById('ininin').style.backgroundColor='black'
    	}
    })
    find_pw_form.onsubmit = sendMailHandler
	  authMailForm.onsubmit = authMailHandler
</script>

<%@ include file="../footer.jsp"%>