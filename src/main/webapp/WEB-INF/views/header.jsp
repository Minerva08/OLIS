<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="cpath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Soft</title>  

<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/event.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/center.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/product.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/trade.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/chat.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/footer.css">

<link rel="icon" type="icon/png" href="">

</head>
<body>

<script>
	const cpath = '${cpath}'
	const login = '${login}'
</script>
<script src="${cpath }/resources/js/header.js"></script>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="${cpath }/resources/js/trade.js"></script>
<script src="${cpath }/resources/js/chat.js"></script>
<%@ include file="trade/chat.jsp" %>

<div class="header_overlay"></div>
<div class="search_component ffcl aice jcce">
	<form action="${cpath }/product/productList">
		<div class="search_input">
			<input type="search" name="search" placeholder="브랜드명, 모델명, 모델번호 등">
			<span id="cancelBtn">취소</span>
		</div>
	</form>
	<div class="search_category df jcsb">
		<div class="searchCategory">
			<a href="${cpath }/product/productList?category=category=의류" class="df ffcl">
				<img src="data:image/png;base64,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" width="80">
				<span>의류</span>
			</a>
		</div>
		<div class="searchCategory">
			<a href="${cpath }/product/productList?category=category=가방" class="df ffcl">
				<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAhFBMVEX///8AAACQkJDu7u5KSkqtra1iYmK9vb3IyMjr6+szMzMQEBCXl5d4eHhDQ0P5+fnm5uazs7NRUVH19fU5OTmjo6PR0dHh4eHX19d+fn4oKChlZWVdXV1ubm5XV1dQUFCIiIgiIiIaGhqcnJyLi4stLS0jIyM+Pj7KysobGxtsbGwTExP+okS9AAALbUlEQVR4nO1daXuqPBC9cSnuSK244VZbbev//3+vQyAblNgyGez75Hy6V/pADiSznEySf/88PDw8PDw8PDw8PDw8PDw8PDw8PDw8kDEL3vafjLHPXSuYNd0YfITRjqlIgrDpJuFivmYmBt2mG4WI5UuBH2CyaLphWBiV8gP8Tz7j+FuCjB2abhwGvioIMrZqunn1saokyFir6QbWRdcgtB6YVjVouon1MNXIjONp+C+c9rbar+2mG1kLe3XISSp9dXB+Ndi+2ugpRHralUi5smyodRjoSBqxcSmQl54aaRsKlpJF0bcrccC0gbbh4CA4PJdclaHcibxlWJAcyoaa7Kc78pYhoS8orEuvy276V9NF+ZHKAxcZsP5Va3oSDObLIIi6KqIoWLbE9ajppv4SkoENf9XUVKVNOv5khjFtlSf25TivzIjg0REo9M6dtyiIF9O2iuli2YtOu/VV/Nlw/ncsanuUt/uazD+qU4cwjp4GorP+jeAmHA15e18O8X2JUbgYPWccx3+A4zzjt/qZj5vmYerBSavwsOQ97jz/hd4bTDjHR076wzfOr/tLPbvHOT49bNa/4B/wVEOvD14f+TNy0WlT8wO8PW4IkMqG1/pvf3mBG00ezjmGqb1PUEZQ+hnPDzapMUtjmBHS3biA9VBxXB9mPg01rQ6m73C/D7T71UYbvPwRM42ddR6K4gze+LGPe9PdI3VUMH5rdC+dAMXHCFOhKe8OwhC47/ERnAbY9qGTdw0x3N7FjX+GVFBzo5XNwIA1Pr+YaqKupLIFrg/6HZ6dpnTQQa7NDkWIticO7w9y3dbh/a1oQzdyGkB+Nuz4n27Pnzt9AkzQfTp9QiU+QG9y/AxIypqTxDsEgRXEvMOmZI2AxAzMb095c/6UckzsgWN72bMhtoXsoP404zFgFI4r/yJO2D2YVEsfEWJu/TM82z7h/C5+zPqi4C9QW34noNxpU/UHkYWWikptDd5UE3OobxZDOvsBwerYHe7UwW7+HVhbfKFZs1eNSpsMsRu99BYziyd++hHDQZVQbn2WE0CsUWlnnm2kNFQ69fClgVTY/tAfMqz0ilBchax0WTG1dhxMhuB6qa0pWPBq7QKTYXi1+Ux8bK1JDSZDqMR9RWz9PThb6+1QGUKXoY1NQ2a136gMYa6GdtoUhr5FBENlCG/UrZhgAgIWS+K0s5HScLQkuYxakYKiPMuf2JaS6LDFnRP3eomOza1fWf4k/hFDWxcc218pLl7uiPbvS385jrb6jRE1w+sdwyIsrqr8FtbMAdwF6VQbu2fKZLa5k9/AnhqB6kVZKw056T3pzPLQGdhwGd8z9wKjmlL7hkkh2vWfEOlTuvyY+Hm811C+0x7xqOAMKSdLYdzTKu3hkTZ/og/1IahJCB8HqgLxnggJraJ4y3/fiRnewrYL4eN29BLtLZBfE77UjkXQd4CWNYdExQu9MNS9J3pFw+xMv2ogIGUIIRT1jB6ULNCVKtKHpfyZdIHikjjQB0C/odOiPkjHBEf7lbJgIWqAYTigtN8nakkBMKHUEw9NFO8+U67bH1OLl4DN7aFkYdtXE5UDt8D0lYzhvomNHkaEOSmYNfqy1ohQV4AK8wPRsyR6hC5qRhpe5LhjQg8NbXItEQChIlW1wpLwbUr0CXtOQJrICBCmbN+m22Hv9PXcqYfddv5N2kJo307ldvvjZ5VsVRiXCervZLuChaCWFn6NL2j8ALtiJ+nQhG3tbnJkJVPc+az9+vmpFpJ0q2FAYfYOysqPSddxXJPvXmEwnPEPuAlm9V9y2I74RnZml8x3W3RpbqZi3lrfvIuXA2/xYqpFWqpi5C+ibHztLDflW+itoSxCmySBSkx2xfWQaYVxUvhpw9+xo5m9dBkXi8KCY4Luc8bWo+NCh0wV0zCtj3e0iAZ26rzMeAWWqiXCk1/xBffY/FjwQy8b82W7FNYGvLx0qSHoemqACGtZXYQ48EC1DFk8d8LcRKgw2FInlb3LHDA83Mh8ifHq8r6zKFohDCwFEaO0Bdwj/uMAwESd4mL5VP7BibEBT8ittJ5sL5m7EgL4iIqDHebSwsKJV9yJsue59tFcaqeBPh5ehDz06WJS/1XcVA9Lb8zf0R+Woa33j0QMv8TF0lkmcpcv7fYvDlWpUPf6t9j3zP9VGvvXBRMZdkddoD47uszadtpa+Ldb5MT/NXfAcCF90EC1cO2ry1olvQADhjyPLFxMDSlKl/bV+kOXwb6+aE1qC6AsYk9gymn0cKh+NSSGwbxbFveNNY8o9SEXE8Ky5+srnlAY8n20SpKTdI9X8RGVqWeGP80urZeuW6Iw5Hn1uXghZShW0Pbll2P49i0Rbk+v1gWGtRc/ZucIFAMHro3k/2vL3vOO7/IvIp7QJ/GB4W7UqodMOhibv4/4TpF59D27ii+3w69yW4veEjF1tWN/yJwjH3HKnNfqu13Qf42ZdHswaJSTKggYioG4F32zhb4zD5jnLKRZaZP4FAzFiNuIlBhMO67LBwMaiMdcZEqDYWnyde3FmfOV/vtWaML4yy8U87LTprgxvEV+SERRX+J7nk+UP8zWuEGfwg1qFPPS0U6GwWAo1vEVwhqDoQxMwTXiSjWwGo+/PaM2CYOhGHCFqMZgCO+ZO00jc0TAVux6AMmEIjyhMiwMaINhLMYKfg1YIiRKo0YQgaE8jeZgXjIYKpPPe+ygRhZ2G2E9AsOK01gMhkpd6wa5aGm2Fp3CqNVFYCg36rmalwyGYF9G4soa0+UrtzY8EQJD5Vgk85LBUJFMRmWmtwYUId+YxCftpSCgKNExpog5lUPcWPeAYUvfc4YFH24yvAhz0HPAMDMvB33tCgbDflYCUHThJkOpvWF/w750sEZtKUqOH0abTnIoabDJcCuUgBbyOITukbmfRN/O073Wpj4Pdt8K82bgpsBj0SkuuqulZdjNGcKwwY1pILfgVuxVvzUtwyDvm6syu1QPg8wNhkbIS8swX38MYQf2HCm8PcjfzEl8WobZ9HO6yz16dSTsjzBcpAxVtZmWIZcalkAQ//TSkJ/vYK78h8U67mZmtiUMu+mBdS4q3Ppp6PFqeOZw7fLIlEtJL03x7mQ5aZirDdo3mzisiQxZiS1NA1hXNYrdc3p/bQnwlrlbuJ7lxrKohjM8O1z7GEYJM7Yoj/A9k0B2gKJ8o5BKJpHjItPE8ESgCbnqplmflLYapnAcPUvillu8aromjE43Kz3y5F/a7gnFHpgRM9TmmDl6bDs3nEKtANfk/qwrUIN01W/H3Dj9fCctqTjFpUkkNkCp1HW8hd6TsCBOMZWW842RrF0dMzP37OrtwIHYRUvZ6Ozi9qiJHBDfG6tz0qmVMWbd7lKubZCvzmWRoIZb3Dswfkp71PCEJWAut4KfqvuunFltA4cSH59pnp1TtOy362Aad0dHpkD2jJkZbDhDn5Uo6vGAOYEir4OdIVoUCEagmH/Oj5bG/gbKY8A9Uu20C+6hTOjqfWETVEMLGOtk+0F/fzJKvxdka3oQoNWtghZGt1GU5YigCGUZ20aLDdONNAn3UwEfX1WxEx9qGp7dyIhdYACQbtwEsWi1FhQuPoJf4qMoUYA2MyTdPy1drXYge5zD4+u+RaoJUW3VmJ68Sr4DQLqGjGbTn/QLNnAGcipbUgz+NNVv5Hi5NBbtuN4HL0yjenyF+y7wiju3cQY/jr6xY7r52cs7d58x5MWJzZ0s96+dTmawlZtFq+GJu/9mTwXORNsxfisWLV6c+9XUwXmiIVmgfWlhklzM9/y2n00ftAoIRD3MfhR9LOpJGeE0Dk6JKK2m3+inHL19vTj7GwwehR9gkS2NwMNx9SjHjgtMu+MjFr3NfEm8EfPdWPSibj1EAXEO4eHh4eHh4eHh4eHh4eHh4eHhgYP/AMkKiXDi+tOSAAAAAElFTkSuQmCC" width="80">
				<span>가방</span>
			</a>
		</div>
		<div class="searchCategory">
			<a href="${cpath }/product/productList?category=category=신발" class="df ffcl">
				<img src="https://cdn-icons-png.flaticon.com/512/866/866692.png" width="80">
				<span>신발</span>
			</a>
		</div>
		<div class="searchCategory">
			<a href="${cpath }/product/productList?category=category=모자" class="df ffcl">
				<img src="data:image/png;base64,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" width="80">
				<span>모자</span>
			</a>
		</div>
		<div class="searchCategory">
			<a href="${cpath }/product/productList?category=category=시계" class="df ffcl">
				<img src="https://png.pngtree.com/png-vector/20191026/ourlarge/pngtree-wristwatch-icon-png-image_1871547.jpg" width="80">
				<span>시계</span>
			</a>
		</div>
	</div>
