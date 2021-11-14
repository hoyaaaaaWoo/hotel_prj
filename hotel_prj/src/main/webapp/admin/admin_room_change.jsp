<%@page import="admin_room.RoomVO"%>
<%@page import="java.util.List"%>
<%@page import="admin_room.RoomSelect"%>
<%@page import="admin_room.RoomSelect.selectRoomInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="객실 - 객실 / 객실 수정"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hotel Ritz - 객실 수정</title>
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
	font-size:16px;
	font-weight:normal;
}

#imgDiv{
	width:1800px;
	margin-left:50px;
	margin-bottom:25px;
	font-size:16px;
	font-weight:normal;
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

#imgTabe{
width:600px;
}

.imgTh{
 font-size:14px;
}

.imgTd{
 text-align: center; 
 font-size:14px;
 background-color: #FFFFFF;
 vertical-align: middle;
}

.imgTr:hover td{
background-color: #F1F3F4;
}

</style>

<script type="text/javascript">
$(function(){
	
	//수정 클릭 시 
	$("#chgBtn").click(function(){
		let roomName = $("#roomName").val();
		let price = $("#price").val();
		let mainDesc = $("#mainDesc").val();
		let roomSize = $("#roomSize").val();
		let chkIn = $("#chkIn").val();
		let chkOut = $("#chkOut").val();
		let specialServ = $("#specialServ").val();
		let generalAmn = $("#generalAmn").val();
		let bathAmn = $("#bathAmn").val();
		let otherAmn = $("#otherAmn").val();
		let moreInfo = $("#moreInfo").val();
		let type = $("#type").val();
		let guestNum = $("#guestNum").val();
		let view = $("#view").val(); 
		
		if(roomName=="" || price=="" || mainDesc=="" || roomSize=="" || chkIn=="" || chkOut=="" ||
				specialServ=="" || generalAmn=="" || bathAmn=="" || otherAmn=="" || moreInfo=="" ||
				type=="none"||guestNum=="none"||view=="none"){
			alert("객실의 정보를 모두 기입해주세요.");
			return;
		}//end if
		
		alert("수정")
		//$("#roomChgFrm").submit();
	})//수정완료

	//비활성화 클릭 시 
	$("#hideBtn").click(function(){
		var rStatus=$("#roomStatus").val();
		if(rStatus=="비활성화"){
			alert("해당 객실은 이미 비활성화 상태입니다.");
			return;
		}//end if
			var roomNum = $("#roomNum").val();
			$("#statusRNo").val(roomNum);
			$("#rStatus").val("N");
			
			$("#statusFrm").submit();
	});//hideBtn
	
	//활성화 클릭 시 
	$("#showBtn").click(function(){
		var rStatus=$("#roomStatus").val();
		if(rStatus=="활성화"){
			alert("해당 객실은 이미 활성화 상태입니다.");
			return;
		}//end if
		var roomNum=$("#roomNum").val();
		$("#statusRNo").val(roomNum);
		$("#rStatus").val("Y");
		
		$("#statusFrm").submit();
	});//showBtn
	
	//취소 클릭 시
	$("#cancelBtn").click(function(){
		alert("객실 정보 수정을 취소합니다.")
		history.back();
	})//cancelBtn

	//가격 숫자형식 체크
	$("#price").keyup(function(evt){
		if(!(evt.which>=48 && evt.which<=57)){ //0~9 사이의 숫자만 입력 가능함
			alert("숫자만 입력해주세요.");
			$("#price").val("");
			$("#price").focus();
			return;
		}//end if
	})//keyup
	
})//ready

</script>
</head>
<body>
<!-- 객실 메인 페이지에서 넘어오지 않았을 경우 redirect 해주기 (객실 선택 필요) -->
	<c:if test="${empty param.selectedRName}">
  	  <c:redirect url="http://localhost/hotel_prj/admin/admin_room_main.jsp"/>
	</c:if> 
	
	<div id="wrap">
	
		<!-- header/navibar import -->
		<c:import url="common/admin_header_nav.jsp" /> 
		
		<!-- 컨테이너 시작  -->
		<div id="container" style="padding:50px"> 
		<span id="mainMenu" onclick="location.href='http://localhost/hotel_prj/admin/admin_room_change.jsp'">객실 정보 수정</span>
		
		<!-- 파라미터 받기 -->
		<%
		String rName = request.getParameter("selectedRName");
		RoomSelect rs = new RoomSelect();
		List<RoomVO> rList = rs.selectRoomInfo(rName, null);
		pageContext.setAttribute("rList", rList);
		%>
		
		<form name="roomChgFrm" id="roomChgFrm" action=" " method="post">
		<div id="tabDiv">
		<c:forEach var="rVO" items="${rList}">
		<input type="hidden" name="roomNum" id="roomNum" value="${rVO.roomNum}"/> <!-- 객실활성화에 사용할 값 -->
		<table id="mainTab">
		<tr>
		<td colspan="2">
		<label>* 상태</label><br/>
	    <input type="text" name="roomStatus" id="roomStatus" value ="${rVO.rStatus=='Y'?'활성화':'비활성화'}" style="margin-left: 11px" class="form-control" maxlength="10" readonly="readonly"/>
		</td>
		</tr>
		<tr>
			<td>
			  <label>* 객실명 </label><br/>
			  <input type="text" name="roomName" id="roomName" value="${rVO.roomName}" class="form-control" maxlength="10"/>
			</td>
			<td>
			  <label>* 1박 가격(원)</label><br/>
			  <input type="text" name="price" id="price" value="${rVO.price}" class="form-control" maxlength="8"  placeholder="숫자만 입력"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			  <label>* 메인 설명</label><br/>
			  <textarea id="mainDesc" name="mainDesc" rows="5" cols="90" placeholder="객실 메인 설명">
