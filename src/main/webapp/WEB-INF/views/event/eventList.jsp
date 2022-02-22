<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="${cpath }/resources/js/event.js"></script>
<section class="event_list">
   
   <h2>EVENT</h2>
   

   <div class="event_top">
      <ul class="df">
         <li><a href="${cpath }/event/eventList">전체 이벤트</a></li>
         <li><a href="${cpath }/event/event_date">진행중인 이벤트</a></li>
         <li><a href="${cpath }/event/event_theEnd">지난 이벤트</a></li>
         <li>
            <div class="eventList_search" >
               <form id="eventList_search_form" action="${cpath }/event/event_search">
                  <input type="text" name="search_event" value="${eventpageing.search_event }" placeholder="검색어를 입력해 주세요">
                  <input type="submit" value="검색">
               </form>
            </div>
         </li>

      </ul>
         
      
      <div class="group">
         <select id="cntPerPage" name="sel" onchange="selChange()">
            <option value="4"
               <c:if test="${eventpaging.cntPerPage == 4 or param.cntPerPage==4 or empty param.cntPerPage }">selected</c:if>>4개 보기</option>
            <option value="6"
               <c:if test="${eventpaging.cntPerPage == 6 or param.cntPerPage==6}">selected</c:if>>6개 보기</option>
            <option value="8"
               <c:if test="${eventpaging.cntPerPage == 8 or param.cntPerPage==8}">selected</c:if>>8개 보기</option>
            <option value="10"
               <c:if test="${eventpaging.cntPerPage == 10 or param.cntPerPage==10}">selected</c:if>>10개 보기</option>
         </select>
      </div>
   
   </div>


   <div class="eventList_div">
      <c:if test="${empty eventList}">
         <p>검색결과가 없습니다.</p>
      </c:if>
      

      <c:forEach var="event" items="${eventList }">
         <div class="eventList_items df">
            <div class="event_img">
               <img src="${event.event_img }" width="194" height="146" style="padding-left:30px;">
            </div>
            <div class="event_title">
               <div class="title" style="margin-bottom: 15px; font-weight: bold;">[${event.event_title }]</div>
               <div class="content" style="margin-bottom: 15px;"> ${event.event_content }</div>
               <div class="date" style="font-size:12px;">기간 : <fmt:formatDate value="${event.event_date_start }" pattern="yy-MM-dd"/> ~ <fmt:formatDate value="${event.event_date_end }" pattern="yy-MM-dd"/></div>
            </div>
         </div>
      </c:forEach>
   </div>
   
   
   <div class="eventList_div_result"></div>  
   
   
   <div class="paging_event df">   
      
      <c:if test="${No ==1}">
         <c:if test="${eventpageing.pre}">
               <a href="${cpath}/event/eventList?nowPage=${eventpageing.begin-1}&cntPerPage=${eventpageing.cntPerPage}">◀</a>
            </c:if>
            <c:forEach var="i" begin="${eventpageing.begin}" end="${eventpageing.end}" >
               <a href="${cpath}/event/eventList?nowPage=${i}&cntPerPage=${eventpageing.cntPerPage}">${i}</a>
            </c:forEach>
            <c:if test="${eventpageing.next}">
               <a href="${cpath }/event/eventList?nowPage=${eventpageing.end+1}&cntPerPage=${eventpageing.cntPerPage}">▶</a>
         </c:if>
      
      </c:if>
      <c:if test="${No ==2}">
         <c:if test="${eventpageing.pre}">
               <a href="${cpath}/event/event_date?nowPage=${eventpageing.begin-1}&cntPerPage=${paging.cntPerPage}">◀</a>
            </c:if>
            <c:forEach var="i" begin="${eventpageing.begin}" end="${eventpageing.end}" >
               <a href="${cpath}/event/event_date?nowPage=${i}&cntPerPage=${eventpageing.cntPerPage}">${i}</a>
            </c:forEach>
            <c:if test="${eventpageing.next}">
               <a href="${cpath }/event/event_date?nowPage=${eventpageing.end+1}&cntPerPage=${paging.cntPerPage}">▶</a>
         </c:if>
      
      </c:if>
      <c:if test="${No ==3}">
         <c:if test="${eventpageing.pre}">
               <a href="${cpath}/event/event_theEnd?nowPage=${eventpageing.begin-1}&cntPerPage=${eventpageing.cntPerPage}">◀</a>
            </c:if>
            <c:forEach var="i" begin="${eventpageing.begin}" end="${eventpageing.end}" >
               <a href="${cpath}/event/event_theEnd?nowPage=${i}&cntPerPage=${eventpageing.cntPerPage}">${i}</a>
            </c:forEach>
            <c:if test="${eventpageing.next}">
               <a href="${cpath }/event/event_theEnd?nowPage=${eventpageing.end+1}&cntPerPage=${eventpageing.cntPerPage}">▶</a>
         </c:if>
      
      </c:if>
      
      <c:if test="${No ==4}">
         <c:if test="${eventpageing.pre}">
               <a href="${cpath}/event/event_search?search_event=${eventpageing.search_event }&nowPage=${eventpageing.begin-1}&cntPerPage=${eventpageing.cntPerPage}">◀</a>
            </c:if>
            <c:forEach var="i" begin="${eventpageing.begin}" end="${eventpageing.end}" >
               <a href="${cpath}/event/event_search?search_event=${eventpageing.search_event }&nowPage=${i}&cntPerPage=${eventpageing.cntPerPage}">${i}</a>
            </c:forEach>
            <c:if test="${eventpageing.next}">
               <a href="${cpath }/event/event_search?search_event=${eventpageing.search_event }&nowPage=${eventpageing.end+1}&cntPerPage=${eventpageing.cntPerPage}">▶</a>
         </c:if>
      
      </c:if>
      
   </div>
   
</section>

<script>
   const search_word=document.querySelector('input[name="search_event"]').value   
   function selChange() {
      const now = window.location.pathname
      const sel = document.getElementById('cntPerPage').value
      if(search_word!==''){
         location.href=now+"?search_event="+search_word+"&nowPage=1&cntPerPage="+sel
         return
      }
      location.href=now+"?nowPage=1&cntPerPage="+sel;
   }
   let nowurl = window.location.pathname
   nowpage(nowurl)

   let page = ${param.nowPage}
   nowP(page)
   
</script>


<%@ include file="../footer.jsp"%>