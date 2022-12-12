$(document).ready(function(){
	/////////////////////////////////////
	//회원 로그인 버튼 클릭 시 유효성 체크
	$("#memberLoginForm").submit(function() {		
		if ($("#email").val().trim() == "") {
			alert("이메일을 입력해 주세요");
			$("#email").focus();
			return false;
		}

		if ($("#password").val().trim() == "") {
			alert("비밀번호를 입력해 주세요");
			$("#password").focus();
			return false;
		}
	}) 

	/////////////////////////////////////
	//이메일 유효성 체크
	$("#email").change(function() {
		checkEmail($("#email").val());
	});

	function checkEmail(email) {
		let expectEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if (!(expectEmail.test(email))) {
			$("#emailValid").html("이메일 형식을 확인해 주세요").css("color", "red");
			$("#email").focus();
			return false;
		}

		$("#emailValid").html("");
		return true;
	}
	
	/////////////////////////////////////
	//취소 버튼 클릭 시 메인 페이지로 이동
	$("#memberLoginForm > input[type=button]:nth-child(6)").click(function() {
		location.href = "${pageContext.request.contextPath}/main";
	})
	
	
	
	/////////////////////////////////////
	//관리자 로그인 버튼 클릭 시 유효성 체크
	$("#adminLoginForm").submit(function() {	
		alert("id = " + $("#adminId").val() + ", password = " + $("#adminPwd").val());
			
		/* if ($("#email").val().trim() == "") {
			alert("이메일을 입력해 주세요");
			$("#email").focus();
			return false;
		}

		if ($("#password").val().trim() == "") {
			alert("비밀번호를 입력해 주세요");
			$("#password").focus();
			return false;
		} */
	}) 
})