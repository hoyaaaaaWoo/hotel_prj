<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="객실 - 객실 / 객실 추가"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hotel Ritz - 객실 / 객실 추가</title>
<link rel="stylesheet" type="text/css"
	href="http://localhost/hotel_prj/common/css/main_v20211012.css">

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
	font-size:16px;
	font-weight:normal;
}

#imgDiv{
	width:1800px;
	margin-left:55px;
	margin-bottom:25px;
}

label{
	font-size:16px;
	font-weight:bold;
	margin-top: 10px;
}

.form-control{
	font-size:15px;
	color:#000000;
	height:40px;
	width:200px;
}

td{
	padding:10px;
	text-align: left;
}

th{
	font-size:16px;
	padding:10px;
	background-color: #dfdfdf;
	text-align: center;
	border: 1px solid #A3A4A4;
	width:90px
}

.subTd{
	border: 1px solid #A3A4A4;
	font-size:15px;
}

#subTab{
	width:700px;
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
}

img {
	padding:20px;
	width:300px;
}

#btnGroup{
	margin-left:300px
}

.btn{
	margin:20px;
}

</style>

<script type="text/javascript">
$(function(){
	$("#imgBtn").click(function(){
		alert("이미지가 추가되었습니다.");
	})//click

	$("#addBtn").click(function(){
		alert("객실이 추가되었습니다.");
		location.href="http://localhost/hotel_prj/admin/admin_room_main_roomview.jsp?roomStatus=Y";
	})//click
	
	$("#cancelBtn").click(function(){
		alert("객실 추가를 취소합니다.");
		history.back();
	})//click
})//ready
</script>
</head>
<body>
	<div id="wrap">
	
		<!-- header/navibar import -->
		<c:import url="common/admin_header_nav.jsp" /> 
		
		<!-- 컨테이너 시작  -->
		<div id="container">
		<span id="mainMenu" onclick="location.href='http://localhost/hotel_prj/admin/admin_room_add.jsp'">객실 / 객실 추가</span>
		
		<form name="roomAddFrm" id="roomAddFrm" action="http://localhost/hotel_prj/admin/admin_room_main.jsp" method="get">
		<div id="tabDiv">
		<table id="mainTab">
		<tr>
			<td>
			  <label>* 룸 이름</label><br/>
			  <input type="text" name="roomName" id="roomName" class="form-control" maxlength="10"/>
			</td>
			<td>
			  <label>* 1박 가격(원)</label><br/>
			  <input type="text" name="price" id="price" class="form-control" maxlength="8"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			  <label>* 메인 설명</label><br/>
			  <textarea id="mainDesc" name="mainDesc" rows="5" cols="90"></textarea>
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
			  	<th>객실면적(m<sup>2</sup>)</th>
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
			  <textarea id="specialServ" name="specialServ" rows="6" cols="90"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			  <label>* 어메니티</label><br/>
			  <table id="subTab">
			  <tr>
			  	<th>일반</th>
			  	<td class="subTd">
				 <textarea name="generalAmn" id="generalAmn" rows="2" cols="80"></textarea>
			  	</td>
			  </tr>
			  <tr>
			  	<th>욕실</th>
			  	<td class="subTd">
				 <textarea name="bathAmn" id="bathAmn" rows="2" cols="80"></textarea>
			  	</td>
			  </tr>
			  <tr>
			  	<th>기타</th>
			  	<td class="subTd">
				 <textarea name="otherAmn" id="otherAmn" rows="2" cols="80"></textarea>
			  	</td>
			  </tr>
			  </table>
		<tr>
			<td colspan="2">
			  <label>* 추가 정보</label><br/>
			  <textarea id="moreInfo" name="moreInfo" rows="7" cols="90"></textarea>
			</td>
		</tr>
		</table>
		</div><!-- 테이블 div -->

		<br/>
		<div id="imgDiv">
		<label>* 사진 추가</label>
		<span style="font-size:14px;">&nbsp;(※최대 5장까지 추가 가능합니다.)</span>
		<input type="button" id="imgBtn" name="imgBtn" class="btn btn-info" value="추가"/>
		<br/>
		<img src="" name="img"/>
		<img src="" name="img"/>
		</div> <!-- 이미지 div -->
		
		<div id="btnGroup">
			<input type="button" id="addBtn" name="addBtn" class="btn btn-primary btn-lg" value="입력"/>
			<input type="reset" id="cancelBtn" name="cancelBtn" class="btn btn-default btn-lg" value="취소"/>
		</div>
		
		</form>
		</div><!-- 컨테이너 div -->
		
		<!-- footer import -->
		<c:import url="common/admin_footer.jsp" /> 
		
	</div>
</body>
</html>