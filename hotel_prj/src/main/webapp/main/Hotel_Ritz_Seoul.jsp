<%@page import="user_room.RoomVO"%>
<%@page import="user_room.RoomSelect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="Hotel Ritz Seoul"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
#promo {
	font-size: 23px;
	font-weight: bold;
	color: #000000;
	text-align: center;
	margin: 0px auto;
	width: 1130px;
}

#mainImg {
	margin: 0px auto;
}

.promTab {
	width: 1130px;
	height: 1000px;
	text-align: center
}

.promTitle:link {
	text-decoration: none;
	color: #5A5A5A;
}

.promTitle:hover {
	text-decoration: none;
	color: #000000;
	font-weight: bold;
}

.roomImg {
	width: 350px;
	heigh: 200px;
	overflow: hidden;
	margin: 0px auto;
	overflow: hidden;
}

.roomImg img {
	transition: all 0.2s linear;
}

.roomImg:hover img {
	transform: scale(1.1);
	cursor: pointer;
}

.promImg {
	width: 450px;
	heigh: 300px;
	overflow: hidden;
	margin: 0px auto;
	overflow: hidden;
}

.promImg img {
	transition: all 0.2s linear;
}

.promImg:hover img {
	transform: scale(1.1);
	cursor: pointer;
}

.roomName:link {
	text-decoration: none;
	color: #5A5A5A;
}

.roomName:hover {
	text-decoration: none;
	color: #000000;
	font-weight: bold;
}

.hr1 {
	border-bottom: 1px solid #d3d3d3;
}
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
</head>


<!-- NAVBAR
================================================== -->
<body>


		<!-- header/navibar import -->
		<c:import url="main_header_nav.jsp" /><!-- 세션은 기본적으로 http:가 붙으면 남의 서버로 인식해서 사용이 안됩ㄴ다. 아 그럼 폴더로 바까야하나요 -->

		
		<!-- Carousel
    ================================================== -->
    <div>
		<div id="myCarousel" class="carousel slide" data-ride="carousel"
			style="margin: 0px auto; height: 800px">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner" role="listbox" style = "margin: 0px auto; height: 800px">
				<div class="item active" style = "margin: 0px auto; height: 800px">
					<img class="first-slide"
						src="http://localhost/hotel_prj/main/main_images/main1.jpg"
						style= "min-width: 2150px; height: 800px; margin: 0px auto;"
						alt="First slide">
						<!-- style="min-width: 1600px; height: 800px; margin: 0px auto;" -->
					<div class="container">
						<div class="carousel-caption">
							<h1>3조의 리츠호텔~</h1>
							<p>호텔메인 설명 어쩌구~!~!~!~!~$$$</p>
						</div>
					</div>
				</div>
				<div class="item" style="margin: 0px auto; height: 800px">
					<img class="second-slide"
						style="min-width: 2150px; margin: 0px auto; height: 800px"
						src="http://localhost/hotel_prj/main/main_images/main2.jpg"
						alt="Second slide">
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
				<div class="item" style="margin: 0px auto; height: 800px">
					<img class="third-slide"
						style="min-width: 2150px; margin: 0px auto; height: 800px"
						src="http://localhost/hotel_prj/main/main_images/main3.jpg"
						/>
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
				<div class="item" style="margin: 0px auto; height: 800px">
					<img class="fourth-slide"
						style="min-width: 2150px; margin: 0px auto; height: 800px"
						src="http://localhost/hotel_prj/main/main_images/main4.jpg"
						/>
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- /.carousel -->
		<br /> <br /><br /> <br /><br /> <br />
</div>
<div>
		<!--================================================== -->

		<div class="container marketing"
			style="width: 1130px; margin: 0px auto">
			
<jsp:useBean id="RoomVO" class = "user_room.RoomVO" scope = "page"></jsp:useBean>
<jsp:setProperty property="*" name="RoomVO"/>
			
<%

/* RoomSelect rs = new RoomSelect();
pageContext.setAttribute("RoomNo", rs.selectAllRoomNo(null) );


RoomVO rv = rs.selectRoomInfo(room_no);
 */
