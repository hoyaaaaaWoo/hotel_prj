<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="객실 - 객실 / 객실 수정"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hotel Ritz - 객실 / 객실 수정</title>
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
#tabDiv{
	margin-top:30px;
	margin-left:30px;
	margin-bottom:0px;
	font-size:16px;
	font-weight:normal;
}

#imgDiv{
	margin-left:55px;
	margin-bottom:25px;
}

label{
	font-size:16px;
	font-weight:bold;
}

.form-control{
	font-size:15px;
	color:#000000;
	height:40px;
	width:200px;
}

td{
	padding:15px;
	text-align: left;
}

th{
	font-size:15px;
	padding:15px;
	background-color: #dfdfdf;
	text-align: center;
	border: 1px solid #A3A4A4;
}

.subTd{
	border: 1px solid #A3A4A4;
}

#subTab{
	width:730px;
}

textarea{
	font-size:15px;
	color:#000000;
	border: 1px solid #A3A4A4;
	padding: 5px;
	resize: none;
}

.sel{
	vertical-align: top;
	width:200px;
	font-size:15px;
}

img {
	padding:15px;
	width:250px;
}

#btnGroup{
	margin-left:120px
}

.btn{
	margin:20px;
}

</style>

<script type="text/javascript">
$(function(){
	
	$("#chgBtn").click(function(){
		alert("객실 정보가 수정되었습니다.")
		$("#roomChgFrm").submit();
	})//수정완료

	$("#hideBtn").click(function(){
		alert("해당 객실을 비활성화 상태로 변경합니다.")
		location.href="http://localhost/hotel_prj/admin/admin_room_main_roomview.jsp?roomStatus=N";
	})//숨기기
	
	$("#showBtn").click(function(){
		alert("해당 객실을 활성화 상태로 변경합니다.")
		location.href="http://localhost/hotel_prj/admin/admin_room_main_roomview.jsp?roomStatus=Y";
	})//보이기
	
	$("#cancelBtn").click(function(){
		alert("객실 정보 수정을 취소합니다.")
		history.back();
	})//취소
	
})//ready
</script>
</head>
<body>
	<div id="wrap">

		<!-- header/navibar import -->
		<c:import url="common/admin_header_nav.jsp" /> 
		
		<!-- 컨테이너 시작  -->
		<div id="container" style="padding:50px"> 
		<span id="mainMenu" onclick="location.href='http://localhost/hotel_prj/admin/admin_room_change.jsp'">객실 / 객실 수정</span>
		
		<form name="roomChgFrm" id="roomChgFrm" action="http://localhost/hotel_prj/admin/admin_room_main_roomview.jsp" method="get">
		<div id="tabDiv">
		<table id="mainTab">
		<tr>
			<td>
			  <label>* 룸 이름</label><br/>
			  <input type="text" name="roomName" id="roomName" class="form-control" maxlength="10"/>
			</td>
			<td>
			  <label>* 1박 가격</label><br/>
			  <input type="text" name="price" id="price" class="form-control" maxlength="8"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			  <label>* 메인 설명</label><br/>
			  <textarea id="mainDesc" name="mainDesc" rows="5" cols="80"></textarea>
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
			  		<option value="더블">더블</option>
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
			  		<option value="2">2</option>
			  		<option value="3">3</option>
			  		<option value="4">4</option>
				 </select>
			    </td>
			  </tr>
			  <tr>
			  	<th>객실면적</th>
			 	<td class="subTd">
			 	<input type="text" name="roomSize" id="roomSize" class="form-control" maxlength="10"/>
			    </td>
			  	<th>전망</th>
			 	<td class="subTd">
			 	 <select name="view" id="view" class="form-control sel">
			  		<option value="none">--전망 선택--</option>
			  		<option value="시티뷰">시티뷰</option>
			  		<option value="리버뷰">리버뷰</option>
			  		<option value="욕실전망">욕실전망</option>
				 </select>
				</td>
				</tr>
				<tr>
			  	<th>체크인</th>
			 	<td class="subTd">
			 	<input type="text" name="chkIn" id="chkIn" class="form-control" maxlength="10" value="15:00"/>
			    </td>
			  	<th>체크아웃</th>
			 	<td class="subTd">
			 	<input type="text" name="chkOut" id="chkOut" class="form-control" maxlength="10" value="12:00"/>
			   </td>
			  </tr>
			  </table>
			</td>
		<tr>
			<td colspan="2">
			  <label>* 특별 서비스</label><br/>
			  <textarea id="specialServ" name="specialServ" rows="6" cols="80"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			  <label>* 어메니티</label><br/>
			  <table id="subTab">
			  <tr>
			  	<th>일반</th>
			  	<th>욕실</th>
			  	<th>기타</th>
			  </tr>
			  <tr>
			  	<td class="subTd">
			 	<input type="text" name="generalAmn" id="generalAmn" class="form-control" maxlength="100"/>
			  	</td>
			  	<td class="subTd">
			 	<input type="text" name="bathAmn" id="bathAmn" class="form-control" maxlength="100"/>
			  	</td>
			  	<td class="subTd">
			 	<input type="text" name="otherAmn" id="otherAmn" class="form-control" maxlength="100"/>
			  	</td>
			  </tr>
			  </table>
		<tr>
			<td colspan="2">
			  <label>* 추가 정보</label><br/>
			  <textarea id="addInfo" name="addInfo" rows="7" cols="80"></textarea>
			</td>
		</tr>
		</table>
		</div><!-- 테이블 div -->

		<br/>
		<div id="imgDiv">
		<label>* 사진 추가</label>
		<input type="button" id="btn" name="btn" class="btn btn-info" value="추가"/>
		<br/>
		<img src="http://localhost/hotel_prj/images/01_grand01.jpg" name="img"/>
		<img src="http://localhost/hotel_prj/images/01_grand02.jpg" name="img"/>
		</div> <!-- 이미지 div -->
		</form>
		
		<form name="btnFrm" id="btnFrm" action="http://localhost/hotel_prj/admin/admin_room_main_roomview.jsp" method="get">
		<div id="btnGroup">
			<input type="button" id="chgBtn" name="chgBtn" class="btn btn-primary btn-lg" value="수정"/>
			<input type="button" id="hideBtn" name="hideBtn" class="btn btn-danger btn-lg" value="비활성화"/>
			<input type="button" id="showBtn" name="showBtn" class="btn btn-success btn-lg" value="활성화"/>
			<input type="reset" id="cancelBtn" name="cancelBtn" class="btn btn-default btn-lg" value="취소"/>
		</div>
		</form>
		
		</div><!-- 컨테이너 div -->

		<!-- footer import -->
	 	<c:import url="common/admin_footer.jsp" />
		
	</div>
</body>
</html>