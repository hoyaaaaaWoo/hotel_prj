<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="관리자 공통 디자인 - header, navi"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%-- <%
 /////////////// 개발완료 후 주석 해제 필요!! /////////////// 
 // 관리자 로그인 세션 검증  
 	String userid = (String)session.getAttribute("userid"); 
	 if( userid == null ) { %> --%>
<!--  	<script type="text/javascript">
 	alert("로그인 되지 않았습니다.");
 	location.href="http://localhost/hotel_prj/admin/common/admin_login.jsp";
 	</script> --> 
<%-- <%}%>      --%>


		<div id="header">
		Hotel Ritz Seoul  &nbsp; &nbsp;
		<span class="glyphicon glyphicon-home cursor" aria-hidden="true" onclick="location.href='http://localhost/hotel_prj/admin/admin_main.jsp'"></span>
		<span class="glyphicon glyphicon-user" aria-hidden="true" id="adminImg" ></span>
		<span style="position: absolute; right: 10px; top: 7px;"><strong> <%-- <%= userid %> --%>   </strong></span>
		<span id="logOut" class="cursor" onclick="location.href='http://localhost/hotel_prj/admin/common/admin_logout_process.jsp'">로그아웃</span>
		</div>

		<nav id="naviBar">
			<ul>
				<li><a href="http://localhost/hotel_prj/admin/admin_member_select.jsp"><span
						class="glyphicon glyphicon-triangle-right"></span> 회원관리</a></li>
				<li><a href="http://localhost/hotel_prj/admin/admin_reservation_main.jsp"><span
						class="glyphicon glyphicon-triangle-right"></span> 예약관리</a></li>
				<li><a href="http://localhost/hotel_prj/admin/admin_room_main.jsp"><span
						class="glyphicon glyphicon-triangle-right"></span> 객실관리</a></li>
			</ul>
		</nav>
		
