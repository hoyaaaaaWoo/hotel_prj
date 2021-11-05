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
	href="http://localhost/jsp_prj/common/css/main_v20211012.css">

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
	width:1200px;
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
	 $("td").click(function(){
		 location.href="http://localhost/hotel_prj/admin/admin_room_main_roomview.jsp";
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
		<!-- 추가되면 동적으로 테이블 생성 예정!! -->
		<form name="mainFrm">
		<table id="roomTab">
		<tr>
			<td class="mainTd">
			<img src="http://localhost/hotel_prj/images/roomStatusY.png" name="room" class="room img-rounded"/>
			<br/>
			그랜드 디럭스 룸</td>
			<td class="mainTd">
			<img src="http://localhost/hotel_prj/images/roomStatusY.png" name="room" class="room img-rounded"/>
			<br/>
			리츠 프리미어 룸</td>
		</tr>
		</table>
		</form>
		</div>
		
		<div id="viewRoom">
		</div>
		
		</div>
		
		<!-- footer import -->
		<c:import url="common/admin_footer.jsp" />
		
	</div>
</body>
</html>