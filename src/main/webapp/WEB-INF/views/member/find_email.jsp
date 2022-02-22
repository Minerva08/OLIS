<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/member.css">

<section class="member_find_email">
	<div class="member_find_email_div">
		<div class="find_email_top jcce aice">
			<span>이메일 아이디 찾기</span>
		</div>
		
		<div class="find_email_middle">
			<span>가입 시 등록한 휴대폰 번호를 입력하면</span>
			<span>이메일 주소의 일부를 알려드립니다.</span>
		</div>
	
		<div id="find_email_phoneNumber">
			<span>휴대폰 번호</span>
		</div>
		
		<form id="find_form">
			<input type="text" name="user_pnum" id="pnum"
				placeholder="가입하신 휴대폰 번호" required="required"> <input
				type="submit" id="email_btn" value="이메일 아이디 찾기">
		</form>
		
		<div id="find_email_result"></div>
	</div>
</section>

<script>
   const find_email_top= document.querySelector('.find_email_top')
   const find_email_middle = document.querySelector('.find_email_middle')
   const find_email_phoneNumber = document.getElementById("find_email_phoneNumber")
   const find_form = document.getElementById('find_form')
   const pnum = document.getElementById('pnum')
   const btn = document.getElementById('email_btn')
   const result = document.getElementById('find_email_result')
   
   function findEmailHandler(event){
   event.preventDefault();
   //const result = document.getElementById('find_email_result')
   
   
   const user_pnum = document.querySelector('input[name="user_pnum"]')
   
   
   const url = cpath +"/findEmail?pnum=" + user_pnum.value
   const opt={
      method:'GET'
   }
   
   fetch(url,opt)
   .then(resp=> resp.text())
   .then(text=>{
      console.log(text)
      find_email_top.classList.add("hiddenNone");
      find_email_middle.classList.add("hiddenNone");
      find_email_phoneNumber.classList.add("hiddenNone")
      find_form.classList.add("hiddenNone");
      pnum.classList.add("hiddenNone");
      btn.classList.add("hiddenNone");
         findEmailCheckHandler(text);
         //render(result,getEmail(text));            
   })
}

const findEmailCheckHandler = (email)=> {
   //이메일 중복검사를 통해 있을경우 map.color ='red'로 온다.
   const url = cpath +'/email_check?user_email='+email;
   const opt={
      method:'GET'
   }
   fetch(url,opt)
   .then(resp=>resp.json())
   .then(json=>{
      console.log(json)
      if(json.color=='blue'){
         alert('가입된 계정이 없거나 휴대번호를 확인해주세요.')   // 일치하는 이메일이 없으면
         location.href=cpath+"/member/find_email"            // 중단
      }else{
         //red이면 불러올것. 안에 있으니까.
         render(result,getEmail(email))   // 일치하는 이메일이 있으면 진행
         
      }   
   })
}

   

function getEmail(email){
   
   let emailSplit=email.split('@');
   //console.log(emailSplit)  //dorami , naver.com
   //console.log(emailSplit[0]); //dorami
   //console.log(emailSplit[0]+','+emailSplit[1]);
   let nonStar =emailSplit[0].substring(emailSplit[0],1)
   //console.log(nonStar)
   let nonStarLast = emailSplit[0].substring(emailSplit[0].length-1)
   //console.log(nonStarLast)
   let star = ''
   for(let i=0; i<emailSplit[0].length-2; i++){
      star+='*'
   }
   //console.log(emailSplit[0].length)
   
   let dom=''
   dom +='<div class="aice ffcl">'
   dom +='	<div class="find_email_success_title"><h2>OLIS에 가입된 이메일</h2></div>'
   dom +='	<div class="find_email_email_result">'+nonStar+star+nonStarLast+'@'+emailSplit[1]+'</div>'
   dom +='</div>'
   dom +='<div class="find_email_href aice jcce">'
   dom +='	<a href='+ cpath +'/member/find_pw type="button">비밀번호 찾기</a>'
   dom +='	<a href='+cpath +'/member/login>로그인</a>'
   dom +='</div>'
   
   return dom;
}


function render(target,dom){
   target.innerHTML = dom;
}
   
    pnum.addEventListener('keydown',function(event){
       btn.style.backgroundColor='black'
    })
    
    find_form.onsubmit=findEmailHandler
</script>


<%@ include file="../footer.jsp"%>