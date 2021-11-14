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
    

		$(function(){
			
			$("#tel").focusout(function(){
			   telCheck($(this).val()); 
			   });//focusout 
			   
			$("#pass1").focusout(function(){
				 passCheck($(this).val()); 
			 });//focusout    
			$("#birth_year").focusout(function(){
				 birthCheck($(this).val()); 
			 });//focusout    
			 
	
			 
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
				if($("#pass1").val()==""){
					alert("비밀번호 필수 입력");
					return;
			}//end if
				if($("#ename_fst").val()==""){
					alert("이름 필수 입력");
					return;
			}//end if
				if($("#ename_lst").val()==""){
					alert("비밀번호 필수 입력");
					return;
			}//end if
				if($("#kname").val()==""){
					alert("이름 필수 입력");
					return;
			}//end if
				if($("#tel").val()==""){
					alert("전화번호 필수 입력");
					return;
			}//end if
				if($("#birth_year").val()==""){
					alert("생년월일 필수 입력");
					return;
			}//end if
				$("#frm").submit();
			});//click	
				
			 function passCheck(args) {
				   var flag=false;
				    if($("#pass").val()!=$("#pass1").val()){
				         alert("비밀번호가 일치하지 않습니다");
				         $('#pass').focus();
				         $('#pass1').val('');
				         return;

			}
			}

		
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
		      
		      function birthCheck(args) {
		    	   var flag=false;
		    	    
		    	    if (  /^(19[0-9][0-9]|20\d{2}).(0[0-9]|1[0-2]).(0[1-9]|[1-2][0-9]|3[0-1])$/.test(args)) {
		    	        flag= true;
		    	    }
		    	    if(flag==false){
		    	       alert("생년월일을 확인하여 주세요");
		    	       $("#birth_year").val('');
		    	    }
		      }
		      
		    

	
	
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
	
<div class="container" style="margin: 0px auto;">

	<!-- 약관 동의 -->
	<br/><br/><br/>
	<table style="margin:0px auto; text-align: center;">
	<tr >
		<td><h2 style="padding: 10px;margin:0px auto;">약관 동의</h2></td>
	</tr>
	<tr>
		<td>아래 동의서를 각각 확인한 후 개별적으로 동의하실 수 있습니다. 전체 동의 시 체크되는 동의 항목에는 선택동의 항목이 포함되어 있습니다.
		<br>회원가입을 위하여 호텔 (이하 "회사")에서는 아래와 같이 개인정보를 수집, 이용 및 제공하고자 합니다</td>
	</tr>
	</table>
<br/><br/><br/><br/>
<div style="padding: 10px; margin: 0px auto;">
	<table class="table" style="height: 600px;">
	<tr>
		<td><input type="checkbox" name="req_agree" id="req_agree" value="Y"></td>
		<td>개인정보의 수집·이용에 관한 사항<span class="essential"> (필수)</span>	<br><br><br>
		<textarea rows="10" cols="130" >롯데호텔앤리조트 롯데호텔 리워즈 회원가입과 관련하여 아래와 같이 개인정보를 수집 및 이용하는 것에 동의합니다.


개인정보 수집항목
- 필수사항 : 성명(영문), 국가, 생년월일, 연락처(모바일 또는 자택), 이메일, 아이디, 비밀번호, 리워즈 회원번호(자동생성), Hotel Ritz seoul(국내 및 해외 체인호텔 포함, 이하 “Hotel Ritz seoul”) 예약 및 투숙정보(투숙기간, 숙박료, 구매금액 포함), 포인트 적립 및 사용내역, 할인내역, IP/쿠키정보

개인정보 수집 및 이용 목적
- Hotel Ritz seoul 리워즈 회원제 서비스에 따른 본인확인 절차에 활용
- 할인 등 각종 멤버십 서비스 제공
- 고객공지, 불만처리를 위한 원활한 의사소통의 경로확보
- 부정이용 방지, 법적 분쟁 등의 처리

