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
	<h3>member/Scrap.jsp</h3>
	///// 메뉴 ////////////////////////////// <p>
	<a href="${pageContext.request.contextPath}/member/myPage">예약내역</a>
	<a href="${pageContext.request.contextPath}/member/myScrap">스크랩북</a>
	<a href="${pageContext.request.contextPath}/member/myCommunity">커뮤니티</a>
	<a href="${pageContext.request.contextPath}/member/myQna">문의사항</a>
	<a href="${pageContext.request.contextPath}/member/myInfo">회원정보</a>

</body>
</html>