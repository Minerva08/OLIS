<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<h1 style="color: blue;">===========Product테이블===========</h1>

<fieldset>
   <legend>사용설명서</legend>
   <div>꼭 상위 submit하고 아래꺼 하기 </div>
   <ul>
      <li>ex)모델넘버&nbsp;&nbsp;:&nbsp;&nbsp;DH3076-010 (없을경우 그럴듯하게 영어-숫자)</li>
      <li>ex)가격&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;389000</li>
      <li>ex)카테고리(big)&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;의류</li>
      <li>ex)카테고리(세부)&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;아우터</li>
      <li>ex)성별(남/여)&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;남성 혹은 여성 아니면 공용</li>
      <li>ex)브랜드(한글)&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;나이키</li>
      <li>ex)관심상품 개수&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;278</li>
      <li>ex)업로드날짜 &nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;정렬순서맞게 유도리있게할것.</li>
      <li>ex)상품 이미지1(기본이미지임) &nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;이미지클릭해서 html파일받고 그 폴더내에서 필요한 이미지 찾아서 넣기</li>
      <li>ex)상품 이미지2&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;없으면 ㄴㄴ</li>
      <li>ex)상품 이미지3&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;없으면 ㄴㄴ</li>
      <li>ex)상품 명(풀네임으로 한글이름 넣기)&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;나이키 ACG 써마 핏 ADV 루나 레이크 퍼퍼 베스트 블랙 - 아시아</li>
      <li>ex)색상(대문자)&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;BLACK/BLACK/LIGHT ARMY/SUMMIT WHITE</li>
      <br>
      <div>=============================================================================</div>
      <br>
      <li>모델넘버&nbsp;&nbsp;:&nbsp;&nbsp;알아서 넘어옴</li>
      <li>사이즈(S,M,L,XL,XXL)&nbsp;&nbsp;:&nbsp;&nbsp;알아서 다르게 넣기</li>
      <li>수량 &nbsp;&nbsp;:&nbsp;&nbsp;5단위로 끊어서 넣기 </li>
      <li>출고지item_place 기본 value="(주)OLIS"</li>
      <li>배송비item_delibery기본 value="5000"</li>
   </ul>
</fieldset>
<form id="product" action="${cpath}/admin/insertProduct"  enctype="multipart/form-data" method="POST" style="margin-left: 50px; margin-top: 50px; display: flex;">
   
   
   
   <div>
      <p><div style="display: flex;"><div style="width:150px;">모텔 넘버: </div><input type="text" name="product_model_num" value="${num }" required autofocus></div></p>
      <p><div style="display: flex;"><div style="width:150px;">가격 : </div><input type="number" name="product_price" required></div></p>

      <p><div style="display: flex;"><div style="width:150px;">카테고리 : </div><input type="text" name="product_big_category" required></div></p>
      <p><div style="display: flex;"><div style="width:150px;">카테고리 : </div><input type="text" name="product_category" required></div></p>
      <p><div style="display: flex;"><div style="width:150px;">성별(남,여) : </div><input type="text" name="product_gender" required></div></p>
      <p><div style="display: flex;"><div style="width:150px;">브랜드(한글) : </div><input type="text" name="product_brand" required></div></p>
      <p><div style="display: flex;"><div style="width:150px;">관심상품 개수 : </div><input type="number" name="product_wish_count" required></div></p>
      <p><div style="display: flex;"><div style="width:150px;">업로드 날짜 : </div><input type="date" name="product_upload" required></div></p>
      <p><div style="display: flex;"><div style="width:150px;">상품 이미지1 : </div><input type="file" name="upload" required></div></p>
      <p><div style="display: flex;"><div style="width:150px;">상품 이미지2 : </div><input type="file" name="upload2"></div></p>
      <p><div style="display: flex;"><div style="width:150px;">상품 이미지3 : </div><input type="file" name="upload3"></div></p>
      <p><div style="display: flex;"><div style="width:150px;">상품명 : </div><input type="text" name="product_name" required></div></p>
      <p><div style="display: flex;"><div style="width:150px;">색상(대문자) : </div><input type="text" name="product_color" required></div></p>
   </div>
   <div style="margin-left: 20px;"><input type="submit" value="프로덕트 넣기" style="width: 300px; height: 300px; font-size: 30px;"></div>
