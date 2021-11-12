<%@page import="user_reservation.ReservationSelect"%>
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
	href="http://localhost/jsp_prj/project02_team03/main/main.css">

<style type="text/css">
.hr1 {
	border-bottom: 1px solid #d3d3d3;
}

#resConf {
	width: 1000px;
	height: 60px;
	font-size: 20px;
	font-weight: bold
}

.resChk {
	width: 1000px;
	height: 1800px;
	color: #5A5A5A;
	margin: 0px auto;
	text-align: center;
}

.chkDiv {
	width: 1000px;
	color: #5A5A5A;
	margin: 0px auto;
	text-align: center;
}

.chkTab {
	width: 1000px;
	height: 450px;
	color: #5A5A5A;
	text-align: left;
	margin: 0px auto;
	table-layout: fixed;
}

.guide {
	font-size: 17px;
	font-weight: bold;
	padding-left: 20px;
}

.guideText {
	font-size: 15px;
}

.cancel {
	width: 800px;
	height: 300px;
	font-size: 13px;
	font-weight: bold;
}

.creditcard {
	font-size: 17px;
	font-weight: bold;
	padding-left: 20px;
}

.creditnumber {
	font-size: 15px;
}

.creditname {
	font-size: 15px;
}

.creditday {
	font-size: 15px;
}

#chkSubTab {
	width: 500px;
	border: 1px solid #d3d3d3;
}

.guideTextP {
	font-size: 15px;
	padding-left: 20px;
	padding-top: 10px;
	padding-bottom: 10px
}

.guideTextPR {
	font-size: 15px;
	padding-right: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
	float: right;
	font-weight: bold
}

.total {
	width: 1000px;
	height: 70px;
	font-size: 20px;
	font-weight: bold;
	color: #333;
	table-layout: fixed;
}

.guideDiv {
	width: 1000px;
	height: 300px; /* border: 10px solid #FFFF00 */
}

.guideTitle {
	width: 1000px;
	height: 40px;
	color: #333;;
	font-size: 20px;
	font-weight: bold;
	text-align: left;
}

.back {
	width: 1000px;
	height: 200px;
	background-color: #FAFAFA;
	padding: 50px
}

.backTab {
	width: 900px;
	height: 100px;
	margin: 0px auto;
	table-layout: fixed;
}

/*div { border: 1px solid #0000FF}
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

<link href="http://localhost/jsp_prj/common/bootstrap/carousel.css"
	rel="stylesheet">

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=028b69a64e72ad065bfc4b7086e48ae3"></script>
<script type="text/javascript">
	function memexit() {
		let result = confirm('예약을 취소하시겠습니까?');
		if (result) {
			alert("예약이 취소되었습니다");
			location.href = "http://localhost/jsp_prj/project02_team03/room/reservation_inq.jsp"
		} else {
		}
	}

	function main() {
		alert("메인 페이지로 이동합니다.");
		location.href = "http://localhost/jsp_prj/project02_team03/main/Hotel_Ritz_Seoul.jsp"
	}
	function print() {
		alert("인쇄를 시작하겠습니다..");
	}

	$(function() {

		/* 	$("#cancel").click(function() { 
		 }//click
		
		 */var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.51271451389996,
					127.10252419812018), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(37.51271451389996,
				127.10252419812018);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		var iwContent = // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		iwPosition = new kakao.maps.LatLng(37.51271451389996,
				127.10252419812018); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			position : iwPosition,
			content : iwContent
		});

		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker);

	});//ready
