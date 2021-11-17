<%@page import="user_reservation.ReservationVO"%>
<%@page import="java.util.List"%>
<%@page import="user_reservation.ReservationSelect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Hotel_Ritz_Seoul</title>
	<style type = "text/css">

	#table {width: 700px; height: 90px; border-align: center; margin: 0px auto;}
	
	#res_inqTr:hover {background-color: #D2D6D7; cursor: pointer;}
	</style>


<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 메인 CSS -->
<link rel="stylesheet" type="text/css"
	href="http://localhost/hotel_prj/main/main.css">

<%
String id = (String)session.getAttribute("id");
if(id==null){//세션이 존재하지 않으면 
		response.sendRedirect("../login/login.jsp");
	}//end if
%>

<script type="text/javascript">
function main(){
	alert("메인 페이지로 이동합니다.");
	location.href="http://localhost/hotel_prj/main/Hotel_Ritz_Seoul.jsp"
}
	

</script>
</head>
<!-- NAVBAR
================================================== -->
  <body>
  <%request.setCharacterEncoding("UTF-8"); %>
  
  <!-- 이전 페이지에서 날아온 웹파라미터 이 페이지에서 받아서 설정하기 -->
  <jsp:useBean id="rVO" class="user_reservation.ReservationVO"/>  
  <!-- *써서 setter method 다 실행해서 세팅됨 -->
  <jsp:setProperty property="*" name="rVO"/>
  
<%
	ReservationSelect rsD = new ReservationSelect();
	List<ReservationVO> list = rsD.reserInq(id);
	pageContext.setAttribute("reserInq", list);
%>
<form action="reservation_confirm.jsp" id="res_noFrm" name="res_noFrm" method="post">
<input type="hidden" name="res_no" id="res_no" />
</form>

<div class="wrapper">
<jsp:include page="../../main/main_header_nav.jsp"/>	

<div style="margin:0px auto;">
<h4>&nbsp;&nbsp;홈 / 마이페이지</h4>
</div>
<br/><br/><br/>
<div style = "width:800px; text-align: center; margin:0px auto;">
<h2>예약조회</h2>
</div>
<br/><br/>
<div  style = "width:600px; text-align: center; margin:0px auto;">
<c:if test="${ empty reserInq }">
예약이 존재하지 않습니다.
</c:if>
	<table id="table" class="table">
	<tbody>
		<c:forEach var="res_inq" items="${ reserInq }">
				<tr id="res_inqTr" onclick="location.href='http://localhost/hotel_prj/user/reser_chk/reservation_confirm.jsp?res_no=${ res_inq.res_no }'">
					<td><c:out value="${ res_inq.res_no }"/></td>
					<td>Hotel Ritz Seoul</td>
					<td><c:out value="${ res_inq.chkin_date }"/>~<c:out value="${ res_inq.chkout_date }"/></td>
					<td>
					<c:choose>
					<c:when test="${ res_status eq Y }">예약완료</c:when>
					<c:when test="${ res_status eq N }"><span style="color:#ff0000">예약취소</span></c:when>
					</c:choose>
					</td>
				</tr>
		</c:forEach>
	</tbody>
	</table>
</div>
<br/><br/><br/>
<div style = "width:450px; text-align: center; margin:0px auto;">
<button type="button" class="btn btn-default" name="reservation_inq" onclick="main()">홈으로</button>
</div>


  <br/><br/><br/><br/><br/><br/>
<div class="container marketing">
 <!-- FOOTER -->
	
    </div><!-- /.container -->
	<jsp:include page="../../main/main_footer.jsp"/>

</div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://localhost/hotel_prj/common/bootstrap/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>