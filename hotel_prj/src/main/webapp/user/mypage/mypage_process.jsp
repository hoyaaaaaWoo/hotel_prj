<%@page import="org.springframework.dao.DataAccessException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="user_login.memberVO"%>
<%@page import="user_login.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <jsp:useBean id="loginVO" class="user_login.memberVO" scope="page"/>
<jsp:setProperty property="*" name="loginVO"/><!--  입력정보-->
  <%request.setCharacterEncoding("UTF-8"); %>
  
  <!-- 이전 페이지에서 날아온 웹파라미터 이 페이지에서 받아서 설정하기 -->
  <jsp:useBean id="mVO" class="user_login.memberVO"/>  
  <!-- *써서 setter method 다 실행해서 세팅됨 -->
  <jsp:setProperty property="*" name="mVO"/>
  
<%
request.setCharacterEncoding("utf-8");
// form으로부터 전달된 데이터 전달.
//id는 세션에서 전달되고 
String id=(String)session.getAttribute("id");
//비밀번호와 이메일은 parameter 에요
String pass=request.getParameter("pass");
//String email=(String)session.getAttribute("email");

MemberDAO mDAO=new MemberDAO();
//여기에서는 email은 필요가 없습니다.
///위에 아이디와 비밀번호가 유효한지 DB에서 비교해야합니다. 
//그래서 id와 비번이 맞으면 정보수정 페이지로 이동하고 틀리면 다시이전페이지로 가야해요.
//memberVO mVO=new memberVO(); //클래스의 이름은 대문자로 시작해야합니다.
mVO.setId(id);//세션의아이디와
mVO.setPass(DataEncrypt.messageDigest("SHA-512", mVO.getPass()));//파라메터 비밀번호를 가지고 비밀번호는 암호화 하나요?네네
try{
String name=mDAO.selectLogin(mVO) ;//아이디와 비밀번호가 맞으면 이름이 나옵니다.
//세션 값 등록
//session.setAttribute("id", id);
//session.setAttribute("pass", pass);
//session.setAttribute("email",email);
	%>
	<script type="text/javascript">
	location.href="correction_member.jsp"; 
	</script>
	<%}catch(DataAccessException se){ //조회된 비밀번호가 없다면 예외가 발생합니다. queryForObject이어서  실행해보세요%>
		<script type="text/javascript">
	alert("비밀번호를 확인하여주세요");
	history.back();

	</script>
	<%}//end catch%>


