<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="Hotel Ritz Seoul"%>
<!DOCTYPE html>
<html lang="en">
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
		#mainImg {margin: 0px auto;}
		#navTab {background-color: #000000; color: #F5dF4D; width: 1130px; height: 50px; 
				margin: 0px auto; text-align: center; font-size: 15px;
				font-weight: bold; vertical-align: middle; display: table; table-layout: fixed }
				
		#logo {font-size: 30px; font-weight: bold; color: #000000; margin-top: 5px; cursor: pointer;}
		#logoF {font-size: 25px; font-weight: bold; color: #FFFFFF;cursor: pointer;
				margin-left: 25px;}
		#textF {font-size: 10px; color: #FFFFFF; margin-left: 25px}
		
		#linkLogin {font-size: 15px; font-weight: bold; color: #000000; cursor: pointer; float: right; margin-top: 15px;}
		#linkResView {font-size: 15px; font-weight: bold; color: #000000; cursor: pointer; float: right; margin-top: 15px; margin-right: 20px}
		#linkMyPage {font-size: 15px; font-weight: bold; color: #000000; cursor: pointer; float: right; margin-top: 15px; margin-right: 20px}
					
		#promo {font-size: 25px; font-weight: bold; color: #000000}
		
		div {margin: 0px auto; width: 1130px;}
		
		.navTd:hover { background-color: #F5dF4D; color :#000000; cursor: pointer;}
		
		.divFooter {background-color: #000000; color: #FFFFFF; width: 1130px; height: 200px; 
					margin: 0px auto; vertical-align: bottom; padding-top: 20px}
					
		.promTab { width: 1130px; height: 1000px; text-align: center}
		
		.promTitle:link {text-decoration: none; color: #5A5A5A; }
		.promTitle:hover {text-decoration: none; color: #000000; font-weight:bold;}
		
	</style>


<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(function() {
	$("#btn").click(function() {
		if($("#pass").val()==""){
			alert("비밀번호를 입력해 주세요.");
			return;
	}//end if
		
		
		$("#frm").submit();
	});//click	
	

});


function home(){
	alert("메인페이지로 이동합니다.");
	location.href="http://localhost/hotel_prj/main/Hotel_Ritz_Seoul.jsp"
}

</script>
</head>
<!-- NAVBAR
================================================== -->
  <body>
 <form action="../login/login_process.jsp"  method="post" id="frm" name="frm">
<div>
 		 <jsp:include page="../../main/main_header_nav.jsp"/>
 		 
<h4>&nbsp;&nbsp;홈 / 마이페이지</h4>
</div>
<br/><br/><br/>
<div style = "width:600px; text-align: center;border-bottom:2px solid #d3d3d3 ">
<h2>마이페이지</h2>
</div>
<div style = "text-align: center; ">
<br/><br/><br/>
<h4>비밀번호를 입력해주세요.</h4>
<input type="text" name="pass" id="pass" style="width:250px;height:40px" placeholder="현재 비밀번호를 입력하세요">
<br/><br/>
<button type="button" class="btn btn-default"  id="btn" style="width:250px;height:40px" >확인</button>
<br/><br/><br/>
<button type="button" class="btn btn-default" style="width:75px; height:30px;" onclick="home()">홈으로</button>

</div>

   </form>
  <br/><br/><br/><br/><br/><br/>
<body>
<div class="container marketing">
  <!-- FOOTER -->
 <jsp:include page="../../main/main_footer.jsp"/>

    </div>
    <!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://localhost/hotel_prj/common/bootstrap/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>