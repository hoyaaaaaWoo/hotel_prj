<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="Hotel Ritz Seoul"%>
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
	
	$("#description1").click(function() {
		
		if($("#description1").val()=="open"){
			var output = "[프리미어 스위트 룸, 68㎡ ~ 87㎡]<br>리츠 서울의 프리미어 스위트 룸은 넓고 여유로운 공간에서 고품격 휴식을 만끽할 수 있는 고급형 프리미어 스위트 룸입니다.<br>여유로운 공간과 고급스러운 인테리어는 고객의 안락함을 최우선으로 고려하여 설계되어 고객님에게 더욱 더 최고의 투숙 경험을 선사합니다.";
			document.getElementById("view1").innerHTML = output;
			$("#description1").val("close");
			}else{
			$("#description1").val("open");
			document.getElementById("view1").innerHTML = "";
				
			}
	});
	
	$("#description2").click(function() {
		
		if($("#description2").val()=="open"){
		var output = "[리츠 프리미어 룸, 56㎡ ~ 65㎡]<br>리츠 서울의 리츠 프리미어 룸은 침실과 함께 여유로운 업무 공간이 구비되어<br>성공적인 비즈니스와 여유로운 휴식을 함께 즐길 수 있는 고급 비즈니스 객실입니다.<br>리츠 프리미어 룸의 60인치 TV에 장착된 프리미엄 사운드 바는 새로운 경험을 제공해 드립니다.";
		document.getElementById("view2").innerHTML = output;
		$("#description2").val("close");
		}else{
		$("#description2").val("open");
		document.getElementById("view2").innerHTML = "";
			
		}
		
		
	});
	
	$("#description3").click(function() {
		
		if($("#description3").val()=="open"){
		var output = "[코리안 스위트 룸, 84㎡, 92층 위치]<br>	리츠 서울의 코리안 스위트 룸은 92층에 위치하여 최고의 전망을 자랑하는 객실입니다.<br>또한, 한국 전통미와 현대적인 시설의 조화가 이루어진 최고급 온돌로 구성되어 있으며 한국의 궁을 테마로 한 온돌,<br>객실 곳곳에 배치된 전통가구와 편백나무로 구성된 욕실은 한국적인 멋을 더욱 돋보이게 합니다.";
		document.getElementById("view3").innerHTML = output;
		$("#description3").val("close");
		}else{
		$("#description3").val("open");
		document.getElementById("view3").innerHTML = "";
			
		}
		
	});
	
	$("#description4").click(function() {
		
		if($("#description4").val()=="open"){
		var output = "[로얄 스위트 룸, 353㎡, 100층 위치]<br>100층에 위치한 로얄스위트 룸은 세계 각국의 국빈과 국내외 VVIP를 위한 리츠서울의 단 하나뿐인 최고급 객실입니다.<br>럭셔리한 응접실과 회의실은 물론 비서관 전용 객실, 자쿠지 등 최신 시설과 보안 시스템을 갖추고 있으며<br>리츠서울만의 세심하고 격조 높은 서비스는 잊지 못할 감동을 선사합니다.";
		document.getElementById("view4").innerHTML = output;
		$("#description4").val("close");
		}else{
		$("#description4").val("open");
		document.getElementById("view4").innerHTML = "";
			
		}
		
	});
	
});
	
	

</script>
</head>

<!-- NAVBAR
================================================== -->

<body>

