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
	<h1>member/myInfo.jsp</h1>
	///// 메뉴 ////////////////////////////// <p>
	<a href="${pageContext.request.contextPath}/myPage">예약내역</a>
	<a href="${pageContext.request.contextPath}/myScrap">스크랩북</a>
	<a href="${pageContext.request.contextPath}/myCommunity">커뮤니티</a>
	<a href="${pageContext.request.contextPath}/myQna">문의사항</a>
	<a href="${pageContext.request.contextPath}/myInfo">회원정보</a>
	
	<br>
	<a href="${pageContext.request.contextPath}/myInfo">회원 정보</a>
	<a href="${pageContext.request.contextPath}/myPet">반려견 정보</a>
	
	<br>
	<h3>회원 정보</h3>
	<c:if test="${not empty member}">
	    사진 ${member.memberProfile} <p>
	    이메일 ${member.memberEmail} <p>
	    닉네임 ${member.memberNickname} <p>
	    휴대폰번호 ${member.memberPhone} <p>
	    생년월일 ${member.memberBirthDate} <p>
	  	
	  	<a href="${pageContext.request.contextPath}/passwordCheck">수정</a>
	</c:if>
</body>
</html>