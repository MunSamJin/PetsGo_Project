<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>PetsGo</title>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	
	<!-- 추가한 것 -->
	<link rel="icon" href="${pageContext.request.contextPath}/img/petsgoweb.png">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <!-- main CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_petsgo.css">
    <!-- register CSS -->
    <link href="${pageContext.request.contextPath}/css/minjeong/registerForm.css" rel="stylesheet">
    
    <!-- register js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/minjeong/registerForm.js"></script>
	<script>
		
	</script>
	
	<style type="text/css">
		.form-content img {max-width: 10%; margin:0 10px 0 5px;}
		.gj-icon{padding: 5px;}
		.gj-textbox-md {border: 1px solid #ced4da !important;}
		.buttons {font-family:SCDream3;}
	</style>

</head>
<body>
	<!-- register part start -->
	<div class="container">
		<div class="row justify-content-center">
				<div class="registerForm">
					<h1 style="color: #25483a; font-family:SCDream4">회원가입</h1>
                    <div class="line">
                        <span class="necessary">*</span>
                        필수입력사항
                    </div>
                    
					<form id="registerForm" action="${pageContext.request.contextPath}/register" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<input type="hidden" name="memberRole" value="ROLE_MEMBER">
                        <div class="form-content">
                            <label for="file" class="form-label">아이콘</label>
                            <input type="radio" name="memberProfile" id="file" value="dog_01.png" checked>
                            <img src="${pageContext.request.contextPath}/img/regi_profile/dog_01.png" alt="">
                           
                            <input type="radio" name="memberProfile" id="file" value="dog_02.png">
                            <img src="${pageContext.request.contextPath}/img/regi_profile/dog_02.png" alt="">
                            
                            <input type="radio" name="memberProfile" id="file" value="dog_03.png">
                            <img src="${pageContext.request.contextPath}/img/regi_profile/dog_03.png" alt="">
                            
                            <input type="radio" name="memberProfile" id="file" value="dog_04.png">
                            <img src="${pageContext.request.contextPath}/img/regi_profile/dog_04.png" alt="">
                            
                            <input type="radio" name="memberProfile" id="file" value="dog_05.png">
                            <img src="${pageContext.request.contextPath}/img/regi_profile/dog_05.png" alt="">
                            
                            <input type="radio" name="memberProfile" id="file" value="dog_06.png">
                            <img src="${pageContext.request.contextPath}/img/regi_profile/dog_06.png" alt="">
                        </div>
                        <div class="form-content">
                            <label for="email" class="form-label">이메일<span class="necessary">*</span></label>
                            <input type="text" class="form-control" name="memberEmail" id="email"> 
                        </div>
                        <div id="emailValid"></div>
                        <div id="emailCheck"></div> 
                        <div class="form-content">
                            <label for="password" class="form-label">비밀번호<span class="necessary">*</span></label>
                            <input type="password" class="form-control" name="memberPassword" id="password">
                        </div>
						<div id="passwordValid"></div>
                        <div class="form-content">
                            <label for="passwordCheck" class="form-label">비밀번호 확인<span class="necessary">*</span></label>
                            <input type="password" class="form-control" name="passwordCheck" id="passwordCheck">
                        </div>
						<div id="passwordEqual"></div>
                        <div class="form-content">
                            <label for="nickname" class="form-label">닉네임<span class="necessary">*</span></label>
                            <input type="text" class="form-control" name="memberNickname" id="nickname">
                        </div>
						<div id="nicknameValid"></div>
						<div id="nicknameCheck"></div> 
                        <div class="form-content">
                            <label for="phone" class="form-label">휴대폰번호<span class="necessary">*</span></label>
                            <input type="text" class="form-control" name="memberPhone" id="phone" oninput="autoHyphen(this)" maxlength="13" placeholder="'-'없이 숫자만 입력해 주세요">
                        </div>						 
						<script>
				            const autoHyphen = (target) => {
				                target.value = target.value
				                    .replace(/[^0-9]/g, '')
				                    .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
				            }
				        </script>
                        <div class="form-content">
                            <label for="datepicker" class="form-label">생년월일<span class="necessary">*</span></label>
                            <input type="text" class="form-control" name="memberBirthDate" id="datepicker"
                            style="border: 1px solid #ced4da !important; margin-left: -32px; padding-left: 5px;">
                        </div>
				        <!-- 		USER TYPE <input type="radio" value="0" name="userType">ROLE_MEMBER
								  <input type="radio" value="1" name="userType">ROLE_ADMIN<br><br> -->
                        <div class="buttons">
                            <input type="submit" class="btn btn-primary" value="가입하기">			
                            <a href="${pageContext.request.contextPath}/main"><button type="button" class="btn btn-light">취소</button></a>	
                        </div>
					</form>
				</div>
			</div>
	</div>
	<!-- register part end -->	
</body>
</html>