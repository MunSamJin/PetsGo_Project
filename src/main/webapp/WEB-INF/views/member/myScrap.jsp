<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.png">
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
    <!-- my_reservation style CSS --> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/my_reservation.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/commu_reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/commu_common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/commu_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/my_scrap.css">
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.js"></script>
    <script type="text/javascript">
    	$(function() {
    		$("#moreBtn").click(function() {
    			let len = $("div[name=hideview]").length;
    			if(len===0) {
    				alert("더 이상 게시물이 없습니다.");
    			} else {
    				let arr = new Array(len);
    				for(var i=0; i<4; i++){         
    					arr[i] = $("div[name=hideview]").eq(i);
    			    }
    				for(var j=0; j<4; j++) {
    					arr[j].attr('name', 'showview');
    					arr[j].css('display', 'block');
    				}
    				$("html, body").animate({scrollTop:$(document).height()}, 500);
    			}
    		});
    		
    		$(".ti-share").click(function() {
    			let aa = $(this).parent().parent().parent().parent();
    			let member = $("#member").val();
    			let camp = $(this).next().val();
    			
    			$.ajax({
    				url : '${pageCotext.request.contextPath}/scrap/scrap',
    				type : 'post',
    				dataType : 'text',
    				data : {
    					member : member,
    					camp : camp
    				},
    				success : function(message) {
    					aa.remove();
    					alert(message);
    				},
    				error : function(err) {
    					alert(err);
    				}
    			});
			});
  
		});
    </script>
</head>
<body>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<sec:authentication var="mvo" property="principal" />
	<input type="hidden" id="member" value="${mvo.memberNo}">

	<section class="blog_area single-post-area section_padding">
		<div class="container">
	    	<div class="my_topmenu">나의 스크랩</div>
	        <div class="row">
	
		        <!-- 프로필 -->
		        <div class="col-lg-4">
				   <div class="blog_right_sidebar">
				      <sec:authentication var="mvo" property="principal" />
						<aside class="single_sidebar_widget instagram_feeds">                          
						   <div class="my_img">
						      <img class="img-fluid" src="${pageContext.request.contextPath}/img/regi_profile/${mvo.memberProfile}" >
						   </div>		                                
						   <h4 class="widget_title">${mvo.memberNickname}님</h4>
						                        
						   <a href="javascript:void(0);" name="communityList">
					         <i class="far fa-star"></i> 
					         <p style="display: inline-block;">스크랩</p>
					       </a>
					       &nbsp	
					       <a href="javascript:void(0);" name="likeList">
					         <i class="far fa-star"></i> 
					         <p style="display: inline-block;">좋아요 리스트</p>
					       </a>
						</aside>
					</div>
				 </div>
		
		         <!-- 캠핑장 -->
		         <div class="contents_box" >
			         <div class="col-lg-8">
			           <div class="row">
			                
			           <!-- 반복문 -->
			             <c:forEach items="${campList}" var="camp" varStatus="status">
			               <c:choose>
			                 <c:when test="${status.count<=3}">
			                    <div class="col-lg-6 col-md-6"  name="showview">
			                 </c:when>
			                 <c:otherwise>
			                    <div class="col-lg-6 col-md-6"  style="display: none" name="hideview">
			                 </c:otherwise>
			               </c:choose>
			               
			               <div class="blog_left_sidebar">
			                <article class="blog_item">
			                	<div class="blog_item_img">
			                		<img src="${pageContext.request.contextPath}/img/seryun/${fn:split(camp.campFilename, ',')[0]}" alt="">
			                	</div>
				                <div class="blog_details">
				               		<a class="d-inline-block" href="#">
				                		<h2>${camp.campName }</h2>
				               		</a>
				               		<p>${camp.campAddr}</p>
				            	</div>
				              <div class="details_icon text-right">
					              <i class="ti-share" alt="스크랩북"></i>
					              <input type="hidden" value="${camp.campNo}">
					          </div>
			            	</article>
			               </div>
			           	  </c:forEach>
			            </div>      	
			         </div>
		                
			         <div class="row">
			             <div class="col-lg-12">
				            <div class="more_place_btn text-center">
				               <button type="button" class="boxed-btn4" id="moreBtn">More Places</button>
				            </div>
				          </div>
			         </div>
		         </div>
	         </div>
	    </div>
	</section>

<!--================ Area end =================-->

    <!-- jquery plugins here-->
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!-- magnific js -->
    <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <!-- masonry js -->
    <script src="${pageContext.request.contextPath}/js/masonry.pkgd.js"></script>
    <!-- masonry js -->
    <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/gijgo.min.js"></script>
    <!-- contact js -->
    <script src="${pageContext.request.contextPath}/js/jquery.ajaxchimp.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/mail-script.js"></script>
    <script src="${pageContext.request.contextPath}/js/contact.js"></script>
    <!-- custom js -->
    <script src="${pageContext.request.contextPath}/js/custom.js"></script>
</body>
</html>