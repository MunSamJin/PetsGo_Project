<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>PetsGo</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/petsgoweb.png">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <!-- main CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_petsgo.css">
    <!-- login CSS -->
    <link href="${pageContext.request.contextPath}/css/minjeong/loginForm.css" rel="stylesheet">
	
	<!-- login js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/minjeong/loginForm.js"></script>
</head>
<body>
	
	<c:if test="${param.err !=null}">
		Error message: <b style="color: red">${SPRING_SECURITY_LAST_EXCEPTION.message} / 정보가 일치하지 않습니다. </b>
	</c:if> 
	<!-- param.err: loginForm에서 get 방식으로 err이 넘어왔는지 아닌지 알 수 o. ${SPRING_SECURITY_LAST_EXCEPTION.message}: spring이 기본적으로 갖고 있는 에러 메시지(Bad credential)가 나옴 -->
	
	<!-- login part start -->
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-6">
				<div class="loginForm">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
					  <li class="nav-item" role="presentation">
					    <button class="nav-link active" id="member-tab" data-bs-toggle="tab" data-bs-target="#member-tab-pane" type="button" role="tab" aria-controls="member-tab-pane" aria-selected="true">회원</button>
					  </li>
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" id="owner-tab" data-bs-toggle="tab" data-bs-target="#owner-tab-pane" type="button" role="tab" aria-controls="owner-tab-pane" aria-selected="false">사업자</button>
					  </li>
					</ul>
					<div class="tab-content" id="myTabContent">
					<h1>로그인</h1>
					<c:if test="${not empty requestScope.errorMessage}">
						<span style="color:red">${requestScope.errorMessage}</span>
					</c:if>
					  <div class="tab-pane fade show active" id="member-tab-pane" role="tabpanel" aria-labelledby="member-tab" tabindex="0">
						<form id="memberLoginForm" action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
							<input type="email" class="form-control" name="id" id="email" placeholder="이메일"> 
							<div id="emailValid"></div>
							<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호"> 
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />		
							<div class="buttons">
								<input type="submit" class="btn btn-primary" value="로그인">			
								<a href="${pageContext.request.contextPath}/main"><button type="button" class="btn btn-light">취소</button></a>	
							</div>
						</form>
					  </div>					  
					  <div class="tab-pane fade" id="owner-tab-pane" role="tabpanel" aria-labelledby="owner-tab" tabindex="0">
						<form id="ownerLoginForm" action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
						
						
						
							<input type="text" class="form-control" name="id" id="no" placeholder="사업자 등록 번호"> 
							<span id="noValid"></span>
							<input type="password" class="form-control" name="password" id="campPassword" placeholder="비밀번호"> 
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />		
							<div class="buttons">
								<input type="submit" class="btn btn-primary" value="로그인">			
								<a href="${pageContext.request.contextPath}/main"><button type="button" class="btn btn-light">취소</button></a>	
							</div>			
						</form>
					  </div>	
					</div>
				</div>				
    		</div>
		</div>
	</div>
	<!-- login part end -->

	<!-- footer part start-->
    <footer class="footer-area">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-sm-6 col-md-5">
                    <div class="single-footer-widget">
                        <h4>Categories</h4>
                        <ul>
                            <li><a href="#">개인정보처리방침</a></li>
                            <li><a href="#">쿠키 정책</a></li>
                            <li><a href="#">쿠키 설정</a></li>                         
                            <li><a href="#">서비스 이용약관</a></li>
                            <li><a href="#">위치정보이용약관</a></li>
                            <li><a href="#">웹사이트 이용약관</a></li>
                             <li><a href="#">사업자구매회원</a></li>
                            <li><a href="#">제휴/광고문의</a></li>
                        </ul>

                    </div>
                </div>
                 <div class="col-sm-6 col-md-3">
                    <div class="single-footer-widget footer_icon">
                        <h4>Contact Us</h4>
                        <p>34, Seongnam-daero, <br> 
                            Bundang-gu, Seongnam<br> 
                                +880 123 456 789</p>
                        <span>petsgo2022@kosta.com</span>
                        <div class="social-icons">
                            <a href="#"><i class="ti-facebook"></i></a>
                            <a href="#"><i class="ti-twitter-alt"></i></a>
                            <a href="#"><i class="ti-pinterest"></i></a>
                            <a href="#"><i class="ti-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="single-footer-widget">
                        <h4>PARTNER</h4>
                        <div class="form-wrap" id="mc_embed_signup">
                            <form target="_blank"
                                action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                method="get" class="form-inline">
                               <a href="#" class="genric-btn primary circle arrow">캠핑장 등록 신청<span class="lnr lnr-arrow-right"></span></a>

                                <div class="info"></div>
                            </form>
                        </div>
                        <p>펫츠고의 파트너가 되어보세요!</p>
                    </div>
                </div>               
            </div>
        </div>
        <div class="container-fluid">d
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="copyright_part_text text-center">
                        <p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Made with by <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Pet's Go</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
	<!-- footer part end-->
	
	<!-- jquery plugins here-->
   <%--  <script src="${pageContext.request.contextPath}/js/jquery-1.12.1.min.js"></script> --%>
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
	
	<!-- partial -->
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js'></script>
	<script  src="${pageContext.request.contextPath}/js/comu_script.js"></script>
	
</body>
</html>