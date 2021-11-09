<%@page import="java.util.List"%>
<%@page import="admin_room.RoomSelect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="객실관리 메인"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hotel Ritz - 객실관리</title>
<link rel="stylesheet" type="text/css"
	href="http://localhost/hotel_prj/common/css/main_v20211012.css">

<!-- jQuery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 관리자 메인 CSS -->
<link rel="stylesheet" type="text/css"
	href="http://localhost/hotel_prj/admin/css/admin_main.css">
	
<style type="text/css">
#addBtn{
	margin-top:30px;
	margin-left:45px;
}

#roomList{
	width:100%;
	padding-left:20px;
	border-bottom: 1px solid #454D55;
}

#roomTab{
	height:250px;
	text-align: left;
}

.mainTd{
	width : 170px;
	padding : 10px;
	font-size: 16px;
	font-weight: normal;
	color:#000000;
	text-align: center;
}

.mainTd:hover{
	cursor:pointer;
}

.room{
	width:120px;
	margin-bottom: 10px;
	border : 1px solid #454D55;
}

</style>
<script type="text/javascript">
$(function(){
	 $("#roomtab tr").click(function(){
		//현재 선택된 tr과 td
			let tr = $(this);
			let td = tr.children();

			//선택된 행에서 예약번호 얻어오기
			let resNum = td.eq(0).text();
			
			if(resNum != "예약번호" && resNum != null){
			//해당 예약번호를 예약변경 페이지로 전송!
				$("#resNum").val(resNum);
				$("#chgFrm").submit();
			}//end if
		 
	 })//click
	 
	 $("#addBtn").click(function(){
		 location.href="http://localhost/hotel_prj/admin/admin_room_add.jsp";
	 })//click
}) 
</script>
</head>
<body>
	<div id="wrap">
		
		<!-- header/navibar import -->
		<c:import url="common/admin_header_nav.jsp" /> 
	
		<!-- 컨테이너 시작 -->
		<div id="container" style="padding:50px"> 
		<span id="mainMenu" onclick="location.href='http://localhost/hotel_prj/admin/admin_room_main.jsp'">객실</span><br/>
		<input type="button" id="addBtn" class="btn btn-primary" value="객실 추가"/>
		<div id="roomList"> 
		<form name="mainFrm">
		
		<% 
		RoomSelect room = new RoomSelect();
		pageContext.setAttribute("roomList", room.selectRoomInfo(null));
		%>
				
		<table id="roomTab">
		<tr>
		  <c:forEach var="roomList" items="${ roomList }">
	        <c:set var="rStatus" value="roomStatusY"/>
		         <c:set var="height" value=""/>
			<td class="mainTd">
			 <c:if test="${roomList.getrStatus() eq 'N'}">
		         <c:set var="rStatus" value="roomStatusN"/>
		         <c:set var="height" value="style='height:110px'"/>
		 	 </c:if>
  			<img src="http://localhost/hotel_prj/images/${rStatus}.png" ${height} name="rStatus" id="rStatus" class="room img-rounded"/>
			<br/>
			<c:out value="${roomList.getRoomName()}"/></td>
		  </c:forEach>
		</tr>
		</table>
		</form>
		</div> <!-- roomList div -->

		<div id="viewRoom">
		</div>
		
		</div>
		
		<!-- footer import -->
		<c:import url="common/admin_footer.jsp" />
		
	</div>
</body>
</html>