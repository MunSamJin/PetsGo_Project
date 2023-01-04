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
  <link rel="icon" href="data:,">
  
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
  <script type="text/javascript">
		$(function(){
			
		})
   </script>
   
</head>

<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="${pageContext.request.contextPath}/owner/reserv/reservCheck/${secCamp.campNo}"><img src="${pageContext.request.contextPath}/images/logo_owner.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="${pageContext.request.contextPath}/owner/reserv/reservCheck/${secCamp.campNo}"><img src="${pageContext.request.contextPath}/images/logo-mini.svg" alt="logo"/></a>
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
              <a class="dropdown-item preview-item" href="${pageContext.request.contextPath}/owner/review/campReview/${secCamp.campNo}">
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
          <li class="nav-item" style="display: none;">
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
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/owner/reserv/reservChart/${secCamp.campNo}">예약 통계</a></li>
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
                  <h4 class="card-title">사업자 정보</h4>
                  <p class="card-description">
                  	정보를 수정하세요
                  </p>
                  <form class="forms-sample" method="post" action="${pageContext.request.contextPath}/owner/info/campInfoUpdate">
                  	<input type="hidden" name="campNo" value="${secCamp.campNo}">
        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <div class="form-group">
                      <label for="exampleInputUsername1">캠핑장</label>
                      <p class="form-control" id="campName">${secCamp.campName}</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">이메일(Email)</label>
                      <input type="email" class="form-control" id="campEmail" name="campEmail" placeholder="Email"  value="${secCamp.campEmail}">
                      <span id="emailValid"></span>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">연락처</label>
                      <input type="text" class="form-control" id="campPhone" name="campPhone" placeholder="Phone Number" oninput="autoHyphen2(this)" maxlength="13" placeholder="'-'없이 숫자만 입력해 주세요" value="${secCamp.campPhone}">
                      <script>
						const autoHyphen2 = (target) => {
							target.value = target.value
							.replace(/[^0-9]/g, '')
							.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
						}
					  </script>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">비밀번호 확인</label>
                      <input type="password" class="form-control" id="campPwdCheck" placeholder="Password">
                      <span id="campPwdCheckValid"></span>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">재설정 비밀번호</label>
                      <input type="password" class="form-control" id="campPassword" name="campPassword" placeholder="Password" value="${secCamp.campPassword}">
                      <span id="passwordValid"></span>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputConfirmPassword1">재설정 비밀번호 일치 확인</label>
                      <input type="password" class="form-control" id="campPasswordCheck" placeholder="Password">
                      <span id="passwordEqual"></span>
                    </div>
                    <div class="form-check form-check-flat form-check-primary">
                      <p class="card-description">
                        비밀번호 변경을 원하지 않으시면 '재설정 비밀번호' 입력칸을 그대로 두세요
                      </p>
                    </div>
                    <button type="button" class="btn btn-primary mr-2" id="infoUpdateBtn">수정</button>
                    <button class="btn btn-light" id="updateCancleBtn">취소</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2021.  Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap owner template</a> from BootstrapDash. All rights reserved.</span>
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
  
  <!-- modal js -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
  <script type="text/javascript">
  	$(function(){
  		$("#updateCancleBtn").click(function(){
	  		$(location).attr('href','${pageContext.request.contextPath}/owner/info/campInfo');
	  	});
	  
	  
		//이메일 유효성 체크
		$("#campEmail").change(function(){
			checkEmail($("#campEmail").val());
		});	
		
		function checkEmail(email){
			let expectEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			/* if($("#campEmail").val().equals("")){
				$("#emailValid").html("");
			}
			else  */if(!(expectEmail.test(email))){            
		        $("#emailValid").html("이메일 형식을 확인해 주세요").css("color","red");
		        $("#campEmail").focus();
		        //emailCheckRs = "";
		        return false;
		    }
		    
		    $("#emailValid").html("");
		    return true;
		}
		
		
		//비밀번호 유효성 체크
		$("#campPassword").change(function(){
			checkPassword($("#campPassword").val());
		});			
		
		function checkPassword(password){			    
			if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
		        $("#passwordValid").html("숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.").css("color","red");
		        $("#campPassword").focus();
		        return false;
		    }    
		    
		    let checkNumber = password.search(/[0-9]/g);
		    let checkEnglish = password.search(/[a-z]/ig);
		    
		    if(checkNumber < 0 || checkEnglish < 0){
		        $("#passwordValid").html("숫자와 영문자를 혼용하여야 합니다.").css("color","red");
		        $("#campPassword").focus();
		        return false;
		    }
		    
		    if(/(\w)\1\1\1/.test(password)){
		        $("#passwordValid").html("같은 문자를 4번 이상 사용하실 수 없습니다.").css("color","red");
		        $("#campPassword").focus();
		        return false;
		    }
		    
		    $("#passwordValid").html("");
		    return true;
		}
		
		//////////////////////////////////////////
		//비밀번호와 비밀번호 확인 일치 체크
		$("#campPasswordCheck").change(function(){
			let password = $("#campPassword").val();
			let passwordCheck = $("#campPasswordCheck").val();
			
			if(passwordCheck != password) {
				$("#passwordEqual").html("비밀번호가 일치하지 않습니다.").css("color","red");
				$("#campPasswordCheck").focus();
				$("#passwordEqual").html("");
	        	return false;
			} else {
				$("#passwordEqual").html("");
			    return true;
			}
		});
		
		
		//비밀번호 확인
		/* $("#infoUpdateBtn").click(function(){
			let password = $("#campPwdCheck").val();

			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/owner/passwordCheck",
				data:"${_csrf.parameterName}=${_csrf.token}&password="+password+"&campNo=${secCamp.campNo}",
				success:function(result){						
					if(result=="fail"){
						alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
						$("#campPwdCheck").val("");
						$("#campPwdCheck").focus();
						return false;
					} else{
						alert("수정 되었습니다");
						location.href = "${pageContext.request.contextPath}/owner/info/campInfo";
					}		
				},
				error:function(err){
					alert(err+" 에러가 발생했습니다");
				}
			});

		});//keyup  */
		
		
  	})
  </script>
 
</body>

</html>
