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
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" id="admin-tab" data-bs-toggle="tab" data-bs-target="#admin-tab-pane" type="button" role="tab" aria-controls="admin-tab-pane" aria-selected="false">관리자</button>
					  </li>
					</ul>
					<div class="tab-content" id="myTabContent">
					<h1>로그인</h1>
					<c:if test="${param.err !=null}">
						<b style="color: red"> 정보가 일치하지 않습니다. </b>
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
							<input type="text" class="form-control" name="id" id="no" oninput="autoHyphen(this)" placeholder="사업자 등록 번호"> 
							<script>																
								const autoHyphen = (target) => {
									target.value = target.value
									.replace(/[^0-9]/g, '')
									.replace(/^(\d{3})(\d{2})(\d{5})$/, `$1-$2-$3`);
								}
						  	</script>
							<span id="noValid"></span>
							<input type="password" class="form-control" name="password" id="campPassword" placeholder="비밀번호"> 
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />		
							<div class="buttons">
								<input type="submit" class="btn btn-primary" value="로그인">			
								<a href="${pageContext.request.contextPath}/main"><button type="button" class="btn btn-light">취소</button></a>	
							</div>			
						</form>
					  </div>	
					  <div class="tab-pane fade" id="admin-tab-pane" role="tabpanel" aria-labelledby="admin-tab" tabindex="0">
						<form id="adminLoginForm" action="${pageContext.request.contextPath}/admin/adminLogin" method="post">
							<input type="text" class="form-control" name="id" id="adminId" placeholder="ID"> 
							<!-- <span id="adminValid"></span> -->
							<input type="password" class="form-control" name="password" id="adminPwd" placeholder="Password"> 
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