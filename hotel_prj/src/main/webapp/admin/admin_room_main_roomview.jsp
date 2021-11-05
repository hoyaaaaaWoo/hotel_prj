<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hotel Ritz - 객실 /상세보기</title>
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
	href="http://localhost/jsp_prj/project02_team03/admin/css/admin_main.css">
<!-- viewroom CSS -->
<link rel="stylesheet" type="text/css"
	href="http://localhost/hotel_prj/admin/css/admin_main.css">

	
<style type="text/css">
#addBtn{
	margin-top:30px;
	margin-left:45px;
}

#roomList{
	width:1200px;
	padding-left:20px;
	border-bottom: 1px solid #454D55;
}

#roomTab{
	height:250px;
	text-align: left;
}

.mainTd{
	width : 170px;
	font-size: 16px;
	padding:10px;
	font-weight: normal;
	color:#000000;
	text-align: center;
}

.mainTd:hover{
	cursor:pointer;
}

.room{
	width:120px;
	margin-bottom: 10px;
	border : 1px solid #454D55;
}

</style>


<script type="text/javascript">
$(function(){
	 $("td").click(function(){
		 location.href="http://localhost/jsp_prj/project02_team03/admin/admin_room_main_roomview.jsp";
	 })//click
	 
	 $("#addBtn").click(function(){
		 location.href="http://localhost/jsp_prj/project02_team03/admin/admin_room_add.jsp";
	 })//click
	 
	 $("#chgBtn").click(function(){
		 location.href="http://localhost/jsp_prj/project02_team03/admin/admin_room_change.jsp";
	 })//click
}) 
</script>
</head>
<body>
	<div id="wrap">
		
		<!-- header/navibar import -->
		<c:import url="common/admin_header_nav.jsp" /> 

		<!-- 컨테이너 -->
		<div id="container" style="padding:50px"> 
		<span id="mainMenu" onclick="location.href='http://localhost/jsp_prj/project02_team03/admin/admin_room_main.jsp'">객실</span><br/>
		<input type="button" id="addBtn" class="btn btn-primary" value="객실 추가"/>
		<div id="roomList"> 
		<!-- 추가되면 동적으로 테이블 생성 예정!! -->
		<form name="mainFrm">
		<table id="roomTab">
		<tr>
			<td class="mainTd">
			<!-- 활성화/비활성화 버튼에 따라 변수를 Y/N로 설정-->
			<% String rStatus = "Y"; %>
			<c:if test="${not empty param.roomStatus and param.roomStatus eq 'N'}">
			<% rStatus = "N"; %>
			</c:if>
			<!-- 버튼에 따른 변수로  -->
			<img src="http://localhost/jsp_prj/project02_team03/images/roomStatus<%=rStatus%>.png" name="room" class="room img-rounded"/>
			<br/>
			그랜드 디럭스 룸</td>
			<td class="mainTd">
			<img src="http://localhost/jsp_prj/project02_team03/images/roomStatusY.png" name="room" class="room img-rounded"/>
			<br/>
			리츠 프리미어 룸</td>
		</tr>
		</table>
		</form>
		</div>
		
		<!-- 선택된 객실의 상세정보가 나타나는 div  -->
		<div id="viewRoom">
		<input type="button" id="chgBtn" name="chgBtn" class="btn btn-primary" value="객실 정보 수정"/>
		<br/>

		 	    <label style="margin-left: 11px">* 상태</label><br/>
	    <input type="text" name="roomStatus" id="roomStatus" value="활성화" style="margin-left: 11px" class="form-control" maxlength="10" readonly="readonly"/>
		<table id="viewTab">	
		<tr>
			<td>
			  <label>* 룸 이름</label><br/>
			  <input type="text" name="roomName" id="roomName" value="그랜드 디럭스 룸" class="form-control" maxlength="10" readonly="readonly"/>
			</td>
			<td>
			  <label>* 1박 가격(원)</label><br/>
			  <input type="text" name="price" id="price" value="399,000" class="form-control" maxlength="8" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			  <label>* 메인 설명</label><br/>
			  <textarea id="mainDesc" name="mainDesc" rows="5" cols="100" readonly="readonly">
