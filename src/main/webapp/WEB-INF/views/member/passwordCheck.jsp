<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
	<script>
		$(document).ready(function(){
			
			/////////////////////////////////////
			//확인 버튼 클릭 시 유효성 체크
			$("#loginForm").submit(function(){								
				if($("#password").val().trim()==""){
					alert("비밀번호를 입력해 주세요");	
					$("#password").focus();
					return false;
				}
			})
			
			/////////////////////////////////////
			//비밀번호 일치 여부 확인(ajax)
			
			/////////////////////////////////////
			//취소 버튼 클릭 시 이전 페이지로 이동
			$("#loginForm > button").click(function(){								
				location.href = history.back();
			})
			
			
		})
	</script>
</head>
<body>
	<h1>member/passwordCheck.jsp</h1>
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
	<h3>회원 정보 수정</h3>
	<b>비밀번호 재확인</b> <p>
	<form id="loginForm" action="${pageContext.request.contextPath}/updateForm" method="post">
		이메일 <input type="text" name="memberEmail" id="email" readonly value="${member.memberEmail}"> <br>
		비밀번호 <input type="password" name="memberPassword" id="password" placeholder="현재 비밀번호를 입력해 주세요"> <br>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="submit" value="확인">
		<button type="button">취소</button>
	</form>

</body>
</html>