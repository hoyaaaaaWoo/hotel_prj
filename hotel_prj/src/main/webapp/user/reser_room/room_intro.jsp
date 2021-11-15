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

.hr1 {border-bottom: 1px solid #d3d3d3; }

.roomImgList {width: 720px; height: 405px;}
.roomName {font-size: 25px; font-weight: bold; color: #5A5A5A; margin: 0px auto; text-align: center;}
.roomBox { width: 1000px; height: 1000px; color: #5A5A5A; margin: 0px auto; text-align: center;}
.roomDesc {width: 1000px; color: #5A5A5A; margin: 0px auto; text-align: center; }

.roomSumm {width: 1000px; height: 150px;color: #5A5A5A;; font-size: 15px; 
			border-bottom: 1px solid #d3d3d3; border-top: 1px solid #d3d3d3;  }
 
#summTitle {width: 200px; color: #5A5A5A; font-size: 18px;  font-weight: bold;}
.summSubTab{width: 800px; color: #5A5A5A; font-size: 15px; table-layout: fixed;}
.summSubTd { padding: 10px; text-align: left;}
.summSubTh { width: 130px; padding: 5px; text-align: left;}

.summSubTab tr { border: none}

.guide {width: 1000px; height: 210px;color: #5A5A5A;; font-size: 15px;}
.guideTitle {width: 1000px; height: 40px;color: #5A5A5A;; font-size: 19px; font-weight: bold;
				text-align: left; padding-left: 20px}
.guideText {width: 1000px; color: #5A5A5A;; font-size: 15px; text-align: left; padding-left: 20px;}				
				
#amntTab {width: 1000px; height: 130px;color: #5A5A5A;; font-size: 15px;  }
.amntTh {padding-left: 20px; width: 80px}
.amntTd {text-align: left;}

.guideC {width: 1000px; height: 150px;color: #5A5A5A;; font-size: 15px;}
.guideP {width: 1000px; height: 170px;color: #5A5A5A;; font-size: 15px;}
.guideR {width: 1000px; height: 400px;color: #5A5A5A;; font-size: 15px; }

/*
div { border: 1px solid #FF0000}
td { border: 1px solid #FF0000}
tr { border: 1px solid #FF0000}
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
	
<script type="text/javascript">
$(function(){
	$("#roomIntroBtn").click(function(){
		location.href="http://localhost/hotel_prj/user/reser_room/room_intro.jsp";
	})//table click
	
	$("#roomReserBtn").click(function(){
		location.href="http://localhost/hotel_prj/user/reser_room/room_date.jsp";
	})//table click
	
}); //ready

</script>

</head>

<!-- NAVBAR
================================================== -->
<body>
	<div class="wrapper">
		<!-- header/navibar import -->
		<c:import url="http://localhost/hotel_prj/main/main_header_nav.jsp" />
		
		<br/><br/><br/><br/><br/><br/>
		
		<div style="width: 1130px; text-align: center; margin: 0px auto">
 		 <input type="button" id = "roomIntroBtn" value="객실소개" class="btn btn-default" style="width: 100px;">	
  			&nbsp;	&nbsp; 	&nbsp;
 		 <input type="button" id = "roomReserBtn" value="객실예약" class="btn btn-default" style="width: 100px;" >
  		<hr class = "hr1">
  		</div><br/>
		<br/><br/><br/>
		
		<span id = "grandRoom"></span><br/><br/>
		<div class ="roomName" >그랜드 디럭스 룸</div><br/>

		<!-- Carousel
    ================================================== -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel"
			style="width: 1000px; margin: 0px auto;">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active" style = "width: 1000px">
					<img class="first-slide" 
						src="http://localhost/jsp_prj/project02_team03/main_images/01_grand01.jpg"
						alt="First slide">
					<div class="container">
						<div class="carousel-caption">
						</div>
					</div>
				</div>
				<div class="item" style = "width: 1000px">
					<img class="second-slide" 
						src="http://localhost/jsp_prj/project02_team03/main_images/01_grand02.jpg"
						alt="Second slide">
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
				<div class="item" style = "width: 1000px">
					<img class="third-slide"
						src="http://localhost/jsp_prj/project02_team03/main_images/01_grand03.jpg"
						alt="Third slide">
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
				<div class="item" style = "width: 1000px">
					<img class="fourth-slide"
						src="http://localhost/jsp_prj/project02_team03/main_images/01_grand04.jpg"
						alt="Fourth slide">
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
		<br/><br/>

		<!--================================================== -->

		<div class = "roomBox">
			<div class = "roomDesc">
			[그랜드 디럭스 룸, 40㎡~50㎡]<br/>
			우아한 인테리어와 현대적 세련미가 조화롭게 어우러진 리츠 서울의 그랜드 디럭스 룸은 서울 시내 동급 호텔 대비 넓은 40~50㎡의 여유로운 공간을 제공합니다.<br/>
			87층부터 101층까지 위치한 초고층 객실에서 바라보는 서울 도심의 파노라믹뷰는 최상의 휴식을 제공합니다.<br/>
			모든 호텔 투숙객들이 자유롭게 이용할 수 있는 살롱 드 리츠은 리츠 서울의 또 하나의 즐길 거리입니다.
			</div><br/><br/>
			<table class = "roomSumm">
			<tr>
			<td id =  "summTitle">객실개요</td>
			<td>
				<table class = "summSubTab">
				<tr>
				<th class = "summSubTh">침대타입</th>
				<td class = "summSubTd">더블</td>
				<th class = "summSubTh">투숙인원</th>
				<td class = "summSubTd">2명</td>
				<th class = "summSubTh">전망</th>
				<td class = "summSubTd">시티뷰</td>
				</tr>
				<tr>
				<th class = "summSubTh">객실면적</th>
				<td class = "summSubTd">40 ~ 50㎡</td>
				<th class = "summSubTh">체크인/체크아웃</th>
				<td class = "summSubTd">15:00 / 12:00</td>
				<th></th>
				<td></td>
				</tr>
				</table>
			</td>
			</tr>
			</table><br/><br/>
			
			<div class = "guideC">
				<div class = "guideTitle"> 특별서비스 </div>
				<div class = "guideText">
				ㆍ 초고층 타워의 전 객실에서 서울의 경관을 조망할 수 있는 파노라믹뷰 <br/>
				ㆍ 호텔 헬스장 (수영장 포함) 무료 이용 <br/>
				ㆍ 맞춤형 베개 제공<br/>
				ㆍ 전 객실 초고속 무료 인터넷 (유선, 와이파이)<br/>
				ㆍ 턴다운 서비스 제공<br/>
				</div>
			</div><br/>
			<hr class = "hr1"><br/>
			<div class = "guide">
				<div class = "guideTitle"> 어메니티 </div>
				<table id = "amntTab">
				<tr>
				<th class = "amntTh">일반</th>
				<td class = "amntTd">55” HD TV 60” HD TV 미니바 티포트 금고 사무용 데스크 (문구류 포함) 전화기 체중계 우산 구둣주걱</td>
				</tr>
				<tr>
				<th class = "amntTh">욕실</th>
				<td class = "amntTd">세면대 2개 면도기 면봉 비데 샤워 캡 슬리퍼 욕실용품 (Diptyque) 욕조 목욕 가운 헤어드라이어 1회용 칫솔 및 치약</td>
				</tr>
				<tr>
				<th class = "amntTh">기타</th>
				<td class = "amntTd">케이블 위성 TV 채널 무료 생수 1일 2병 커피 및 티 메이커 무료 일간 신문 옷솔 매일 2병의 물을 무료로 제공 무료 다림질 서비스 (1일 2점)</td>
				</tr>
				</table>
			</div>
			<hr class = "hr1"><br/>
			
			<div class = "guideC">
				<div class = "guideTitle"> 추가정보 </div>
				<div class = "guideText">
				ㆍ 모든 요금에 세금 10% 및 봉사료 10% (합계 21%)가 부과됩니다.<br/>
				ㆍ 모든 객실은 금연입니다.<br/>
				ㆍ 객실 구조 및 인테리어는 객실 위치에 따라 이미지와 다를 수 있습니다.<br/>
				ㆍ 호텔내 반려동물 동반 입장은 불가합니다.<br/>
				ㆍ 객실 내 장식물 부착 관련 문의 사항은 리츠서비스로 연락부탁드립니다. (02-3213-1000)<br/>
				ㆍ 화재의 위험이 있는 양초류의 사용은 불가합니다.<br/>
				ㆍ 데코레이션 업체를 통한 객실 내 장식물 부착은 불가합니다.<br/>
				</div>
			</div><br/>
				
			</div><!-- roomBox -->
			<br/><br/>
			<hr class = "hr1"><br/><br/><br/>
			<span id = "premierRoom"></span>
			<div class ="roomName">프리미어 스위트 룸</div><br/>
			<!-- Carousel
    ================================================== -->
		<div id="myCarousel1" class="carousel slide" data-ride="carousel"
			style="width: 1000px; margin: 0px auto;">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel1" data-slide-to="1"></li>
				<li data-target="#myCarousel1" data-slide-to="2"></li>
				<li data-target="#myCarousel1" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active" style = "width: 1000px">
					<img class="first-slide" 
						src="http://localhost/jsp_prj/project02_team03/main_images/02_premier01.jpg"
						alt="First slide">
					<div class="container">
						<div class="carousel-caption">
						</div>
					</div>
				</div>
				<div class="item" style = "width: 1000px">
					<img class="second-slide" 
						src="http://localhost/jsp_prj/project02_team03/main_images/02_premier02.jpg"
						alt="Second slide">
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
				<div class="item" style = "width: 1000px">
					<img class="third-slide"
						src="http://localhost/jsp_prj/project02_team03/main_images/02_premier03.jpg"
						alt="Third slide">
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
				<div class="item" style = "width: 1000px">
					<img class="fourth-slide"
						src="http://localhost/jsp_prj/project02_team03/main_images/02_premier04.jpg"
						alt="Fourth slide">
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel1" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel1" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- /.carousel -->
		<br/><br/>

		<!--================================================== -->

		<div class = "roomBox">
			<div class = "roomDesc">
			[프리미어 스위트 룸, 68㎡ ~ 87㎡]<br/>
			리츠 서울의 프리미어 스위트 룸은 넓고 여유로운 공간에서 고품격 휴식을 만끽할 수 있는 고급형 프리미어 스위트 룸입니다.<br/>
			여유로운 공간과 고급스러운 인테리어는 고객의 안락함을 최우선으로 고려하여 설계되어 고객님에게 더욱 더 최고의 투숙 경험을 선사합니다.
			</div><br/><br/>
			<table class = "roomSumm">
			<tr>
			<td id =  "summTitle">객실개요</td>
			<td>
				<table class = "summSubTab">
				<tr>
				<th class = "summSubTh">침대타입</th>
				<td class = "summSubTd">킹 2개</td>
				<th class = "summSubTh">투숙인원</th>
				<td class = "summSubTd">4명</td>
				<th class = "summSubTh">전망</th>
				<td class = "summSubTd">욕실전망</td>
				</tr>
				<tr>
				<th class = "summSubTh">객실면적</th>
				<td class = "summSubTd">68 ~ 87㎡</td>
				<th class = "summSubTh">체크인/체크아웃</th>
				<td class = "summSubTd">15:00 / 12:00</td>
				<th></th>
				<td></td>
				</tr>
				</table>
			</td>
			</tr>
			</table><br/><br/>
			
			<div class = "guideC">
				<div class = "guideTitle"> 특별서비스 </div>
				<div class = "guideText">
				ㆍ 초고층 타워의 전 객실에서 서울의 경관을 조망할 수 있는 파노라믹뷰 <br/>
				ㆍ 호텔 헬스장 (수영장 포함) 무료 이용 <br/>
				ㆍ 맞춤형 베개 제공<br/>
				ㆍ 전 객실 초고속 무료 인터넷 (유선, 와이파이)<br/>
				ㆍ 턴다운 서비스 제공<br/>
				</div>
			</div><br/>
			<hr class = "hr1"><br/>
			<div class = "guide">
				<div class = "guideTitle"> 어메니티 </div>
				<table id = "amntTab">
				<tr>
				<th class = "amntTh">일반</th>
				<td class = "amntTd">60” HD TV 미니바 티포트 금고 사무용 데스크 (문구류 포함) 전화기 체중계 우산 구둣주걱</td>
				</tr>
				<tr>
				<th class = "amntTh">욕실</th>
				<td class = "amntTd">세면대 2개 면도기 면봉 비데 샤워 캡 슬리퍼 욕실용품 (Diptyque) 욕조 목욕 가운 헤어드라이어 1회용 칫솔 및 치약</td>
				</tr>
				<tr>
				<th class = "amntTh">기타</th>
				<td class = "amntTd">케이블 위성 TV 채널 무료 생수 1일 2병 커피 및 티 메이커 무료 일간 신문 옷솔 무료 다림질 서비스 (1일 2점)</td>
				</tr>
				</table>
			</div>
			<hr class = "hr1"><br/>
			
			<div class = "guideC">
				<div class = "guideTitle"> 추가정보 </div>
				<div class = "guideText">
				ㆍ 모든 요금에 세금 10% 및 봉사료 10% (합계 21%)가 부과됩니다.<br/>
				ㆍ 모든 객실은 금연입니다.<br/>
				ㆍ 객실 구조 및 인테리어는 객실 위치에 따라 이미지와 다를 수 있습니다.<br/>
				ㆍ 호텔내 반려동물 동반 입장은 불가합니다.<br/>
				ㆍ 객실 내 장식물 부착 관련 문의 사항은 리츠서비스로 연락부탁드립니다. (02-3213-1000)<br/>
				ㆍ 화재의 위험이 있는 양초류의 사용은 불가합니다.<br/>
				ㆍ 데코레이션 업체를 통한 객실 내 장식물 부착은 불가합니다.<br/>
				</div>
			</div><br/>
				
			</div><!-- roomBox -->
			<br/><br/>
			
			<hr class = "hr1"><br/><br/><br/>
			<span id = "ritzRoom"></span>
			<div class ="roomName">리츠 프리미어 룸</div><br/>
			<!-- Carousel
    ================================================== -->
		<div id="myCarousel2" class="carousel slide" data-ride="carousel"
			style="width: 1000px; margin: 0px auto;">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel2" data-slide-to="1"></li>
				<li data-target="#myCarousel2" data-slide-to="2"></li>
				<li data-target="#myCarousel2" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active" style = "width: 1000px">
					<img class="first-slide" 
						src="http://localhost/jsp_prj/project02_team03/main_images/03_ritz01.jpg"
						alt="First slide">
					<div class="container">
						<div class="carousel-caption">
						</div>
					</div>
				</div>
				<div class="item" style = "width: 1000px">
					<img class="second-slide" 
						src="http://localhost/jsp_prj/project02_team03/main_images/03_ritz02.jpg"
						alt="Second slide">
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
				<div class="item" style = "width: 1000px">
					<img class="third-slide"
						src="http://localhost/jsp_prj/project02_team03/main_images/03_ritz03.jpg"
						alt="Third slide">
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
				<div class="item" style = "width: 1000px">
					<img class="fourth-slide"
						src="http://localhost/jsp_prj/project02_team03/main_images/03_ritz04.jpg"
						alt="Fourth slide">
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel2" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel2" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- /.carousel -->
		<br/><br/>

		<!--================================================== -->

		<div class = "roomBox">
			<div class = "roomDesc">
			[리츠 프리미어 룸, 56㎡ ~ 65㎡]<br/>
			리츠 서울의 리츠 프리미어 룸은 침실과 함께 여유로운 업무 공간이 구비되어<br/> 성공적인 비즈니스와 여유로운 휴식을 함께 즐길 수 있는 고급 비즈니스 객실입니다.<br/> 
			리츠 프리미어 룸의 60인치 TV에 장착된 프리미엄 사운드 바는 새로운 경험을 제공해 드립니다.
			</div><br/><br/>
			<table class = "roomSumm">
			<tr>
			<td id =  "summTitle">객실개요</td>
			<td>
				<table class = "summSubTab">
				<tr>
				<th class = "summSubTh">침대타입</th>
				<td class = "summSubTd">더블</td>
				<th class = "summSubTh">투숙인원</th>
				<td class = "summSubTd">4명</td>
				<th class = "summSubTh">전망</th>
				<td class = "summSubTd">리버뷰</td>
				</tr>
				<tr>
				<th class = "summSubTh">객실면적</th>
				<td class = "summSubTd">56 ~ 65㎡</td>
				<th class = "summSubTh">체크인/체크아웃</th>
				<td class = "summSubTd">15:00 / 12:00</td>
				<th></th>
				<td></td>
				</tr>
				</table>
			</td>
			</tr>
			</table><br/><br/>
			
			<div class = "guideC">
				<div class = "guideTitle"> 특별서비스 </div>
				<div class = "guideText">
				ㆍ 초고층 타워의 전 객실에서 서울의 경관을 조망할 수 있는 파노라믹뷰 <br/>
				ㆍ 호텔 헬스장 (수영장 포함) 무료 이용 <br/>
				ㆍ 맞춤형 베개 제공<br/>
				ㆍ 전 객실 초고속 무료 인터넷 (유선, 와이파이)<br/>
				ㆍ 턴다운 서비스 제공<br/>
				</div>
			</div><br/>
			<hr class = "hr1"><br/>
			<div class = "guide">
				<div class = "guideTitle"> 어메니티 </div>
				<table id = "amntTab">
				<tr>
				<th class = "amntTh">일반</th>
				<td class = "amntTd">60” HD TV 미니바 티포트 금고 사무용 데스크 (문구류 포함) 전화기 체중계 우산 구둣주걱</td>
				</tr>
				<tr>
				<th class = "amntTh">욕실</th>
				<td class = "amntTd">세면대 2개 면도기 면봉 비데 샤워 캡 슬리퍼 욕실용품 (Diptyque) 욕조 목욕 가운 헤어드라이어 1회용 칫솔 및 치약</td>
				</tr>
				<tr>
				<th class = "amntTh">기타</th>
				<td class = "amntTd">케이블 위성 TV 채널 무료 생수 1일 2병 커피 및 티 메이커 무료 일간 신문 옷솔 무료 다림질 서비스 (1일 2점)</td>
				</tr>
				</table>
			</div>
			<hr class = "hr1"><br/>
			
			<div class = "guideC">
				<div class = "guideTitle"> 추가정보 </div>
				<div class = "guideText">
				ㆍ 모든 요금에 세금 10% 및 봉사료 10% (합계 21%)가 부과됩니다.<br/>
				ㆍ 모든 객실은 금연입니다.<br/>
				ㆍ 객실 구조 및 인테리어는 객실 위치에 따라 이미지와 다를 수 있습니다.<br/>
				ㆍ 호텔내 반려동물 동반 입장은 불가합니다.<br/>
				ㆍ 객실 내 장식물 부착 관련 문의 사항은 리츠서비스로 연락부탁드립니다. (02-3213-1000)<br/>
				ㆍ 화재의 위험이 있는 양초류의 사용은 불가합니다.<br/>
				ㆍ 데코레이션 업체를 통한 객실 내 장식물 부착은 불가합니다.<br/>
				</div>
			</div><br/>
				
			</div><!-- roomBox -->
			<br/><br/>
			<hr class = "hr1"><br/><br/><br/>
			<span id = "koreanRoom"></span>
			<div class ="roomName">코리안 스위트 룸</div><br/>
			<!-- Carousel
    ================================================== -->
		<div id="myCarousel3" class="carousel slide" data-ride="carousel"
			style="width: 1000px; margin: 0px auto;">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel3" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel3" data-slide-to="1"></li>
				<li data-target="#myCarousel3" data-slide-to="2"></li>
				<li data-target="#myCarousel3" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active" style = "width: 1000px">
					<img class="first-slide" 
						src="http://localhost/jsp_prj/project02_team03/main_images/04_korean01.jpg"
						alt="First slide">
					<div class="container">
						<div class="carousel-caption">
						</div>
					</div>
				</div>
				<div class="item" style = "width: 1000px">
					<img class="second-slide" 
						src="http://localhost/jsp_prj/project02_team03/main_images/04_korean02.jpg"
						alt="Second slide">
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
				<div class="item" style = "width: 1000px">
					<img class="third-slide"
						src="http://localhost/jsp_prj/project02_team03/main_images/04_korean03.jpg"
						alt="Third slide">
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
				<div class="item" style = "width: 1000px">
					<img class="fourth-slide"
						src="http://localhost/jsp_prj/project02_team03/main_images/04_korean04.jpg"
						alt="Fourth slide">
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel3" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel3" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- /.carousel -->
		<br/><br/>

		<!--================================================== -->

		<div class = "roomBox">
			<div class = "roomDesc">
			[코리안 스위트 룸, 84㎡, 92층 위치]<br/>
			리츠 서울의 코리안 스위트 룸은 92층에 위치하여 최고의 전망을 자랑하는 객실입니다.<br/>
			또한, 한국 전통미와 현대적인 시설의 조화가 이루어진 최고급 온돌로 구성되어 있으며 한국의 궁을 테마로 한 온돌, <br/>
			객실 곳곳에 배치된 전통가구와 편백나무로 구성된 욕실은 한국적인 멋을 더욱 돋보이게 합니다.
			</div><br/><br/>
			<table class = "roomSumm">
			<tr>
			<td id =  "summTitle">객실개요</td>
			<td>
				<table class = "summSubTab">
				<tr>
				<th class = "summSubTh">침대타입</th>
				<td class = "summSubTd">온돌</td>
				<th class = "summSubTh">투숙인원</th>
				<td class = "summSubTd">4명</td>
				<th class = "summSubTh">전망</th>
				<td class = "summSubTd">리버뷰</td>
				</tr>
				<tr>
				<th class = "summSubTh">객실면적</th>
				<td class = "summSubTd">56 ~ 65㎡</td>
				<th class = "summSubTh">체크인/체크아웃</th>
				<td class = "summSubTd">15:00 / 12:00</td>
				<th></th>
				<td></td>
				</tr>
				</table>
			</td>
			</tr>
			</table><br/><br/>
			
			<div class = "guideC">
				<div class = "guideTitle"> 특별서비스 </div>
				<div class = "guideText">
				ㆍ 초고층 타워의 전 객실에서 서울의 경관을 조망할 수 있는 파노라믹뷰 <br/>
				ㆍ 호텔 헬스장 (수영장 포함) 무료 이용 <br/>
				ㆍ 맞춤형 베개 제공<br/>
				ㆍ 전 객실 초고속 무료 인터넷 (유선, 와이파이)<br/>
				ㆍ 턴다운 서비스 제공<br/>
				</div>
			</div><br/>
			<hr class = "hr1"><br/>
			<div class = "guide">
				<div class = "guideTitle"> 어메니티 </div>
				<table id = "amntTab">
				<tr>
				<th class = "amntTh">일반</th>
				<td class = "amntTd">60” HD TV 미니바 티포트 금고 사무용 데스크 (문구류 포함) 전화기 체중계 우산 구둣주걱</td>
				</tr>
				<tr>
				<th class = "amntTh">욕실</th>
				<td class = "amntTd">세면대 2개 면도기 면봉 비데 샤워 캡 슬리퍼 욕실용품 (Diptyque) 욕조 목욕 가운 헤어드라이어 1회용 칫솔 및 치약</td>
				</tr>
				<tr>
				<th class = "amntTh">기타</th>
				<td class = "amntTd">케이블 위성 TV 채널 무료 생수 1일 2병 커피 및 티 메이커 무료 일간 신문 옷솔 무료 다림질 서비스 (1일 2점)</td>
				</tr>
				</table>
			</div>
			<hr class = "hr1"><br/>
			
			<div class = "guideC">
				<div class = "guideTitle"> 추가정보 </div>
				<div class = "guideText">
				ㆍ 모든 요금에 세금 10% 및 봉사료 10% (합계 21%)가 부과됩니다.<br/>
				ㆍ 모든 객실은 금연입니다.<br/>
				ㆍ 객실 구조 및 인테리어는 객실 위치에 따라 이미지와 다를 수 있습니다.<br/>
				ㆍ 호텔내 반려동물 동반 입장은 불가합니다.<br/>
				ㆍ 객실 내 장식물 부착 관련 문의 사항은 리츠서비스로 연락부탁드립니다. (02-3213-1000)<br/>
				ㆍ 화재의 위험이 있는 양초류의 사용은 불가합니다.<br/>
				ㆍ 데코레이션 업체를 통한 객실 내 장식물 부착은 불가합니다.<br/>
				</div>
			</div><br/>
				
			</div><!-- roomBox -->
			<br/><br/>
			<hr class = "hr1"><br/><br/><br/>
			<span id = "royalRoom"></span>
			<div class ="roomName">로얄 스위트 룸</div><br/>
			<!-- Carousel
    ================================================== -->
		<div id="myCarousel4" class="carousel slide" data-ride="carousel"
			style="width: 1000px; margin: 0px auto;">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel4" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel4" data-slide-to="1"></li>
				<li data-target="#myCarousel4" data-slide-to="2"></li>
				<li data-target="#myCarousel4" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active" style = "width: 1000px">
					<img class="first-slide" 
						src="http://localhost/jsp_prj/project02_team03/main_images/05_royal01.jpg"
						alt="First slide">
					<div class="container">
						<div class="carousel-caption">
						</div>
					</div>
				</div>
				<div class="item" style = "width: 1000px">
					<img class="second-slide" 
						src="http://localhost/jsp_prj/project02_team03/main_images/05_royal02.jpg"
						alt="Second slide">
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
				<div class="item" style = "width: 1000px">
					<img class="third-slide"
						src="http://localhost/jsp_prj/project02_team03/main_images/05_royal03.jpg"
						alt="Third slide">
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
				<div class="item" style = "width: 1000px">
					<img class="fourth-slide"
						src="http://localhost/jsp_prj/project02_team03/main_images/05_royal04.jpg"
						alt="Fourth slide">
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel4" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel4" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- /.carousel -->
		<br/><br/>

		<!--================================================== -->

		<div class = "roomBox">
			<div class = "roomDesc">
			[로얄 스위트 룸, 353㎡, 100층 위치]<br/>
			100층에 위치한 로얄스위트 룸은 세계 각국의 국빈과 국내외 VVIP를 위한 리츠서울의 단 하나뿐인 최고급 객실입니다.<br/>
			럭셔리한 응접실과 회의실은 물론 비서관 전용 객실, 자쿠지 등 최신 시설과 보안 시스템을 갖추고 있으며 <br/>
			리츠서울만의 세심하고 격조 높은 서비스는 잊지 못할 감동을 선사합니다.
			</div><br/><br/>
			<table class = "roomSumm">
			<tr>
			<td id =  "summTitle">객실개요</td>
			<td>
				<table class = "summSubTab">
				<tr>
				<th class = "summSubTh">침대타입</th>
				<td class = "summSubTd">더블</td>
				<th class = "summSubTh">투숙인원</th>
				<td class = "summSubTd">2명</td>
				<th class = "summSubTh">전망</th>
				<td class = "summSubTd">시티뷰</td>
				</tr>
				<tr>
				<th class = "summSubTh">객실면적</th>
				<td class = "summSubTd">363㎡</td>
				<th class = "summSubTh">체크인/체크아웃</th>
				<td class = "summSubTd">15:00 / 12:00</td>
				<th></th>
				<td></td>
				</tr>
				</table>
			</td>
			</tr>
			</table><br/><br/>
			
			<div class = "guideC">
				<div class = "guideTitle"> 특별서비스 </div>
				<div class = "guideText">
				ㆍ 초고층 타워의 전 객실에서 서울의 경관을 조망할 수 있는 파노라믹뷰 <br/>
				ㆍ 호텔 헬스장 (수영장 포함) 무료 이용 <br/>
				ㆍ 맞춤형 베개 제공<br/>
				ㆍ 전 객실 초고속 무료 인터넷 (유선, 와이파이)<br/>
				ㆍ 턴다운 서비스 제공<br/>
				</div>
			</div><br/>
			<hr class = "hr1"><br/>
			<div class = "guide">
				<div class = "guideTitle"> 어메니티 </div>
				<table id = "amntTab">
				<tr>
				<th class = "amntTh">일반</th>
				<td class = "amntTd">79” HD TV 미니바 티포트 금고 사무용 데스크 (문구류 포함) 전화기 체중계 우산 구둣주걱</td>
				</tr>
				<tr>
				<th class = "amntTh">욕실</th>
				<td class = "amntTd">세면대 2개 면도기 면봉 비데 샤워 캡 슬리퍼 에머리보드 욕실용품 (Diptyque) 욕조 위생봉지 목욕 가운 헤어드라이어 1회용 칫솔 및 치약</td>
				</tr>
				<tr>
				<th class = "amntTh">기타</th>
				<td class = "amntTd">케이블 위성 TV 채널 무료 생수 1일 2병 커피 및 티 메이커 무료 일간 신문 셔츠 무료 다림질서비스(1일 2개) 옷솔 구두 광택 서비스</td>
				</tr>
				</table>
			</div>
			<hr class = "hr1"><br/>
			
			<div class = "guideC">
				<div class = "guideTitle"> 추가정보 </div>
				<div class = "guideText">
				ㆍ 모든 요금에 세금 10% 및 봉사료 10% (합계 21%)가 부과됩니다.<br/>
				ㆍ 모든 객실은 금연입니다.<br/>
				ㆍ 객실 구조 및 인테리어는 객실 위치에 따라 이미지와 다를 수 있습니다.<br/>
				ㆍ 호텔내 반려동물 동반 입장은 불가합니다.<br/>
				ㆍ 객실 내 장식물 부착 관련 문의 사항은 리츠서비스로 연락부탁드립니다. (02-3213-1000)<br/>
				ㆍ 화재의 위험이 있는 양초류의 사용은 불가합니다.<br/>
				ㆍ 데코레이션 업체를 통한 객실 내 장식물 부착은 불가합니다.<br/>
				</div>
			</div><br/><br/><br/>
				
			</div><!-- roomBox -->
			<br/><br/><br/><br/>

			<!-- footer import -->
					<c:import url="http://localhost/hotel_prj/main/main_footer.jsp" />

		</div><!-- wrap -->
		

		
    <!-- ================================================== -->

		<script
			src="http://localhost/jsp_prj/common/bootstrap/ie10-viewport-bug-workaround.js"></script>
	</div>
</body>
</html>
