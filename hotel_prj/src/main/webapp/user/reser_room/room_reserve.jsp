<%@page import="java.util.Arrays"%>
<%@page import="user_room.RoomVO"%>
<%@page import="user_room.RoomSelect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="Hotel Ritz Seoul"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Hotel_Ritz_Seoul</title>
<!-- 메인 CSS -->
<link rel="stylesheet" type="text/css"
	href="http://localhost/hotel_prj/main/main.css">

<style type="text/css">
.button {
	border: 1px solid #E9E9E9;
	font-weight: bold;
	background-color: #000;
	color: #F5DF3C;
	width: 300px;
	height: 40px;
	cursor: pointer;
	text-align: center;
	border-radius: 7px;
}

.roomView {
	width: 720px;
	height: 405px;
}
</style>

<!-- Bootstrap core CSS -->
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

<script src="http://localhost/jsp_prj/common/bootstrap/holder.js"></script>

<script
	src="http://localhost/hotel_prj/common/bootstrap/ie-emulation-modes-warning.js"></script>

<link href="http://localhost/hotel_prj/common/bootstrap/carousel.css"
	rel="stylesheet">

<script type="text/javascript">
$(function () {
	
	$("#deluxe").click(function() {
		location.href="http://localhost/hotel_prj/user/reser_room/reservation2.jsp";
	});
	
	$("#description").click(function() {
		
		if($("#description").val()=="open"){
			var output = "[그랜드 디럭스 룸, 40㎡~50㎡]<br>우아한 인테리어와 현대적 세련미가 조화롭게 어우러진 시그니엘 서울의 그랜드 디럭스 룸은 <br>서울 시내 동급 호텔 대비 넓은 40~50㎡의 여유로운 공간을 제공합니다.<br>87층부터 101층까지 위치한 초고층 객실에서 바라보는 서울 도심의 파노라믹뷰는 최상의 휴식을 제공합니다.<br>모든 호텔 투숙객들이 자유롭게 이용할 수 있는 살롱 드 시그니엘은 시그니엘 서울의 또 하나의 즐길 거리입니다.";
			document.getElementById("view").innerHTML = output;
			$("#description").val("close");
			}else{
			$("#description").val("open");
			document.getElementById("view").innerHTML = "";
				
			}
	});
	
	
	
	
});
	
	

</script>
</head>

<!-- NAVBAR
================================================== -->

<body>
<c:forEach var = "room_no" items = "${ RoomNo }">
</c:forEach>

<%
	String[] paramRoomNo = request.getParameterValues("rev_room_num");
	
/* 
 	
	RoomSelect rs = new RoomSelect();
	pageContext.setAttribute("RoomNo", rs.selectAllRoomNo() ); 
	
 */	
%>


<jsp:include page="../../main/main_header_nav.jsp"/>
		<br/><br/><br/>

	<div style="width: 720px; margin:0px auto; text-align: center;">
 		 <input type="button" id = "roomIntroBtn" value="${param.room_no}" class="btn btn-default" style="width: 100px;">	
  			&nbsp;	&nbsp; 	&nbsp;
 		 <input type="button" id = "roomReserBtn" value="객실예약" class="btn btn-default" style="width: 100px;" >
  		</div><br/>
  		<hr class = "hr1">
		<br/><br/><br/>

	<form name="resRoom" id="resRoom" action="http://localhost/hotel_prj/user/reser_room/reservation2.jsp" method="get">
	
	<%-- <c:forEach var = "room_no" items = "${ RoomNo }"> --%>
	<%
	RoomSelect rs=new RoomSelect();
	
	RoomVO tempRoom=null;
	for(int i= 0 ; i <paramRoomNo.length ; i++){
		tempRoom = rs.selectRoomInfo(Integer.parseInt( paramRoomNo[i]));
		pageContext.setAttribute("serachRoom", tempRoom);
	%>
	<!-- 그랜드 디럭스 더블 -->
	<div style="width: 1000px; margin: 0px auto;">
		<table style="width: 1000px;">
			<tr>
				<td style="width: 252px;" rowspan="2">
				<img src="http://localhost/hotel_prj/images/01_grand01.jpg %>"
					style="width: 270px; height: 187px;">&nbsp;&nbsp;&nbsp;</td>
				<td style="height: 100px;"><br><br><br>
				<span style="font-size: 25px; font-weight: bold;">&nbsp;&nbsp;</span>
				<input type="button" id="description" value="open" class="btn" style="margin-left: 30px;">
				<hr/>
				</td>
			</tr>
			
			<tr>
				<td style="height: 87px;">&nbsp;&nbsp; 전망 ${ serachRoom.r_view }| 객실면적 40㎡~50㎡
				<br><br><br><br>
			</tr>
			
		</table>
		
		<div id="view"></div>
		<input type="button" class="button" id="deluxe" name="grand" style="width: 100px; float: right;" value="${ room_no }">
	</div>
	<% }//end for %>
<%-- 	</c:forEach> --%>
	<br><br>
	<br><br>
	<hr/>
	</form>


	<br />
	<br />
	<br />
	<br />
	<br />
	<div style="width: 1000px; margin: 0px auto; text-align: center;">
		<input type="submit" class="button" style="width: 100px;" value="홈으로">
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
<!-- FOOTER -->
<jsp:include page="../../main/main_footer.jsp"/>

	<!-- Bootstrap core JavaScript
    ================================================== -->

	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="http://localhost/jsp_prj/common/bootstrap/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
