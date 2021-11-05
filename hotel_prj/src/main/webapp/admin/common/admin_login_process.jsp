<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
// form으로부터 전달된 데이터 전달.
String userid = request.getParameter("userid");
String password = request.getParameter("password");

//세션 값 등록
session.setAttribute("userid", userid);
session.setAttribute("password", password);

if(userid != null ){
	%>
	<script type="text/javascript">
	location.href="http://localhost/hotel_prj/admin/admin_main.jsp";
	</script>
<%}%>