$(document).ready(function(){
	/////////////////////////////////////
	//답변 등록 버튼 클릭 시 메인 페이지로 이동
	$("#replyForm > div.modal-footer > button.btn.btn-primary > input[type=submit]").click(function() {
		location.href = "${pageContext.request.contextPath}/admin/pages/qna/qna_list";
	})
	
	/////////////////////////////////////
	//답변 등록 버튼 클릭 시 메인 페이지로 이동
	/* $("#replyForm > div.modal-footer > button.btn.btn-primary > input[type=submit]").click(function() {
		location.href = "${pageContext.request.contextPath}/admin/pages/qna/qna_list";
	})*/
})