<c:out value="${rVO.mainDesc}"/></textarea></td>
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
			  		<c:set var="selected" value=" "/>
			  		<c:if test="${rVO.type eq '더블'}"><c:set var="selected" value="selected='selected'"/></c:if>
			  			<option value="더블" ${selected}>더블</option>
			  		<c:set var="selected" value=" "/>
			  		<c:if test="${rVO.type eq '더블 2개'}"><c:set var="selected" value="selected='selected'"/></c:if>
			  			<option value="더블 2개" ${selected}>더블 2개</option>
			  		<c:set var="selected" value=" "/>
			  		<c:if test="${rVO.type eq '온돌'}"><c:set var="selected" value="selected='selected'"/></c:if>
			  			<option value="온돌" ${selected}>온돌</option>
			  		<c:set var="selected" value=" "/>
			  		<c:if test="${rVO.type eq '킹'}"><c:set var="selected" value="selected='selected'"/></c:if>
			  			<option value="킹" ${selected}>킹</option>
			  		<c:set var="selected" value=" "/>
			  		<c:if test="${rVO.type eq '킹 2개'}"><c:set var="selected" value="selected='selected'"/></c:if>
			  			<option value="킹 2개" ${selected}>킹 2개</option>
				 </select>
			    </td>
			  	<th>투숙인원</th>
			 	<td class="subTd">
			 	 <select name="guestNum" id="guestNum" class="form-control sel">
			  		<option value="none">--인원수 선택--</option>
			  		<c:forEach var="num" begin="1" end="10" step="1"> 
			  			<c:set var="selected" value=" "/>
			  			<c:if test="${rVO.guestNum eq num}"><c:set var="selected" value="selected='selected'"/></c:if>
			  				<option value="${num}" ${selected}><c:out value="${num}명"/></option>
			  		</c:forEach>
				 </select>
			    </td>
			  </tr>
			  <tr>
			  	<th>객실면적(m<sup>2</sup>)</th>
			 	<td class="subTd">
			 	<input type="text" name="roomSize" id="roomSize" value="${rVO.roomSize}" class="form-control" maxlength="10" placeholder="숫자만 또는 숫자~숫자"/>
			    </td>
			  	<th>전망</th>
			 	<td class="subTd">
			 	 <select name="view" id="view" class="form-control sel">
			  		<option value="none">--전망 선택--</option>
			  		<c:set var="selected" value=" "/>
			  		<c:if test="${rVO.view eq '시티뷰'}"><c:set var="selected" value="selected='selected'"/></c:if>
			  			<option value="시티뷰" ${selected}>시티뷰</option>
			  		<c:set var="selected" value=" "/>
			  		<c:if test="${rVO.view eq '리버뷰'}"><c:set var="selected" value="selected='selected'"/></c:if>
			  			<option value="리버뷰"  ${selected}>리버뷰</option>
			  		<c:set var="selected" value=" "/>
			  		<c:if test="${rVO.view eq '욕실전망'}"><c:set var="selected" value="selected='selected'"/></c:if>
			  			<option value="욕실전망"  ${selected}>욕실전망</option>
				 </select>
				</td>
				</tr>
				<tr>
			  	<th>체크인</th>
			 	<td class="subTd">
			 	<input type="text" name="chkIn" id="chkIn" class="form-control" maxlength="10" value="${rVO.chkIn }" placeholder="15:00"/>
			    </td>
			  	<th>체크아웃</th>
			 	<td class="subTd">
			 	<input type="text" name="chkOut" id="chkOut" class="form-control" maxlength="10" value="${rVO.chkOut }" placeholder="12:00"/>
			   </td>
			  </tr>
			  </table>
			</td>
		<tr>
			<td colspan="2">
			  <label>* 특별 서비스</label><br/>
			  <textarea id="specialServ" name="specialServ" rows="6" cols="90" placeholder="특별 서비스">
