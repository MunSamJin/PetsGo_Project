<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

    <style>
        .widget_title {
            text-align: center;
         }

         .my_img {
            text-align: center;
         }
         .img-fluid {
            width: 100px;
            background-color: none !important;
         }

    </style>
</head>
<body>
	<h3>member/myReservation.jsp</h3>
	///// 메뉴 ////////////////////////////// <p>
	<a href="${pageContext.request.contextPath}/member/myPage">예약내역</a>
	<a href="${pageContext.request.contextPath}/member/myScrap">스크랩북</a>
	<a href="${pageContext.request.contextPath}/member/myCommunity">커뮤니티</a>
	<a href="${pageContext.request.contextPath}/member/myQna">문의사항</a>
	<a href="${pageContext.request.contextPath}/member/myInfo">회원정보</a>
	<section class="blog_area single-post-area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget instagram_feeds">                          
                                <div class="my_img">
                                    <img class="img-fluid" src="${pageContext.request.contextPath}/img/post/post_5.png" alt="">
                                </div>
                                 <h4 class="widget_title">회원 닉네임</h4>
                        </aside>
                    </div>
                </div>
                <div class="col-lg-8 posts-list">
                    <div class="single-post">
                    </div>
                    <div class="navigation-top">
                        <div class="d-sm-flex justify-content-between text-center">
                            
                            <div class="col-sm-4 text-center my-2 my-sm-0">
                               
                            </div>

                        </div>
                        <div class="navigation-area">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                                    <div class="thumb">
                                        <a href="#">
                                            <img class="img-fluid" src="${pageContext.request.contextPath}/img/post/preview.png" alt="">
                                        </a>
                                    </div>
                                    <a href="#">
                                        <div class="detials">
                                        <p>ooo캠핑장</p>
                                            <span>Space The Final Frontier</span>
                                    </div>
                                    </a>
                                </div>

                                <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                                    <div class="detials">
                                        <p>이용자 정보</p>                                       
                                           <span>이름 : </span> <br>
                                           <span>휴대폰번호 : </span>
                                    </div>
                                </div>

                                <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                                    <div class="detials">
                                        <p>결제 정보</p>                                       
                                           <span>결제금액 : </span><span>000</span> <br>
                                           <span>결제수단 : </span><span>카카오페이</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="navigation-area">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                                    <div class="thumb">
                                        <a href="#">
                                            <img class="img-fluid" src="${pageContext.request.contextPath}/img/post/preview.png" alt="">
                                        </a>
                                    </div>
                                    <a href="#">
                                        <div class="detials">
                                        <p>ooo캠핑장</p>
                                            <span>Space The Final Frontier</span>
                                    </div>
                                    </a>
                                </div>

                                <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                                    <div class="detials">
                                        <p>이용자 정보</p>                                       
                                           <span>이름 : </span> <br>
                                           <span>휴대폰번호 : </span>
                                    </div>
                                </div>

                                <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                                    <div class="detials">
                                        <p>결제 정보</p>                                       
                                           <span>결제금액 : </span><span>000</span> <br>
                                           <span>결제수단 : </span><span>카카오페이</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
	
</body>
</html>