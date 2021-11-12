<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div class="wrapper">
<jsp:include page="../../main/main_header_nav.jsp"/>	

<div style="margin:0px auto;">
<h4>&nbsp;&nbsp;홈 / 마이페이지</h4>
</div>
<br/><br/><br/>
<input type="hidden" value="${ id }">
<div style = "width:800px; text-align: center; margin:0px auto;">
<h2>예약조회</h2>
</div>
<br/><br/>
<div  style = "width:600px; text-align: center; margin:0px auto;">
	<table id="table">
				<tr>
					<td><a href = "http://localhost/hotel_prj/user/reser_chk/reservation_confirm.jsp" >10445635 </a></td>
					<td><a href = "http://localhost/hotel_prj/user/reser_chk/reservation_confirm.jsp" >Hotel Ritz Seoul</a></td>
					<td><a href = "http://localhost/hotel_prj/user/reser_chk/reservation_confirm.jsp" >2022년05월24일~2022년05월25일</a></td>
					<td><a href = "http://localhost/hotel_prj/user/reser_chk/reservation_confirm.jsp">예약완료</a></td>
				</tr>
				<tr>
					<td>10445635</td>
					<td>Hotel Ritz Seoul</td>
					<td>2022년05월24일~2022년05월25일</td>
					<td>예약취소</td>
				</table>
</div>
<br/><br/><br/>
<div style = "width:450px; text-align: center; margin:0px auto;">
<button type="button" class="btn btn-default" name="reservation_inq" onclick="main()">홈으로</button>
</div>



  <br/><br/><br/><br/><br/><br/>
<div class="container marketing">
 <!-- FOOTER -->
	<jsp:include page="../../main/main_footer.jsp"/>
	
    </div><!-- /.container -->

</div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://localhost/hotel_prj/common/bootstrap/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>