%>
			<!-- Three columns of text below the carousel -->
			<div class="row">
			<c:forEach var = "room_no" items = "${ RoomNo }" >
				<div class="col-lg-4">
					<div class="roomImg">
						<a
							href="http://localhost/hotel_prj/user/reser_room/room_intro.jsp#grandRoom">
							<img
							src="http://localhost/hotel_prj/main/main_images/01_grand01.jpg"
							width="350" height="200">
						</a>
					</div>
					<a
						href="http://localhost/hotel_prj/user/reser_room/room_intro.jsp#grandRoom"
						class="roomName"><h3 class="roomName">프리미어 스위트 룸</h3></a>
					<p>프리미어 스위트 룸 간략 설명 혹은 가격</p>
					<p>
						<a class="btn btn-default"
							href="http://localhost/hotel_prj/user/reser_room/room_intro.jsp#grandRoom"
							role="button">View details &raquo;</a>
					</p>
				</div>
				</c:forEach>
				
				<br /> <br /><br /> <br />

				<div style="width: 1130px; margin: 0px auto;">
					<hr class="featurette-divider">

					<div id="promo" style="width: 1130px; margin: 0px auto;">
					<br /> <br /><br /><br />
					<hr class="hr1"><br /><br />
						<span>호텔 리츠의 추천 프로모션</span><br /> <br /> <br />
					</div>
					<div>
						<table class="promTab">
							<tr>
								<td>
									<div class="promImg">
										<a
											href="http://localhost/hotel_prj/main/specialOffer.jsp"><img
											src="http://localhost/hotel_prj/main//main_images/SO01.jpg"
											width="450" height="300"></a>
									</div> <a
									href="http://localhost/hotel_prj/main/specialOffer.jsp"
									class="promTitle"><h2 class="promTitle">Long and
											Lasting Love</h2></a>
									<p>
										리츠 서울 더 라운지에서 오직 둘 만의 완벽한 시간을 선물합니다.<br /> 객실 + 프로포즈 디너 + 스파
										+ 케이크/샴페인</strong>
									</p>
								</td>
								<td>
									<div class="promImg">
										<a
											href="http://localhost/hotel_prj/main/specialOffer.jsp"><img
											src="http://localhost/hotel_prj/main/main_images/SO02.jpg"
											width="450" height="300"></a>
									</div> <a
									href="http://localhost/hotel_prj/main/specialOffer.jsp"
									class="promTitle"><h2 class="promTitle">Deep
											Relaxation</h2></a>
									<p>
										에비앙스파의 대표적인 바디 프로그램을 이용하실 수 있는 패키지입니다.<br /> <strong>객실
											+ 조식 + 에비앙 스파</strong>
									</p>
								</td>
							</tr>
							<tr>
								<td>
									<div class="promImg">
										<a
											href="http://localhost/hotel_prj/main/specialOffer.jsp"><img
											src="http://localhost/hotel_prj/main/main_images/SO03.jpg"
											width="450" height="300"></a>
									</div> <a
									href="http://localhost/hotel_prj/main/specialOffer.jsp"
									class="promTitle"><h2 class="promTitle">Arrive in
											Style</h2></a>
									<p>
										리츠 서울에서만 경험할 수 있는 특별한 여행의 시작과 끝, <br /> 롤스로이스와 함께 하는 품격 있는
										하루를 누려보시기 바랍니다. <br /> <strong>객실 + 조식 + 차량 서비스</strong>
									</p>
								</td>
								<td>
									<div class="promImg">
										<a
											href="http://localhost/hotel_prj/main/specialOffer.jsp"><img
											src="http://localhost/hotel_prj/main/main_images/SO04.jpg"
											width="450" height="300"></a>
									</div> <a
									href="http://localhost/hotel_prj/main/specialOffer.jsp"
									class="promTitle"><h2 class="promTitle">Kids at Home</h2></a>
									<p>
										리츠 서울에서 사랑하는 아이에게 행복한 하루를 선물하세요.<br /> <strong>객실 +
											조식 + 키즈 텐트 + 키즈 배스로브</strong>
									</p>
								</td>
							</tr>
						</table>
					</div>
					<br /> <br />

					<!-- footer import -->

				</div>
			</div>
		</div>
					<c:import url="http://localhost/hotel_prj/main/main_footer.jsp" />

		<!-- ================================================== -->

		<script
			src="http://localhost/hotel_prj/common/bootstrap/ie10-viewport-bug-workaround.js"></script>
	</div>
</body>
</html>
