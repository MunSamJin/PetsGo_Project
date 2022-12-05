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
	<h1>member/myPet.jsp</h1>
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
	<h3>반려견 정보</h3>
	<a href="${pageContext.request.contextPath}/addPetForm">추가</a> <br><br>
	
	<c:forEach items="${member.petList}" var="pet" varStatus="state">
	    ${state.count} 순서 / ${pet.petNo} / ${pet.petName}  / ${pet.petWeight} / ${pet.petNeuter} / ${pet.petVaccine} / ${pet.petOther}
	      <a href="${pageContext.request.contextPath}/pet/delete/${pet.pet_no}">삭제</a> <p>
	</c:forEach>

</body>
</html>