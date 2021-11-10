<%@page import="user_room.RoomVO"%>
<%@page import="user_room.RoomSelect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="Hotel Ritz Seoul"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

.hr1 {border-bottom: 1px solid #d3d3d3; }

#resConf {width: 1000px; height: 60px; font-size: 20px; font-weight: bold}
.resChk { width: 1000px; height: 1800px; color: #5A5A5A; margin: 0px auto; text-align: center;}

.chkDiv {width: 1000px; color: #5A5A5A; margin: 0px auto; text-align: center; }
.chkTab {width: 1000px; height: 450px; color: #5A5A5A; text-align: left; margin: 0px auto; table-layout: fixed;
		}


.guide {font-size: 17px; font-weight: bold; padding-left: 20px; }				
.guideText {font-size: 15px; }				

#chkSubTab {width: 500px; border: 1px solid #d3d3d3;}
.guideTextP {font-size: 15px; padding-left: 20px; padding-top: 10px; padding-bottom: 10px}				
.guideTextPR {font-size: 15px;  padding-right: 20px; padding-top: 10px; padding-bottom: 10px; float: right; font-weight: bold}				

.total {width: 1000px; height: 70px; font-size: 20px; font-weight: bold; color: #333; table-layout: fixed;}

.guideDiv {width: 1000px; height: 300px; /* border: 10px solid #FFFF00 */}
.guideTitle {width: 1000px; height: 40px;color: #333;; font-size: 20px; font-weight: bold;
				text-align: left;}
.back {width: 1000px; height: 200px; background-color: #FAFAFA; padding: 50px}
.backTab {width: 900px; height: 100px; margin: 0px auto; table-layout: fixed;}


/*
div { border: 1px solid #0000FF}
td { border: 1px solid #FF0000}
tr { border: 1px solid #FF0000}
span { border: 1px solid #FF00FF}
p { border: 1px solid #FF00FF}
*/


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

<link href="http://localhost/hotel_prj/common/bootstrap/carousel.css"
	rel="stylesheet">
	

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4770be2574c85940d843f0c412764fd2"></script>
<script>
$(function(){

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.51271451389996, 127.10252419812018), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.51271451389996, 127.10252419812018); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var  // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(37.51271451389996, 127.10252419812018); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
	
}); //ready
</script>

<script type="text/javascript">
$(function(){
	$("#goHomeBtn").click(function(){
		location.href="http://localhost/hotel_prj/main/Hotel_Ritz_Seoul.jsp";
	})//table click
	
}); //ready

</script>	
	
</head>

<!-- NAVBAR
================================================== -->
<body>

<%
 String paramRoomNo = request.getParameter("room_no");
int room_no = Integer.parseInt( paramRoomNo );

String addReq = request.getParameter("addReq"); 

 /*
String card_no = request.getParameter("card_no");
String company = request.getParameter("company");
String val_MM = request.getParameter("val_MM");
String val_YY = request.getParameter("val_YY");*/

RoomSelect rs = new RoomSelect();
RoomVO rv = rs.selectRoomInfo(room_no);  

%>
	<div class="wrapper">
		<!-- header/navibar import -->
		<c:import url="http://localhost/hotel_prj/main/main_header_nav.jsp" />
		<br/><br/><br/><br/><br/>
		
		
		<!--================================================== -->

		<div class = "resChk">
			<div class = "chkDiv">
			<div id = "resConf">예약이 완료되었습니다.  ${param.room_no} ${param.addReq } ${param.card_no } ${param.company } ${param.val_MM } ${param.val_YY }</div>
			<table class = "chkTab">
			<tr >
				<td style = "width: 500px">
				<img src = "http://localhost/hotel_prj/main/main_images/<%= rv.getMain_img() %>" width="480" height="330"/><br/><br/>
				</td>
				
				<td >
				<table id = "chkSubTab">
				<tr>
					<td class = "guide">객실</td>
					<td class = "guideTextP"><%= rv.getR_name() %></td>
				</tr>
				<tr>
					<td class = "guide">투숙 날짜</td>
					<td class = "guideTextP">2021년 11월 26일 - 2021년 11월 27일 (1박)</td>
				</tr>
				<tr>
					<td class = "guide">인원</td>
					<td class = "guideTextP">성인2, 어린이0</td>
				</tr>
				</table> <br/>
				
				<table id = "chkSubTab">
				<%
				int price = rv.getPrice();
				pageContext.setAttribute("price", price);
				
				int tax = (int)(rv.getPrice()*0.21);
				pageContext.setAttribute("tax", tax);
				
				int totalP = (int)(rv.getPrice()+tax);
				pageContext.setAttribute("totalP", totalP);
				%>
				<tr>
					<td class = "guide">객실요금</td>
					<td class = "guideTextPR"><fmt:formatNumber pattern = "#,###,###" value = "${ price }"/> KRW</td>
				</tr>
				<tr>
					<td class = "guide">세금 및 봉사료</td>
					<td class = "guideTextPR"><fmt:formatNumber pattern = "#,###,###" value = "${ tax }"/> KRW</td>
				</tr>
				</table><br/>
				
				<span class = "guide">요금정책</span><br/>
				<span class = "guideText"> ㆍ 상기 요금에 세금 및 봉사료가 각 10%가 가산됩니다. (총 21%) <br/>
				ㆍ 상기 요금에 조식은 포함되어 있지 않습니다. </span>
				</td>
			</tr>
			</table>
			
			<hr class = "hr1">
			<table class = "total">
			<tr>
				<td></td>
				<td>총 요금</td>
				<td><fmt:formatNumber pattern = "#,###,###" value = "${ totalP }"/> KRW</td>
			</tr>
			</table>
			<hr class = "hr1">
			</div><!-- chkDiv --><br/><br/><br/>
			
			
			<div class = "guideDiv">
			<div class = "guideTitle"> 예약자 정보</div>
			<div class = "back">
			<table class = "backTab">
			<tr>
				<td class = "guide">성(영문)</td>
				<td class = "guideText">Woo</td>
				<td class = "guide">연락처</td>
				<td class = "guideText">820144065532</td>
				
			</tr>
			<tr>
			</tr>
				<td class = "guide">이름(영문)</td>
				<td class = "guideText">Jiho</td>
				<td class = "guide">이메일</td>
				<td class = "guideText">woojiho22@naver.com</td>
			</table>
			</div>
			</div><!-- guideDiv --><br/>
			<button type="button" id = "goHomeBtn" class="btn btn-default btn-lg">메인으로</button><br/><br/><br/><br/>
			
			
			<div id="map" style="width:1000px; height:500px;"></div>
			
			
			</div><!-- resChk -->
			<br/><br/>

			<!-- footer import -->
					<c:import url="http://localhost/hotel_prj/main/main_footer.jsp" />

		</div><!-- wrap -->
		

		
    <!-- ================================================== -->

		<script
			src="http://localhost/hotel_prj/common/bootstrap/ie10-viewport-bug-workaround.js"></script>
	</div>
</body>
</html>
