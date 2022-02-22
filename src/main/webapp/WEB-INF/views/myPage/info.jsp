<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage.css">
<script src="${cpath }/resources/js/mypage.js"></script>
<script src="${cpath }/resources/js/header.js"></script>

   <section class="myPage_profile df">
        <div class="myPage_left">
			<h2><a href="${cpath }/myPage/home_myPage">마이 페이지</a></h2>
			<div>
				<span>쇼핑 정보</span>
				<ul>
					<li><a href="${cpath }/myPage/buyList">구매 내역</a></li>
					<li><a href="${cpath }/myPage/saleList">판매 내역</a></li>
					<li><a href="${cpath }/myPage/wishList?page=0">관심 상품</a></li>
				</ul>
			</div>
			<div>
				<span>내 정보</span>
				<ul>
					<li><a href="${cpath }/myPage/info">프로필 정보</a></li>
					<li><a href="${cpath }/myPage/address">주소록</a></li>
					<li><a href="${cpath }/myPage/shopping?page=0">장바구니</a></li>
					<li><a href="${cpath }/myPage/point">포인트</a></li>
				</ul>
			</div>
		</div>
		
		<div class="_profile">
			<div class="profile_title">
				<strong>프로필 정보</strong>
			</div>
			
			<div class="profile_div1">
				<form action="${cpath }/updateInfo" class="profile_form aice" enctype="multipart/form-data" method="POST">
					<input type="hidden" name="user_email" value="${login.user_email }">
					<label>
						<img width="100" src="${login.user_profile_img }">
						<input type="file" id="changeProfile" name="upload" class="hiddenNone">
						<span>변경</span>
					</label>
					<div>
						<span>${login.user_nickname }</span>
						<div class="profile_title_btn df">
							<button type="submit" data-btn="0" class="info_img_class" id="info_img_modify">수정</button>
							<div data-btn="1" class="info_img_class">삭제</div>
						</div>
					</div>
				</form>
			</div>
			
			<div class="profile_div2">
				<span class="profile_div_title">로그인 정보</span>
				<div class="df">
					<div class="ffcl">
						<span class="profile_spanTop">이메일 주소</span>
						<span class="profile_spanBottom">${login.user_email }</span>
					</div>
					
				</div>
				
				<div class="df">
					<div class="ffcl">
						<span class="profile_spanTop">비밀번호</span>
						<span class="profile_spanBottom">*********</span>
						
						<div class="profile_drop_div profile_divhidden_password ffcl hiddenNone">
							<strong>변경할 비밀번호<span id="Info_pw_ck1"></span></strong>
							<input type="password" name="user_pw" autocomplete="off" placeholder="!@#$%^&*특수문자포함 길이8~15이하"  onkeyup="password_checked_info()" maxlength="15">
							<strong>비밀번호 확인<span id="Info_pw_ck2"></span></strong>
							<input type="password" name="user_pw2" autocomplete="off" placeholder="비밀번호 확인" onkeyup="password_checked_info()" maxlength="15">
							<div class="profile_drop_btn">
								<button id="cancel_pw" data-c="c">취소</button>
								<button class="profile_fetch_btn" data-pw="${login.user_pw }">변경</button>
							</div>
						</div>
					</div>
					
					<button class="profile_btn_password profile_btn" style="border: 0.5px solid #dadada;" data-pw="pw">변경</button>
					
				</div>
			</div>		
			
			<div class="profile_div3">
				<span class="profile_div_title">개인정보</span>
				<div class="df">
					<div class="ffcl">
						<span class="profile_spanTop">닉네임</span>
						<span class="profile_spanBottom">${login.user_nickname }</span>
						
						<div class="profile_drop_div profile_divhidden_nickname ffcl hiddenNone">
							<strong>변경할 닉네임<span id="Info_nick_ck"></span></strong>
							<input type="text" name="user_nickname" placeholder="변경할 닉네임을 입력하세요">
							<div class="profile_drop_btn">
								<button id="cancel_nick" data-c="c">취소</button>
								<button id="Info_nick_ck_btn">중복체크</button>
								<button class="profile_fetch_btn" data-nick="${login.user_nickname }">변경</button>
							</div>
						</div>
					</div>
					<button class="profile_btn_nickname profile_btn" style="border: 0.5px solid #dadada;" data-nick="nick">변경</button> 
					
					
				</div>
				
				<div class="df">
					<div class="ffcl">
						<span class="profile_spanTop">휴대폰 번호</span>
						<span class="profile_spanBottom">${login.user_pnum }</span>
						
						<div class="profile_drop_div profile_divhidden_pnum ffcl hiddenNone">
							<strong>새 휴대폰 번호</strong>
							<input type="number" name="user_pnum" placeholder="변경할 휴대폰 번호를 입력하세요">
							<div class="profile_drop_btn">
								<button id="cancel_pnum" data-c="c">취소</button>
								<button class="profile_fetch_btn" data-pnum="${login.user_pnum }">변경</button>
							</div>
						</div>
						
					</div>
					<button class="profile_btn_pnum profile_btn" style="border: 0.5px solid #dadada;" data-pnum="pnum">변경</button>
					
				</div>
				
				<div class="df">
					<div class="ffcl">
						<span class="profile_spanTop">회원탈퇴</span>
						<span class="profile_spanBottom">탈퇴 동의 하기</span>
						
						<div class="profile_drop_div profile_divhidden_out ffcl hiddenNone">
							<label class="df"><input type='checkbox' name='selectall' onclick='selectAll(this)'/> 전체동의<br /></label>
							
							<label><input type='checkbox' id="1" name='agree'  onclick='checkSelectAll()'/><strong>회원 정보및 서비스 기록이 삭제됩니다</strong><br /></label>
							<label><input type='checkbox' id="2" name='agree' onclick='checkSelectAll()'/><strong>관련 법정에따라 일부 정보가 저장될 수 있습니다</strong><br /></label>
   					
							<div class="profile_drop_btn">
								<button id="cancel_out" data-c="c">취소</button>
								<button id="member_out_btn" data-login="${login.user_email }">탈퇴</button>
							</div>
						</div>
						
					</div>
					<button class="profile_btn_out profile_btn" style="border: 0.5px solid #dadada;" data-out="out">탈퇴</button>
					
					
				</div>
			</div>
			
		</div>
		<form method="POST" id="Info_form" action="${cpath }/updateInfo">
			<input type="hidden" name="user_email" value="${login.user_email }">
			<input type="hidden" id="Info_param">
		</form>
    </section>
        
    <script>
		const addEvent1 = document.querySelector('input[name="user_pw"]')
		console.log('addEevent1',addEvent1)
		const addEvent2 = document.querySelector('input[name="user_pw2"]')
		console.log('addEevent2',addEvent2)
		const addEvent3 = document.querySelector('input[name="user_nickname"]')
		console.log('addEevent3',addEvent3)
		const addEvent4 = document.querySelector('input[name="user_pnum"]')
   	 	console.log('addEevent4',addEvent4)
   	 
 	
		
   	 	
  		addEvent1.addEventListener('keyup', nospace)
  		addEvent2.addEventListener('keyup', nospace)
    	addEvent3.addEventListener('keyup', nospace)
    	addEvent4.addEventListener('keyup', nospace)

    	const Info_form = document.getElementById('Info_form')
    	const Info_param = document.getElementById('Info_param')
    
    	const member_out_btn = document.getElementById('member_out_btn')
    	member_out_btn.onclick = memberOut
    
    	//각각 변경 버튼
    	const profile_fetch_btn = document.querySelectorAll('.profile_fetch_btn')
    	console.log(profile_fetch_btn)
    	profile_fetch_btn.forEach(ev => {
    		ev.addEventListener('click', updateFetch)
    	})
    
    	const profile_divhidden_password = document.querySelector('.profile_divhidden_password')
    	const profile_btn_password = document.querySelector('.profile_btn_password')
    	const cancel_pw = document.getElementById('cancel_pw')
    	profile_btn_password.onclick = selectBtn_pw
    	cancel_pw.onclick = selectBtn_pw
    	
    	const profile_divhidden_nickname = document.querySelector('.profile_divhidden_nickname')
    	const profile_btn_nickname = document.querySelector('.profile_btn_nickname')
    	const cancel_nick = document.getElementById('cancel_nick')
    	profile_btn_nickname.onclick = selectBtn_nick
    	cancel_nick.onclick = selectBtn_nick
    	
    	const profile_divhidden_pnum = document.querySelector('.profile_divhidden_pnum')
    	const profile_btn_pnum = document.querySelector('.profile_btn_pnum')
    	const cancel_pnum = document.getElementById('cancel_pnum')
    	profile_btn_pnum.onclick = selectBtn_pnum
    	cancel_pnum.onclick = selectBtn_pnum
    	
    	const profile_divhidden_out = document.querySelector('.profile_divhidden_out')
    	const profile_btn_out = document.querySelector('.profile_btn_out')
    	const cancel_out = document.getElementById('cancel_out')
    	profile_btn_out.onclick = selectBtn_out
    	cancel_out.onclick = selectBtn_out
    	
		const nowurl = window.location.pathname
		nowpage(nowurl)
    	const infomsg = '${msg}'
    	getmsg(infomsg)
    	
    	let flagpw1 = false
    	let flagpw2 = false
    	let flagnick = false
    	let flagimg = false
    	const infoimg = '${login.user_profile_img}'
    	const Info_nick_ck_btn = document.getElementById('Info_nick_ck_btn')
    	Info_nick_ck_btn.onclick = duplicate_nick_info
    	
    	const changeProfile = document.querySelector('#changeProfile')
    	changeProfile.addEventListener('change', profileUpload)
    	
    	const info_img_modify = document.getElementById('info_img_modify')
    	const info_img_class = document.querySelectorAll('.info_img_class')
    	info_img_class.forEach(ev => {
    		ev.addEventListener('click', imgModifyandDeletebtn)
    	})
    </script>
    
<%@ include file="../footer.jsp"%>



