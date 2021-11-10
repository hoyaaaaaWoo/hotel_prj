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

<!-- datepicker -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<script type="text/javascript">

let adultNum;

function adultCount(type)  {
	  // 결과를 표시할 element
	  let cntAdult = document.getElementById('adult');
	  
	  // 현재 화면에 표시된 값
	  adultNum = cntAdult.innerText;
	  
	  // 더하기/빼기
	  if(type === 'plus') {
		  adultNum = parseInt(adultNum) + 1;
	    if(adultNum >4){
	    	adultNum = 4;
	    }
	  }else if(type === 'minus')  {
		  adultNum = parseInt(adultNum) - 1;
	    if(adultNum<1){
	    	adultNum=1;
	    }
	  }
	  
	  // 결과 출력
	  cntAdult.innerText = adultNum;
	  
}//count


let kidsNum;

function kidsCount(type)  {
	  // 결과를 표시할 element
	  let cntKids = document.getElementById('kids');
	  
	  // 현재 화면에 표시된 값
	  kidsNum = cntKids.innerText;
	  
	  // 더하기/빼기
	  if(type === 'plus') {
		  kidsNum = parseInt(kidsNum) + 1;
	    if(kidsNum >4){
	    	kidsNum = 4;
	    }
	  }else if(type === 'minus')  {
		  kidsNum = parseInt(kidsNum) - 1;
	    if(kidsNum<0){
	    	kidsNum=0;
	    }
	  }
	  
	  // 결과 출력
	  cntKids.innerText = kidsNum;
	  
}//count


$(function() {
		
	//room header btn
		$("#roomIntroBtn").click(function(){
			location.href="http://localhost/hotel_prj/user/reser_room/room_intro.jsp";
		})//table click
		
		$("#roomReserBtn").click(function(){
			location.href="http://localhost/hotel_prj/user/reser_room/room_date.jsp";
		})//table click
		
	
	//date picker
	  $('input[name="daterange"]').daterangepicker({
	    opens: 'left'
	  }, function(start, end, label) {
	    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
	  });
	
	
	$("#pickRoom").click(function() {
		alert();
		location.href="http://localhost/hotel_prj/user/reser_room/room_reserve.jsp?kidsNum="+kidsNum;
			
	});	//click
	  
});
</script>
</head>
<body>
<div class="wrapper">

<jsp:include page="../../main/main_header_nav.jsp"/>	

		<br><br><br><br>
				
		<div style="width: 720px;  margin:0px auto; text-align: center;">
 		 <input type="button" id = "roomIntroBtn" value="객실소개" class="btn btn-default" style="width: 100px;">	
  			&nbsp;	&nbsp; 	&nbsp;
 		 <input type="button" id = "roomReserBtn" value="객실예약" class="btn btn-default" style="width: 100px;" >
  		</div><br/>
		
		<div class="container" style="text-align: center;">
  		<hr class = "hr1">
		
		성인
		<input type="button" class="btn btn_pctrl" onclick="adultCount('minus')" value="-">                        
	    <span id="adult">1</span>                                                        
		<input type="button" class="btn btn_pctrl" onclick="adultCount('plus')" value="+">                        
		
		어린이
		<input type="button" class="btn btn_pctrl" onclick="kidsCount('minus')" value="-">                        
	    <span id="kids">0</span>                                                             
		<input type="button" class="btn btn_pctrl" onclick="kidsCount('plus')" value="+">                        
		
		<hr/>
		
		<input type="text" name="daterange" value="date picker" />
		
		<br><br><br><br><br><br><br><br><br>
		
		<input type="button" id="pickRoom" name="pickRoom" value="예약하기">

  <br/><br/><br/><br/><br/><br/>
  
  
 <!-- FOOTER -->
	<jsp:include page="../../main/main_footer.jsp"/>
	
	</div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://localhost/hotel_prj/common/bootstrap/ie10-viewport-bug-workaround.js"></script>
   </div> 
  </body>
</html>