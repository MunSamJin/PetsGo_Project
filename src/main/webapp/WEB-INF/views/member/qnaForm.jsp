<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>member/qnaForm.jsp</h3>
	
	<form id="qnaForm" action="${pageContext.request.contextPath}/member/qnaInsert" method="post">
		<input type="hidden" name="member" value="<sec:authentication property="principal.memberNo"/>">

		문의 내용 <br>
		<textarea name="qnaContent" cols="50" rows="5"></textarea><br><br> 
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="submit" value="문의하기">
		<button type="button">취소</button>
	</form>

</body>
</html>