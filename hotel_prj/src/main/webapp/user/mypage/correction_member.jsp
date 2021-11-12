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
	/* tr {border: 1px solid #FF0000}
		td {border: 1px solid #FF0000}
		*/
	</style>


<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
function corpass(){if (confirm("비밀번호를 변경하시겠습니까?") == true) {
	alert("비밀번호 변경이 완료되었습니다.");
} else {
	return;
}
	location.href="http://localhost/jsp_prj/project02_team03/mypage/correction_member.jsp"
}
function coremail(){
	if (confirm("회원 정보를 수정하시겠습니까?") == true) {
	alert("회원정보 변경이 완료되었습니다.");
	} else {
		return;
	}
	location.href="http://localhost/hotel_prj/mypage/correction_member.jsp"
}

function exit(){
	if (confirm("회원 탈퇴를 하시겠습니까?") == true) {
		alert("탈퇴 되었습니다.");
	} else {
		return;
	}

	location.href="http://localhost/hotel_prj/main/Hotel_Ritz_Seoul.jsp"
}
function main(){
	alert("메인페이지로 이동합니다.");
	location.href="http://localhost/hotel_prj/main/Hotel_Ritz_Seoul.jsp"
}
</script>
</head>
<!-- NAVBAR
================================================== -->
  <body>
  <div class="navbar-wrapper">
 	 <jsp:include page="../../main/main_header_nav.jsp"/>
   </div>
<div>
<h5>&nbsp;&nbsp;홈 / 마이페이지</h5>
</div>
<br/><br/><br/>
<div style = "width:600px; border-bottom:2px solid #d3d3d3; text-align: center;">
<h2>마이페이지</h2>
</div>

<div style = "width:450px; border-bottom:2px solid #d3d3d3; text-align: center;">
<br/><br/><br/>
<h5>비밀번호 변경하기</h5>
<input type="text" style="width:250px;height:40px" placeholder="현재 비밀번호를 입력하세요">
<br/><br/>
<input type="text" style="width:250px;height:40px" placeholder="변경할 비밀번호를 입력하세요">
<br/><br/>
<input type="text" style="width:250px;height:40px" placeholder="변경할 비밀번호를 한 번 더 입력하세요.">
<br/><br/><br/>
<button type="button" class="btn btn-default" style="width:250px;height:40px" onclick="corpass()">수정</button>
<br/><br/><br/><br/><br/><br/>
</div>

<div style = "width:450px; border-bottom:2px solid #d3d3d3; text-align: center;">
<br/><br/><br/>
<h5>이름 변경하기</h5>
<input type="text" style="width:250px;height:40px" placeholder="변경할 이름을 입력하세요">
<br/><br/>
<h5>전화번호 변경하기</h5>
<input type="text" style="width:250px;height:40px" placeholder="변경할 전화번호를 입력하세요.">
<br/><br/>
<h5>이메일 변경하기</h5>
<input type="text" style="width:250px;height:40px" placeholder="변경할 이메일을 입력하세요.">
<br/><br/><br/>
<button type="button" class="btn btn-default" style="width:250px;height:40px" onclick="coremail()">수정</button>
<br/><br/><br/><br/><br/><br/>
</div>
<div style = "width:450px; text-align: center;">
<br/><br/><br/>
<button type="button" class="btn btn-default" style="width:100px;height:40px" onclick="exit()">회원탈퇴</button>
<br/><br/><br/>
<button type="button" class="btn btn-default" style="width:75px; height:30px;" onclick="main()">홈으로</button>
</div>
  <br/><br/><br/><br/><br/><br/>
<body>
<div class="container marketing">
 <!-- FOOTER -->
<jsp:include page="../../main/main_footer.jsp"/>

    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://localhost/hotel_prj/common/bootstrap/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>