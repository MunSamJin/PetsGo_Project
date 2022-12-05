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

</head>
<body>
<div style="margin-left:10%;">
	<h2>community/list 페이지 입니다.</h2>
	<a href="${pageContext.request.contextPath}/community/write">글쓰기</a> <br><br>
	
	
		<table>
			<tr>
				<c:forEach items="${requestScope.communityBoardList}" var="communityBoardList" varStatus="status">
				<c:if test="${status.index%3==0}">
			</tr>
			<tr>
				</c:if>
				    <td>
				    	<c:choose>
				    		<c:when test="${empty communityBoardList.boardFileName }">
								<div style="width: 320px; height: 350px; text-align: center;">
									<div style="width: 300px; height: 300px; border: 1px solid gray; border-radius: 10px"></div>		
										<div style="text-align: left;">
											<span>${communityBoardList.boardTag}</span><br>
											<c:choose>
												<c:when test="${fn:length(communityBoardList.boardContent)>17}">
													 <c:out value="${fn:substring(communityBoardList.boardContent,0,16)}"/>... <a href="#">더보기</a>
												</c:when>
												
												<c:otherwise>
													<c:out value="${communityBoardList.boardContent}"/>
												</c:otherwise>
											</c:choose>
										</div>
								</div><br>
							</c:when>
				
							<c:otherwise>
								<div style="width: 320px; height: 350px; text-align: center;">
									
									<img src="${pageContext.request.contextPath}/img/samjin/${communityBoardList.boardFileName}" 
								 		 width="300px" height="300px" style="border-radius: 10px"/><br>	 
								 	<div style="text-align: left;">
								 		<span>${communityBoardList.boardTag}</span><br>
								 		<c:choose>
												<c:when test="${fn:length(communityBoardList.boardContent)>17}">
													 <c:out value="${fn:substring(communityBoardList.boardContent,0,16)}"/>... <a href="#">더보기</a>
												</c:when>
												
												<c:otherwise>
													<c:out value="${communityBoardList.boardContent}"/>
												</c:otherwise>
											</c:choose>
								 	</div>	
								</div><br> 
							</c:otherwise>
				    	</c:choose>
				    </td>
				</c:forEach>
			</tr>
		</table>
	</div>
 
	
	

	
</body>
</html>