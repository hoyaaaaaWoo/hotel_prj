<%@page import="admin_room.OtherImgVO"%>
<%@page import="java.util.List"%>
<%@page import="admin_room.RoomSelect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="객실관리 메인"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hotel Ritz - 객실관리</title>
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
	
<!-- viewroom CSS -->
<link rel="stylesheet" type="text/css"
	href="http://localhost/hotel_prj/admin/css/admin_room_roomview.css">
	
<style type="text/css">
#addBtn{
	margin-top:30px;
	margin-left:45px;
}

#roomList{
	width:100%;
	padding-left:20px;
	border-bottom: 1px solid #454D55;
}

#roomTab{
	height:250px;
	text-align: left;
}

.mainTd{
	width : 170px;
	padding : 10px;
	font-size: 15px;
	font-weight: bold;
	color:#000000;
	text-align: center;
}

.rStatus{
	width:120px;
	margin-bottom: 10px;
	border : 1px solid #454D55
}

.rStatus:hover{
	cursor:pointer;
}

</style>
<script type="text/javascript">
$(function(){
		
	 $("#addBtn").click(function(){
		 location.href="http://localhost/hotel_prj/admin/admin_room_add.jsp";
	 });//click
	 
});//ready 

//이미지 클릭시 룸 상세 view 페이지로 이동
function showRoomDetail(roomName){
	$("#rName").val(roomName);
	$("#frm").submit();
}//showRoomDetail

</script>
</head>
<body>
	<div id="wrap">
		
		<!-- header/navibar import -->
		<c:import url="common/admin_header_nav.jsp" /> 
	
		<!-- 컨테이너 시작 -->
		<div id="container" style="padding:50px"> 
		<span id="mainMenu" onclick="location.href='http://localhost/hotel_prj/admin/admin_room_main.jsp'">객실</span><br/>
		<input type="button" id="addBtn" class="btn btn-primary" value="객실 추가"/>
		
		<div id="roomList"> 
		
		<% 
		RoomSelect room = new RoomSelect();
		pageContext.setAttribute("roomList", room.selectRoomInfo(null));
		%>
				
		<table id="roomTab">
		<tr>
		  <c:forEach var="roomList" items="${ roomList }">
	        <c:set var="rStatus" value="roomStatusY"/>
		    <c:set var="height" value=""/>
			<td class="mainTd">
			 <c:if test="${roomList.getrStatus() eq 'N'}">
		         <c:set var="rStatus" value="roomStatusN"/>
		         <c:set var="height" value="style='height:110px'"/>
		 	 </c:if>
  			<img src="http://localhost/hotel_prj/images/${rStatus}.png" ${height} class="rStatus img-rounded"
  			onclick="showRoomDetail( '${roomList.getRoomName()}' )"/>
			<br/>
			<c:out value="${roomList.getRoomName()}"/></td>
		  </c:forEach>
		</tr>
		</table>
		</div> <!-- roomList div -->

		<form name="frm" id="frm" action="http://localhost/hotel_prj/admin/admin_room_main.jsp" method="get">
			<input type="hidden" name="rName" id="rName"/>
		</form>
		
		<!-- 선택된 객실이 있으면 상세정보 보여줌 -->
		<c:if test="${ not empty param.rName }">
		<%
		String rName = request.getParameter("rName");
		pageContext.setAttribute("rmVO", room.selectRoomInfo(rName));
		%>
		<div id="viewRoom">
			<input type="button" id="chgBtn" name="chgBtn" class="btn btn-primary" value="객실 정보 수정"/>
		<br/>
		<c:forEach var="rmVO" items="${ rmVO }">
		<label style="margin-left: 11px">* 상태</label><br/>
	    <input type="text" name="roomStatus" id="roomStatus" value ="${rmVO.rStatus=='Y'?'활성화':'비활성화'}" style="margin-left: 11px" class="form-control" maxlength="10" readonly="readonly"/>
		<table id="viewTab">	
		<tr>
			<td>
			  <label>* 룸 이름</label><br/>
			  <input type="text" name="roomName" id="roomName" value="${rmVO.roomName}" class="form-control" maxlength="10" readonly="readonly"/>
			</td>
			<td>
			  <label>* 1박 가격(원)</label><br/>
			  <input type="text" name="price" id="price" value="${rmVO.price}" class="form-control" maxlength="8" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			  <label>* 메인 설명</label><br/>
			  <textarea id="mainDesc" name="mainDesc" rows="5" cols="100" readonly="readonly">
