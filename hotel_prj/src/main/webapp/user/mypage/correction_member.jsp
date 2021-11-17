<%@page import="user_login.MemberDAO"%>
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
     <!-- 메인 CSS -->
	<link rel="stylesheet" type="text/css"
	href="http://localhost/hotel_prj/main/main.css">
	<style type = "text/css">

	</style>
	
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#tel").focusout(function(){
		   telCheck($(this).val()); 
		   });//focusout 
		   $("#email").focusout(function(){
				emailCheck($(this).val()); 	    
			 });//focusout 
	$("#btn").click(function(){
		var regPass = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;     // 비밀번호 정규식
		var change_pass =$("#change_pass").val();
		if(confirm("변경하시겠습니까?") == true) {
			if( $("#pass").val() =="" || $("#change_pass").val() =="" || $("#change_pass2").val() ==""   ){
					alert("비밀번호는 공백없이 입력해주세요.");
					return;	
			}else if( $("#change_pass").val() != $("#change_pass2").val()   ){
					alert("변경할 비밀번호가 서로 일치하지 않습니다. ");
					return;
			}else if(  ($("#pass").val()) == ($("#change_pass").val()|| $("#change_pass2").val()) ){
						alert("현재 비밀번호와 변경할 비밀번호가 동일합니다");
				return;
			}else if(	!regPass.test($("#change_pass").val()) ){
				alert("비밀번호는 숫자와 문자를 조합하여 8~16글자로 설정해 주세요.");
				return;
			}else if( change_pass.search(/\s/) != -1   ){
				alert("비밀번호는 공백 없이 입력해주세요.");
				return;
			}
		
		$("#passFrm").submit();	
		}//end if
	})//click
	////////////////////////////////////////////////////
	$("#btn1").click(function(){
		if(confirm("변경하시겠습니까?") == true) {
			if(    ( ($("#kname").val() !="" && $("#tel").val()=="" && $("#email").val() =="")  || 
					($("#kname").val() =="" && $("#tel").val()!="" && $("#email").val() =="") ||
					($("#kname").val() =="" && $("#tel").val()=="" && $("#email").val() !="") )   ||  
					
					( ($("#kname").val() !="" && $("#tel").val()!="" && $("#email").val() =="") || 
					($("#kname").val() !="" && $("#tel").val()=="" && $("#email").val() !="") || 
					($("#kname").val() =="" && $("#tel").val()!="" && $("#email").val() !="") )    ||
					
					(  ($("#kname").val() !="" && $("#tel").val()!="" && $("#email").val() !=""))	){
			    
				
			      
			}else{
				alert("변경할 값을 입력해 주세요");
				return;
			}
			$("#frm").submit();	
		}//end if
	})//click
				function telCheck(args) {
			    	   var flag=false;
			    	    
			    	    if (/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/.test(args)) {
			    	        flag= true;
			    	    }
			    	    if(flag==false){
			    	       alert("전화번호를 확인해 주세요");
			    	       $("#tel").val('');
			    	    }
			      }
    function emailCheck() {		


  		var email = document.getElementById("email").value;

  		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

  				if(exptext.test(email)==false){

  			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			

  			alert("이 메일형식이 올바르지 않습니다.");

  			document.addjoin.email.focus();

  			return false;

  		}

  	}

	$("#delBtn").click(function(){
		if (confirm("정말 탈퇴를 하시겠습니까?") == true) {
			alert("회원 탈퇴가 완료되었습니다. \n그동안이용해주셔서 감사합니다");
		}
		$("#delfrm").submit();	
		return;
	})//click
	
})//ready



</script>
</head>


 <jsp:useBean id="mVO" class="user_login.memberVO" scope="page"/>
<jsp:setProperty property="*" name="mVO"/><!--  입력정보-->
<%
String id=(String)session.getAttribute("id");
pageContext.setAttribute("mVO", mVO.getPass());
%>
<!-- NAVBAR
================================================== -->
  <body>
 	 <jsp:include page="../../main/main_header_nav.jsp"/>
  <div class="navbar-wrapper">
   </div>
<div>
<br/>
<h4>&nbsp;&nbsp;홈 / 마이페이지</h4>
</div>
<br/><br/><br/>
<div style = "width:600px; border-bottom:2px solid #d3d3d3; text-align: center; margin: 0px auto;">
<h2>마이페이지</h2>
</div>
<div style = "width:450px; border-bottom:2px solid #d3d3d3; text-align: center; margin: 0px auto;">
<br/><br/><br/>
<h5>비밀번호 변경하기</h5>
<form  id="passFrm" action="http://localhost/hotel_prj/user/mypage/member_pass_process.jsp" method="post">
<input type="password" style="width:250px;height:40px" placeholder="현재 비밀번호를 입력하세요"id="pass"  value="${mVOPass }" name ="pass">
<br/><br/>
<input type="password" style="width:250px;height:40px" placeholder="변경할 비밀번호를 입력하세요" id="change_pass" name="change_pass">
<br/><br/>
<input type="password" style="width:250px;height:40px" placeholder="변경할 비밀번호를 한 번 더 입력하세요."  id="change_pass2" name="change_pass2">
<br/><br/><br/>
<button type="button" class="btn btn-default" style="width:250px;height:40px" id="btn">수정</button>
</form>
<br/><br/><br/><br/><br/><br/>
</div>

<div style = "width:450px; border-bottom:2px solid #d3d3d3; text-align: center; margin: 0px auto;">
<br/><br/><br/>
<form id="frm" action="http://localhost/hotel_prj/user/mypage/member_update_process.jsp" method="post">
<h5>이름 변경하기</h5>
<input type="text" style="width:250px;height:40px" id="kname" name="kname" placeholder="변경할 이름을 입력하세요">
<br/><br/>
<h5>전화번호 변경하기<br/>("-"를 포함해주세요)</h5>
<input type="text" style="width:250px;height:40px" placeholder="변경할 전화번호를 입력하세요." name="tel" id="tel">
<br/><br/>

<h5>이메일 변경하기</h5>
<input type="text" style="width:250px;height:40px" placeholder="변경할 이메일을 입력하세요." name="email" id="email">
<br/><br/><br/>
<button type="button" class="btn btn-default" style="width:250px;height:40px ; margin: 0px auto;" value="수정"  id="btn1">수정</button>
</form>
<br/><br/><br/><br/><br/><br/>
</div >

<div style = "width:450px; text-align: center; margin: 0px auto;">
<br/><br/><br/>
<form action="member_del.jsp" id="delfrm" name="delfrm">
<button type="button" class="btn btn-default" style="width:100px;height:40px" id="delBtn">회원탈퇴</button>
</form>
<br/><br/><br/>
</div>
  <br/><br/><br/><br/><br/><br/>
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