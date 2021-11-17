<%@page import="user_find.FindVO"%>
<%@page import="user_find.FindSelect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info = "Hotel Ritz Seoul"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    
	<style type = "text/css">
	
	</style>
	
    <!-- Bootstrap core CSS -->
	<!-- jQuery CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	

	<!-- Bootstrap CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
    <script src="http://localhost/hotel_prj/common/bootstrap/holder.js"></script>

    <script src="http://localhost/hotel_prj/common/bootstrap/ie-emulation-modes-warning.js"></script>

    <link href="http://localhost/hotel_prj/common/bootstrap/carousel.css" rel="stylesheet">

<script type="text/javascript">
function login() {
	location.href = "http://localhost/hotel_prj/user/login/login.jsp"
}
</script>

</head>
  
<!-- NAVBAR
================================================== -->
  <body>
 <div class="wrapper">
		<jsp:include page="../../main/main_header_nav.jsp"/>
	
	<!-- Standard button -->

	
      	
   <div class="container marketing">
  <br/><br/>
  <div style="width: 300px;text-align: center; margin: 0px auto;">
  <br>
  <h2>아이디 찾기</h2>
  </div>
  
  <%request.setCharacterEncoding("UTF-8"); %>
  
  <!-- 이전 페이지에서 날아온 웹파라미터 이 페이지에서 받아서 설정하기 -->
  <jsp:useBean id="fVO" class="user_find.FindVO"/>  
  <!-- *써서 setter method 다 실행해서 세팅됨 -->
  <jsp:setProperty property="*" name="fVO"/>
  
<%
//파라미터로 받아오기
   	String kname = request.getParameter("kname");
   	String email = request.getParameter("email");
	pageContext.setAttribute("kname", kname);
	pageContext.setAttribute("email", email);
   	
	FindSelect fD = new FindSelect();
	
	fVO.setKname(kname);
	fVO.setEmail(email);
	
	  
%>
  
  
  <br>
  <hr style="width: 500px"/>
  <br>
  
  <div style="width: 300px;text-align: center; margin: 0px auto;">
	<c:out value="${ fVO.id }"/><!-- 아이디 출력 -->
  <br/><br/>
  
</div>
  
  
  <div style="width: 1135px; text-align: center;">
	<button type="button" class="btn btn-default"
			style="width: 100px; height: 40px" onclick="login()">로그인</button>
   </div>
  </div>
    
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</div>

	<jsp:include page="../../main/main_footer.jsp"/>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://localhost/jsp_prj/common/bootstrap/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
