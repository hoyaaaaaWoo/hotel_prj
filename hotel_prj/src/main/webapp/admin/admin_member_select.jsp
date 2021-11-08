<%@page import="admin_member.MemberUpdate"%>
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
<title>Hotel Ritz - 회원관리</title>
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
$(function(){
$("#search").click(function(){
	$("#frm_search").submit();
})//click
})//ready

function updateData( kname ,i){
	if( confirm( kname + "님 회원정보를 변경하시겠습니까?") ){
		$("#kname").val( kname );
		$("#tel").val( $("#tel"+i).val() );
		$("#address").val( $("#address"+i).val() );
		$("#m_status").val( $("#m_status"+ i).val() );
		
	  	$("#hiddenFrm").submit();
	}//end if
}//updateData


</script>
</head>
<body>
<jsp:useBean id="ev" class="admin_member.MemberVO" scope="page"/>
<jsp:setProperty property="*" name="ev"/>
<c:catch var="e">
<%
request.setCharacterEncoding("utf-8");
MemberSelect ms = new MemberSelect();
List<MemberVO> list = ms.selectMember(null);
pageContext.setAttribute("memberData", list);
%>
</c:catch>
	<div id="wrap">
		<!-- header/navibar import -->
		 <c:import url="common/admin_header_nav.jsp" />  

		<!-- 컨테이너 시작 -->
		<div id="container">
			<div id="naviBar2">
				<span id="mainMenu" onclick="location.href='http://localhost/hotel_prj/admin/admin_member_select.jsp'">회원조회</span> &nbsp; 
				<span id="mainMenu" style="text-decoration: none" onclick="location.href='http://localhost/hotel_prj/admin/admin_member_delete.jsp'">탈퇴회원</span>
				<form name="frm_search" action="http://localhost/hotel_prj/admin/admin_member_specific_select.jsp" method="post">
				<input type="text" name="search" placeholder="이름조회" id="id_search" class="form-control" maxlength="10"/>
				<input type="submit" value="검색" name="search" class="btn btn-default" id="search" />
				</form>				
			
			</div>
			<table class="table table-bordered"  id="table">
			 <c:if test="${ empty memberData }">
   			<tr> 
     		 <td colspan="5">회원정보가 존재하지 않습니다.</td>
   			</tr>
   			</c:if>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>영문이름</th>
					<th>탈퇴여부</th>
				<c:forEach var="member" items="${memberData}">
				<c:set var="i" value="${ i+1 }"/>
				<tr>
					<td><input type="text" value="${member.id}"size="15px;" style="text-align: center;" readonly="readonly"/ ></td>
					<td><input type="text" value="${member.kname}"  id="kname" size="15px;" style="text-align: center;"readonly="readonly"/></td>
					<td><input type="text" value="${member.birth_year}"style="text-align: center;"readonly="readonly"/></td>
					<td><input type="text" id="tel${i}"value="${member.tel}" size="15px;"style="text-align: center;"/></td>
					<td><input type="text" id="email${i}" value="${member.email}" style="text-align: center;"/></td>
					<td><input type="text" value="${member.ename_fst}${member.ename_lst }"size="15px;"style="text-align: center;"readonly="readonly"/></td>
					<td><input type="text" id="m_status${i}"value="${member.m_status}"  size="4px;" style="text-align: center;"/></td>
					<td><input type="button" name="del" value="변경"  
						class="btn btn-danger" id="del" onclick="updateData('${member.kname}',${i})"/></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<form  action="admin_member_update_process.jsp"   method="post" name="hiddenFrm" id="hiddenFrm" >
		<input type="hidden" name="kname" id="kname"/>
		<input type="hidden" name="tel" id="tel"/>
		<input type="hidden" name="address" id="address"/>
		<input type="hidden"  name="m_status" id="m_status"/>
		</form>
		
		<!-- footer import -->
		<c:import url="common/admin_footer.jsp" />
	</div>
</body>
</html>