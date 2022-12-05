<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

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
			});//keyup 
			
			/////////////////////////////////////
			//생년월일 달력
			$( "#datepicker" ).datepicker({
				changeMonth:true,
                changeYear:true, 
                yearRange:"1930:2030",
                dateFormat:"yy-mm-dd"
			});
			
			/////////////////////////////////////
			//취소 버튼 클릭 시 마이 페이지로 이동
			$("#updateForm > button").click(function(){								
				location.href = "${pageContext.request.contextPath}/member/myInfo";
			})
			
		}) //ready
	</script>

</head>
<body>
	<h1> member/updateForm.jsp 문서 </h1>
	
	<form id="updateForm" action="${pageContext.request.contextPath}/updateInfo" method="post">
		<input type="hidden" name="memberNo" value="${member.memberNo}">
		<input type="hidden" name="memberProfile" value="${member.memberProfile}">
		<input type="hidden" name="memberEmail" value="${member.memberEmail}">
		
		아이콘 <input type="file" name="memberProfile" value="${member.memberProfile}"><br><br>
		이메일 ${member.memberEmail} <br><br>
		새 비밀번호 <input type="password" name="memberPassword" id="password"><br>
		<span id="passwordValid"></span><br><br>
		새 비밀번호 확인 <input type="password" name="passwordCheck" id="passwordCheck"><br>
		<span id="passwordEqual"></span><br><br>
		닉네임 <input type="text" name="memberNickname" id="nickname" value="${member.memberNickname}"><br>
		<span id="nicknameValid"></span><br><br>
		휴대폰번호 <input type="text" name="memberPhone" value="${member.memberPhone}" oninput="autoHyphen(this)" maxlength="15" placeholder="'-'없이 숫자만 입력해 주세요."><br><br>
		<script>
            const autoHyphen = (target) => {
                target.value = target.value
                    .replace(/[^0-9]/g, '')
                    .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
            }
        </script>
        생년월일 <input type="text" name="memberBirthDate" id="datepicker" value="${member.memberBirthDate}"><br><br>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="submit" value="수정">
		<button type="button">취소</button>
	</form>

</body>
</html>