<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="예약관리 메인"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hotel Ritz - 예약관리</title>
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
#date{
	font-size: 15px;
	margin: 20px;
	padding-bottom :30px;
	border-bottom: 1px solid #454D55;
	width:1300px;
	hegiht:300px;
}

#resList{
	font-size: 15px;
	margin-left: 20px;
	margin-bottom:0px;
}

#year,#month,#day{
	width:120px;
	margin-right: 5px;
	font-size: 15px;
	color:#000000}

.table{
	width:1100px;
	margin-top: 40px;
	}

th{
	width:250px;
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
.btn{
	font-weight: bold;
}
#page{
	margin-top : 20px;
	padding-left:420px;
}
.pagination>li>a {color:#343A40}

tr:hover td {
	background-color: #F1F3F4;
	cursor:pointer;
}

</style>

<script type="text/javascript">
$(function(){
	
	$("#searchBtn").click(function(){
		
		let year = $("#year").val();
		let month = $("#month").val();
		let day = $("#day").val();
		
		if(year == "" || month == "" || day == ""){
			alert("날짜를 입력해주세요.");
			$("#year").focus();
			return;
		}//end if
		
		$("#dateFrm").submit();
		
	})//날짜검색 click
	
	/* 테이블 데이터 클릭시, 페이지 이동 및 값 넘기기 */
	$("#resList tr").click(function(){
		//현재 선택된 tr과 td
		let tr = $(this);
		let td = tr.children();

		//선택된 행에서 예약번호 얻어오기
		let resNum = td.eq(0).text();
		
		//해당 예약번호를 예약변경 페이지로 전송!
		location.href="http://localhost/jsp_prj/project02_team03/admin/admin_reservation_change.jsp?resNum="+resNum;
	})//table click
	
	/* 삭제 버튼 클릭시, 예약번호 get & 삭제 메시지 출력 */
	$(".delBtn").click(function(){
		//선택된 버튼 할당
		var delBtn = $(this);
		//선택된 버튼에 해당하는 행과 각 td
		let tr = delBtn.parent().parent(); 
		let td = tr.children();
		//예약번호 얻기
		let resNum = td.eq(0).text();
		
		if(resNum == " "){
			alert("존재하는 예약건을 선택해주세요.");
			return;
		}//end if
		
		let flag = confirm("["+resNum+"] 예약을 삭제하시겠습니까?");
		if(flag == true){
			alert("예약이 삭제되었습니다.")
		}else{
			alert("예약 삭제 진행을 취소합니다.");
		}//end else
			
	})//table click
	
})//ready

</script>
</head>
<body>
	<div id="wrap">
		<!-- header/navibar import -->
		<c:import url="common/admin_header_nav.jsp" /> 
		
		<div id="container" style="padding:50px">
		<form name="dateFrm" id="dateFrm" action="http://localhost/hotel_prj/admin/admin_reservation_main.jsp" method="get" class="form-inline">
		 <span id="mainMenu" onclick="location.href='http://localhost/hotel_prj/admin/admin_reservation_main.jsp'">체크인 날짜 검색</span><br/><br/>
		 <div id="date">
		  	<input type="text" id="year" name="year" class="form-control" placeholder="YYYY" maxlength="4"/>년 &nbsp;
		  	<input type="text" id="month" name="month" class="form-control" placeholder="DD" maxlength="2"/>월 &nbsp;
		  	<input type="text" id="day" name="day" class="form-control" placeholder="YY" maxlength="2"/>일 &nbsp;
		  	<input type="button" id="searchBtn" name="searchBtn" class="btn btn-default" value="검색"/>
		 </div>
		 </form>
		 
		 <form name="resFrm" action="http://localhost/hotel_prj/admin/admin_reservation_main.jsp" method="get">
		 <div id="resList">
		 <!-- 테이블은 조회내용대로 동적으로 생성 예정 / scriptlet 활용 -->
		 <table class="table table-bordered" id="resList">
		 <tr>
		 	<th>예약번호</th>
		 	<th>예약자명</th>
		 	<th>투숙날짜</th>
		 	<th>인원수</th>
		 	<th>객실</th>
		 	<th>예약관리</th>
		 </tr>
		 
		 <tr>
		 	<td>1019R01</td>
		 	<td>김나나</td>
		 	<td>2021.10.22-2021.10.23</td>
		 	<td>2</td>
		 	<td>그랜드 디럭스 룸</td>
		 	<td onclick="event.cancelBubble=true">
		 	<input type="button" id="delBtn" name="delBtn" class="delBtn btn btn-danger" value="예약삭제"></td>
		 </tr>
		 <tr>
			<td>1019R02</td>
			<td>한하나</td>
		 	<td>2021.10.25-2021.10.28</td>
		 	<td>1</td>
		 	<td>리츠 프리미어 룸</td>
		 	<td onclick="event.cancelBubble=true">
		 	<input type="button" id="delBtn" name="delBtn" class="delBtn btn btn-danger" value="예약삭제"></td>
		 </tr>
		 <tr>
			<td> </td>
			<td> </td>
		 	<td> </td>
		 	<td> </td>
		 	<td> </td>
		 	<td onclick="event.cancelBubble=true">
		 	<input type="button" id="delBtn" name="delBtn" class="delBtn btn btn-danger" value="예약삭제"></td>
		 </tr>
		 <tr>
			<td> </td>
			<td> </td>
		 	<td> </td>
		 	<td> </td>
		 	<td> </td>
		 	<td onclick="event.cancelBubble=true">
		 	<input type="button" id="delBtn" name="delBtn" class="delBtn btn btn-danger" value="예약삭제"></td>
		 </tr>
		 <tr>
			<td> </td>
			<td> </td>
		 	<td> </td>
		 	<td> </td>
		 	<td> </td>
		 	<td onclick="event.cancelBubble=true">
		 	<input type="button" id="delBtn" name="delBtn" class="delBtn btn btn-danger" value="예약삭제"></td>
		 </tr>
		 </table>
		 </div>
		 </form>
		 
		 <div id="page">
		  <ul class="pagination">
    		<li>
    			<a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
    		</li>
    		<li><a href="#">1</a></li>
    		<li><a href="#">2</a></li>
    		<li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
  		 	<li><a href="#">5</a></li>
   		 	<li>
     			<a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
   			</li>
 		 </ul>
		</div>
		</div>
		 
	    <!-- footer import -->
		<c:import url="common/admin_footer.jsp" />
	
	</div>
</body>
</html>