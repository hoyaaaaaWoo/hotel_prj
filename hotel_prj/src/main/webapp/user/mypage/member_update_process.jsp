<%@page import="user_login.updateDAO"%>
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
String userKname=(String)session.getAttribute("kname");
String userTel=(String)session.getAttribute("tel");


mVO.setEmail(mVO.getEmail());
mVO.setId(mVO.getId());
mVO.setPass(mVO.getPass());
mVO.setKname(mVO.getKname());
mVO.setTel(mVO.getTel());

updateDAO mDAO=new updateDAO();
mDAO.updatePass(mVO);
mDAO.updateKname(mVO);
mDAO.updateEmail(mVO);
mDAO.updateTel(mVO);


//세션 값 등록
session.setAttribute("id", userId);
session.setAttribute("pass", userPass);
session.setAttribute("email", userEmail);
session.setAttribute("tel", userTel);
session.setAttribute("kname", userKname);


%>
    </c:catch>