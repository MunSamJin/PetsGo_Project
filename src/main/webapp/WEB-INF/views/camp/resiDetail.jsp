<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<div style="position: relative; padding: 32px; border: 1px solid #edeef0; border-radius: 8px; 
				text-align: center; width: 80%; 
				margin-top: 16px; margin-left: auto; margin-right: auto; margin-bottom: 50px">
		
		<span style="color: #25483a; font-family: BMJUA; font-size: 28px;">${resi.resiName}</span><br><br>
		<c:forEach items="${fn:split(resi.resiFilename,',')}" var="resi">			
			<img src="${pageContext.request.contextPath}/img/seryun/${resi}" 
					width="600px" style="border-radius: 10px" />
			<br><br><br><br>
		</c:forEach>
		
	</div>
</body>
</html>