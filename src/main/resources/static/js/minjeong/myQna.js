/* $(document).ready(function(){
	/////////////////////////////////////
	//회원 로그인 버튼 클릭 시 유효성 체크
	$("#memberLoginForm").submit(function() {	
		alert("id = " + $("#adminId").val() + ", password = " + $("#adminPwd").val());
			
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
}) */



$(function(){
	   //alert(1)
	   $("input[value=수정하기]").click(function(){
		   //document.requestForm.action="${pageContext.request.contextPath}/board/updateForm"; /js 기반
		   
		   //action="${pageContext.request.contextPath}/member/qnaUpdateForm/${qna.qnaNo}" 
		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/member/qnaUpdateForm/${qna.qnaNo}"); //selector를 이용한 jQuery 기법
		   $("#requestForm").submit();
	   })
	   
	   
	   //$("input[value=삭제하기]").click(function(){
		   /* var pwd = prompt("비밀번호를 입력하세요.");
		   if(pwd){
	           $("#password").val(pwd); //val: textbox에 값(pwd)을 넣어줌
			   $("#requestForm").attr("action", "${pageContext.request.contextPath}/board/delete");
			   $("#requestForm").submit();
		   } */
		   
		   //"${pageContext.request.contextPath}/member/qnaDelete"
		   //${pageContext.request.contextPath}/reply/delete/${reply.rno}/${board.bno}
		    //$("#requestForm").attr("action", "${pageContext.request.contextPath}/board/delete");
		/*	$("#requestForm").attr("action", "/member/qnaDelete/${qna.qnaNo}");
			$("#requestForm").submit();
	   }) */
   })
   
   
   
//<a href="${pageContext.request.contextPath}/reply/delete/${reply.rno}/${board.bno}">삭제</a> 
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   