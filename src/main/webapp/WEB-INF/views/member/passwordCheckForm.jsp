<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- myInfo CSS -->
	<link href="${pageContext.request.contextPath}/css/minjeong/passwordCheckForm.css" rel="stylesheet">


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
	<script>
		$(document).ready(function(){
			/////////////////////////////////////
			//확인 버튼 클릭 시 유효성 체크
			$("#checkForm").submit(function(){								
				if($("#password").val().trim()==""){
					alert("비밀번호를 입력해 주세요");	
					$("#password").focus();
					return false;
				}
			})
			
			/////////////////////////////////////
			//비밀번호 일치 여부 확인(ajax)
			$("#password").keyup(function(){
				let password = $(this).val().trim();
			
				$.ajax({
					type: "POST",
					url: "${pageContext.request.contextPath}/member/passwordCheck",
					dataType: "text",  //서버가 응답(보내 온)한 데이터 타입(text | html | xml | json)
					data: "memberPassword=" + password, //서버에게 보낼 parameter 정보 
					success: function(data) {
						if (data == "fail") {
							$("#passwordCheck").html("비밀번호가 일치하지 않습니다.").css("color", "red");
						} else {
							$("#passwordCheck").html("");
							//location.href = "${pageContext.request.contextPath}/member/updateForm";
						}
					}//callback			
				});//ajax
			});//keyup 
			
			/////////////////////////////////////
			//취소 버튼 클릭 시 이전 페이지로 이동
			$("#loginForm > button").click(function(){								
				location.href = history.back();
			})
		})
	</script>
</head>
<body>	
	<div class="container"> 
		<div class="row justify-content-center">
			<div class="col-12 col-lg-6">
				<div class="checkForm"> 
					<h1>회원 정보 수정</h1>
					<b>비밀번호 재확인</b>
					<sec:authentication var="mvo" property="principal" />

					<div id="passwordCheck"></div> 
					
					<form id="checkForm" action="${pageContext.request.contextPath}/member/updateForm" method="post">
						<input type="email"  class="form-control" name="memberEmail" name="id" id="email" readonly value="${mvo.memberEmail}"> 
						<input type="password" class="form-control" name="memberPassword" id="password" placeholder="현재 비밀번호를 입력해 주세요">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />		
						<div class="buttons">
							<input type="submit" class="btn btn-primary" value="확인">			
							<a href="${pageContext.request.contextPath}/member/myInfo"><button type="button" class="btn btn-light">취소</button></a>	
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>