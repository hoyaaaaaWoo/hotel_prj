<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="사용자 화면 헤더와 네비바"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div class="navbar-wrapper"
	style="width: 100%; margin: 0px auto; position: fixed;">
	<div style="height: 60px; background-color: #FFFFFF">
	<div style="height: 20px;  background-color: #FFFFFF"></div>
		<span id="logo"
			onclick="location.href = 'http://localhost/hotel_prj/main/Hotel_Ritz_Seoul.jsp'">
			<strong>Hotel Ritz Seoul</strong>
		</span> <span> <a href="http://localhost/hotel_prj/user/login/login.jsp" id="linkLogin">로그인</a></span>
		 <span> <a href="http://localhost/hotel_prj/user/reser_chk/reservation_inq.jsp" id="linkResView">예약조회</a>
		</span> <span> <a href="http://localhost/hotel_prj/user/mypage/Mypage.jsp" id="linkMyPage">마이페이지</a></span>
	</div>
	<div style = "background-color: #000000">
		<nav>
			<table id="navTab">
				<tr>
					<td class="navTd" onclick="location.href = '#void'">객실 예약</td>
					<td class="navTd"
						onclick="location.href = 'http://localhost/hotel_prj/main/dining.jsp'">다이닝
						예약</td>
					<td class="navTd"
						onclick="location.href = 'http://localhost/hotel_prj/main/drive.jsp'">드라이브
						스루</td>
					<td class="navTd"
						onclick="location.href = 'http://localhost/hotel_prj/main/specialOffer.jsp'">스페셜
						오퍼</td>
					<td class="navTd"
						onclick="location.href = 'http://localhost/hotel_prj/main/wedding.jsp'">웨딩&컨벤션</td>
				</tr>
			</table>
		</nav>
	</div>
</div>

<br />
<br />
<br />
<br />
<br />