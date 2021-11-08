<%@page import="admin_member.MemberSelect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hotel Ritz - 메인</title>
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
/* 관리자 메인페이지 */
/* #naviBar2{
position: absolute;
top: 15px;
} */
#nav {
	list-style: none;
	position: absolute;
	top: 15px;
}

#nav li {
	display: inline-block;
}
 
#nav a {
	color: #000000;
}

.button {
	border-radius: 10px;
	width: 70px;
	background-color: #454D55;
	color: #ffffff;
}

.member_select {
	background-color: #454D55;
}

#page {
	margin-top: 50px;
	padding-left: 420px;
}

.pagination>li>a {
	color: #343A40
}

.table{
	margin-top: 80px;
	margin-left: 50px;
	border: 1px solid #333;
	font-size: 15px;
	margin-bottom:0px;
	width:900px;
	text-align: center;
	}

th{
	width:50px;
	height:40px;
	font-size: 16px;
	text-align: center;
	vertical-align: middle;
	background-color: #dfdfdf;
	}
	
td{
	font-size: 16px;
	text-align: center;
	vertical-align: middel;
	color:#000000;
	background-color: #FFFFFF;
}

tr:hover td {
	background-color: #F1F3F4;
	cursor:pointer;
}

</style>

<script type="text/javascript">
	
</script>
</head>
<body>

	<div id="wrap">
		<!-- header/navibar import -->
		<c:import url="common/admin_header_nav.jsp" /> 
		
		<div id="container">
			<div id="reserv">
			<span id="mainMenu" onclick="location.href='#void'">오늘의 예약</span><br/>
			</div>
			<table  class="table table-bordered" id="table">
				<tr>
					<th>예약번호</th>
					<th>회원명</th>
					<th>객실</th>
					<th>인원</th>
				<tr>
					<td>12345678</td>
					<td>이기휘</td>
					<td>그랜드 디럭스 룸</td>
					<td>3</td>
				</tr>
				<tr>
					<td>12345678</td>
					<td>이기휘</td>
					<td>그랜드 디럭스 룸</td>
					<td>3</td>
				</tr>
				<tr>
					<td>12345678</td>
					<td>이기휘</td>
					<td>그랜드 디럭스 룸</td>
					<td>3</td>
				</tr>
				<tr>
					<td>12345678</td>
					<td>이기휘</td>
					<td>그랜드 디럭스 룸</td>
					<td>3</td>
				</tr>
			</table>
		</div>



	</div>

	<!-- footer import -->
	<c:import url="common/admin_footer.jsp" />

</body>
</html>
