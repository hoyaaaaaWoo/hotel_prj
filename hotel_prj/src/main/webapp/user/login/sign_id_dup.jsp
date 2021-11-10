<%@page import="user_login.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="아이디 중복확인"
    %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost/hotel_prj/common/css/main_v20211012.css" />   
<style type="text/css">

</style>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){
	
	$("#btn").click(function(){
		chkNull();
	});
	$("#id").keydown(function(evt){
		if( evt.which == 13){
		chkNull();
		}
			
	});
});
function chkNull(){
	let id=$("#id").val().trim();
	
	if( id=="" ){
		alert("중복 검사할 아이디를 입력해 주세요.");
		return;
	}//end if
	/* if( !(id.length >=8 && id.length < 19)){
		alert("아이디는 8자부터 18자까지만 입력할 수 있습니다.")
		return;
	} */  //개발할때는 닫고 끝나면 풀어야 편하다.
	
	$("#frm").submit();
	
}//chkNull

function sendId(id){
	//부모창으로 아이디 전달
	opener.window.document.frm.id.value=id;
	//자식창 닫기
	self.close();
}

</script>
</head>
<body>
<form action="sign_id_dup.jsp" method="get" id="frm" >
<h2>아이디중복확인</h2>
<label>아이디</label>
<!--  웹 브라우저에 키 입력이 가능한 Form Control이 하나만 제공된다면
자바스크립트 코드를 정의하지 않아도 엔터를 쳤을 때 back-end로 전송된다.
-->
<input type="text" name="id" id="id"/>
<!--  자동전송을 막기위해 값전달이 되지 않는 form control을 하나 만들고 
숨긴다.-->
<input type="text" style="display:none;"/>
<input type="button" value="중복확인"  id="btn" class="btn"/>
<c:if test="${ not empty param.id }">

<!--  id라는 파라메터가 존재하면 입력된 아이디를 사용하여 DBTable에
	아이디가 존재하는지 조회.-->
<div>
<%
	//입력된 id를 받는다.
	String id=request.getParameter("id");
	//DB검증.
	MemberDAO mDAO=new MemberDAO();
	String resultId=mDAO.selectId(id);
	//검증결과 출력
	pageContext.setAttribute("resultId", resultId);
%>
<span style="color: #0D569F; font-weight: bold; ">
입력하신<c:out value="${ param.id }"/>
</span>는
<c:choose>
<c:when test="${ empty resultId }">
<span style="color: #0D569F; font-weight: bold; ">
사용가능합니다.
</span>
<a href="javascript:sendId('${ param.id }')">[사용]</a>
</c:when>
<c:otherwise>
<span style="color: #D75043; font-weight: bold; ">
이미 사용중입니다.
</span>
</c:otherwise>
</c:choose>
</div>
</c:if>
</form>
</body>
</html>