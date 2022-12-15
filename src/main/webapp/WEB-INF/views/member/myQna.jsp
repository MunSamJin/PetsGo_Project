<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    <!-- my_reservation style CSS --> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/my_reservation.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/commu_reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/commu_common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/commu_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage_style.css">

	<script>
		$(document).ready(function(){
			$("#commentForm").submit(function(){
				if($("#comment").val().trim()==""){
					alert("문의 내용을 입력해 주세요");	
					$("#comment").focus();
					return false;
				}
			})	
		})	
	</script>
</head>

<body>
    <!--================ Area =================-->
    <section class="blog_area single-post-area section_padding">
        <div class="container">
            <div class="my_topmenu">나의 문의답변</div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                    	<sec:authentication var="mvo" property="principal" />
                        <aside class="single_sidebar_widget instagram_feeds">                          
                                <div class="my_img">
                                    <img class="img-fluid" src="${pageContext.request.contextPath}/img/regi_profile/${mvo.memberProfile}" alt="">
                                </div>
                                 <h4 class="widget_title">${mvo.memberNickname}님</h4>
                        </aside>
                    </div>
                </div>
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                        <!-- 문의등록 -->
                        <div class="comment-form">
                        <h4 style="color: #467e62; font-weight: bold; text-align: center;">문의 등록</h4>
                        <form class="form-contact comment_form" name="qnaForm" method="post" action="${pageContext.request.contextPath}/member/qnaInsert" id="commentForm" onSubmit='return checkValid()'>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
							<input type="hidden" name="member" value="<sec:authentication property="principal.memberNo"/>">
                            
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea class="form-control w-100" name="qnaContent" id="comment" cols="30" rows="9" placeholder="문의 내용을 작성해주세요."></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="text-align: center;">
                                <button type="submit" class="button button-contactForm btn_1">등록</button>
                            </div>
                        </form>
                    </div>
                       <!-- 문의내역 -->
                        <div class="comments-area">
                        <h4 style="color: #f7612f; font-weight: bold; text-align: center;">문의내역</h4>
                        <c:choose>
							<c:when test="${empty requestScope.myQna}">
								<b>작성한 문의가 없습니다.</b>
							</c:when>
							<c:otherwise>	
								<c:forEach items="${requestScope.myQna}" var="qna">
									<div class="comment-list_user">
			                            <div class="single-comment_user justify-content-between d-flex">
			                                <div class="user justify-content-between d-flex">
			                                    <div class="thumb">
			                                        <img src="${pageContext.request.contextPath}/img/regi_profile/${mvo.memberProfile}" alt="">
			                                    </div>
			                                    <div class="desc">
			                                        <p class="comment">
			                                            ${qna.qnaContent}
			                                        </p>
			                                        <div class="d-flex justify-content-between">
			                                            <div class="d-flex align-items-center">
			                                                <h5>
						                                       <a href="#">${qna.member.memberNickname}</a>
						                                    </h5>
			                                                <p class="date">
			                                                	<fmt:parseDate value="${qna.qnaDate}" pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
			                              						<fmt:formatDate value="${parsedDateTime}" pattern="yyyy-MM-dd"/>
			                                                </p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                                                <a href="${pageContext.request.contextPath}/member/qnaDelete/${qna.qnaNo}"><button type="button" class="btn btn-light">삭제</button></a>
			                                            </div>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                        <c:choose>
			                        	<c:when test="${qna.qnaReContent == null}">
			                            </c:when>
			                            <c:otherwise>
			                            	<div class="comment-list_admin">
					                            <div class="single-comment_admin justify-content-between d-flex">
					                                <div class="user justify-content-between d-flex">
					                                    <div class="desc">
					                                        <p class="comment">
					                                            ${qna.qnaReContent}
					                                        </p>
					                                        <div class="d-flex justify-content-between">
					                                            <div class="d-flex align-items-center">
							                                        <h5>
							                                       		<a href="#">관리자</a>
							                                    	</h5>
						                                            <p class="date">
						                                            	<fmt:parseDate value="${qna.qnaReDate}" pattern="yyyy-MM-dd" var="parsedReDateTime" type="both" />
			                              								<fmt:formatDate value="${parsedReDateTime}" pattern="yyyy-MM-dd"/>
						                                            </p>
						                                         </div>
					                                        </div>                                       
					                                    </div>
					                                    
					                                </div>
					                                <div class="thumb">
					                                	<img src="${pageContext.request.contextPath}/images/admin_pr.jpg" alt="">
					                                </div>
					                            </div>
					                        </div>
			                            </c:otherwise>
			                        </c:choose>  
		                        </c:forEach>
							</c:otherwise>
						</c:choose> 
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
    
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
</body>

</html>	
