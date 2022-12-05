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
	<h3>member/myCommunity.jsp</h3>
	///// 메뉴 ////////////////////////////// <p>
	<a href="${pageContext.request.contextPath}/myPage">예약내역</a>
	<a href="${pageContext.request.contextPath}/myScrap">스크랩북</a>
	<a href="${pageContext.request.contextPath}/myCommunity">커뮤니티</a>
	<a href="${pageContext.request.contextPath}/myQna">문의사항</a>
	<a href="${pageContext.request.contextPath}/myInfo">회원정보</a>

</body>
</html>