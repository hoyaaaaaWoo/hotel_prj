<%@page import="org.springframework.dao.DataAccessException"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="user_login.UpdateDAO"%>
<%@page import="user_login.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <jsp:useBean id="mVO" class="user_login.MemberChgPassVO" scope="page"/><!-- 아이디 비밀번호 새로운 비번을 저장할 수 있는 VO  -->
<jsp:setProperty property="*" name="mVO"/><!--  입력정보-->

<%
request.setCharacterEncoding("utf-8");
// form으로부터 전달된 데이터 전달.

String id=(String)session.getAttribute("id");
mVO.setId(id); //VO에 세션에서 꺼내온 아이디를 넣는다.
//비밀번호는 암호화?네네
mVO.setPass(DataEncrypt.messageDigest("SHA-512", mVO.getPass()));
//변경할 비번도 받아야죠?네네
//변경할 비번 암호화하세요네네
mVO.setChange_pass(DataEncrypt.messageDigest("SHA-512", mVO.getChange_pass()));


UpdateDAO mDAO=new UpdateDAO();
int cnt=mDAO.updatePass(mVO);//아이디,비번,새비번을 가진 mVO가 들어가서 업데이트를 수행합니다. 반환형이 뭐였어요?>int요
//자 cnt가 1이면 변경 성공이고 그렇지 않으면 변경실패입니다. ok?spsp
	//그러면 이제 뭐하시면 되요? 변경성공할 때와 실패화면을 만들어서 사용자에게 제공하면 됩니다. 
	
if(cnt==1){ ;//아이디와 비밀번호가 맞으면 이름이 나옵니다.
%>
	<script type="text/javascript">
	location.href="correction_member.jsp"; 
	alert("변경 되었습니다");
	</script>
	<%}else{%>
		<script type="text/javascript">
	alert("비밀번호를 확인하여주세요");
	history.back();

	</script>
	<%}//end catch%>

