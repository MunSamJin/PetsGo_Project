<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

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
   

	<link rel='stylesheet' href='${pageContext.request.contextPath}/css/swiper.min.css'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comu_style.css">

	
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
	
	<script type="text/javascript">
	
		$(function(){
			//alert(11);
			
			
			
			/* 태그 검색 */			
			$("a[name=tag]").on("click", function(){
				//alert("클릭");
				var tag = $(this).text();
				console.log(tag);
				$(location).attr('href', "${pageContext.request.contextPath}/community/list?tag="+ tag);
				//alert(tag);			
			});//태그검색 끝
			
			/* 정렬 기능 */
			$("select[name=option_select_category]").on("change", function(){
				//alert("클릭");
				var tag = $(this).val();
				console.log(tag);
				$(location).attr('href', "${pageContext.request.contextPath}/community/list?tag="+ tag);
						
			});//정렬 끝
			
			
			
		}); //readyEnd
	</script>
	
	<style type="text/css">
	
/* 전체검색 : 태그 */
		.table1{width: 75%; margin-left: auto; margin-right: auto; margin-top:30px; text-align: center;}
		.tag{width: 30px; height: 30px}
		body > section > div > table:nth-child(4) > tbody > tr > td{width: 100px;}
		a{color: gray; cursor: pointer;}
		
/* 정렬기능 */		
		.list_sort{position: relative; padding: 20px 0; border-bottom: 1px solid #d7dce5; display: block;
					width: 80%; margin-left: auto; margin-right: auto; margin-bottom: 10px}
		.inpSel{margin-top: 8px; height: auto; border: 0; background: none; display: inline-block;
				border-radius: 5px; vertical-align: middle; box-sizing: border-box;}
		.inpSel>select {padding: 2px 36px 4px 12px; width: 100%; min-width: 80px; height: 40px;
						border: 1px solid #d7dce5; border-radius: 4px; box-sizing: border-box; color: #5c667b;
						font-size: 14px; letter-spacing: -1px; line-height: 20px; text-align: left; 
						vertical-align: top;
						background: #fff url(//www.saraminimage.co.kr/sri/person/bg/bg_select_default.png) no-repeat right 12px top 50%;
						cursor: pointer; -webkit-appearance: none;}
		.inpSel select option {height: 32px; font-size: 13px; color: #444; line-height: 16px;
								font-family: inherit; font-weight: inherit; font-style: inherit; display: block;
								white-space: nowrap; min-height: 1.2em; padding: 0px 2px 1px;}		
		
/* 커뮤니티 게시글 */	
		.communityBoardList{margin-bottom: 50px}
		.communityCard{width: 320px; height: 350px; text-align: center;}	
		.communityImg{width: 400px; height: 300px; border-radius: 10px; cursor: pointer;}
		.communityBoardContent{display: inline-block; width: 270px; white-space: nowrap;
								overflow: hidden; text-overflow: ellipsis;}
		ul{text-align: center;}
		li{display: inline-block; margin-left: 10px;margin-right: 8px; }

		
	</style>

</head>
<body>


<div class="communityBoardList">
							
<!-- 전체검색 : 태그 -->	
	<table class="table1" >
		<tr>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/오토캠핑.png" /><br>
				<a name="tag">오토캠핑</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/방갈로.png"/><br>
				<a name="tag">방갈로</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/카라반.png" /><br>
				<a name="tag">카라반</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/글램핑.png"/><br>
				<a name="tag">글램핑</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/펜션.png" /><br>
				<a name="tag">펜션</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/차박.png" /><br>
				<a name="tag">차박</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/바다.png"/><br>
				<a name="tag">바다</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/산.png"/><br>
				<a name="tag">산</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/강.png" /><br>
				<a name="tag">강</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/호수.png"/><br>
				<a name="tag">호수</a>
			</td>
			<td>
				<img class="tag" src="${pageContext.request.contextPath}/img/samjin/tag/계곡.png"/><br>
				<a name="tag">계곡</a>
			</td>
		</tr>
	</table>	
	<br>
	
