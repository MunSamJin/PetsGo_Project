<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>PetsGo</title>
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
    <!-- main CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_petsgo.css">

    <style type="text/css">
    
    a#navbarDropdown_1.nav-link {width: 150px;}
    
    </style>

</head>

<body>
<!--::header part start - 로그인회원 MODE ::-->
   <header class="main_menu">
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">

                            <a class="navbar-brand" href="${pageContext.request.contextPath}/"> <img src="${pageContext.request.contextPath}/img/logo_main.png" alt="logo">  </a>

                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item justify-content"
                                id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false" style="margin-top: 10px;">
                                            커뮤니티
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/community/list">홈</a>
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/community/write">글쓰기</a>
                                        </div>
                                    </li>
                                    
                                    
                                    
                                    <c:choose>
                                    	<c:when test="${empty pageContext.request.userPrincipal}">
                                    		<li class="nav-item">
		                                        <a class="nav-link" href="${pageContext.request.contextPath}/loginForm" style="margin-top: 10px;">로그인</a>
		                                    </li>
		                                    <li class="nav-item">
		                                        <a class="nav-link" href="${pageContext.request.contextPath}/registerForm" style="margin-top: 10px;">회원가입</a>
		                                    </li>
                                    	</c:when>
                                    	<c:otherwise>
                                          <li class="nav-item">
                                              <a class="nav-link" href="${pageContext.request.contextPath}/logout" style="margin-top: 10px;">로그아웃</a>
                                          </li>
                                          <!-- 회원 프로필 아이콘 -->
                                          <li class="nav-item dropdown" style="display:block; text-align: center; margin-left: -28px;">
                                              <a class="nav-link" href="#" id="navbarDropdown_1"
                                                  role="button" data-toggle="dropdown" aria-haspopup="true"
                                                  aria-expanded="false">
                                                  <sec:authentication var="mvo" property="principal" />
                                                  <img src="${pageContext.request.contextPath}/img/regi_profile/${mvo.memberProfile}" style="width: 40%;">

                                              </a>
                                              <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                                  <a class="dropdown-item" href="${pageContext.request.contextPath}/member/myReservation">예약내역</a>
                                                  <a class="dropdown-item" href="${pageContext.request.contextPath}/member/myScrap">스크랩북</a>
                                                  <a class="dropdown-item" href="${pageContext.request.contextPath}/member/myCommunity">내 커뮤니티</a>
                                                   <a class="dropdown-item" href="${pageContext.request.contextPath}/member/myInfo">회원정보</a>
                                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/member/myQna">문의하기</a>
                                              </div>
                                          </li>
                                       </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                            <!--  <div style="display: inline-block; margin-right:10px"><a href="#" class="btn_1 d-none d-lg-block">회원가입</a></div>
                             <a href="#" class="btn_1 d-none d-lg-block">로그인</a> -->
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
<!-- Header part end-->

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
<%--     <script src="${pageContext.request.contextPath}/js/contact.js"></script> --%>


</body>

</html>