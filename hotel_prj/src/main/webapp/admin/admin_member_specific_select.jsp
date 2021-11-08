<%@page import="admin_member.MemberVO"%>
<%@page import="java.util.List"%>
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
<title>Hotel Ritz - 특정회원조회</title>
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

.button {
	border-radius: 10px;
	width: 70px;
	background-color: #454D55;
	color: #ffffff;
}

.member_select {
	background-color: #454D55;
}

#page{
	margin-top : 50px;
	padding-left:420px;
}

.pagination>li>a {color:#343A40}

.form-control{
	font-size:15px;
	color:#000000;
	height:40px;
	width: 180px;
	margin:0px;
}

.table{
	margin-top: 80px;
	margin-left: 50px;
	font-size: 15px;
	margin-bottom:0px;
	width:1200px;
	text-align: center;
	
	}

th{
	width:80px;
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

#id_search{
position: absolute; top: 80px; left: 1000px;
}

#search{
position: absolute; top: 80px; left: 1200px;
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
			<div id="naviBar2">
				<span id="mainMenu" onclick="location.href='#void'">특정회원조회</span>
				<form name="frm_search" action="http://localhost/hotel_prj/admin/admin_member_specific_select.jsp" method="post">
				<input type="text" name="search" placeholder="이름조회" id="id_search" class="form-control" maxlength="10"/>
				<input type="submit" value="검색" name="search" class="btn btn-default" id="search" />
				</form>		
			</div>

			<table class="table table-bordered" id="table">
			
				<tr>
					<th><strong>아이디</strong></th>
					<th><strong>이름</strong></th>
					<th><strong>생년월일</strong></th>
					<th><strong>연락처</strong></th>
					<th><strong>이메일</strong></th>
					<th><strong>영문이름</strong></th>
					</tr>
					<c:catch var="e">
					<%
					request.setCharacterEncoding("utf-8");
					String kname=request.getParameter("search");
					MemberSelect ms = new MemberSelect();
					pageContext.setAttribute("kname", ms.selectSpecificMember(kname));
					%>
				<tr>
					<td><c:out value="${kname.id}"/></td>
					<td><c:out value="${kname.kname}"/></td>
					<td><c:out value="${kname.birth_year}"/></td>
					<td><c:out value="${kname.tel}"/></td>
					<td><c:out value="${kname.email}"/></td>
					<td><c:out value="${kname.ename_fst}${kname.ename_lst}"/></td>
				</tr>
					</c:catch>
				<c:if test="${ not empty e }">
				<tr>
				<td colspan="7">
				<span style="color: #ff0000"><c:out value="${ param.search }"/></span>회원은 존재하지 않습니다.
				</td>
				</tr>
				</c:if>
			</table>

		</div>
	<!-- footer import -->
	<c:import url="common/admin_footer.jsp" />

	</div>
</body>
</html>