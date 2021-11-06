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

.hr1 {border-bottom: 1px solid #d3d3d3; }

.roomName {font-size: 25px; font-weight: bold; color: #5A5A5A; margin: 0px auto; text-align: center;}
.roomBox { width: 1000px; height: 1400px; color: #5A5A5A; margin: 0px auto; text-align: center;}
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

#confirmDiv {width: 960px; height: 350px; border: 1px solid #5a5a5a; padding: 30px}
#confirmTab {width: 900px; height: 290px; table-layout: fixed;}

#confirmPaper {width: 400px; height: 290px; background-color: #F0F0F0; float: right;
				padding: 30px}

#addReq {width: 450px; height: 120px;}

#checkRname {color: #333; font-size: 17px; font-weight: bold; text-align: left;}
#checkAdult {color: #5a5a5a; font-size: 17px; text-align: left;}

.chkPaperLeft {color: #333; font-size: 15px; font-weight: bold; text-align: left; float: left}
.chkPaperRight {color: #333; font-size: 15px; font-weight: bold; text-align: left;  float: right}

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

<link href="http://localhost/jsp_prj/common/bootstrap/carousel.css"
	rel="stylesheet">
	
<script type="text/javascript">
$(function(){
	$("#resBtn").click(function(){
		location.href="http://localhost/hotel_prj/user/reser_room/reservation3_card.jsp";
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
		<br/><br/><br/><br/>
		
		
		<div class ="roomName">그랜드 디럭스 룸</div><br/>
		

		<!-- Carousel
    ================================================== -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel"
			style="width: 1000px; margin: 0px auto;">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
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
			</table><br/><br/><br/>
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
				<div class = "guideTitle"> 취소규정 </div>
				<div class = "guideText">
				ㆍ 상기 홈페이지 요금은 정상가로 할인은 불가능합니다. <br/>
				ㆍ 예약 취소 및 변경은 체크인 하루 전 18 : 00(한국시간)까지 가능합니다. <br/>
				ㆍ 예약하신 일자에 체크인 되지 않거나 또는 위의 지정 시간 이후에 예약을 취소했을 경우에는 예약 사항에 대해 노-쇼 (No-Show)처리 되며, <br/>
					&nbsp;&nbsp;&nbsp;&nbsp; 이에 따른 위약금으로 예약 첫날에 해당하는 1박 객실요금이 청구되오니 유의하시기 바랍니다. 
				</div>
			</div><br/>
			<hr class = "hr1"><br/>
			
			<div class = "guideR">
			<div class = "guideTitle"> 예약 옵션 </div>
			<div id = "confirmDiv">
			<table id = "confirmTab">
				<tr>
				<td>
				<p id = "checkRname">객실 그랜드 디럭스 룸</p>
				<p id = "checkAdult">투숙인원 : 성인 2명, 어린이 0명</p>
				<br/><br/><br/>
				<p id = "checkRname">추가요청</p>
				 <textarea id="addReq" name="addReq" rows="5" cols="80" placeholder="예시) 추가 배드를 요청합니다." style = "resize: none"></textarea>
				</td>
				<td>
				<div id = "confirmPaper">
				<br/>
				<span class = "chkPaperLeft">객실 요금</span><br/><br/>
				<span style = "color: #333; font-size: 15px; text-align: left; float: left">2021년 11월 26일</span>
				<span class = "chkPaperRight">407,000 KRW </span><br/><br/><br/>
				<span class = "chkPaperLeft">세금 및 봉사료</span>
				<span class = "chkPaperRight">85,470 KRW </span><br/>
				<hr class = "hr1">
				<span class = "chkPaperLeft">총 요금</span>
				<span class = "chkPaperRight">492,470 KRW </span><br/>
				</div>
				</td>
				</tr>
			</table>
			</div>
			</div><br/>
			<hr class = "hr1"><br/>
			 <button type="button" id = "resBtn" class="btn btn-default btn-lg">예약하기</button>
			 			
			</div><!-- roomBox -->
			<br/><br/>

			<!-- footer import -->
					<c:import url="http://localhost/hotel_prj/main/main_footer.jsp" />

		</div><!-- wrap -->
		

		
    <!-- ================================================== -->

		<script
			src="http://localhost/jsp_prj/common/bootstrap/ie10-viewport-bug-workaround.js"></script>
	</div>
</body>
</html>
