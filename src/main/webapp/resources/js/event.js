function nowpage(url) {
   const mypage_a = document.querySelectorAll('.event_list >.event_top > ul > li > a')
   for (let i = 0; i < mypage_a.length; i++) {
      if (mypage_a[i].getAttribute('href') + '' == url + '') {
         mypage_a[i].style.color = 'black'
         mypage_a[i].style.fontWeight = 'bold'
         return
      }
   }
}

function nowP(page){
   const content_p =document.querySelectorAll('.event_list>.paging_event> a')

   for (let i = 0; i < content_p.length; i++) {
      if (content_p[i].innerText == page) {
         content_p[i].style.color = 'black'
         content_p[i].style.fontWeight = 'bold'
         return
      }
   }

}