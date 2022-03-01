function password_checked_join() {
   pw2_checked_join.innerText = '비밀번호 확인*'
   pw2_checked_join.style.color = 'black'
   const arr = ['!', '@', '#', '$', '%', '^', '&', '*']
   const p_v = pw.value
   let flag = false
   for (let i = 0; i < p_v.length; i++) {
      if (arr.includes(p_v[i])) {
         flag = true
      }   
   }
   if (pw.value != '' && 8 <= p_v.length && p_v.length<= 15 && flag) {
      pw_length_checked.innerText = '비밀번호* 조건에 적합 합니다'
      pw_length_checked.style.color = 'blue'
         pw1flag = true   
   }
   else {
      pw_length_checked.innerText = '비밀번호* 조건에 부적합 합니다'
      pw_length_checked.style.color = 'red'
         pw1flag = false
   }
   if (pw_check.value != '') {
      if (pw.value === pw_check.value) {
         pw2_checked_join.innerText = '비밀번호 확인* 일치'
         pw2_checked_join.style.color = 'blue'
            pw2flag = true
      }
      else {
         pw2_checked_join.innerText = '비밀번호 확인* 불일치'
         pw2_checked_join.style.color = 'red'
            pw2flag = false
      }      
   }
}

function join_value_check(event){
   let flag = true
   
   if(email.value =='')flag=false
   if(pw.value =='')flag=false
   if(pw_check.value =='')flag=false
   if(nickname.value =='')flag=false
   if(pnum.value == '')flag=false
   //질문할것.
   if(event.target.dataset.n != 1 && event.target.dataset.n != 2) flag = false
   
   if(flag){
      join.style.backgroundColor='black'
   }
}

function duplicate_nick(event) {
    if (nickname.value == '') {
       join_nic_checked.innerText = '닉네임'
        join_nic_checked.style.color = 'black'
       nickname.setAttribute('placeholder', '닉네임을 입력하세요')
       nickname.classList.add('input_placeholder')
        return
    }
    nickname.setAttribute('placeholder', 'nickname')
    nickname.classList.remove('input_placeholder')
    let url = cpath + '/nickname_check?user_nickname=' + nickname.value
    const opt = {
        method: 'GET'
    }
    fetch(url, opt)
        .then(resp => resp.text())
        .then(row => {
            if (row == 1) {
               join_nic_checked.innerText = '닉네임 중복입니다'
               join_nic_checked.style.color = 'red'
               nicflag = false
            }
            else {
               join_nic_checked.innerText = '사용가능 닉네임'
                join_nic_checked.style.color = 'blue'
                nicflag = true
            }
        })
}

function joinOnInput(el, maxlength) {
     if (el.length == 11) pnumflag = true
     else pnumflag = false
}

function go_join(event) {
    let email_length = email.value.split('@')
    if (!emailflag) {
       alert('이메일 인증해주세요')
       event.preventDefault()
       return
    }
    if (!nicflag) {
       alert('닉네임 중복체크 해주세요')
       event.preventDefault()
       return
    }
    if (!pw1flag) {
       alert('비밀번호 조건이 맞지 않거나 입력해주세요')
       event.preventDefault()
       return
    }
    if (!pw2flag) {
       alert('비밀번호가 일치하지않습니다')
       event.preventDefault()
       return
    }
    if (pnum.value == '' && pnum.length == 8) {
       alert('휴대폰 번호를 확인해주세요')
       event.preventDefault()
       return
    }
    if (gender.checked == false) {
       alert('성별을 선택해주세요')
       event.preventDefault()
       return
    }
    email1.value = email.value
    join.onsubmit()
}




//----------------------------------------------------------------------------------

