<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- Bootstrap CSS -->
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	 -->
	<!-- style CSS -->
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
     --%>
    <!-- main CSS -->
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_petsgo.css">
     --%>
    <!-- myInfo CSS -->
    <link href="${pageContext.request.contextPath}/css/minjeong/myInfo.css" rel="stylesheet">

</head>
<body>
<%-- 	<br>
	<a href="${pageContext.request.contextPath}/member/myInfo">회원 정보</a>
	<a href="${pageContext.request.contextPath}/member/myPet">반려견 정보</a>
	
	<br>
	<h3>회원 정보</h3>
	    사진  <p>
		<img alt="" src="${pageContext.request.contextPath}/img/minjeong/${member.memberProfile}">     
		<p>
	    이메일 ${member.memberEmail} <p>
	    닉네임 ${member.memberNickname} <p>
	    휴대폰번호 ${member.memberPhone} <p>
	    생년월일 ${member.memberBirthDate} <p>
	  	
	  	<a href="${pageContext.request.contextPath}/member/passwordCheck">수정</a> --%>

	<!-- myInfo part start -->
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-6">
				<div class="myInfoView">
					<a href="${pageContext.request.contextPath}/member/myInfo">회원 정보</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/member/myPet">반려견 정보</a>
					
					<br>
					<h3>회원 정보</h3>
					    사진  <p>
						<img alt="" src="${pageContext.request.contextPath}/img/minjeong/${member.memberProfile}">     
						<p>
					    이메일 ${member.memberEmail} <p>
					    닉네임 ${member.memberNickname} <p>
					    휴대폰번호 ${member.memberPhone} <p>
					    생년월일 ${member.memberBirthDate} <p>
					  	
					  	<a href="${pageContext.request.contextPath}/member/passwordCheck">수정</a>
				</div>
				
			
			</div>
		</div>
	</div>
	<!-- myInfo part end -->
	
</body>
</html>