<c:out value="${rmVO.mainDesc}"/>
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
				  <input type="text" name="type" id="type" value="${rmVO.type}" class="form-control" maxlength="8" readonly="readonly"/>
			    </td>
			  	<th>투숙인원</th>
			 	<td class="subTd">
				  <input type="text" name="guestNum" id="guestNum" value="${rmVO.guestNum}명" class="form-control" maxlength="8" readonly="readonly"/>
			    </td>
			  </tr>
			  <tr>
			  	<th>객실면적 (m<sup>2</sup>)</th>
			 	<td class="subTd">
			 	<input type="text" name="roomSize" id="roomSize" value="${rmVO.roomSize}" class="form-control" maxlength="10" readonly="readonly"/>
			    </td>
			  	<th>전망</th>
			 	<td class="subTd">
			 	<input type="text" name="view" id="view" value="${rmVO.view}" class="form-control" maxlength="10" readonly="readonly"/>
				</td>
				</tr>
				<tr>
			  	<th>체크인</th>
			 	<td class="subTd">
			 	<input type="text" name="chkIn" id="chkIn" class="form-control" maxlength="10" value="${rmVO.chkIn}" readonly="readonly"/>
			    </td>
			  	<th>체크아웃</th>
			 	<td class="subTd">
			 	<input type="text" name="chkOut" id="chkOut" class="form-control" maxlength="10" value="${rmVO.chkOut}" readonly="readonly" />
			   </td>
			  </tr>
			  </table>
			</td>
		<tr>
			<td colspan="2">
			  <label>* 특별 서비스</label><br/>
			  <textarea id="specialServ" name="specialServ" rows="6" cols="100" readonly="readonly">
<c:out value="${rmVO.specialServ}"/>
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
<c:out value="${rmVO.generalAmn}"/>
				</textarea>
			  	</td>
			  </tr>
			  <tr>
			  	<th>욕실</th>
			  	<td class="subTd">
				 <textarea name="bathAmn" id="bathAmn" rows="2" cols="85" readonly="readonly">
<c:out value="${rmVO.bathAmn}"/>
				 </textarea>
			  	</td>
			  </tr>
			  <tr>
			  	<th>기타</th>
			  	<td class="subTd">
				 <textarea name="otherAmn" id="otherAmn" rows="2" cols="85" readonly="readonly">
<c:out value="${rmVO.otherAmn}"/>
				 </textarea>
			  	</td>
			  </tr>
			  </table>
		<tr>
			<td colspan="2">
			  <label>* 추가 정보</label><br/>
			  <textarea id="moreInfo" name="moreInfo" rows="7" cols="100" readonly="readonly">
<c:out value="${rmVO.moreInfo}"/>
			  </textarea>
			</td>
		</tr>
		</table>
		<br/>
		
		<label>* 사진 </label>
		<br/>
		<img src="http://localhost/hotel_prj/images/${rmVO.img}" name="img" class="viewImg"/>
		</c:forEach>
		<%
		List<OtherImgVO> imgList = room.selectOtherImg(rName);
		pageContext.setAttribute("imgList", imgList);
		%>
 		<c:if test="${not empty imgList}">
		 <c:forEach var="img" items="${imgList}">
		   <img src="http://localhost/hotel_prj/images/${img.imgSrc}" name="img" class="viewImg"/>
		 </c:forEach>
		</c:if> 
		</div> <!-- view room div  -->
		</c:if>
		
		</div> <!-- 컨테이너 div -->
		
		<!-- footer import -->
		<c:import url="common/admin_footer.jsp" />
		
	</div> <!-- wrap div -->
</body>
</html>