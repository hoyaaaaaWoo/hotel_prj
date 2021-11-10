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
			div {margin: 0px auto; width: 1130px;}
			table{margin:0px auto;}
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
    

		$(function(){
			$("#btn").click(function(){
				if($("#id").val()==""){
					alert("아이디 필수 입력");
					return;
			}//end if
				if($("#email").val()==""){
					alert("이메일 필수 입력");
					return;
			}//end if
				if($("#pass").val()==""){
					alert("비밀번호 필수 입력");
					return;
			}//end if
				
				
				$("#frm").submit();
			});//click	
		
	
				$("#dupId").click(function(){
					window.open("sign_id_dup.jsp","dup","width=400,height=400");	
			});

	
			$("#dupEmail").click(function(){
				window.open("sign_email_dup.jsp","dup","width=400,height=400");	
		});
	});//ready



    </script>
  </head>
  
<!-- NAVBAR
================================================== -->
  <jsp:include page="../../main/main_header_nav.jsp"/>
  
<form action="sign_form_process.jsp" method="post" name="frm" id="frm">
	
<div>
	<!-- 약관 동의 -->
	<br/><br/><br/>
	<table style="margin:0px auto; text-align: center;">
	<tr >
		<td><h2 style="padding: 10px;">약관 동의</h2></td>
	</tr>
	<tr>
		<td>아래 동의서를 각각 확인한 후 개별적으로 동의하실 수 있습니다. 전체 동의 시 체크되는 동의 항목에는 선택동의 항목이 포함되어 있습니다.
		<br>회원가입을 위하여 호텔 (이하 "회사")에서는 아래와 같이 개인정보를 수집, 이용 및 제공하고자 합니다</td>
	</tr>
	</table>
<br/><br/><br/><br/>
<div style="padding: 10px;">
	<table class="table" style="height: 600px;">
	<tr>
		<td><input type="checkbox" name="req_agree" id="req_agree" value="Y"></td>
		<td>개인정보의 수집·이용에 관한 사항<span class="essential"> (필수)</span>	<br><br><br>
		<textarea rows="10" cols="130"></textarea></td>
	</tr>
	<tr>
	<td><input type="checkbox" name="opt_agree" id="opt_agree" value="Y"></td>
	<td>상품안내 및 마케팅 활용을 위한 개인정보 수집·이용에 관한 동의<span class="optional"> (선택)</span>
	<br><input type="checkbox">SMS &nbsp;<input type="checkbox">E-mail<br><br><br>
		<textarea rows="10" cols="130"></textarea><br><br></td>
	</tr>
	</table>
</div>	
	
	<br/><br/><br/><br/><br/>
	
	<!-- 아이디 만들기 -->
	<div class= "container" >
	<table style="height: 800px; width: 800px;">
	<tr>
	<td style="font-weight: bold">아이디</td>
	</tr>
	<tr>
	<td style="padding: 5px;"><input type="text" class="form-control"  name="id" id="id" placeholder="아이디를 입력하세요" readonly="readonly"> </td>
	<td><input type="button" value="중복확인"  id="dupId"> </td>
	</tr>
	<tr>
	<td style="font-weight: bold">이메일</td>
	</tr>
	<tr>
	<td style="padding: 5px;"><input type="text" class="form-control" name="email"  id="email" placeholder="이메일을 입력하세요"readonly="readonly"></td>
	<td><input type="button" value="중복확인" id="dupEmail"> </td>
	</tr>
	<tr>
	<td style="font-weight: bold">비밀번호</td>
	</tr>
	<tr>
	<td style="padding: 5px;"><input type="text" class="form-control" name="pass" id="pass" placeholder="비밀번호를 입력하세요"> </td>
	<td style="padding: 5px;"><input type="text" class="form-control" placeholder="한번 더 입력하세요"> </td>
	</tr>
	<tr>
	<td style="font-weight: bold">영문이름 <span style="font-size: 10px;">※여권상의 이름을 입력하세요</span></td>
	</tr>
	<tr>
	<td style="padding: 5px;"><input type="text" class="form-control" name="ename_lst" id="ename_lst" placeholder="영문 성을 입력하세요"> </td>
	<td style="padding: 5px;"><input type="text" class="form-control" name="ename_fst" id="ename_fst" placeholder="영문 이름을 입력하세요"> </td>
	</tr>
	<tr>
	<td style="font-weight: bold">한글이름</td>
	</tr>
	<tr>
	<td style="padding: 5px;"><input type="text" class="form-control"  name="kname" id="kname" placeholder="성명(한글)"> </td>
	</tr>
	<tr>
	<td style="font-weight: bold">생년월일</td>
	</tr>
	<tr>
	<td style="padding: 5px;"><input type="text" class="form-control" name="birth_year" id="birth_year" placeholder="YYYY.MM.DD"> </td>
	</tr>
	<tr>
	<td style="font-weight: bold">연락처</td>
	</tr>
	<tr>
	<td style="padding: 5px;"><input type="text" class="form-control" name="tel" id="tel" placeholder="전화번호를 입력하세요"> </td>
	</tr>
	</table>
	</div>
	<br>
	<div style="width : 100px; text-align: center;">
	<input type="submit" class="btn btn-default" value="입력" id="btn" >
	</div>
</div>
</form>
      	
    
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
     <!-- FOOTER -->
     <jsp:include page="../../main/main_footer.jsp"/>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://localhost/hotel_prj/common/bootstrap/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
