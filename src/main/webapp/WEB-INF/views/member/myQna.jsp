<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/js/minjeong/myQna.js"></script> --%>
</head>
<body>
	<form name="qnaForm" method="post" action="${pageContext.request.contextPath}/member/qnaInsert" onSubmit='return checkValid()'>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
		<input type="hidden" name="member" value="<sec:authentication property="principal.memberNo"/>">

		<table style="width: 70%; margin-left: auto; margin-right: auto;">
			<tr>
				<td>
					<p style="white-space: pre-line;">
						문의 내용
						<textarea name="qnaContent" rows="10" cols="100" style="font-size: 10pt; white-space: pre-line; border: 1px solid #edeef0; border-radius: 8px;" ></textarea>
					</p>
				</td>
			</tr>
			<tr>
				<td>
					<!-- <div style="text-align: right;"> <br> -->
						<input type=submit value="문의하기" style="display: inline-block; margin-left: 6px; border-color: #d7dce5; color: #5c667b; background-color: #fff; padding: 0 8px 1px; height: 24px; border-radius: 4px; font-size: 12px; letter-spacing: -0.5px; line-height: 20px; border: 1px solid #edeef0; box-sizing: border-box; text-align: center; cursor: pointer;" />
					<!-- </div> -->
				</td>
			</tr>
		</table>
	</form>	
	
	<br><br><br>
	<c:choose>
		<c:when test="${empty requestScope.qnaBoardList}">
			<b>작성한신 문의가 없습니다.</b>
		</c:when>
		<c:otherwise>			
			<c:forEach items="${requestScope.qnaBoardList}" var="qna">
				${qna.qnaNo} <p>
				${qna.qnaContent} <p>
				${qna.qnaDate} <p>
				${qna.qnaReContent} <p>
				${qna.qnaReDate} <p>

				<a href="${pageContext.request.contextPath}/member/qnaDelete/${qna.qnaNo}"><button type="button">삭제</button></a>					
				<br><br><br>
			</c:forEach> 
		</c:otherwise>
	</c:choose>
	<br><br><br>

</body>
</html>
