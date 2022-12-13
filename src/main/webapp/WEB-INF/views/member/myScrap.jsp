<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.js"></script>
    <script type="text/javascript">
    	$(function() {
			
		});
    </script>
</head>
<body>
<section class="blog_area single-post-area section_padding">
    <div class="container">
        <div class="row">

            <!-- 프로필 -->
            <div class="col-lg-4">
                <div class="blog_right_sidebar">
                    <aside class="single_sidebar_widget instagram_feeds">
                        <div class="my_img">
                            <img class="img-fluid" src="/img/post_5.png" alt="">
                        </div>
                        <h4 class="widget_title">쫑쫑2님</h4>
                    </aside>
                </div>
            </div>

            <!-- 캠핑장 -->
            <div class="col-lg-8">
                <div class="row">
                
                	<!-- 반복문 -->
                	<c:forEach items="${campList}" var="camp">
                		<div class="col-lg-6 col-md-6">
                		<div class="blog_left_sidebar">
                			<article class="blog_item">
                				<div class="blog_item_img">
                					<img src="${pageContext.request.contextPath}/img/seryun/${fn:split(camp.campFilename, ',')[0]}" alt="">
                				</div>
                				<div class="blog_details">
                					<a class="d-inline-block" href="#">
                						<h2>${camp.campName }</h2>
                					</a>
                				</div>
                			</article>
                		</div>
                	</div>
                	</c:forEach>
                	
                </div>
                
                <div class="row">
                	<div class="col-lg-12">
	                	<div class="more_place_btn text-center">
	                		<button type="button" class="boxed-btn4" id="moreBtn">More Places</button>
	                		<button type="button" class="boxed-btn4" id="moreBtn">More Places</button>
	                	</div>
	                </div>
            	</div>
            	
            </div>

        </div>
    </div>
</section>
</body>
</html>