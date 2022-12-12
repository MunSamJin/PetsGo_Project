<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<tbody id="reservAjax">
		<c:forEach items="${reservList}" var="reserv">
			<tr
				onclick="location.href='${pageContext.request.contextPath}/owner/resi/resiDetail/${resi.resiNo}'"
				style="cursor: pointer;">
				<td><p id="reservNo">${reserv.reservNo}</p></td>
				<td><p id="memberNo">${reserv.memberNo}</p></td>
				<td><p id="reservDate">${reserv.reservDate}</p></td>
				<td>
					<p>
						<fmt:formatNumber id="reservPrice" value="${reserv.reservPrice}"
							pattern="###,### 원" />
					</p>
				</td>
				<c:choose>
					<c:when test="${reserv.reservState == 0}">
						<td><label class="badge badge-info">예약대기</label></td>
					</c:when>
					<c:when test="${reserv.reservState == 1}">
						<td><label class="badge badge-success">예약확정</label></td>
					</c:when>
					<c:when test="${reserv.reservState == 3}">
						<td><label class="badge badge-wait">예약취소</label></td>
					</c:when>
					<c:when test="${reserv.reservState == 4}">
						<td><label class="badge badge-danger">결제취소요청</label></td>
					</c:when>
				</c:choose>
			</tr>
		</c:forEach>
	</tbody>

</body>
</html>