우아한 인테리어와 현대적 세련미가 조화롭게 어우러진 리츠 서울의 그랜드 디럭스 룸은 서울 시내 동급 호텔 대비 넓은 40~50㎡의 여유로운 공간을 제공합니다.
87층부터 101층까지 위치한 초고층 객실에서 바라보는 서울 도심의 파노라믹뷰는 최상의 휴식을 제공합니다.
모든 호텔 투숙객들이 자유롭게 이용할 수 있는 살롱 드 리츠은 리츠 서울의 또 하나의 즐길 거리입니다.
			  </textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			  <label>* 객실 개요</label><br/>
			  <table id="subTab">
			  <tr>
			  	<th>침대타입</th>
			 	<td class="subTd">
			 	 <select name="type" id="type" class="form-control sel">
			  		<option value="none">--타입 선택--</option>
			  		<option value="더블" selected="selected">더블</option>
			  		<option value="더블 2개">더블 2개</option>
			  		<option value="온돌">온돌</option>
			  		<option value="킹">킹</option>
			  		<option value="킹 2개">킹 2개</option>
				 </select>
			    </td>
			  	<th>투숙인원</th>
			 	<td class="subTd">
			 	 <select name="guestNum" id="guestNum" class="form-control sel">
			  		<option value="none">--인원수 선택--</option>
			  		<option value="1">1</option>
			  		<option value="2" selected="selected">2</option>
			  		<option value="3">3</option>
			  		<option value="4">4</option>
				 </select>
			    </td>
			  </tr>
			  <tr>
			  	<th>객실면적(m<sup>2</sup>)</th>
			 	<td class="subTd">
			 	<input type="text" name="roomSize" id="roomSize" value="40~50" class="form-control" maxlength="10" readonly="readonly"/>
			    </td>
			  	<th>전망</th>
			 	<td class="subTd">
			 	 <select name="view" id="view" class="form-control sel">
			  		<option value="none">--전망 선택--</option>
			  		<option value="시티뷰" selected="selected">시티뷰</option>
			  		<option value="리버뷰">리버뷰</option>
			  		<option value="욕실전망">욕실전망</option>
				 </select>
				</td>
				</tr>
				<tr>
			  	<th>체크인</th>
			 	<td class="subTd">
			 	<input type="text" name="chkIn" id="chkIn" class="form-control" maxlength="10" value="15:00" readonly="readonly"/>
			    </td>
			  	<th>체크아웃</th>
			 	<td class="subTd">
			 	<input type="text" name="chkOut" id="chkOut" class="form-control" maxlength="10" value="12:00" readonly="readonly" />
			   </td>
			  </tr>
			  </table>
			</td>
		<tr>
			<td colspan="2">
			  <label>* 특별 서비스</label><br/>
			  <textarea id="specialServ" name="specialServ" rows="6" cols="100">
•  초고층 타워의 전 객실에서 서울의 경관을 조망할 수 있는 파노라믹뷰
•  슈퍼프리미엄 베딩 시스템 : 최상의 숙면을 위한 침대 및 침구류
•  호텔 헬스장 (수영장 포함) 무료 이용
•  맞춤형 베개 제공
•  전 객실 초고속 무료 인터넷 (유선, 와이파이)
•  턴다운 서비스 제공
			  </textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			  <label>* 어메니티</label><br/>
			  <table>
			  <tr>
			  	<th>일반</th>
			  	<td class="subTd">
				 <textarea name="generalAmn" id="generalAmn" rows="2" cols="85" readonly="readonly">
55” HD TV 60” HD TV 미니바 티포트 금고 사무용 데스크 (문구류 포함) 전화기 체중계 우산 구둣주걱
				</textarea>
			  	</td>
			  </tr>
			  <tr>
			  	<th>욕실</th>
			  	<td class="subTd">
				 <textarea name="bathAmn" id="bathAmn" rows="2" cols="85" readonly="readonly">
세면대 2개 면도기 면봉 비데 샤워 캡 슬리퍼 욕실용품 (Diptyque) 욕조 목욕 가운 헤어드라이어 1회용 칫솔 및 치약
				 </textarea>
			  	</td>
			  </tr>
			  <tr>
			  	<th>기타</th>
			  	<td class="subTd">
				 <textarea name="otherAmn" id="otherAmn" rows="2" cols="85" readonly="readonly">
케이블 위성 TV 채널 무료 생수 1일 2병 커피 및 티 메이커 무료 일간 신문 옷솔 매일 2병의 물을 무료로 제공 무료 다림질 서비스 (1일 2점)
				 </textarea>
			  	</td>
			  </tr>
			  </table>
		<tr>
			<td colspan="2">
			  <label>* 추가 정보</label><br/>
			  <textarea id="addInfo" name="addInfo" rows="7" cols="100">
•  모든 요금에 세금 10% 및 봉사료 10% (합계 21%)가 부과됩니다.
•  모든 객실은 금연입니다.
•  객실 구조 및 인테리어는 객실 위치에 따라 이미지와 다를 수 있습니다.
•  호텔내 반려동물 동반 입장은 불가합니다.
•  객실 내 장식물 부착 관련 문의 사항은 리츠서비스로 연락부탁드립니다. (02-3213-1000)
•  화재의 위험이 있는 양초류의 사용은 불가합니다.
•  데코레이션 업체를 통한 객실 내 장식물 부착은 불가합니다.
			  </textarea>
			</td>
		</tr>
		</table>
		<br/>
		
		<div id="imgDiv">
		<label>* 사진 </label>
		<br/>
		<img src="http://localhost/jsp_prj/project02_team03/images/01_grand01.jpg" name="img" class="viewImg"/>
		<img src="http://localhost/jsp_prj/project02_team03/images/01_grand02.jpg" name="img" class="viewImg"/>
		</div> <!-- 이미지 div -->
		
		</div> <!-- view room div  -->
		</div> <!-- 컨테이너 div -->
		
		<!-- footer import -->
		<c:import url="common/admin_footer.jsp" />
		
	</div>
</body>
</html>