<%@page import="admin.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="admin.MemberSelect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hotel Ritz - 회원관리</title>
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

.button {
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
/* function deleteData(kname){
	if(confirm( kname+ "회원을 삭제하시겠습니까?"  )){
	$("#removeKname").val( kname );
	$("#removeFrm").submit();
	}
	}
} */
</script>
</head>
<body>

<%
MemberSelect ms=new MemberSelect();
List<MemberVO> list =ms.selectMember(null);
pageContext.setAttribute("memberData", list);
%>


	<div id="wrap">
		<!-- header/navibar import -->
		 <c:import url="common/admin_header_nav.jsp" />  

		<!-- 컨테이너 시작 -->
		<div id="container">
			<div id="naviBar2">
				<span id="mainMenu" onclick="location.href='http://localhost/hotel_prj/admin/admin_member_select.jsp'">회원조회</span> &nbsp; 
				<span id="mainMenu" style="text-decoration: none" onclick="location.href='http://localhost/hotel_prj/admin/admin_member_delete.jsp'">탈퇴회원</span>
				<form name="frm_search" action="http://localhost/gp_2/admin/admin_member_specific_select.jsp" method="post">
				<input type="text" name="search" placeholder="이름조회" id="id_search" class="form-control" maxlength="10"/>
				<input type="submit" value="검색" name="search" class="btn btn-default" id="search"/>
				</form>
			</div>
			 <c:if test="${ empty memberData }">
   			<tr> 
     		 <td colspan="5">사원정보가 존재하지 않습니다.</td>
   			</tr>
   			</c:if>
			<table class="table table-bordered"  id="table">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>영문이름</th>
					<th>회원삭제</th>
				<c:forEach var="member" items="${memberData}">
				<tr>
					<td><input type="text" value="${member.id}"/></td>
					<td><input type="text" value="${member.kname}"/></td>
					<td><input type="text" value="${member.birth_year}"/></td>
					<td><input type="text" value="${member.tel}"/></td>
					<td><input type="text" value="${member.email}"/></td>
					<td><input type="text" value="${member.ename_fst}${member.ename_lst }"/></td>
					<td><input type="button" name="del" value="삭제"
						class="btn btn-danger" id="del" onclick='deleteData("${member.kname}")'/></td>
				</tr>
				</c:forEach>
			</table>
			<!-- 
				<form name="removeFrm" id="removeFrm" action="admin_member_select.jsp" method="post">
				<input type="hidden" name="id" id="removeId"/>
				<input type="hidden" name="kname" id="removeKname"/>
				<input type="hidden" name="birth_year" id="removeBirth_year"/>
				<input type="hidden" name="tel" id="removeTel"/>
				<input type="hidden" name="email" id="removeEmail"/>
				<input type="hidden" name="ename" id="removeEname"/>
			</form> -->
			
			<div id="page">
				<ul class="pagination">
					<li><a href="#" aria-label="Previous"><span
							aria-hidden="true">&laquo;</span></a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
					</li>
				</ul>
			</div>

		</div>

		<!-- footer import -->
		<c:import url="common/admin_footer.jsp" />

	</div>
</body>
</html>