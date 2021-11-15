<%@page import="user_login.updateDAO"%>
<%@page import="user_login.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <jsp:useBean id="mVO" class="user_login.memberVO" scope="page"/>
<jsp:setProperty property="*" name="mVO"/><!--  입력정보-->

<%
request.setCharacterEncoding("utf-8");
// form으로부터 전달된 데이터 전달.

String id=(String)session.getAttribute("id");
String pass=request.getParameter("pass");
String email=request.getParameter("email");
String kname=request.getParameter("kname");
String tel=request.getParameter("tel");

mVO.setId(id);
mVO.setEmail(email);
/* mVO.setPass(mVO.getPass());
mVO.setKname(mVO.getKname());
mVO.setTel(mVO.getTel()); */

updateDAO mDAO=new updateDAO();
/* mDAO.updatePass(mVO);
mDAO.updateKname(mVO);
mDAO.updateEmail(mVO);
mDAO.updateTel(mVO);  */
////////////////////////////////////////////////////////
/* String id = request.getParameter("id"); 
String email = request.getParameter("email");  */
mDAO.updateEmail(mVO);
////////////////////////////////////////////////
//세션 값 등록
/* session.setAttribute("id", id);
session.setAttribute("pass", pass);
session.setAttribute("email", email);
session.setAttribute("tel", tel);
session.setAttribute("kname", kname);
 */

%>
    