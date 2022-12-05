<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>member/main.jsp</h1>

	<c:if test="${not empty member}">
	    ${member.memberEmail}님 / ${member.memberNickname}님  <p>
	    
	    <form action="${pageContext.request.contextPath}/logout" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="submit" value="로그아웃">
		</form>
		
		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	</c:if>
	
	<a href="${pageContext.request.contextPath}"> index</a></h3>
</body>
</html>