개인정보 보유 및 이용 기간
수집이용 동의일로부터 회원 탈회시 까지 보유됩니다.

동의를 거부할 권리가 있으나 및 동의를 거부할 경우 Hotel Ritz seoul 리워즈 회원가입 서비스 이용이 불가능 합니다.


보유 및 이용기간 예외 사항
- 부커멤버십, 트레비클럽 등 당사 타 멤버십에 가입되어 있으신 경우 해당 서비스 제공을 위한 개인정보는 멤버십 탈회시까지 보유됩니다.
- 소비자의 분쟁처리 및 부정이용, 공공질서에 위배되는 행위이용 기록(성명, 연락처, 이메일, 투숙정보)은 수집 시점으로부터 3년간 보관하고 파기하고 있습니다.</textarea></td>
	</tr>
	<tr>
	<td><input type="checkbox" name="opt_agree" id="opt_agree" value="Y"></td>
	<td>상품안내 및 마케팅 활용을 위한 개인정보 수집·이용에 관한 동의<span class="optional"> (선택)</span>
	<br><input type="checkbox">SMS &nbsp;<input type="checkbox">E-mail<br><br><br>
		<textarea rows="10" cols="130">상품안내 및 마케팅 활용을 위한 개인정보 수집·이용에 관한 동의
국내 및 해외 롯데호텔앤리조트 회원서비스 관련정보, 할인상품 및 신상품 안내, 마케팅 서비스를 위하여 국내 및 해외 체인 롯데호텔에 개인정보를 수집 및 이용하는 것에 동의 합니다.


개인정보 수집항목
- 위 2항 및 5항과 같이 귀하의 동의를 받아 수집한 개인정보
[필수사항]
- 롯데호텔 리워즈 정보: 성명(영문/여권명), 국가, 생년월일, 연락처(모바일 또는 자택), 이메일, 아이디, 비밀번호, 리워즈 회원번호(자동생성), Hotel Ritz seoul(국내 및 해외 체인호텔 포함, 이하 “Hotel Ritz seoul”) 예약 및 투숙정보, 포인트 적립 및 사용내역, 할인내역, IP/쿠키 정보
- 선택사항 : 성명(한글)

개인정보 수집 및 이용목적
- SMS, E-MAIL을 통한 국내 및 해외 Hotel Ritz seoul 리조트의 회원서비스 관련 정보, 할인 상품 및 신상품 안내, 마케팅 활용을 위한 이용

개인정보 보유기간
- 수집이용 동의일로부터 회원 탈회시 까지 보유됩니다.

* 국내 및 해외 Hotel Ritz seoul 리조트
- 롯데호텔의 국내 및 해외 체인호텔

동의를 거부할 권리가 있으나 동의를 거부할 경우 상기 국내 및 해외 Hotel Ritz seoul 리조트 할인상품 및 신상품 안내 서비스이용에 제약이 있습니다.</textarea><br><br></td>
	</tr>
	</table>
</div>	
	
	<br/><br/><br/><br/><br/>
	
	<!-- 아이디 만들기 -->
	<div class= "container" style=" margin:0px auto;">
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
	<td style="padding: 5px;"><input type="text" class="form-control"  name="pass1" id="pass1" placeholder="한번 더 입력하세요"> </td>
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
	<td style="font-weight: bold">생년월일  ("."를 입력해주세요)</td>
	</tr>
	<tr>
	<td style="padding: 5px;"><input type="text" class="form-control" name="birth_year" id="birth_year" placeholder="YYYY.MM.DD"> </td>
	</tr>
	<tr>
	<td style="font-weight: bold">연락처  ("-"를 입력해주세요)</td>
	</tr>
	<tr>
	<td style="padding: 5px;"><input type="text" class="form-control" name="tel" id="tel" placeholder="000-0000-0000"> </td>
	</tr>
	</table>
	</div>
	<br>
	<div style="width : 100px; text-align: center; margin:0px auto;">
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
