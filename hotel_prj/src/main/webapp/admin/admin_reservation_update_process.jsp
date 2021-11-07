<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="admin_reservation.ReserveModify"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="예약 건 삭제"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

</head>
<body>
<!-- 파라미터 없는 루트로 들어왔을 때 redirect -->
<c:if test="${empty param.inYear}">
	<c:redirect url="http://localhost/hotel_prj/admin/admin_reservation_main.jsp"/>
</c:if>
<%
//날짜 검증
//현재일을 date 형식으로 변환
String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
Date toDay = new SimpleDateFormat("yyyy-MM-dd").parse(date);

//체크인 일자를 date 형식으로 변환
StringBuilder sb = new StringBuilder();
sb.append((String)request.getParameter("inYear")).append("-")
.append((String)request.getParameter("inMonth")).append("-")
.append((String)request.getParameter("inDay"));
Date chkInDate = new SimpleDateFormat("yyyy-MM-dd").parse(sb.toString());

//체크아웃 일자를 date 형식으로 변환
StringBuilder sb2 = new StringBuilder();
sb2.append((String)request.getParameter("outYear")).append("-")
.append((String)request.getParameter("outMonth")).append("-")
.append((String)request.getParameter("outDay"));
Date chkOutDate = new SimpleDateFormat("yyyy-MM-dd").parse(sb2.toString());

//체크인/아웃 일자가 현재일자보다 빠르면 back
if(chkInDate.before(toDay) || chkOutDate.before(toDay)){
 %>
<script type="text/javascript">
	alert("체크인/체크아웃은 현재일 이후의 날짜로 입력해주세요.");
	history.back();
</script>
<% } 
//체크아웃 일자가 체크인보다 빠르면 back
 else if(chkOutDate.before(chkInDate)){
 %>
<script type="text/javascript">
	alert("체크아웃 일자는 체크인 일자보다 커야 합니다.");
	history.back();
</script>
<%}%>

<c:catch var="e">
</c:catch>
<c:if test="${not empty e}">
	<strong>죄송합니다. 삭제 작업 중 문제가 발생했습니다.</strong><br/>
	<strong>잠시 후 다시 시도해주세요.</strong><br/>
	<a href="http://localhost/hotel_prj/admin/admin_reservation_main.jsp">뒤로 가기</a>
</c:if>  
</html>