</form>
<h1>================================</h1>
<form class="itemForm" style="display: flex; border: 1px solid black;">
   <div style="margin-right: 20px; font-size: 55px;">1</div>
   <div>
      <p><div style="display: flex;"><div style="width:150px;">모텔 넘버: </div><input type="text" name="product_model_num" value="${num }" required autofocus readonly></div></p>
      <p><div style="display: flex;"><div style="width:150px;">사이즈 : </div><input type="text" name="item_size" required autofocus></div></p>
      <p><div style="display: flex;"><div style="width:150px;">수량 : </div><input type="number" name="item_inven" required autofocus value="10"></div></p>
        <p><div style="display: flex;"><div style="width:150px;">출고지:</div><input type="text" name="item_place" required value="(주)OLIS"></div></p>
        <p><div style="display: flex;"><div style="width:150px;">배송비:</div><input type="number" name="item_delibery" required value="5000"></div></p>
   </div>
   <div style="margin-left: 20px;"><input type="submit" value="아이템 넣기" style="width: 300px; height: 110px; font-size: 30px;"></div>
</form>
<form class="itemForm" style="display: flex; border: 1px solid black; margin-top: 20px;">
   <div style="margin-right: 20px; font-size: 55px;">2</div>
   <div>
      <p><div style="display: flex;"><div style="width:150px;">모텔 넘버: </div><input type="text" name="product_model_num" value="${num }" required autofocus readonly></div></p>
      <p><div style="display: flex;"><div style="width:150px;">사이즈 : </div><input type="text" name="item_size" required autofocus></div></p>
      <p><div style="display: flex;"><div style="width:150px;">수량 : </div><input type="number" name="item_inven" required autofocus value="10"></div></p>
      <p><div style="display: flex;"><div style="width:150px;">출고지:</div><input type="text" name="item_place" required value="(주)OLIS"></div></p>
        <p><div style="display: flex;"><div style="width:150px;">배송비:</div><input type="number" name="item_delibery" required value="5000"></div></p>
   </div>
   <div style="margin-left: 20px;"><input type="submit" value="아이템 넣기" style="width: 300px; height: 110px; font-size: 30px;"></div>
</form>
<form class="itemForm" style="display: flex; border: 1px solid black; margin-top: 20px;">
   <div style="margin-right: 20px; font-size: 55px;">3</div>
   <div>
      <p><div style="display: flex;"><div style="width:150px;">모텔 넘버: </div><input type="text" name="product_model_num" value="${num }" required autofocus readonly></div></p>
      <p><div style="display: flex;"><div style="width:150px;">사이즈 : </div><input type="text" name="item_size" required autofocus></div></p>
      <p><div style="display: flex;"><div style="width:150px;">수량 : </div><input type="number" name="item_inven" required autofocus value="10"></div></p>
      <p><div style="display: flex;"><div style="width:150px;">출고지:</div><input type="text" name="item_place" required value="(주)OLIS"></div></p>
        <p><div style="display: flex;"><div style="width:150px;">배송비:</div><input type="number" name="item_delibery" required value="5000"></div></p>
   </div>
   <div style="margin-left: 20px;"><input type="submit" value="아이템 넣기" style="width: 300px; height: 110px; font-size: 30px;"></div>
</form>
<form class="itemForm" style="display: flex; border: 1px solid black; margin-top: 20px;">
   <div style="margin-right: 20px; font-size: 55px;">4</div>
   <div>
      <p><div style="display: flex;"><div style="width:150px;">모텔 넘버: </div><input type="text" name="product_model_num" value="${num }" required autofocus readonly></div></p>
      <p><div style="display: flex;"><div style="width:150px;">사이즈 : </div><input type="text" name="item_size" required autofocus value=""></div></p>
      <p><div style="display: flex;"><div style="width:150px;">수량 : </div><input type="number" name="item_inven" required autofocus value="10"></div></p>
      <p><div style="display: flex;"><div style="width:150px;">출고지:</div><input type="text" name="item_place" required value="(주)OLIS"></div></p>
        <p><div style="display: flex;"><div style="width:150px;">배송비:</div><input type="number" name="item_delibery" required value="5000"></div></p>
   </div>
   <div style="margin-left: 20px;"><input type="submit" value="아이템 넣기" style="width: 300px; height: 110px; font-size: 30px;"></div>
