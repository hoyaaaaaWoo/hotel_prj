<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
// form으로부터 전달된 데이터 전달.
String id=request.getParameter("id");
String pass = request.getParameter("pass");



//세션 값 등록
session.setAttribute("id", id);
session.setAttribute("pass", pass);
if(pass != null ){
	%>
	<script type="text/javascript">
	location.href="http://localhost/jsp_prj/project02_team03/mypage/correction_member.jsp";
	</script>
	<%
}
%>