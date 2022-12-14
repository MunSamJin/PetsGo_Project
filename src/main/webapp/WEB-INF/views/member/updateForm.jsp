<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- update CSS -->
    <link href="${pageContext.request.contextPath}/css/minjeong/updateForm.css" rel="stylesheet">

	<!-- update js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script>
		$(document).ready(function(){	
			let checkResult = "";
			
			//////////////////////////////////////////
			//비밀번호 유효성 체크
			$("#password").change(function(){
    			checkPassword($("#password").val());
			});			
			
			function checkPassword(password){			    
				if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
			        $("#passwordValid").html("숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.").css("color","red");
			        $("#password").focus();
			        return false;
			    }    
			    
			    let checkNumber = password.search(/[0-9]/g);
			    let checkEnglish = password.search(/[a-z]/ig);
			    
			    if(checkNumber < 0 || checkEnglish < 0){
			        $("#passwordValid").html("숫자와 영문자를 혼용하여야 합니다.").css("color","red");
			        $("#password").focus();
			        return false;
			    }
			    
			    if(/(\w)\1\1\1/.test(password)){
			        $("#passwordValid").html("같은 문자를 4번 이상 사용하실 수 없습니다.").css("color","red");
			        $("#password").focus();
			        return false;
			    }
			    
			    $("#passwordValid").html("");
			    return true;
			}
			
			//////////////////////////////////////////
			//비밀번호와 비밀번호 확인 일치 체크
			$("#passwordCheck").change(function(){
				let password = $("#password").val();
				let passwordCheck = $("#passwordCheck").val();
				
				if(passwordCheck != password) {
					$("#passwordEqual").html("비밀번호가 일치하지 않습니다.").css("color","red");
					$("#passwordCheck").focus();
		        	return false;
				} else {
					$("#passwordEqual").html("");
				    return true;
				}
			});
			
			//////////////////////////////////////////
			//닉네임 유효성&중복 체크			
			$("#nickname").keyup(function(){
				let nickname = $(this).val().trim();
				
				if(nickname.length < 2 || nickname.length > 15){
					$("#nicknameValid").html("닉네임은 최소 2자 이상 15자 미만이어야 합니다.").css("color","red");
					checkResult="";
					return;
				} 
				
				$("#nicknameValid").html(""); //ajax 활용 시 없애도 됨
				
				/* $.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/emailCheck",				
					data:"${_csrf.parameterName}=${_csrf.token}&email="+email,	
					success:function(data){						
						if(data=="fail"){
						$("#emailCheck").html("  " + email + " 사용할 수 없습니다.").css("background","red");
							checkResult="";
						}else{						
							$("#emailCheck").html("  " + email + " 사용 가능합니다.").css("background","yellow");		
							checkResult = email;
						}					
					}//callback			
				});//ajax */
				
				$.ajax({
					type: "POST",
					url: "/nicknameCheck",
					dataType: "text",  //서버가 응답(보내 온)한 데이터 타입(text | html | xml | json)
					data: "memberNickname=" + nickname, //서버에게 보낼 parameter 정보 
					success: function(data) {
						if (data == "fail") {
							$("#nicknameCheck").html("이미 사용하고 있는 닉네임입니다.").css("color", "red");
						} else {
							$("#nicknameCheck").html("사용 가능한 닉네임입니다.").css("color", "black");
						}
					}//callback			
				});//ajax
			});//keyup 
			
			/////////////////////////////////////
			//생년월일 달력
			$( "#datepicker" ).datepicker({
				changeMonth:true,
                changeYear:true, 
                yearRange:"1930:2030",
                dateFormat:"yy-mm-dd"
			});
			
			$("#updateForm > div.buttons > a > button").click(function() {
				if(confirm("탈퇴하시겠습니까?")) {
					location.href = "${pageContext.request.contextPath}/member/deleteInfo";
				}
			});
		}) //ready
	</script>

</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="updateForm">
				<h1>회원 정보 수정</h1>
				<div class="line">
					<span class="necessary">*</span>
                    필수입력사항
				</div>
				
				<form id="updateForm" action="${pageContext.request.contextPath}/member/updateInfo" method="post">
					<input type="hidden" name="memberNo" value="<sec:authentication property="principal.memberNo"/>">
					<sec:authentication var="mvo" property="principal" /> 	
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
					    	<label for="email" class="form-label">이메일</label> 
					    	<%-- <p> ${mvo.memberEmail} </p> --%>
					    	<input type="text" class="form-control" name="memberEmail" id="nickname" value="${mvo.memberEmail}" readonly>
					    </div>
					    <div class="form-content">
					    	<label for="password" class="form-label">새 비밀번호<span class="necessary">*</span></label>
					    	<input type="password" class="form-control" name="memberPassword" id="password">
					    </div>
					    <div id="passwordValid"></div>
					    <div class="form-content">
					    	<label for="passwordCheck" class="form-label">새 비밀번호 확인<span class="necessary">*</span></label>
					    	<input type="password" class="form-control" name="passwordCheck" id="passwordCheck">
					    </div>
					    <div id="passwordEqual"></div>
					    <div class="form-content">
					    	<label for="nickname" class="form-label">닉네임</label>
					    	<input type="text" class="form-control" name="memberNickname" id="nickname" value="${mvo.memberNickname}">
					    </div>
					    <div id="nicknameValid"></div>
						<div id="nicknameCheck"></div> 
					    <div class="form-content">
					    	<label for="phone" class="form-label">휴대폰번호</label>
					    	<input type="text" class="form-control" name="memberPhone" id="phone" value="${mvo.memberPhone}" oninput="autoHyphen(this)" maxlength="15" placeholder="'-'없이 숫자만 입력해 주세요.">
							<script>
					            const autoHyphen = (target) => {
					                target.value = target.value
					                    .replace(/[^0-9]/g, '')
					                    .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
					            }
					        </script>
					    </div>
					    <div class="form-content">
					    	<label for="datepicker" class="form-label">생년월일</label>
					    	<input type="text" class="form-control" name="memberBirthDate" id="datepicker" value="${mvo.memberBirthDate}">
					    </div>

						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class="buttons">
						<a href="${pageContext.request.contextPath}/member/deleteInfo"><button type="button" class="btn btn-light">탈퇴하기</button></a>
						<input type="submit" class="btn btn-primary" value="회원정보수정">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>