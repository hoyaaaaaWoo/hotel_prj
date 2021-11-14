<%@page import="user_login.updateDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost/jsp_prj/common/css/main_v20211012.css" />   
<style type="text/css">

</style>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

</script>
</head>
<body>
<%
String kname=request.getParameter("delKname");
updateDAO ud = new updateDAO();
int cnt = ud.delmember(kname);

if(cnt ==1){
%>
<script type="text/javascript">
alert("회원이 정상적으로 삭제되었습니다.");
location.href="http://localhost/hotel_prj/admin/admin_member_select.jsp";
</script>	
<%}else{%>
<script type="text/javascript">
	alert("죄송합니다. 잠시 후 다시 시도해주십시오.");
	location.href="http://localhost/hotel_prj/admin/admin_member_select.jsp";
</script>
<%}%>
</body>
</html>