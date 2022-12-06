<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
		
	<script type="text/javascript">
		$(function(){
			
			$("input[value=수정]").click(function(){
				   $("#requestForm").attr("action", "${pageContext.request.contextPath}/community/updateForm");
				   $("#requestForm").submit();
			});
			   
			   
			$("input[value=삭제]").click(function(){
				
				if (confirm("정말 삭제하시겠습니까?") == true) {
					$("#requestForm").attr("action", "${pageContext.request.contextPath}/community/delete");
					$("#requestForm").submit();
			            
			        } else {
			            return;
			            
			        }
			});
		});

	</script>
</head>
<body>

<!-- 상세보기 -->
	<div style="position: relative; padding: 32px; border: 1px solid #edeef0; border-radius: 8px;
				width: 80%; margin-top: 16px; margin-left: auto; margin-right: auto; margin-bottom: 50px">
		
		<form name="requestForm" method="post" id="requestForm">		
			
			<input type=hidden name="boardNo" value="${communityBoard.boardNo}">		
			
			<div style="text-align: right;">		
				
				<input type="button" value="수정"
				   style="display: inline-block; margin-left: 6px; border-color: #4876ef; color: #4876ef; background-color: #fff;
						  border: 1px solid #4876ef; box-sizing: border-box; text-align: center;padding: 0 8px 1px; height: 24px;
						  border-radius: 4px; font-size: 12px; letter-spacing: -0.5px; line-height: 20px; cursor: pointer;">
				<input type="button" value="삭제"
				   style="display: inline-block; margin-left: 6px;border-color: #d7dce5; color: #5c667b; background-color: #fff;
				   		  padding: 0 8px 1px; height: 24px; border-radius: 4px; font-size: 12px; letter-spacing: -0.5px;
				   		  line-height: 20px; border: 1px solid #edeef0; box-sizing: border-box; text-align: center;cursor: pointer;">
			</div>
		</form>
		
		<table style="margin-left: auto; margin-right: auto; margin-top: 50px; margin-bottom: 50px; text-align: center; width: 600px;" >
		
			<tr>
				<td><div style="white-space:pre-line;">${communityBoard.boardContent }</div><br><br><br></td>
			</tr>
			<tr>
				<td>
					<c:if test="${!empty communityBoard.boardFileName }">
						<c:set var="boardFileName" value="${fn:split(communityBoard.boardFileName,',')}"/>
						<c:forEach items="${boardFileName}" var="boardFileName">
							<img src="${pageContext.request.contextPath}/img/samjin/${boardFileName}"
								width="600px" height="450px" style="border-radius: 10px" />
							<br><br><br>
						</c:forEach>
					</c:if>	
				</td>
			</tr>
		</table>
		<div style="text-align: right; ">
			<a style="display: inline-block; clear: both; margin-top: 15px; padding: 4px 0 7px 0; width: 80px; 
					  height: 32px; border: 1px solid #d7dce5; border-radius: 4px; box-sizing: border-box; text-align: center;"
			   href="${pageContext.request.contextPath}/community/list">
				<span style="display: inline-block; position: relative; color: #5c667b; font-size: 13px; line-height: 20px; 
							 text-align: center;">목록 〉</span>
			</a>
		</div>
	</div>
		
	

</body>
</html>