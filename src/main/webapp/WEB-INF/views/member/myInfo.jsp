<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>PetsGo</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/petsgoweb.png">

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage_style.css">
    
    <!-- myInfo CSS -->
	<link href="${pageContext.request.contextPath}/css/minjeong/myInfo.css" rel="stylesheet">
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>

</head>
<body>
	<!--================ Area =================-->
    <section class="blog_area single-post-area section_padding">
        <div class="container">
            <div class="my_topmenu">나의 정보</div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                    	<sec:authentication var="mvo" property="principal" />
                        <aside class="single_sidebar_widget instagram_feeds" style="text-align: center;">                          
                             <div class="my_img">
                                 <img class="img-fluid" src="${pageContext.request.contextPath}/img/regi_profile/${mvo.memberProfile}" >
                             </div>
                              <h4 class="widget_title">${mvo.memberNickname}님</h4><br>
	                                  
	                         <a href="javascript:void(0);" name="communityList">
	                         	<img src="${pageContext.request.contextPath}/img/bookmark_1.png" alt="" style="width: 7%; opacity: 68%;">
	                         	<p style="display: inline-block;">스크랩</p>
	                         	<b>7</b>
	                         </a>
	                         &nbsp
	                         <i class="far fa-star" style="opacity: 68%;"></i>
	                         <a href="javascript:void(0);" name="likeList">
	                         	<p style="display: inline-block;">좋아요</p>
	                         	<b>33</b>
	                         </a>			                         
                          </aside>
                    </div>
                </div>

                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                        <!-- myInfo part start -->
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link active" id="member-tab" data-bs-toggle="tab" data-bs-target="#member-tab-pane" type="button" role="tab" aria-controls="member-tab-pane" aria-selected="true">회원 정보</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="pet-tab" data-bs-toggle="tab" data-bs-target="#pet-tab-pane" type="button" role="tab" aria-controls="pet-tab-pane" aria-selected="false">반려견 정보</button>
							</li>
						</ul>
						<div class="tab-content" id="myTabContent">
							<sec:authentication var="mvo" property="principal" />
							<div class="tab-pane fade show active" id="member-tab-pane" role="tabpanel" aria-labelledby="member-tab" tabindex="0">								
								<form id="myInfo" action="${pageContext.request.contextPath}/member/passwordCheckForm" method="post">
									<div class="form-content">
										<label for="memberEmail" class="form-label">이메일</label>
										<input type="text" class="form-control" name="memberEmail" value="${mvo.memberEmail}" readonly>
									</div>
									<div class="form-content">	
										<label for="memberNickname" class="form-label">닉네임</label>
										<input type="text" class="form-control" name="memberNickname" value="${mvo.memberNickname}" readonly>
									</div>
									<div class="form-content">	
										<label for="memberPhone" class="form-label">휴대폰번호</label>
										<input type="text" class="form-control" name="memberPhone" value="${mvo.memberPhone} " readonly>
									</div>
									<div class="form-content">	
										<label for="memberBirthDate" class="form-label">생년월일</label>
										<input type="text" class="form-control" name="memberBirthDate" value="${mvo.memberBirthDate} " readonly>	
									</div>
									<div class="buttons">
										<input type="submit" class="btn btn-primary" value="수정">
									</div>
								</form>
							</div>
							<div class="tab-pane fade" id="pet-tab-pane" role="tabpanel" aria-labelledby="pet-tab" tabindex="0">
								<%-- <a href="${pageContext.request.contextPath}/member/addPetForm">추가</a> <br><br> --%>
								<form id="myInfo" action="#" method="post">
									<c:forEach items="${petList}" var="pet">
									<div class="form-content">
										<label for="petName" class="form-label">이름</label>
										<input type="text" class="form-control" name="petName" value="${pet.petName}" readonly>
									</div>
									<div class="form-content">	
										<label for="petWeight" class="form-label">몸무게</label>
										<input type="text" class="form-control" name="petWeight" value="${pet.petWeight}kg" readonly>
									</div>
									<div class="form-content">	
										<label for="memberPhone" class="form-label">중성화</label>
										<c:choose>
								        	<c:when test="${pet.petNeuter == 0}">
								        		<input type="text" class="form-control" name="memberPhone" value="비수술" readonly>
								        	</c:when>
								        	<c:otherwise>
								        		<input type="text" class="form-control" name="memberPhone" value="수술 완료" readonly>
								        	</c:otherwise>
								        </c:choose>
									</div>
									<div class="form-content">	
										<label for="memberBirthDate" class="form-label">광견병 예방</label>
										<c:choose>
								        	<c:when test="${pet.petVaccine == null}">
								        		<!-- 광견병 예방 미접종 -->
								        		<input type="text" class="form-control" name="memberBirthDate" value="미접종" readonly>	
								        	</c:when>
								        	<c:otherwise>
								        		<%-- 광견병 예방 접종일 ${pet.petVaccine} --%>
								        		<input type="text" class="form-control" name="memberBirthDate" value="${pet.petVaccine}" readonly>	
								        	</c:otherwise>
								        </c:choose>
									</div>
									<div class="form-content">	
										<label for="memberBirthDate" class="form-label">기타 특이사항</label>
										<input type="text" class="form-control" name="memberBirthDate" value="${pet.petOther}" readonly>	
									</div>
									<div class="buttons">
										<%-- <a href="${pageContext.request.contextPath}/member/deleteInfo"><button type="button" class="btn btn-light">탈퇴하기</button></a> --%>
										<input type="submit" class="btn btn-primary" value="수정">
									</div>
									</c:forEach>
								</form>	
							</div>
						</div>
						<!-- myInfo part end -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================ Area end =================-->

</body>
</html>