$(document).ready(function(){			
	//회원가입 버튼 클릭 시 유효성 체크
	$("#registerForm").submit(function() {

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

		if ($("#passwordCheck").val().trim() == "") {
			alert("비밀번호를 입력해 주세요");
			$("#passwordCheck").focus();
			return false;
		}

		if ($("#nickname").val().trim() == "") {
			alert("닉네임을 입력해 주세요");
			$("#nickname").focus();
			return false;
		}

		if ($("#datepicker").val().trim() == "") {
			alert("생일을 입력해 주세요");
			$("#datepicker").focus();
			return false;
		}

		if ($("#registerForm > input[type=text]:nth-child(25)").val().trim() == "") {
			alert("휴대폰 번호를 입력해 주세요");
			$("#registerForm > input[type=text]:nth-child(25)").focus();
			return false;
		}
	});//submit

	//이메일 유효성 체크
	$("#email").change(function() {
		checkEmail($("#email").val());
		$("#emailCheck").html("");
	});

	function checkEmail(email) {
		let expectEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if (!(expectEmail.test(email))) {
			$("#emailValid").html("이메일 형식을 확인해 주세요.").css("color", "red");
			$("#email").focus();
			return false;
		}

		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/emailCheck",
			dataType: "text",  //서버가 응답(보내 온)한 데이터 타입(text | html | xml | json)
			data: "memberEmail=" + email, //서버에게 보낼 parameter 정보 
			success: function(data) {
				if (data == "fail") {
					$("#emailCheck").html("이미 사용하고 있는 이메일입니다.").css("color", "red");
				} else {
					$("#emailCheck").html("사용 가능한 이메일입니다.").css("color", "black");
				}
			}//callback			
		});//ajax

		$("#emailValid").html("");
		return true;
	}

	//////////////////////////////////////////
	//비밀번호 유효성 체크
	$("#password").change(function() {
		checkPassword($("#password").val());
	});

	function checkPassword(password) {
		if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)) {
			$("#passwordValid").html("숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.").css("color", "red");
			$("#password").focus();
			return false;
		}

		let checkNumber = password.search(/[0-9]/g);
		let checkEnglish = password.search(/[a-z]/ig);

		if (checkNumber < 0 || checkEnglish < 0) {
			$("#passwordValid").html("숫자와 영문자를 혼용하여야 합니다.").css("color", "red");
			$("#password").focus();
			return false;
		}

		if (/(\w)\1\1\1/.test(password)) {
			$("#passwordValid").html("같은 문자를 4번 이상 사용하실 수 없습니다.").css("color", "red");
			$("#password").focus();
			return false;
		}

		$("#passwordValid").html("");
		return true;
	}

	//////////////////////////////////////////
	//비밀번호와 비밀번호 확인 일치 체크
	$("#passwordCheck").change(function() {
		let password = $("#password").val();
		let passwordCheck = $("#passwordCheck").val();

		if (passwordCheck != password) {
			$("#passwordEqual").html("비밀번호가 일치하지 않습니다.").css("color", "red");
			$("#passwordCheck").focus();
			return false;
		} else {
			$("#passwordEqual").html("");
			return true;
		}
	});

	//////////////////////////////////////////
	//닉네임 유효성&중복 체크			
	$("#nickname").keyup(function() {
		let nickname = $(this).val().trim();
		$("#nicknameCheck").html("");

		if (nickname.length < 2 || nickname.length > 15) {
			$("#nicknameValid").html("닉네임은 최소 2자 이상 15자 미만이어야 합니다.").css("color", "red");
			return;
		}

		$("#nicknameValid").html(""); //ajax 활용 시 없애도 됨.......???

		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/nicknameCheck",
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
	$("#datepicker").datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange: "1930:2030",
		dateFormat: "yy-mm-dd"
	});
});//ready