</div>
<header class="header">
	<div class="header_component">
		<div class="header_top">
			<div class="top_list jcfe">
				<ul class="jcfe">
					<li><a href="${cpath }/center/home_notice?page=1">고객센터</a></li>
					<li><a href="${cpath }/myPage/wishList?page=0">관심상품</a></li>
					<li><a href="${cpath }/myPage/home_myPage">마이페이지</a></li>
					<c:if test = "${not empty login }">
						<li><a href="${cpath }/member/logout">로그아웃</a></li>
					</c:if>
					<c:if test = "${empty login }">
						<li><a href="${cpath }/member/login">로그인</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<div class="header_bottom jcsb">
			<div class="header_logo aice"><a href="${cpath }"><img src="${cpath }/resources/img/logo.jpg" width="65"></a></div>
			<div class="header_nav aice">
				<ul class="df">
					<li><a href="${cpath }/trade/tradeList?page=1">TRADE</a></li>
					<li><a href="${cpath }/product/productList">SHOP</a></li> 
					<li><a href="${cpath }/event/eventList?nowPage=1&cntPerPage=4">EVENT</a></li>
					<li><img id="searchBtn" src="${cpath }/resources/img/search_icon.png" width="20px" style="cursor: pointer;"></li>
					<c:if test="${not empty login}">
						<li><img class="msg" src="https://cdn-icons-png.flaticon.com/512/1946/1946426.png" width="20px"></li>
					</c:if>
					<c:if test="${not empty login}">
						<li><a href="${cpath }/myPage/shopping?page=0"><img class="msg" src="https://cdn-icons-png.flaticon.com/512/481/481384.png" width="20px"></a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</header>

<script>
	const searchBtn = document.getElementById('searchBtn')
	const cancelBtn = document.getElementById('cancelBtn')
	const header_overlay = document.querySelector('.header_overlay')
	const searchComponent = document.querySelector('.search_component')
	const msg = document.querySelector('.header>.header_component>.header_bottom>.header_nav>ul>li >.msg')
	if(msg != null) {
		msg.addEventListener('click', onMsg)
	}
	searchBtn.onclick = onSearch
	cancelBtn.onclick = closeSearch
	header_overlay.onclick = closeSearch
</script>
	