${rVO.specialServ}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			  <label>* 어메니티</label><br/>
			  <table id="subTab">
			  <tr>
			  	<th>일반</th>
			  	<td class="subTd">
				 <textarea name="generalAmn" id="generalAmn" rows="2" cols="80" placeholder="일반 어메니티">
${rVO.generalAmn}</textarea>
			  	</td>
			  </tr>
			  <tr>
			  	<th>욕실</th>
			  	<td class="subTd">
				 <textarea name="bathAmn" id="bathAmn" rows="2" cols="80" placeholder="욕실 어메니티">
${rVO.bathAmn}</textarea>
			  	</td>
			  </tr>
			  <tr>
			  	<th>기타</th>
			  	<td class="subTd">
				 <textarea name="otherAmn" id="otherAmn" rows="2" cols="80" placeholder="기타 어메니티">
${rVO.otherAmn}</textarea>
			  	</td>
			  </tr>
			  </table>
		<tr>
			<td colspan="2">
			  <label>* 추가 정보</label><br/>
			  <textarea id="moreInfo" name="moreInfo" rows="7" cols="90" placeholder="추가 정보">
${rVO.moreInfo}</textarea>
			</td>
		</tr>
		</table>
		</c:forEach>
		</div><!-- 테이블 div -->
		
		<input type="hidden" name="img" id="img"/>
		</form> <!-- roomChgFrm  -->

		<br/>

		<form action="admin_room_img_upload_process.jsp" id="uploadfrm" method="post" enctype="multipart/form-data">
		<label>* 객실 이미지</label>
		<span style="font-size:14px;">&nbsp;(※최대 5장까지 등록 가능합니다.)</span>
		<label for="mainFile" class="btn btn-info btn-sm" id="mainUpLoad">메인 이미지 추가</label>
			<input type="file" name ="mainFile" id="mainFile" style="display: none;"/>
		<label for="otherFile" class="btn btn-info btn-sm" id="otherUpLoad">기타 이미지 추가</label>
			<input type="file" name ="otherFile" id="otherFile" style="display: none;"/>
			
		<input type="hidden" name= "fileName" id="fileName"/>
		</form> <!-- 이미지 업로드 form -->
	
	
		<form name="imgFrm">
		<!-- 이미지 추가 시 보여질 div -->
		<div id="imgDiv">
		<!-- 파라미터 받기 -->
		<%
		String mainImg = request.getParameter("mainImg");
		String[] otherImg = request.getParameterValues("otherImg");
		pageContext.setAttribute("otherImg", otherImg);
		%>
		
		<table id="imgTable" class="table table-bordered" style="width:580px;">
			<tr>	
			<th class="imgTh">번호</th> 
			<th class="imgTh">파일명</th>
			<th class="imgTh">관리</th> 
			</tr>
			<tr class="imgTr">
				<c:set var="i" value="${ i+1 }"/>
				<td class="imgTd"> 1 </td>
				<td class="imgTd" style="font-weight:bold"><%=mainImg %></td>
				<td class="imgTd">
				<input type="button" name="delBtn" class="delBtn btn btn-default btn-sm" 
				style="margin:0px;font-size:13px" value="삭제" onclick="delImg(this)"/></td>
			</tr>
			<c:forEach var="img" items="${otherImg}">	
				<tr>
				<c:set var="i" value="${ i+1 }"/>
				<td class="imgTd"><c:out value= "${i}"/></td>
				<td class="imgTd" style="font-weight:bold"><c:out value="${img}"/></td>
				<td class="imgTd">
				<input type="button" name="delBtn" class="delBtn btn btn-default btn-sm" 
				style="margin:0px;font-size:13px" value="삭제" onclick="delImg(this)"/></td>
				</tr>
			</c:forEach>
		</table>
		</div> <!-- imgDiv -->
		</form> <!-- imgFrm  -->
		
		<div id="btnGroup">
			<input type="button" id="chgBtn" name="chgBtn" class="btn btn-primary btn-lg" value="수정"/>
			<input type="button" id="hideBtn" name="hideBtn" class="btn btn-danger btn-lg" value="비활성화"/>
			<input type="button" id="showBtn" name="showBtn" class="btn btn-success btn-lg" value="활성화"/>
			<input type="reset" id="cancelBtn" name="cancelBtn" class="btn btn-default btn-lg" value="취소"/>
		</div>
		
		<form name="statusFrm" id="statusFrm" action="admin_room_status_update_process.jsp" method="get">
			<input type="hidden" name="rStatus" id="rStatus"/>
			<input type="hidden" name="statusRNo" id="statusRNo"/>
		</form>
		
		</div><!-- 컨테이너 div -->

		<!-- footer import -->
	 	<c:import url="common/admin_footer.jsp" />
		
	</div><!-- wrap div -->
</body>
</html>