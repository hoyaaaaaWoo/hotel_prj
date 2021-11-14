<%@page import="user_login.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <jsp:useBean id="loginVO" class="user_login.memberVO" scope="page"/>
<jsp:setProperty property="*" name="loginVO"/><!--  입력정보-->

<%
request.setCharacterEncoding("utf-8");
// form으로부터 전달된 데이터 전달.

String id=(String)session.getAttribute("id");
String pass=(String)session.getAttribute("pass");
String email=(String)session.getAttribute("email");

MemberDAO mDAO=new MemberDAO();



//세션 값 등록
session.setAttribute("user_id", id);
session.setAttribute("user_pass", pass);
session.setAttribute("uesr_email",email);

if(pass != null ) {
	%>
	<script type="text/javascript">
	location.href="correction_member.jsp"; 
	</script>
	<%}else{%>
		<script type="text/javascript">
	alert("비밀번호를 확인하여주세요");
	history.back();

	</script>
	<%}%>


