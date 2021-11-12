<%@page import="user_imagesTab.ImageCount"%>
<%@page import="user_room.RoomVO"%>
<%@page import="user_room.RoomSelect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="Hotel Ritz Seoul"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

<style type="text/css">

/*
div { border: 1px solid #FF0000}
td { border: 1px solid #FFFF00}
tr { border: 1px solid #FFFF00}
*/
</style>

<!-- Bootstrap core CSS -->
<!-- jQuery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link href="http://localhost/hotel_prj/common/bootstrap/carousel.css"
	rel="stylesheet">
<!--  zebra_datepicker -->
<script src="http://localhost/hotel_prj/common/zebra_datepicker/zebra_datepicker.min.js"></script>
<link rel="stylesheet" href="http://localhost/hotel_prj/common/zebra_datepicker/css/default/zebra_datepicker.min.css">

<script type="text/javascript">
	
$(function(){
	$('#datepicker-range-start').Zebra_DatePicker({
	    direction: true,
	    pair: $('#datepicker-range-end'),
	    format: 'Y-m-d'
	});
	 
	$('#datepicker-range-end').Zebra_DatePicker({
	    direction: 1,
	    format: 'Y-m-d'
	});
	
	
	$("#btn").click(function(){
		 let sd=$("#datepicker-range-start").val();
		 let ed=$("#datepicker-range-end").val();
		 let adult = $("#adult").val(); 
		 //var adultCnt = Number (adult);
		 let child = $("#child").val();
		 //var childCnt = Number (child);
		 
		  if( (Number(adult) + Number(child)) > 4 ){
			 alert("어린이를 동반한 수용 가능한 최대 인원수는 4명입니다. ");
			 return;
		 }//end if 
		 
		   if ( !sd || !ed ){
			 alert("원하시는 예약 날짜를 선택해주세요.");
			 return;
		 }//end if   
		 
		//alert(sd +"  / " +ed + " / " + " / " + Number(adult) + " / " + Number(child) + " / " + (Number(adult) + Number(child)));
	 
		 let queryString = "start_date="+sd+"&end_date="+ed+"&adult="+adult+"&child="+child;
		
		 $.ajax({
			 url:"ajax_room_date.jsp",
			 type:"get",
			 data:queryString,
			 dataType:"json",
			 error:function(xhr){
				 console.log("에러코드:" + xhr.status + "/ 에러메시지" + xhr.statusText);
				},
			 success: function(jsonObj){
				//단일데이터
				if(!jsonObj.dataResult){
				//복합데이터
				alert("선택하신 날짜 : " + jsonObj.searchStartDate+ " ~ " + jsonObj.searchEndDate+
						"\n선택하신 인원수 ( 성인 : " + jsonObj.adultCnt + " 어린이 : " + jsonObj.childCnt +" ) \n예약가능한 방이 없습니다."
					);
							
				return;
				}//end if
				
				
				let output ="";
				//output="<div style='font-weight:bold'>";
				//output+=jsonObj.dataRow + "건 조회되었습니다.";
				//output+="</div>";
				
				
				
				//조회 데이터 (JSONArray) 보여주기
				let param="";
				$.each(jsonObj.data,function(idx,temp){
					param += "rev_room_num="+temp.room_no+"&";
				//요기서 디자인하기
				});//each
				
				location.href="room_reserve.jsp?"+param;
			
				//조회결과가 만들어졌다면 room_reserve.jsp에 출력
				//$("#view").html(output);
				
				
				//let room_no = $("#room_no").val(output);
				
				$("#dateFrm").submit(output);
				
				//location href = "http://localhost/hotel_prj/user/reser_room/room_reserve.jsp";
				
			 }//success
			 
		 });//end ajax
		
		 
	});//click
	
});//ready

</script>

</head>

<!-- NAVBAR
================================================== -->
<body>


		<c:import url="http://localhost/hotel_prj/main/main_header_nav.jsp" />
	<div class="wrapper" style = "text-align: center">
		<!-- header/navibar import -->
		<br />
		<br />
		<br />
		<br />
		
		<form name = "dateFrm" id = "dateFrm" method = "get" action = "room_reserve.jsp">
		<div>
		<table style = "width: 500px;  margin: 0px auto">
		<tr>
		<td>
		<label>성인 인원수</label>
		</td>
		<td>
		<input type = "number" id = "adult" name = "adult" min = "1" max = "4"/>
		</td>
		<td>
		<label>어린이 인원수</label>
		</td>
		<td>
		<input type = "number" id = "child" name = "child" min = "0" max = "3"/>
		</td>
		</tr>
		</table><br/>
		<div style = "width: 500px;  margin: 0px auto">
		저희 리츠호텔은 수용 가능한 최대 인원은 성인 4인입니다.<br/>
		어린이가 포함된 예약은 성인 1인 동반 필수입니다.  
		</div>
		<br/><br/><br/>
		</div>
		
		<div style="width: 700px; margin: 0px auto">
		<table style = "width: 700px;">
		<tr >
			<td >
			<label>체크인 날짜</label><br/> 
			<span class="Zebra_DatePicker_Icon_Wrapper"
				style=" width: 50px;"> <input
				id="datepicker-range-start" type="text" class="form-control"
				data-zdp_readonly_element="false"
				style="position: relative; float: none; inset: auto; margin: 0px; padding-right: 10px;"></span>
			</td>
			<td style = "width: 50px"></td>
			<td>
			<label>체크아웃 날짜</label><br/>
			<span class="Zebra_DatePicker_Icon_Wrapper"
				style=" width: 50px;"> <input
				id="datepicker-range-end" type="text" class="form-control"
				data-zdp_readonly_element="false"
				style="position: relative; float: none; inset: auto; margin: 0px; padding-right: 10px;"></span>
			</td>
			<td>
			</td>
			</tr>
			</table>
		</div><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
			<input type="button" class = "btn btn-default btn-lg"; value="조회" id="btn" />
			</form>
		< <div id="view" style="clear: both"></div> 






	</div>
	<!-- wrapper -->

	<br />
	<br />

	<!-- footer import -->
	<c:import url="http://localhost/hotel_prj/main/main_footer.jsp" />





	<!-- ================================================== -->

	<script
		src="http://localhost/hotel_prj/common/bootstrap/ie10-viewport-bug-workaround.js"></script>

</body>
</html>