</form>
<form class="itemForm" style="display: flex; border: 1px solid black; margin-top: 20px;">
   <div style="margin-right: 20px; font-size: 55px;">5</div>
   <div>
      <p><div style="display: flex;"><div style="width:150px;">모텔 넘버: </div><input type="text" name="product_model_num" value="${num }" required autofocus readonly></div></p>
      <p><div style="display: flex;"><div style="width:150px;">사이즈 : </div><input type="text" name="item_size" required autofocus></div></p>
      <p><div style="display: flex;"><div style="width:150px;">수량 : </div><input type="number" name="item_inven" required autofocus value="10"></div></p>
      <p><div style="display: flex;"><div style="width:150px;">출고지:</div><input type="text" name="item_place" required value="(주)OLIS"></div></p>
        <p><div style="display: flex;"><div style="width:150px;">배송비:</div><input type="number" name="item_delibery" required value="5000"></div></p>
   </div>
   <div style="margin-left: 20px;"><input type="submit" value="아이템 넣기" style="width: 300px; height: 110px; font-size: 30px;"></div>
</form>
<form class="itemForm" style="display: flex; border: 1px solid black; margin-top: 20px;">
   <div style="margin-right: 20px; font-size: 55px;">6</div>
   <div>
      <p><div style="display: flex;"><div style="width:150px;">모텔 넘버: </div><input type="text" name="product_model_num" value="${num }" required autofocus readonly></div></p>
      <p><div style="display: flex;"><div style="width:150px;">사이즈 : </div><input type="text" name="item_size" required autofocus></div></p>
      <p><div style="display: flex;"><div style="width:150px;">수량 : </div><input type="number" name="item_inven" required autofocus></div></p>
      <p><div style="display: flex;"><div style="width:150px;">출고지:</div><input type="text" name="item_place" required value=""></div></p>
        <p><div style="display: flex;"><div style="width:150px;">배송비:</div><input type="number" name="item_delibery" required value=""></div></p>
   </div>
   <div style="margin-left: 20px;"><input type="submit" value="아이템 넣기" style="width: 300px; height: 110px; font-size: 30px;"></div>
</form>
<form class="itemForm" style="display: flex; border: 1px solid black; margin-top: 20px;">
   <div style="margin-right: 20px; font-size: 55px;">7</div>
   <div>
      <p>
         <div style="display: flex;">
            <div style="width:150px;">모텔 넘버: </div>
            <input type="text" name="product_model_num" value="${num }" required autofocus readonly>
         </div>
      </p>
      <p><div style="display: flex;"><div style="width:150px;">사이즈 : </div><input type="text" name="item_size" required autofocus></div></p>
      <p><div style="display: flex;"><div style="width:150px;">수량 : </div><input type="number" name="item_inven" required autofocus></div></p>
   </div>
   <div style="margin-left: 20px;"><input type="submit" value="아이템 넣기" style="width: 300px; height: 110px; font-size: 30px;"></div>
</form>

<script type="text/javascript">
   const itemForm = document.querySelectorAll('.itemForm')
   
   itemForm.forEach(form => {
      form.onsubmit = function(event) {
         event.preventDefault()
         console.log(event.target)
         const num = event.target.children[1].children[1].children[1].value
         const size = event.target.children[1].children[4].children[1].value
         const inven = event.target.children[1].children[7].children[1].value
         const place=event.target.children[1].children[10].children[1].value
         const de = event.target.children[1].children[13].children[1].value
         console.log(num)
         console.log(size)
         console.log(inven)
         const url = cpath + '/nogadaItem_insert'
         const ob = {
            'product_model_num': num,
            'item_size': size,
            'item_inven': inven,
            'item_place':place,
            'item_delibery':de,
         }
         const opt = {
            method: 'POST',
            body: JSON.stringify(ob),
            headers: {
               'Content-type': 'application/json'
            },
         }
         fetch(url, opt)
         .then(resp => resp.text())
         .then(text => {
            if(text == 1) {
               alert('추가성공')
            }
            else {
               alert('추가실패')
            }
         })
      }
   })
</script>
</body>
</html>