<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>PetsGo</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/petsgoweb.png">
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
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link active" id="member-tab" data-bs-toggle="tab" data-bs-target="#member-tab-pane" type="button" role="tab" aria-controls="member-tab-pane" aria-selected="true">회원 정보</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="owner-tab" data-bs-toggle="tab" data-bs-target="#owner-tab-pane" type="button" role="tab" aria-controls="owner-tab-pane" aria-selected="false">반려견 정보</button>
		</li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<h1>회원 정보</h1>
		<sec:authentication var="mvo" property="principal" />
		<div class="tab-pane fade show active" id="member-tab-pane" role="tabpanel" aria-labelledby="member-tab" tabindex="0">
			사진 <p>
			<img alt="" src="${pageContext.request.contextPath}/img/minjeong/${mvo.memberProfile}"> <p>
			이메일 ${mvo.memberEmail} <p>
			닉네임 ${mvo.memberNickname} <p>
			휴대폰번호 ${mvo.memberPhone} <p>
			생년월일 ${mvo.memberBirthDate} <p>

			<a href="${pageContext.request.contextPath}/member/passwordCheck">수정</a>
		</div>

		<div class="tab-pane fade" id="owner-tab-pane" role="tabpanel" aria-labelledby="owner-tab" tabindex="0">
			<form id="ownerLoginForm" action="${pageContext.request.contextPath}/admin/login" method="post">
				<input type="text" class="form-control" name="memberEmail" id="email" placeholder="사업자 등록 번호"> 
				<span id="emailValid"></span>
				<input type="password" class="form-control" name="memberPassword" id="password" placeholder="비밀번호"> 
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="buttons">
					<input type="submit" class="btn btn-primary" value="로그인"> 
					<a href="${pageContext.request.contextPath}/main"><button type="button" class="btn btn-light">취소</button></a>
				</div>
			</form>
		</div>
	</div>
	<!-- myInfo part end -->
	
</body>
</html>