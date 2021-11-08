<%@page import="user_find.FindSelect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info = "Hotel Ritz Seoul"%>
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
  <jsp:useBean id="mVO" class="admin_member.MemberVO"/>  
  <!-- *써서 setter method 다 실행해서 세팅됨 -->
  <jsp:setProperty property="*" name="mVO"/>
  
   <%
  FindSelect fD = new FindSelect();
  String id = fD.findId(mVO);
  %>
  
  
  <br>
  <hr style="width: 500px"/>
  <br>
  
  <div style="width: 300px;text-align: center; margin: 0px auto;">
  <input type="text" class="form-control" value=<%=id%>>
  <br/><br/>
  
  <form action="http://localhost/hotel_prj/user/login/find.jsp">
  <input type="submit" class="button" id="loginBtn" style="width: 100px;" value="로그인">
  </form>
  </div>
  
  
<!--  <div style="width:150px; text-align: center;">
  </div>
 -->
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
