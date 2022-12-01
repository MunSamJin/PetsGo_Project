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
	<h2>index.jsp 입니다.</h2>

	<h4>
	   MEMBER : 가입된 사용자 /
	   OWNER : 사업자 / 
	   MANAGER :  관리자  <p>
	</h4>
	
	<h3>
	<c:if test="${not empty pageContext.request.userPrincipal}">
	    ${pageContext.request.userPrincipal.name}님 /${pageContext.request.userPrincipal}  <p>
	    
	    <form action="${pageContext.request.contextPath}/logout" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="submit" value="로그아웃">
		</form>
		
		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	</c:if>
	
	<a href="${pageContext.request.contextPath}"> index</a></h3>
	
	<h2> USER </h2>
	<a href="${pageContext.request.contextPath}/user/main">user/main - 인증없이 접근 가능</a><p>
	<a href="${pageContext.request.contextPath}/user/login">user/login - 인증해야만 접근 가능(ROLE_USER)</a><p>
	<a href="${pageContext.request.contextPath}/user/loginForm">user/loginForm - 인증없이 접근 가능</a><p>
	<a href="${pageContext.request.contextPath}/user/board">user/board - 인증없이 접근 가능</a><p>
	
	<h2> MEMBER </h2>
	<a href="${pageContext.request.contextPath}/member/main">member/main - 인증해야만 접근 가능</a><p>
	<a href="${pageContext.request.contextPath}/member/myPage">member/mypage - 인증해야만 접근 가능</a><p>
	
	
	
	<h2> Admin </h2>
	<a href="${pageContext.request.contextPath}/admin/main">admin/main - 인증해야만 접근 가능(ROLE_ADMIN,ROLE_USER)</a><p>
	<a href="${pageContext.request.contextPath}/admin/board">admin/board - 인증해야만 접근 가능(ROLE_ADMIN,ROLE_USER)</a><p>
</body>
</html>