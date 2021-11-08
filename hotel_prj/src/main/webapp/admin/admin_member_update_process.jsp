<%@page import="admin_member.MemberUpdate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost/jsp_prj/common/css/main_v20211012.css">

<style type="text/css">

</style>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

</script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="ev" class="admin_member.MemberVO" scope="page"/>
<jsp:setProperty property="*" name="ev"/>
<c:catch var="e">
<%
MemberUpdate mu =new MemberUpdate();
pageContext.setAttribute("cnt", mu.updateMember(ev));
%>
<c:choose>
<c:when test="${cnt eq 0}">
<c:out value="${ param.kname }"/>회원은 존재하지 않습니다.
</c:when>
<c:otherwise>
<c:out value="${ param.kname}"/>회원 정보를 변경하였습니다.
</c:otherwise>
</c:choose>
<br/>
<a href="javascrip:history.back()">뒤로</a>
</c:catch>
<c:if test="${not empty e }">
변경 작업 중 문제가 발생하였습니다<br/>
</c:if>



</body>
</html>