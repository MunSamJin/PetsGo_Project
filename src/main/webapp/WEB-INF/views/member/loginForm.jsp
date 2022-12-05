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
			//로그인 버튼 클릭 시 유효성 체크
			$("#loginForm").submit(function(){				
				if($("#email").val().trim()==""){
					alert("이메일을 입력해 주세요");	
					$("#email").focus();
					return false;
				}
				
				if($("#password").val().trim()==""){
					alert("비밀번호를 입력해 주세요");	
					$("#password").focus();
					return false;
				}
			})
			
			/////////////////////////////////////
			//이메일 유효성 체크
			$("#email").change(function(){
    			checkEmail($("#email").val());
			});	
			
			function checkEmail(email){
				let expectEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			    if(!(expectEmail.test(email))){            
			        $("#emailValid").html("이메일 형식을 확인해 주세요").css("color","red");
			        $("#email").focus();
			        return false;
			    }    
			    
			    $("#emailValid").html("");
			    return true;
			}
			
			/////////////////////////////////////
			//취소 버튼 클릭 시 이전 페이지로 이동
			$("#loginForm > button").click(function(){								
				location.href = "${pageContext.request.contextPath}/member/index";
			})
			
		}) //ready
	</script>

</head>
<body>
	member/loginForm.jsp 문서 <br>
	
	<%-- <c:if test="${param.err !=null}">
		Error message: <b style="color: red">${SPRING_SECURITY_LAST_EXCEPTION.message} / 정보가 일치하지 않습니다. </b>
	</c:if> --%>
	<!-- param.err: loginForm에서 get 방식으로 err이 넘어왔는지 아닌지 알 수 o. ${SPRING_SECURITY_LAST_EXCEPTION.message}: spring이 기본적으로 갖고 있는 에러 메시지(Bad credential)가 나옴 -->
	
	<form id="loginForm" action="${pageContext.request.contextPath}/member/login" method="post">
		이메일 <input type="text" name="memberEmail" id="email" placeholder="이메일"> <br>
		<span id="emailValid"></span><br><br>
		비밀번호 <input type="password" name="memberPassword" id="password" placeholder="비밀번호"> <br>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="submit" value="로그인">
		<button type="button">취소</button>
	</form>
</body>
</html>