<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>

	<%-- <script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/minjeong/qnaUpdateForm.js"></script> --%>
	
</head>
<body>
	<h3>member/qnaForm.jsp</h3>
	
	<%-- <form id="qnaForm" action="${pageContext.request.contextPath}/member/qnaInsert" method="post">
		<input type="hidden" name="member" value="<sec:authentication property="principal.memberNo"/>">

		문의 내용 <br>
		<textarea name="qnaContent" cols="50" rows="5"></textarea><br><br> 
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="submit" value="문의하기">
		<button type="button">취소</button>
	</form> --%>
	
	<br><br><br>
	<div style="position: relative; padding: 32px; border: 1px solid #edeef0; border-radius: 8px;
				width: 80%; margin-top: 50px; margin-left: auto; margin-right: auto; margin-bottom: 50px">
		

		<form name="qnaUpdateForm" method="post" action="${pageContext.request.contextPath}/member/qnaUpdate" 
			  onSubmit='return checkValid()'>			  
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">  						
			<input type="hidden" name="qnaNo" value="${qna.qnaNo}"/>
					  
			<table style="width: 70%; margin-left: auto; margin-right: auto;">				
				<tr>
					<td>
						<p style="white-space: pre-line;">
							<textarea name="qnaContent" rows="10" cols="100" 
									  style="font-size: 10pt; white-space: pre-line; border: 1px solid #edeef0; border-radius: 8px;">
									 <%--  ${requestScope.qna.qnaContent} --%>
							</textarea>
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<div style="text-align: right;">
							<br>
	  						<input type="button" value="뒤로가기" onclick="javascript:history.back();"
	  								style="display: inline-block; margin-left: 6px; border-color: #4876ef; color: #4876ef; background-color: #fff;
					 					   border: 1px solid #4876ef; box-sizing: border-box; text-align: center;padding: 0 8px 1px; height: 24px;
					 					   border-radius: 4px; font-size: 12px; letter-spacing: -0.5px; line-height: 20px; cursor: pointer;"/>
					  
	  						<input type=submit value=수정하기
	  							   style="display: inline-block; margin-left: 6px;border-color: #d7dce5; color: #5c667b; background-color: #fff;
			   		  					  padding: 0 8px 1px; height: 24px; border-radius: 4px; font-size: 12px; letter-spacing: -0.5px;
			   		  					  line-height: 20px; border: 1px solid #edeef0; box-sizing: border-box; text-align: center;cursor: pointer;"/>
	  					</div>
					</td>
				</tr>
			</table>
	  	</form>	
	</div>
	

</body>
</html>