<jsp:include page="../../main/main_header_nav.jsp"/>
		<br/><br/><br/>

	<div style="width: 720px; margin:0px auto; text-align: center;">
 		 <input type="button" id = "roomIntroBtn" value="객실소개" class="btn btn-default" style="width: 100px;">	
  			&nbsp;	&nbsp; 	&nbsp;
 		 <input type="button" id = "roomReserBtn" value="객실예약" class="btn btn-default" style="width: 100px;" >
  		</div><br/>
  		<hr class = "hr1">
		<br/><br/><br/>
	
	<form name="resRoom" id="resRoom" action="http://localhost/hotel_prj/user/reser_room/reservation2.jsp" method="post">
	
	<!-- 그랜드 디럭스 더블 -->
	<div style="width: 1000px; margin: 0px auto;">
		<table style="width: 1000px;">
			<tr>
				<td style="width: 252px;" rowspan="2">
				<img src="http://localhost/hotel_prj/images/01_grand01.jpg"
					style="width: 270px; height: 187px;">&nbsp;&nbsp;&nbsp;</td>
				<td style="height: 100px;"><br><br><br>
				<span style="font-size: 25px; font-weight: bold;">&nbsp;&nbsp;그랜드 디럭스 더블</span>
				<input type="button" id="description" value="open" class="btn" style="margin-left: 30px;">
				<hr/>
				</td>
			</tr>
			
			<tr>
				<td style="height: 87px;">&nbsp;&nbsp; 전망 시티뷰 | 객실면적 40㎡~50㎡
				<br><br><br><br>
			</tr>
			
		</table>
		
		<div id="view"></div>
		<input type="button" class="button" id="deluxe" name="grand" style="width: 100px; float: right;" value="460,000 KRW">
	</div>
	<br><br>
	<hr/>
	
	<!-- 프리미어 스위트 룸 -->
	<div style="width: 1000px; margin: 0px auto;">
		<table style="width: 1000px;">
			<tr>
				<td style="width: 252px;" rowspan="2"><img src="http://localhost/hotel_prj/images/02_premier01.jpg"
					style="width: 270px; height: 187px;">&nbsp;&nbsp;&nbsp;</td>
				<td style="height: 100px;"><br><br><br>
				<span style="font-size: 25px; font-weight: bold;">&nbsp;&nbsp;프리미어 스위트 룸</span>
				<input type="button" id="description1" value="open" class="btn" style="margin-left: 30px;">
				<hr/>
				</td>
			</tr>
			
			<tr>
				<td style="height: 87px;">&nbsp;&nbsp; 전망 욕실전망 | 객실면적 68㎡ ~ 87㎡
				<br><br><br><br>
			</tr>
			
		</table>
		
		<div id="view1"></div>
		<input type="button" class="button" name="premier" style="width: 100px; float: right;" value="460,000 KRW">
	</div>
	<br><br>
	<hr/>
	
	<!-- 리츠 프리미어 룸 -->
	<div style="width: 1000px; margin: 0px auto;">
		<table style="width: 1000px;">
			<tr>
				<td style="width: 252px;" rowspan="2"><img
					src="http://localhost/hotel_prj/images/03_ritz01.jpg"
					style="width: 270px; height: 187px;">&nbsp;&nbsp;&nbsp;</td>
				<td style="height: 100px;"><br><br><br>
				<span style="font-size: 25px; font-weight: bold;">&nbsp;&nbsp;리츠 프리미어 룸</span>
				<input type="button" id="description2" value="open" class="btn" style="margin-left: 30px;">
				<hr/>
				</td>
			</tr>
			
			<tr>
				<td style="height: 87px;">&nbsp;&nbsp; 전망 리버뷰 | 객실면적 56㎡ ~ 65㎡
				<br><br><br><br>
			</tr>
			
		</table>
		
		<div id="view2"></div>
		<input type="button" class="button" name="ritz" style="width: 100px; float: right;" value="460,000 KRW">
	</div>
	<br><br>
	<hr/>
	
	<!-- 코리안 스위트 룸 -->
	<div style="width: 1000px; margin: 0px auto;">
		<table style="width: 1000px;">
			<tr>
				<td style="width: 252px;" rowspan="2"><img
					src="http://localhost/hotel_prj/images/04_korean01.jpg"
					style="width: 270px; height: 187px;">&nbsp;&nbsp;&nbsp;</td>
				<td style="height: 100px;"><br><br><br>
				<span style="font-size: 25px; font-weight: bold;">&nbsp;&nbsp;코리안 스위트 룸</span>
				<input type="button" id="description3" value="open" class="btn" style="margin-left: 30px;">
				<hr/>
				</td>
			</tr>
			
			<tr>
				<td style="height: 87px;">&nbsp;&nbsp; 전망 리버뷰 | 객실면적 84㎡, 92층 위치
				<br><br><br><br>
			</tr>
			
		</table>
		
		<div id="view3"></div>
		<input type="button" class="button" name="korean" style="width: 100px; float: right;" value="460,000 KRW">
	</div>
	<br><br>
	<hr/>

	<!-- 로얄 스위트 룸 -->
	<div style="width: 1000px; margin: 0px auto;">
		<table style="width: 1000px;">
			<tr>
				<td style="width: 252px;" rowspan="2"><img
					src="http://localhost/hotel_prj/images/05_royal01.jpg"
					style="width: 270px; height: 187px;">&nbsp;&nbsp;&nbsp;</td>
				<td style="height: 100px;"><br><br><br>
				<span style="font-size: 25px; font-weight: bold;">&nbsp;&nbsp;로얄 스위트 룸</span>
				<input type="button" id="description4" value="open" class="btn" style="margin-left: 30px;">
				<hr/>
				</td>
			</tr>
			
			<tr>
				<td style="height: 87px;">&nbsp;&nbsp; 전망 시티뷰 | 353㎡, 100층 위치
				<br><br><br><br>
			</tr>
			
		</table>
		
		<div id="view4"></div>
		<input type="button" class="button" name="royal" style="width: 100px; float: right;" value="460,000 KRW">
	</div>
	
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
