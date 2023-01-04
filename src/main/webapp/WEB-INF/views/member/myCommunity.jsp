<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Martine</title>
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

    <style>
    	/*커뮤니티 이미지*/
			.myComImg{cursor: pointer;}
		
		/*수정하기, 삭제하기 버튼*/
			ul{list-style:none;}
			a{text-decoration:none; color:#333;}
			.menu:after{display:block; content:''; clear:both;}
			.menu > li{position:relative; float:left; margin-right:5px;}
			.menu > li > a{display:block; padding:0 15px; background:white; height:40px; line-height:40px; color:#fff;}
			.menu > li:hover .depth_1 {display:block;}
			.menu .depth_1{display:none; position:absolute; left:0; right:0; text-align:center;}
			.menu .depth_1 a{display:block; padding:5px; background:white; color:#fff;}
    </style>

</head>

<body>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <!--================ community Area =================-->
    <section class="blog_area single-post-area section_padding">
        <div class="container">
            <div class="my_topmenu">나의 커뮤니티</div>
            <div class="row">
                    <div class="col-lg-4">
                        <div class="blog_right_sidebar">
                        	<sec:authentication var="mvo" property="principal" />
                            <aside class="single_sidebar_widget instagram_feeds">                          

			                     <div class="my_img">
			                        <img class="img-fluid" src="${pageContext.request.contextPath}/img/regi_profile/${mvo.memberProfile}" >
			                     </div>                                      
			                     <h4 class="widget_title">${mvo.memberNickname}님</h4>
			                      
			                      <img src="${pageContext.request.contextPath}/img/bookmark_1.png" alt="" style="width: 7%; opacity: 68%;">                    
			                     <a href="javascript:void(0);" name="communityList">
			                        <p style="display: inline-block;">스크랩</p>
			                        <b>7</b>
			                      </a>
			                      &nbsp 
			                      <i class="far fa-star"></i>   
			                      <a href="javascript:void(0);" name="likeList">
			                        <p style="display: inline-block;">좋아요</p>
			                        <b>33</b>
			                      </a>
			                  </aside>

                        </div>
                    </div>
                   
                    <div class="col-lg-8 mb-5 mb-lg-0">
                        <!-- my_community field01 -->  
                        <div class="contents_box">
                            
                            <c:forEach items="${requestScope.myCommunity}" var="myCommunity" varStatus="status" >
                            
	                            <article class="contents cont01" >
	                                <header class="top">
	                                    <div class="user_container">
	                                        <div class="profile_img" >
	                                            <img src="${pageContext.request.contextPath}/img/regi_profile/${mvo.memberProfile}">
	                                        </div>
	                                        <div class="user_name">
	                                            <div class="nick_name">${mvo.memberNickname}</div> 
	                                        </div>
	                                    </div>
	                                    
	                                    <%-- <ul class="menu">
	                                    	<li>
												<a href="#"><div class="sprite_more_icon"></div></a>
											    <ul class="depth_1">
											      <li>
											      	 <a href="javascript:void(0)"
											      	 	onclick="javascript:location.href='${pageContext.request.contextPath}/community/delete/${myCommunity.boardNo}'">
											      	 	<b>삭제</b>
											      	 </a>
											      </li>
											      <!-- <li><a href="javascript:void(0)"><b>수정</b></a></li> -->
											    </ul>
											 </li>
	                                    </ul> --%>
	                                </header>
	
	                                <div class="img_section" >
	                                    <div class="trans_inner">
	                                        <div style="text-align: center; width:330px; height: 410px">
	                                        	<img style="width: 300px; height: 400px; cursor: pointer;"
	                                        		  src="${pageContext.request.contextPath}/img//samjin/${fn:split(myCommunity.boardFileName,',')[0]}" 
	                                        		  onclick="javascript:window.open('${pageContext.request.contextPath}/community/read/${myCommunity.boardNo}',
	                                        		  			'communityPop','width=800,height=400,left=200,top=100')">
	                                        </div>	                                        
	                                    </div>
	                                </div>	                                
	                        </article>
                        </c:forEach>
                    </div> 
                    <!-- my_community field01 End -->
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