<!-- 정렬기능 -->
	<div class="list_sort">
		<div class="inpSel">
			<select name="option_select_category" title="정렬 선택">
				<option value="">정렬 선택</option>
				<option value="좋아요">좋아요 많은 순</option>
				<option value="최신">최신순</option>
			</select>
			
		</div>
	</div>	
	
<!-- 커뮤니티 전체조회 -->	
    
		<div class="container" ><!-- style="width: 80%; margin-left: auto; margin-right: auto; margin-bottom: 50px" -->
			
			<ul id="tagResult">
			<c:choose>
			  <c:when test="${not empty communityBoardList}">
			     <c:forEach items="${requestScope.communityBoardList}" var="communityBoardList" varStatus="status" >				  				  				  				    
				    <li>
						<div class="communityCard">
							<img class="communityImg" src="${pageContext.request.contextPath}/img/samjin/${fn:split(communityBoardList.boardFileName,',')[0]}" 
								onclick="javascript:location.href='${pageContext.request.contextPath}/community/read/${communityBoardList.boardNo}'"/><br> 
						
							<div style="text-align: left;">							
								<span><b>좋아요&nbsp${communityBoardList.likeList.size() }개</b></span>
								<span><b>${communityBoardList.boardTag}</b></span><br>
								<span class="communityBoardContent">${communityBoardList.boardContent}</span>
								<a href="${pageContext.request.contextPath}/community/read/${communityBoardList.boardNo}" style="color: gray">더보기</a>
							</div>	
						</div>
						<br> 
				    </li>
				</c:forEach>
			  </c:when>
			  <c:otherwise>
			    <c:forEach items="${requestScope.likeList}" var="like" varStatus="status" >				  				  				  				    
				      <li>
						<div class="communityCard">
							<img class="communityImg" src="${pageContext.request.contextPath}/img/samjin/${fn:split(like.boardfilename,',')[0]}" 
								onclick="javascript:location.href='${pageContext.request.contextPath}/community/read/${like.boardno}'"/><br> 
						
							<div style="text-align: left;">							
								<span><b>좋아요&nbsp${like.likecount }개</b></span>
								<span><b>${like.boardtag}</b></span><br>
								<span class="communityBoardContent">${like.boardcontent}</span>
								<a href="${pageContext.request.contextPath}/community/read/${like.boardno}" style="color: gray">더보기</a>
							</div>	
						</div>
						<br> 
				    </li>
				</c:forEach>
			  
			  </c:otherwise>
			</c:choose>
				
			</ul> 
			<!-- <button type="button" id="moreBtn">더보기</button> -->
		</div>	
		

			<!--  블럭당  -->
			<nav class="blog-pagination justify-content-center d-flex">
				<ul class="pagination">
					<c:set var="doneLoop" value="false"/>
					
					<c:if test="${(startPage-blockCount) > -2}">
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/community/list?nowPage=${startPage-1}">PREV
								<i class="ti-angle-left"></i>
							</a>
						</li>
					</c:if>
					  
					<span class="pagination-inner"> 
						<c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
					  
							<c:if test="${(i-1)>=pageList.getTotalPages()}">
								<c:set var="doneLoop" value="true"/>
							</c:if> 
					    
							<c:if test="${not doneLoop}" >
								<a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/community/list?nowPage=${i}">${i}</a> 
							</c:if>
					   
						</c:forEach>
					</span> 
							
					<c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
						<li class="page-item">
							<a class="page-link"  href="${pageContext.request.contextPath}/community/list?nowPage=${startPage+blockCount}">NEXT
								<i class="ti-angle-right"></i>
							</a>
							
						</li>
					</c:if>
				
				</ul>
			</nav>  
	</div>

</body>
</html>