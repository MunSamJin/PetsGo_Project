<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>PetsGo</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/petsgoweb.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/fontawesome/css/all.min.css">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gijgo.min.css">
    <!-- niceselect CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css">
    <!-- slick CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <!-- main CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_petsgo.css">
    <!-- map CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kakao_map.css">

	<link rel='stylesheet' href='${pageContext.request.contextPath}/css/swiper.min.css'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comu_style.css">

	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
	
	<script type="text/javascript">
		$(function(){
			//alert(11);
			
			$("a[name=tag]").on("click", function(){
				//alert("클릭");
				let tag = $(this).text();
				//alert(tag);
				
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/community/tagSelect",				
					data:{tag:tag},	
					dataType:"json" ,
					success:function(result){		
						
						//alert(result)
						//$("#tagResult").empty();
						
						//let str = "";
						let filename = "";
						
						
						$.each(result, function(index, item){
							filename = item.boardFileName.split(",");
							//alert(filename[0]);
							
							$.each(filename, function(i, j){
								alert(j);
							})
							//alert(item.boardFileName.split(","));
							//alert(item.boardTag)
							//alert(item.boardContent)
						//	str += "<li>";
						//	str += item.boardContent
						//str += "</li>";
							
						});
						
						//$("#tagResult").append(str);
						
					},//callback
					error:function(err){
						alert(err);
					}
					
				});//ajax
				
				
				
				
				
			
			});
			
			
		});
	</script>
	
	<style type="text/css">
	
/* 전체검색 : 태그 */
		.table1{width: 75%; margin-left: auto; margin-right: auto; margin-top:30px; text-align: center;}
		.tag{width: 30px; height: 30px}
		body > section > div > table:nth-child(4) > tbody > tr > td{width: 100px;}
		a{color: gray; cursor: pointer;}
		
/* 커뮤니티 게시글 */	
		.communityCard{width: 320px; height: 350px; text-align: center;}	
		.communityImg{width: 400px; height: 300px; border-radius: 10px; cursor: pointer;}
		ul{text-align: center;}
		li{display: inline-block; margin-left: 10px;margin-right: 8px; }

		
	</style>

</head>
<body>
<div>
	<%-- a href="${pageContext.request.contextPath}/community/write">글쓰기</a> <br><br> --%>
							
<!-- 전체검색 : 태그 -->	
	<table class="table1" >
		<tr>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/오토캠핑.png" /><br>
				<a name="tag" >#오토캠핑</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/방갈로.png"/><br>
				<a name="tag">#방갈로</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/카라반.png" /><br>
				<a name="tag">#카라반</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/글램핑.png"/><br>
				<a name="tag">#글램핑</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/펜션.png" /><br>
				<a name="tag">#펜션</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/차박.png" /><br>
				<a name="tag">#차박</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/바다.png"/><br>
				<a name="tag">#바다</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/산.png"/><br>
				<a name="tag">#산</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/강.png" /><br>
				<a name="tag">#강</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/호수.png"/><br>
				<a name="tag">#호수</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/계곡.png"/><br>
				<a name="tag">#계곡</a>
			</td>
		</tr>
	</table>	
	<br>
	
	
<!-- 커뮤니티 전체조회 -->	
		<div class="container" ><!-- style="width: 80%; margin-left: auto; margin-right: auto; margin-bottom: 50px" -->
			<ul id="tagResult">
				<c:forEach items="${requestScope.communityBoardList}" var="communityBoardList" varStatus="status" begin="0" end="6">
				    <li>
						<div class="communityCard">
							<img class="communityImg"src="${pageContext.request.contextPath}/img/samjin/${fn:split(communityBoardList.boardFileName,',')[0]}" 
								 onclick="javascript:location.href='${pageContext.request.contextPath}/community/read/${communityBoardList.boardNo}';"/><br> 
							<div style="text-align: left;">
								 <span id="heart" style="cursor: pointer;">
								 	<img src="${pageContext.request.contextPath}/img/samjin/heart.png" 
								 				 width="15px" height="15px" style="padding-bottom: 3px;">
								 </span>
								 		<span><b>좋아요&nbsp30개</b></span>
								 		<span><b>${communityBoardList.boardTag}</b></span><br>
					
								 		<c:choose>
												<c:when test="${fn:length(communityBoardList.boardContent)>17}">
													 <c:out value="${fn:substring(communityBoardList.boardContent,0,16)}"/>
													 ... 
													 <a href="${pageContext.request.contextPath}/community/read/${communityBoardList.boardNo}" style="color: gray">더보기</a>
													 
													 
												</c:when>
												
												<c:otherwise>
													<c:out value="${communityBoardList.boardContent}"/>
												</c:otherwise>
											</c:choose>
								 	</div>	
								</div><br> 
				    </li>
				   
				</c:forEach>
			</ul> 
		</div>	
		
		
	</div>	
	
	
		
</body>
</html>