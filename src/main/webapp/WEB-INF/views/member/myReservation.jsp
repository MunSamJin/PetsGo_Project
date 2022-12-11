<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    

</head>

<body>

    <!--================ Area =================-->
    <section class="blog_area single-post-area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget instagram_feeds">                          
                                <div class="my_img">
                                    <img class="img-fluid" src="${pageContext.request.contextPath}/img/post_5.png" alt="">
                                </div>
                                 <h4 class="widget_title">펫츠고</h4>
                        </aside>
                    </div>
                </div>
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                       <!-- 예약내역 - 결제완료까지 -->
                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="${pageContext.request.contextPath}/img/single_blog_1.png" alt="">
                                <div href="#" class="blog_item_date">
                                    <span class="check_in">
                                        <p>check-in</p>
                                        <h3>15일</h3>
                                        <p>6월</p>
                                    </span>

                                    <span class="check_center">
                                        
                                    </span>

                                    <span class="check_out">
                                        <p>check-out</p>
                                        <h3>17일</h3>
                                        <p>6월</p>
                                    </span>
                                </div>
                            </div>
                            <div class="blog_details">
                                <a class="d-inline-block" href="#">
                                    <h2>물동네힐링캠프</h2>
                                </a>
                                <div class="rev_detail">
                                    <div class="detials01">
                                        <p>이용자 정보</p>                                       
                                           <span>이름 : </span><span>김민지</span> <br>
                                           <span>휴대폰번호 : </span><span>010-1234-5678</span>
                                    </div>
                                    <div class="detials02">
                                        <p>결제 정보</p>                                       
                                           <span>결제금액 : </span><span>90,000원</span> <br>
                                           <span>결제수단 : </span><span>카카오페이</span>
                                    </div>
                                </div>
                                <ul class="blog-info-link">
                                    <li><span><i class="far fa-user"></i> 인원 2명</span></li>
                                    <li><span><i class="far fa-check-circle"></i> 결제완료</span></li>
                                    <li style="font-size: 13px;"><a href="#"><i class="far fa-times-circle"></i> 결제취소</a></li>
                                </ul>
                            </div>
                        </article>
                        <!-- 예약내역 - 예약확정까지 -->
                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="${pageContext.request.contextPath}/img/single_blog_2.png" alt="">
                                <div href="#" class="blog_item_date">
                                    <span class="check_in">
                                        <p>check-in</p>
                                        <h3>05일</h3>
                                        <p>7월</p>
                                    </span>

                                    <span class="check_center">
                                        
                                    </span>

                                    <span class="check_out">
                                        <p>check-out</p>
                                        <h3>07일</h3>
                                        <p>7월</p>
                                    </span>
                                </div>
                            </div>

                            <div class="blog_details">
                                <a class="d-inline-block" href="#">
                                    <h2>범바위캠핑정원</h2>
                                </a>
                                <div class="rev_detail">
                                    <div class="detials01">
                                        <p>이용자 정보</p>                                       
                                           <span>이름 : </span><span>이유진</span> <br>
                                           <span>휴대폰번호 : </span><span>010-1234-5678</span>
                                    </div>
                                    <div class="detials02">
                                        <p>결제 정보</p>                                       
                                           <span>결제금액 : </span><span>120,000원</span> <br>
                                           <span>결제수단 : </span><span>카카오페이</span>
                                    </div>
                                </div>
                                <ul class="blog-info-link">
                                    <li><span><i class="far fa-user"></i> 인원 4명</span></li>
                                    <li><span><i class="far fa-check-circle"></i> 결제완료</span></li>
                                    <li style="font-size: 13px; display: none;"><a href="#"><i class="far fa-times-circle"></i> 결제취소</a></li>
                                    <li style="color: #f7612f;"><i class="far fa-star"></i> 예약확정</li>
                                </ul>
                            </div>
                        </article>

                        

                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Previous">
                                        <i class="ti-angle-left"></i>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link">1</a>
                                </li>
                                <li class="page-item active">
                                    <a href="#" class="page-link">2</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Next">
                                        <i class="ti-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
    <!--================ Area end =================-->

    <!-- jquery plugins here-->
    <script src="${pageContext.request.contextPath}js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="${pageContext.request.contextPath}js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="${pageContext.request.contextPath}js/bootstrap.min.js"></script>
    <!-- magnific js -->
    <script src="${pageContext.request.contextPath}js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="${pageContext.request.contextPath}js/owl.carousel.min.js"></script>
    <!-- masonry js -->
    <script src="${pageContext.request.contextPath}js/masonry.pkgd.js"></script>
    <!-- masonry js -->
    <script src="${pageContext.request.contextPath}js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}js/gijgo.min.js"></script>
    <!-- contact js -->
    <script src="${pageContext.request.contextPath}js/jquery.ajaxchimp.min.js"></script>
    <script src="${pageContext.request.contextPath}js/jquery.form.js"></script>
    <script src="${pageContext.request.contextPath}js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}js/mail-script.js"></script>
    <script src="${pageContext.request.contextPath}js/contact.js"></script>
    <!-- custom js -->
    <script src="${pageContext.request.contextPath}js/custom.js"></script>
</body>

</html>