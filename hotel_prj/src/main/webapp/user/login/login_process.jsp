<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
// form으로부터 전달된 데이터 전달.
String userid = request.getParameter("userid");
String userpass = request.getParameter("userpass");

//세션 값 등록
session.setAttribute("userid", userid);
session.setAttribute("userpass", userpass);

if(userid != null ){
	%>
	<script type="text/javascript">
	location.href="http://localhost/jsp_prj/project02_team03/main/Hotel_Ritz_Seoul.jsp";
	</script>
	<%
}
%>