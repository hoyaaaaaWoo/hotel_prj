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
    
    <script type="text/javascript">
    function main() {
		alert("메인 페이지로 이동합니다.");
		location.href = "http://localhost/hotel_prj/main/Hotel_Ritz_Seoul.jsp"
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
  
  <form action="find_id.jsp" method="post" id="fidFrm" name="fidFrm">
  
  <div style="width: 300px; margin: 0px auto;">
  <h2 style="text-align: center; ">아이디 찾기</h2>
  </div>
  
  <hr style="width: 500px;"/>
  <br>
  
  <div style="width: 300px; text-align: center; margin: 0px auto;">
  
  <label>이름</label>
  <input type="text" class="form-control" name="kname" id="kname" placeholder="이름을 입력하세요">
  
  <br/><br/>
  
  <label>이메일</label>
  <input type="text" class="form-control" name="email" id="email" placeholder="가입시 등록한 이메일을 입력하세요">
  
  <br/><br/>
  
  <input type="button" class="btn" value="아이디 찾기" onclick="location.href='http://localhost/hotel_prj/user/login/find_id.jsp'">
  
  </div>
  
  <br/><br/>
  <hr/>
  <br/><br/>
  
  </form>
  
  <form action="find_pass.jsp" method="post" id="fidFrm" name="fidFrm">
  
  <div style="width: 300px; text-align: center; margin: 0px auto;">
  <h2 style="text-align: center;">비밀번호 찾기</h2>
  </div>
  <br>
  
  <hr style="width: 500px; margin: 0px auto;"/>
  <br>
  
  <div style="width: 300px; text-align: center; margin: 0px auto;">
  
  <label>아이디</label>
  <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력하세요">
  
  <br/><br/>
  
  <label>이름</label>
  <input type="text" class="form-control" name="kname" id="kname" placeholder="이름을 입력하세요">
  
  <br/><br/>
  
  <label>이메일</label>
  <input type="text" class="form-control" name="email" id="email" placeholder="가입시 등록한 이메일을 입력하세요">
  
  <br/><br/>
  
  <input type="button" class="btn" value="비밀번호 찾기" onclick="location.href='http://localhost/hotel_prj/user/login/find_pass.jsp'">
  
  <br><br><br><br><br>
  
  </div>
  
  </form>
  
<div style="width: 1135px; text-align: center;">
<button type="button" class="btn btn-default" style="width: 100px; height: 40px" onclick="main()">홈으로</button>
</div>
  
  </div>
  
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
      <!-- FOOTER -->
	<jsp:include page="../../main/main_footer.jsp"/>

</div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://localhost/hotel_prj/common/bootstrap/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
