<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="user_login.MemberDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="chkVO" class="user_login.memberVO" scope="page"/>
<jsp:setProperty property="*" name="chkVO"/><!--  입력정보-->
<c:catch var="e">
<%
request.setCharacterEncoding("UTF-8");
String pass = request.getParameter("pass");

//DBMS비밀번호 컬럼은 SHA 암호화된 값이므로 입력된 Plain Text를 
//cipher Text로 변환하여 비교하는 코드를 수행해야한다.
chkVO.setPass(DataEncrypt.messageDigest("MD5", chkVO.getPass()));

//로그인 수행
MemberDAO mDAO=new MemberDAO();
pass=mDAO.selectLogin(chkVO);

DataDecrypt dd=new DataDecrypt("AbcdEfgHiJkLmnOpQrst");
pass=dd.decryption(pass);

//로그인 정보를 세션에 할당 
//=>비연결성인 웹에서 로그인 정보를 모든 페이지에서 사용하기 위해
session.setAttribute("pass", pass);


%>
<!-- <script type="text/javascript">
	location.href="http://localhost/hotel_prj/main/Hotel_Ritz_Seoul.jsp";
	</script> -->

<c:out value="${ param.kname }"/>님 환영합니다.<br/>
<input type="button" value="회원정보 수정" class="btn btn-default" onclick="location.href='correction_member.jsp'">
</c:catch>
<c:if test="${ not empty e }">
${ e  }
죄송합니다. 회원정보가 입력되지 않았습니다.
잠시 후 다시 시도해주세요.
</c:if>
