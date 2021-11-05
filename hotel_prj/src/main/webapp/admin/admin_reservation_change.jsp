<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="예약관리 - 변경페이지"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hotel Ritz - 예약변경</title>
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
#container {
	font-weight:normal;
}

#title{
	font-weight:bold;
	color:#000000;
}
#subTitle{
	font-weight:normal;
	color:#000000;
}

#resNum{
	font-weight:bold;
}

td{
	vertical-align: top;
	text-align: left;
	padding-top:10px;
	padding-left: 30px;
	padding-bottom: 25px;
	font-size:16px;
}

textarea{
	font-size:15px;
	color:#000000;
	border: 1px solid #A3A4A4;
	padding: 5px;
	resize: none;
}

.form-control{
	font-size:15px;
	color:#000000;
	height:40px;
}

#date{
	width:100px;
	margin-right:10px	
}

#btnGroup{
	margin-left:300px
}

.btn {
	margin:20px;
}

</style>

<script type="text/javascript">
$(function(){
	
	$("#chgBtn").click(function(){
		alert("[" + $("#resNum").val() + "]의 예약이 변경되었습니다.");
		$("#chgFrm").submit();
	})//click

	$("#resetBtn").click(function(){
		alert("예약변경을 취소합니다.");
		history.back();
	})//click
	
})//ready
</script>
</head>
<body>
	<div id="wrap">
		
		<!-- header/navibar import -->
		<c:import url="common/admin_header_nav.jsp" /> 
		
		<div id="container" style="padding:50px">
		<span id="mainMenu" onclick="location.href='admin_reservation_change.jsp?resNum=${param.resNum}'">예약변경</span><br/><br/>
		<form name="chgFrm" id="chgFrm" action="http://localhost/hotel_prj/admin/admin_reservation_main.jsp" method="get" class="form-inline">
		 
		 <!-- 예약관리 메인 페이지에서 넘어오지 않았을 경우 redirect 해주기 (예약번호 선택 필요) -->
		 <c:if test="${empty param.resNum}">
		 	<% response.sendRedirect("http://localhost/hotel_prj/admin/admin_reservation_main.jsp"); %>
		 </c:if>
		 
		 <table>
		 <tr>
		   <!-- 예약 메인 페이지에서 선택된 예약번호를 받아서 설정 -->
		   <td>	<label id="title">* 예약번호</label> </td>
	       <td> <input type="text" name="resNum" id="resNum" class="form-control" value="${param.resNum}" readonly="readonly"/> </td>
		 </tr>
		 <tr>
		   <td> <label id="title">* 예약자명</label> </td>
		   <td> <input type="text" name="name" id="name" class="form-control" maxlength="10"/> </td>
		 </tr>
		 <tr>
		   <td> <label id="title">* 투숙날짜</label> </td>
		   <td>	<label id="subTitle">체크인</label><br/>
					<input type="text" id="date" name="inYear" class="form-control" placeholder="YYYY" maxlength="4"/>년 &nbsp;
		  			<input type="text" id="date" name="inMonth" class="form-control" placeholder="DD" maxlength="2"/>월 &nbsp;
		  			<input type="text" id="date" name="inDay" class="form-control" placeholder="YY" maxlength="2"/>일 &nbsp;
				<br/>
				<label id="subTitle" style="margin-top:15px" >체크아웃</label><br/>
					<input type="text" id="date" name="outYear" class="form-control" placeholder="YYYY" maxlength="4"/>년 &nbsp;
		  			<input type="text" id="date" name="outMonth" class="form-control" placeholder="DD" maxlength="2"/>월 &nbsp;
		  			<input type="text" id="date" name="outDay" class="form-control" placeholder="YY" maxlength="2"/>일 &nbsp;
		  	</td>
		  </tr>
		  <tr>
		   <td>	<label id="title">* 인원수</label> </td>
		  <td> <label id="subTitle">성인</label>
			<select name="adult" class="form-control" style="margin-left:50px">
				<option value="none">--인원수 선택--</option> 
				<option value="1">1명</option>
				<option value="2">2명</option>
				<option value="3">3명</option>
				<option value="4">4명</option>
		  	</select>
		  	<br/>
			<label id="subTitle" style="margin-top:15px">어린이</label>
			<select name="child" class="form-control" style="margin-left:32px;">
				<option value="none">--인원수 선택--</option> 
				<option value="0">0명</option>
				<option value="1">1명</option>
				<option value="2">2명</option>
				<option value="3">3명</option>
		  	</select>
			<span style="font-size:12px;">&nbsp;&nbsp;어린이는 성인 동반 필수</span>
		  </td>
		  </tr>
		  <tr>
		  <td> <label id="title">* 객실</label> </td>
		  <td> <select name="room" class="form-control">
				<option value="none">--객실 선택--</option>
				<option value="그랜드 디럭스 룸">그랜드 디럭스 룸</option>
				<option value="리츠 프리미어 룸">리츠 프리미어 룸</option>
				<option value="코리안 스위트 룸">코리안 스위트 룸</option>
				<option value="프리미어 스위트 룸">프리미어 스위트 룸</option>
				<option value="로얄 스위트 룸">로얄 스위트 룸</option>
		  	</select>
		  </td>
		  <tr> 
		  <td> <label id="title">* 추가 요청</label> </td>
		  <td> <textarea name="addReq" rows="3" cols="80"></textarea> </td>
		  </tr>
		</table>
		
		<div id="btnGroup">
		<input type="button" id="chgBtn" name="chgBtn" class="btn btn-primary btn-lg" value="예약변경"/>
		<input type="reset" id="resetBtn" name="resetBtn" class="btn btn-default btn-lg" value="취소"/>
		</div>
		
		</form>
		</div>
		 
		<!-- footer import -->
		<c:import url="common/admin_footer.jsp" />
		
	</div>
</body>
</html>