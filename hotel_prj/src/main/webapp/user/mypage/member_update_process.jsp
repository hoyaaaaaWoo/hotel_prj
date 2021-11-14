<%@page import="user_login.MemberDAO"%>
<%@page import="user_login.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <jsp:useBean id="mVO" class="user_login.memberVO" scope="page"/>
<jsp:setProperty property="*" name="mVO"/><!--  입력정보-->
<c:catch var="e">
<%
request.setCharacterEncoding("utf-8");
// form으로부터 전달된 데이터 전달.

String userId=(String)session.getAttribute("id");
String userPass=(String)session.getAttribute("pass");
String userEmail=(String)session.getAttribute("email");


mVO.setEmail(mVO.getEmail());




//세션 값 등록
session.setAttribute("id", userId);
session.setAttribute("pass", userPass);


%>
    </c:catch>