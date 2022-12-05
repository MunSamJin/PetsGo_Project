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
	<h2>member/index.jsp 입니다.</h2>

	<h4>
	   MEMBER : 가입된 사용자 /
	   OWNER :  사업자 /  
	   ADMIN : 관리자 <p>
	</h4>
	
	<h3>
	<%-- <c:if test="${not empty pageContext.request.userPrincipal}">
	    ${pageContext.request.userPrincipal.name}님 /${pageContext.request.userPrincipal}  <p>
	    
	    <form action="${pageContext.request.contextPath}/logout" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="submit" value="로그아웃">
		</form>
		
		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	</c:if> --%>
	
	<c:if test="${not empty member}">
	    ${member.memberEmail}님 / ${member.memberNickname}님 반갑습니다! <p>
	    
	    <form action="${pageContext.request.contextPath}/member/logout" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="submit" value="로그아웃">
		</form>
		
		<a href="${pageContext.request.contextPath}/member/myReservation">마이페이지</a> <br>
		<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a> <br>
	</c:if>
	
	<a href="${pageContext.request.contextPath}"> index</a></h3>
	
	<%-- <h2> MEMBER / OWNER / ADMIN </h2>
	<a href="${pageContext.request.contextPath}/user/loginForm"> user/loginForm - 인증없이 접근 가능</a><p> --%>

	<h2> MEMBER </h2>
	<a href="${pageContext.request.contextPath}/member/registerForm">회원 가입 하기</a> <p>
	<a href="${pageContext.request.contextPath}/member/loginForm">로그인 하기</a> <p>
	
	////////////////////////////////////////////////////////////////////// <p>
	
	<%-- <a href="${pageContext.request.contextPath}/member/login">member/login - 인증해야만 접근 가능(ROLE_MEMBER)</a><p>
	<a href="${pageContext.request.contextPath}/member/loginForm">로그인 하러 가기 - 인증없이 접근 가능</a><p>
	<a href="${pageContext.request.contextPath}/member/joinForm">member/joinForm - 인증없이 접근 가능</a><p>
	<a href="${pageContext.request.contextPath}/member/main">member/main - 인증해야만 접근 가능(ROLE_MEMBER)</a><p>
	
	<a href="${pageContext.request.contextPath}/user/board">user/board - 인증없이 접근 가능 - 아직 안 한 것</a><p>
	
	<h1>/////////////////////////////////////////////////////////////////////////////////////////////////////</h1>
	
	<h2> OWNER </h2>
	<a href="${pageContext.request.contextPath}/owner/login">owner/login - 인증해야만 접근 가능(ROLE_OWNER)</a><p>
	<a href="${pageContext.request.contextPath}/owner/loginForm">owner/loginForm - 인증없이 접근 가능</a><p>
	<a href="${pageContext.request.contextPath}/owner/main">owner/main - 인증해야만 접근 가능(ROLE_OWNER)</a><p>

	<h2> Admin </h2>
	<a href="${pageContext.request.contextPath}/admin/login">admin/login - 인증해야만 접근 가능(ROLE_ADMIN)</a><p>
	<a href="${pageContext.request.contextPath}/admin/loginForm">admin/loginForm - 인증없이 접근 가능</a><p>
	<a href="${pageContext.request.contextPath}/admin/main">admin/main - 인증해야만 접근 가능(ROLE_ADMIN)</a><p>  --%>
</body>
</html>