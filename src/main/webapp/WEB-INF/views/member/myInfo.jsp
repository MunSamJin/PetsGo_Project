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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
    <!-- myInfo CSS -->
	<%-- <link href="${pageContext.request.contextPath}/css/minjeong/myInfo.css" rel="stylesheet"> --%>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>

</head>
<body>
	<div class="container">
	
		<!-- myInfo part start -->
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="member-tab" data-bs-toggle="tab" data-bs-target="#member-tab-pane" type="button" role="tab" aria-controls="member-tab-pane" aria-selected="true">회원 정보</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="pet-tab" data-bs-toggle="tab" data-bs-target="#pet-tab-pane" type="button" role="tab" aria-controls="pet-tab-pane" aria-selected="false">반려견 정보</button>
			</li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<sec:authentication var="mvo" property="principal" />
			<div class="tab-pane fade show active" id="member-tab-pane" role="tabpanel" aria-labelledby="member-tab" tabindex="0">
				<h3>회원 정보</h3>
				사진 <p>
				<img alt="" src="${pageContext.request.contextPath}/img/minjeong/${mvo.memberProfile}"> <p>
				이메일 ${mvo.memberEmail} <p>
				닉네임 ${mvo.memberNickname} <p>
				휴대폰번호 ${mvo.memberPhone} <p>
				생년월일 ${mvo.memberBirthDate} <p>
	
				<a href="${pageContext.request.contextPath}/member/passwordCheck">수정</a>
			</div>
	
			<div class="tab-pane fade" id="pet-tab-pane" role="tabpanel" aria-labelledby="pet-tab" tabindex="0">
				<h3>반려견 정보</h3>
				<a href="${pageContext.request.contextPath}/member/addPetForm">추가</a> <br><br>
				
				<c:forEach items="${petList}" var="pet">
					몸무게 ${pet.petWeight}kg <p> 
					중성화 수술 여부 ${pet.petNeuter} <p>
					광견병 예방 접종일 ${pet.petVaccine} <p>
					기타 특이사항 ${pet.petOther} <br><br><br>
				</c:forEach>			
			</div>
		</div>
		<!-- myInfo part end -->
		
	</div>
</body>
</html>