</script>
</head>
<body>

	<div class="wrap">

		<jsp:include page="../../main/main_header_nav.jsp" />

		<!--================================================== -->
		<div class="resChk">

			<div class="chkDiv">
				<div id="resConf">예약 정보 조회</div>

				<form name="resChkInfo" id="resChkInfo" action="" method="post">
					<table class="chkTab">
						<tr>
							<td style="width: 500px"><img
								src="http://localhost/jsp_prj/project02_team03/main_images/01_grand01.jpg"
								width="480" height="330" /><br /> <br /></td>

							<td>
								<table id="chkSubTab">
									<tr>
										<td class="guide">객실</td>
										<td class="guideTextP">그랜드 디럭스 룸</td>
									</tr>
									<tr>
										<td class="guide">투숙 날짜</td>
										<td class="guideTextP">2021년 11월 26일 - 2021년 11월 27일 (1박)</td>
									</tr>
									<tr>
										<td class="guide">인원</td>
										<td class="guideTextP">성인2, 어린이0</td>
									</tr>
								</table> <br />

								<table id="chkSubTab">
									<tr>
										<td class="guide">객실요금</td>
										<td class="guideTextPR">407,000 KRW</td>
									</tr>
									<tr>
										<td class="guide">세금 및 봉사료</td>
										<td class="guideTextPR">85,470 KRW</td>
									</tr>
								</table> <br /> <span class="guide">요금정책</span><br /> <span
								class="guideText"> ㆍ 상기 요금에 세금 및 봉사료가 각 10%가 가산됩니다. (총
									21%) <br /> ㆍ 상기 요금에 조식은 포함되어 있지 않습니다.
							</span>
							</td>
						</tr>
					</table>

					<hr class="hr1">
					<table class="total">
						<tr>
							<td></td>
							<td>총 요금</td>
							<td>492,470 KRW</td>
						</tr>
					</table>
				</form>
				<hr class="hr1">
			</div>
			<!-- chkDiv -->
			<br /> <br /> <br />


			<div class="guideDiv">
				<div class="guideTitle">예약자 정보</div>
				<div class="back">
					<form name="bookerInfo" id="bookerInfo" action="" method="post">
						<table class="backTab">
							<tr>
								<td class="guide">성(영문)</td>
								<td class="guideText">Woo</td>
								<td class="guide">연락처</td>
								<td class="guideText">820144065532</td>

							</tr>
							<tr>
								<td class="guide">이름(영문)</td>
								<td class="guideText">Jiho</td>
								<td class="guide">이메일</td>
								<td class="guideText">woojiho22@naver.com</td>
								<td></td>
								<td><button type="button" class="btn btn-primary"
										onclick="print()">인쇄하기</button></td>
							</tr>
							<tr>
								<td class="creditcard">신용카드 종류</td>
								<td class="creditname">Master Card</td>
								<td class="creditcard">신용카드번호</td>
								<td class="creditnum">5389***************</td>
							</tr>
							<tr>
								<td class="creditcard">유효기간</td>
								<td class="creditday">03/26</td>
								<td></td>
								<td></td>
							</tr>

						</table>
						<table>
							<tr>
								<td></td>
							</tr>
						</table>
					</form>

				</div>
			</div>
			<!-- guideDiv -->
			<br /> <br /> <br />


			<form name="cancel" id="cancel" action="" method="post">
				<div>
					<table class="total">
						<td>상기 홈페이지 요금은 정상가에서 할인된 금액으로 중복할인은 불가능합니다. 예약 취소 및 변경은 체크인
							하루전 18:00(한국시간)까지 가능합니다. 예약하신 일자에 체크인 되지 않거나 또는 위의 지정 시간 이후에 예약을
							취소 했을 경우에는 예약 사항에 대해 노·쇼(No show)처리 되며, 이에따른 위약금으로 예약 첫날에 해당하는 1박
							객실 요금이 청구되오니 유의하시기 바랍니다. 일부 프로모션 특가상품은 별도의 취소 규정이 적용되며, 취소 첫날 1박
							요금의 100%가 위약금으로 부과 됩니다.</td>
					</table>
				</div>
				<br /> <br /> <br />
				<div style="width: 1000px; text-align: center;">
					<button type="button" class="btn btn-default"
						style="width: 400px; height: 40px;" onclick="memexit()">예약취소</button>
				</div>

			</form>

			<br /> <br />
			<div id="map" style="width: 800px; height: 350px;"></div>


			<br /> <br />
			<div style="width: 1000px; text-align: center;">
				<button type="button" class="btn btn-default"
					style="width: 100px; height: 40px" onclick="main()">홈으로</button>
			</div>

		</div>
		<!-- resChk -->
		<br /> <br />

		<!-- FOOTER -->
		<jsp:include page="../../main/main_footer.jsp" />


	</div>
	<!-- wrap -->



	<!-- ================================================== -->

	<script
		src="http://localhost/jsp_prj/common/bootstrap/ie10-viewport-bug-workaround.js"></script>
	</div>
</body>
</html>