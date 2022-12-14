<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication var="secCamp" property="principal" />

<!DOCTYPE html>
<html lang="kr">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>PetsGo Owner</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/feather/feather.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" />
  
  
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
  <script type="text/javascript">
		$(function(){
			
			$("#resiUpdateBtn").click(function(){
				$(location).attr('href','${pageContext.request.contextPath}/owner/resi/resiUpdateForm/${resi.resiNo}');
			})
			
			
			$("#resiSelectBtn").click(function(){
				$(location).attr('href','${pageContext.request.contextPath}/owner/resi/resiSelect/${secCamp.campNo}');
			})
		})
   </script>
   
</head>

<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="${pageContext.request.contextPath}/owner/campHome"><img src="${pageContext.request.contextPath}/images/logo_owner.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="${pageContext.request.contextPath}/owner/campHome"><img src="${pageContext.request.contextPath}/images/logo-mini.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown">
            <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
              <i class="icon-bell mx-0"></i>
              <span class="count"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
              <a class="dropdown-item preview-item" href="${pageContext.request.contextPath}/owner/review/campReview">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-info">
                    <i class="ti-user mx-0"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject font-weight-normal">Review</h6>
                </div>
              </a>
            </div>
          </li>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src="${pageContext.request.contextPath}/images/admin_pr.jpg" alt="profile"/>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">
                <i class="ti-power-off text-primary"></i>
                Logout
              </a>
            </div>
          </li>
        </ul>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_settings-panel.html -->
      <div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close ti-close"></i>
          <p class="settings-heading">SIDEBAR SKINS</p>
          <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div>Light</div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div>Dark</div>
          <p class="settings-heading mt-2">HEADER SKINS</p>
          <div class="color-tiles mx-0 px-4">
            <div class="tiles success"></div>
            <div class="tiles warning"></div>
            <div class="tiles danger"></div>
            <div class="tiles info"></div>
            <div class="tiles dark"></div>
            <div class="tiles default"></div>
          </div>
        </div>
      </div>
      
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/owner/campHome">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">캠핑장 홈</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">캠핑장 관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/owner/camp/campSelect">캠핑장 조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/owner/resi/resiSelect/${secCamp.campNo}">숙소 목록 조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/owner/resi/resiInsertForm">숙소 등록</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">예약 관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/owner/reserv/reservCheck/${secCamp.campNo}">예약 신청 관리</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/owner/reserv/reservChart">예약 통계</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">후기</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/owner/review/campReview/${secCamp.campNo}">후기 조회</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">사업자 페이지</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/owner/info/campInfo">정보 조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </nav>
      <!-- partial -->
      
      
      <div class="main-panel">        
        <div class="content-wrapper">
          <div class="row">
            <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">예약 상세 정보</h4>
                  <p class="card-description">
                    
                  </p>
                  <%-- <form class="forms-sample" id="campInsertForm" name="campInsert" method="post" action="${pageContext.request.contextPath}/owner/campInsert" 
        				onSubmit='return checkValid()' enctype="multipart/form-data"> --%>
        				
                    <div class="form-group">
                      <label for="exampleInputName1">예약번호</label>
                      <p class="form-control" id="exampleInputName1" name="resiName">${reserv.reservNo}</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">회원이름</label>
                      <p class="form-control" id="memberNo" name="memberNo">${reserv.member.memberNickname}</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">숙소번호(숙소이름)</label>
                      <p class="form-control" id="resiNo" name="resiNo">${reserv.residence.resiName}</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">투숙객 이름</label>
                      <p class="form-control" id="reservName" name="reservName">${reserv.reservName}</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">투숙객 전화번호</label>
                      <p class="form-control" id="reservPhone" name="reservPhone">${reserv.reservPhone}</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">예약 총 인원</label>
                      <p class="form-control" id="reservPeople" name="reservPeople">${reserv.reservPeople} 명</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleTextarea1">예약일</label>
                      <p class="form-control" id="reservDate" name="reservDate">
                      	<fmt:parseDate value="${reserv.reservDate}" pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
                      	<fmt:formatDate value="${parsedDateTime}" pattern="yyyy-MM-dd"/>
                      </p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">체크인 날짜</label>
                      <p class="form-control" id="reservCheckin" name="reservCheckin">${reserv.reservCheckin}</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">체크아웃 날짜</label>
                      <p class="form-control" id="reservCheckout" name="reservCheckout">${reserv.reservCheckout}</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">반려견 총 마리수</label>
                      <p class="form-control" id="reservTotalPet" name="reservTotalPet">${reserv.reservTotalPet}</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">손해배상 보험 총금액</label>
                      <p class="form-control" id="reservInsuranceTotal" name="reservInsuranceTotal"><fmt:formatNumber value="${reserv.reservInsuranceTotal}" pattern="###,### 원"/></p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">결제수단</label>
                      <p class="form-control" id="reservType" name="reservType">${reserv.reservType}</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">결제금액</label>
                      <p class="form-control" id="reservPrice" name="reservPrice"><fmt:formatNumber value="${reserv.reservPrice}" pattern="###,### 원"/></p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">예약상태</label>
                      	<c:choose>
                          	<c:when test="${reserv.reservState == 0}">
                      			<p class="form-control" id="reservState" name="reservState">예약대기</p>
	                      	</c:when>
	                      	<c:when test="${reserv.reservState == 1}">
	                      		<p class="form-control" id="reservState" name="reservState">예약확정</p>
	                      	</c:when>
	                      	<c:when test="${reserv.reservState == 3}">
	                      		<p class="form-control" id="reservState" name="reservState">예약취소</p>
	                      	</c:when>
	                      	<c:when test="${reserv.reservState == 4}">
	                      		<p class="form-control" id="reservState" name="reservState">결제취소요청</p>
	                      	</c:when>
                      </c:choose>
                    </div>
                    <div class="btn-group">
                      <c:choose>
                          	<c:when test="${reserv.reservState == 0}">
                      			<button type="button" class="btn btn-primary" name="stateBtn">예약대기</button>
	                      	</c:when>
	                      	<c:when test="${reserv.reservState == 1}">
	                      		<button type="button" class="btn btn-primary" name="stateBtn">예약확정</button>
	                      	</c:when>
	                      	<c:when test="${reserv.reservState == 3}">
	                      		<button type="button" class="btn btn-primary" name="stateBtn">예약취소</button>
	                      	</c:when>
	                      	<c:when test="${reserv.reservState == 4}">
	                      		<button type="button" class="btn btn-primary" name="stateBtn">결제취소요청</button>
	                      	</c:when>
                      </c:choose>
                    <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" id="dropdownMenuSplitButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="sr-only"></span>
                      </button>
                      <div class="dropdown-menu" aria-labelledby="dropdownMenuSplitButton1">
                      	<h6 class="dropdown-header" style="font-weight: bold">상태변경</h6>
                        <a class="dropdown-item" href="#"></a>
                        <a class="dropdown-item" href="#">예약대기</a>
                        <a class="dropdown-item" href="#">예약확정</a>
                        <a class="dropdown-item" href="#">결제취소요청</a>
                        <a class="dropdown-item" href="#">예약취소</a>
                      </div>
                    </div>
                    <button type="button" class="btn btn-light" id="reservListBtn">목록보기</button>
                  <!-- </form> -->
                </div>
              </div>
            </div>
            
            
            
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2021.  Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash. All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="ti-heart text-danger ml-1"></i></span>
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="${pageContext.request.contextPath}/../../vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="${pageContext.request.contextPath}/../../vendors/typeahead.js/typeahead.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/../../vendors/select2/select2.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="${pageContext.request.contextPath}/../../js/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath}/../../js/hoverable-collapse.js"></script>
  <script src="${pageContext.request.contextPath}/../../js/template.js"></script>
  <script src="${pageContext.request.contextPath}/../../js/settings.js"></script>
  <script src="${pageContext.request.contextPath}/../../js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${pageContext.request.contextPath}/../../js/file-upload.js"></script>
  <script src="${pageContext.request.contextPath}/../../js/typeahead.js"></script>
  <script src="${pageContext.request.contextPath}/../../js/select2.js"></script>
  <!-- End custom js for this page-->
  
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
  <script type="text/javascript">
  	$(function(){
  		$(".dropdown-item").click(function(){
  			let reservStateStr = $(this).text();
  			let reservState = 0;
  			
  			if(reservStateStr == "예약대기"){
  				reservState = 0;
  			}else if(reservStateStr == "예약확정"){
  				reservState = 1;
  			}else if(reservStateStr == "예약취소"){
  				reservState = 3;
  			}else if(reservStateStr == "결제취소요청"){
  				reservState = 4;
  			}else if(reservStateStr == "전체"){
  				reservState = 5;
  			}
  			
  			
  			if(confirm("예약 상태를 "+ reservStateStr + "(으)로 변경하시겠습니까?")){
  				$.ajax({
  					type:"post",
  					url:"${pageContext.request.contextPath}/owner/reserv/reservStateUpdate",
  					dataType: "text",  //서버가 응답(보내 온)한 데이터 타입(text | html | xml | json)
					data:"${_csrf.parameterName}=${_csrf.token}&reservState=" + reservState + "&reservNo="+${reserv.reservNo}, //서버에게 보낼 parameter 정보
					success:function(data) {
						
						$("button[name=stateBtn]").html(reservStateStr);	
						$("#reservState").html(reservStateStr);
					}
  				});
  				
  			}else{
  				return false;
  			}
  		})
  		
  		
  		$("#reservListBtn").click(function(){
  			$(location).attr("href","${pageContext.request.contextPath}/owner/reserv/reservCheck/${secCamp.campNo}");
  		})
  	})
  </script>
  
</body>

</html>
