<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	
	<!-- 추가한 것 -->
	<link rel="icon" href="${pageContext.request.contextPath}/img/petsgoweb.png">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <!-- main CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_petsgo.css">
    
    <!-- register js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/minjeong/registerForm.js"></script>
	<script>
		
	</script>

</head>
<body>
	<!--::header part start - 비회원MODE ::-->
   <header class="main_menu">
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand" href="${pageContext.request.contextPath}/main"> <img src="${pageContext.request.contextPath}/img/logo.png" alt="logo"> </a>
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
                                            aria-expanded="false">
                                            커뮤니티
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="#">홈</a>
                                            <a class="dropdown-item" href="#">글쓰기</a>
                                        </div>
                                    </li>
                                     <li class="nav-item" style="display: none;">
                                        <a class="nav-link" href="#">예약 확인</a>
                                    </li>
                                    <li class="nav-item dropdown" style="display:none;">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown_1"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            마이페이지
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                            <a class="dropdown-item" href="#">예약내역</a>
                                            <a class="dropdown-item" href="#">스크랩북</a>
                                            <a class="dropdown-item" href="#">내 커뮤니티</a>
                                             <a class="dropdown-item" href="#">회원정보</a>
                                              <a class="dropdown-item" href="#">문의하기</a>
                                        </div>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="contact.html">회원가입</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="${pageContext.request.contextPath}/loginForm">로그인</a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
	<!-- Header part end-->

	<!-- register part start -->
	<h2>Member Register Form</h2><p>
	<form method="post" action="${pageContext.request.contextPath}/register" id="registerForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		아이콘 <input type="file" name="memberProfile"><br><br>
		이메일 <input type="text" name="memberEmail" id="email"> <span id="emailCheck"></span> <br>
		<span id="emailValid"></span><br><br>
		비밀번호 <input type="password" name="memberPassword" id="password"><br>
		<span id="passwordValid"></span><br><br>
		비밀번호 확인 <input type="password" name="passwordCheck" id="passwordCheck"><br>
		<span id="passwordEqual"></span><br><br>
		닉네임 <input type="text" name="memberNickname" id="nickname"> <span id="nicknameCheck"></span> <br>
		<span id="nicknameValid"></span><br><br>
		휴대폰번호 <input type="text" name="memberPhone" oninput="autoHyphen(this)" maxlength="13" placeholder="'-'없이 숫자만 입력해 주세요."><br><br>
		<script>
            const autoHyphen = (target) => {
                target.value = target.value
                    .replace(/[^0-9]/g, '')
                    .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
            }
        </script>
        생년월일 <input type="text" name="memberBirthDate" id="datepicker"><br><br>
<!-- 		USER TYPE <input type="radio" value="0" name="userType">ROLE_MEMBER
				  <input type="radio" value="1" name="userType">ROLE_ADMIN<br><br> -->
		<input type="submit" value="회원 가입">
		<input type="reset" value="취소">
	</form>
	<!-- register part end -->
	
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
	
</body>
</html>