//join 인증번호 타이머
function joinTimer() {
 let min = Math.floor(second / 60) + ''
 let sec = second % 60 + ''
 if(min.length < 2)  min = '0' + min
 if(sec.length < 2)  sec = '0' + sec

const format = min + ' : ' + sec
 const div = document.querySelector('.join_authTimer')
 div.innerText = format

 if(second <= 0) {
     div.style.color = 'red'
     clearInterval(interval)
     join_authForm.querySelector('input').placeholder = '유효시간이 지났습니다'
     join_authForm.querySelector('input').disabled = 'disabled'

     join_authMsg.innerText = '인증번호를 다시 발송해주세요'
     join_authMsg.style.color = 'red'
 }
 second -= 1
}

//공백 확인 함수
//value는 input으로 들어오는 값   , dataName  input 태그의 종류 쓸것.
function checkExistData(value,dataName){
   if(value == ""){
      alert(dataName + "입력 해주세요");
      return false;
   }
   return true;
}

//이메일 정규표현식 체킹
function joinCheckEmail(join_user_email){
   //메일이 입력되었는지 확인
   if(!checkExistData(join_user_email,"이메일을")) return false;
   
   //이멜 정규표현식
   let emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
        if (!emailRegExp.test(join_user_email.value)) {
            return false;
        }
        return true;
}


//회원가입 이메일 존재하는지 확인
const joinAvailableEmailChecker = (join_user_email) =>{
   const url = cpath +'/email_check?user_email='+join_user_email.value;
   const opt={
         method:'GET'
   }
   fetch(url,opt)
   .then(resp=>resp.json())
   .then(json=>{
      console.log(json)
      if(json.color == 'blue' && joinCheckEmail(join_user_email)){
         alert('사용가능한 이메일 입니다')
         joinSendNumber(join_user_email) //사용가능한 이메일이면 인증메일 보내기.
      }
      else {
         alert("이미 가입된 이메일 입니다");
         return
      }
      
      
   })
}

const joinSendNumber = function(join_user_email){
   const url = cpath +'/mailto/' + join_user_email.value+'/'
   const opt={
         method:'GET'
   }
   //console.log('인증번호 발송')
   fetch(url,opt)
   .then(resp=>resp.json())
   .then(json=>{
      console.log(json)
      join_sendMailMsg.innerText = json.message
      join_sendMailMsg.style.color = json.status =='OK' ? 'blue': 'red';
      if(json.status =='OK'){
         interval = setInterval(joinTimer,1000) 
         join_authForm.querySelector('input').disabled=''
         join_authForm.querySelector('input').placeholder='인증번호'
         join_authForm.querySelector('input').focus()
         join_authMsg.innerText=''
      }
   })
   join_authForm.classList.remove('hiddenNone')
}


function joinAuthMailHandler(event){
   event.preventDefault()
   if(second <=0){
      alert('유효시간이 지났습니다. 다시 메일을 보내주세요')
      return
   }
   const auth = event.target.querySelector('input[name="join_auth"]');
   const ob={auth:auth.value}
   const url= cpath+'/getAuthResult'
   const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		}
   fetch(url,opt)
   .then(resp=>resp.json())
   .then(json=>{
      console.log(json)
      join_authMsg.innerText = json.message
      if(json.status =='OK'){
        btn1.removeEventListener('click', joinSendMailHandler)
        btn1.style.backgroundColor = 'black'
        btn1.style.color = 'white'    
        join_authForm.classList.add('hiddenNone')
         join_authMsg.style.color='blue'
         auth.disabled='disabled'
            email.readOnly = true;
        emailflag = true
         //인증에 통과했을 경우 진행할 수 있는 다음 버튼을 보여주거나, 기타 처리를 하면 된다.
         clearInterval(interval)
         document.querySelector('.join_authTimer').innerHTML=''
      }else{
         join_authMsg.style.color='red';
         auth.select() //인증안되면 다시 input창 select
            
      }
   })
}
//마지막 sendmail
function joinSendMailHandler(event){
   event.preventDefault()
   //이메일 입력
  
   let email_length = email.value.split('@')
   console.log(email_length)
   if (email_length[0].length < 3) {
      alert('이메일 길이가 짧습니다')
      return
   }
   joinAvailableEmailChecker(email)

}

