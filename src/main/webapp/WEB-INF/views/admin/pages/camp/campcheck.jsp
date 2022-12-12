<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>PetsGo Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/../../vendors/feather/feather.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/../../vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/../../vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/../../css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/../../images/favicon.png" />

  <style type="text/css">
    .col-lg-6 {max-width: 100%;}
    .badge {margin-right: 5px;}
    .badge-wait{background-color: #666; color: #fff; padding-right: 10px;}
  </style>

</head>

<body>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="${pageContext.request.contextPath}/admin/main"><img src="${pageContext.request.contextPath}/../../images/logo.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="${pageContext.request.contextPath}/admin/main"><img src="${pageContext.request.contextPath}/../../images/logo-mini.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown">
            <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
              <i class="icon-bell mx-0"></i>
              <span class="count"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src="${pageContext.request.contextPath}/../../images/admin_pr.jpg" alt="profile"/>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item">
                <i class="ti-power-off text-primary"></i>
                Logout
              </a>
            </div>
          </li>
        </ul>
      </div>
    </nav>
    <!-- top_partial -->
    <div class="container-fluid page-body-wrapper">
      <div id="right-sidebar" class="settings-panel">
        <i class="settings-close ti-close"></i>
        <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="todo-tab" data-toggle="tab" href="#todo-section" role="tab" aria-controls="todo-section" aria-expanded="true">TO DO LIST</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="chats-tab" data-toggle="tab" href="#chats-section" role="tab" aria-controls="chats-section">CHATS</a>
          </li>
        </ul>
        <div class="tab-content" id="setting-content">
          <div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
            <div class="add-items d-flex px-3 mb-0">
              <form class="form w-100">
                <div class="form-group d-flex">
                  <input type="text" class="form-control todo-list-input" placeholder="Add To-do">
                  <button type="submit" class="add btn btn-primary todo-list-add-btn" id="add-task">Add</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- top_partialEnd -->
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
           <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/main">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">홈</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/pages/camp/campcheck" aria-expanded="false" aria-controls="camp">
              <i class="icon-paper menu-icon"></i>
              <span class="menu-title">캠핑장 등록 승인</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/pages/qna/qna_list" aria-expanded="false" aria-controls="qna">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">문의답변</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/pages/chart/chart_list" aria-expanded="false" aria-controls="chart">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">수익통계</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/pages/banner/banner_list" aria-expanded="false" aria-controls="banner">
              <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">배너관리</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/pages/user/user_list" aria-expanded="false" aria-controls="user">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">회원관리</span>
            </a>
          </li>
        </ul>
      </nav>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
            <div class="col-lg-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">캠핑장 등록 승인</h4>
                  <p class="card-description">
                    <div class="dropdown">
                      <button class="btn btn-danger btn-sm dropdown-toggle" type="button" id="campStateArr" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        전체
                      </button>
                      <div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton3">
                        <h6 class="dropdown-header" style="font-weight: bold">정렬</h6>
                        <a class="dropdown-item" href="#">전체</a>
                        <a class="dropdown-item" href="#">등록승인대기</a>
                        <a class="dropdown-item" href="#">승인</a>
                        <a class="dropdown-item" href="#">종료승인대기</a>
                        <a class="dropdown-item" href="#">종료</a>
                      </div>
                    </div>
                  </p>
                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>사업자 번호</th>
                          <th>캠핑장</th>
                          <th>정보</th>
                          <th>승인상태</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<c:forEach items="${campList}" var="camp">
                        <tr>
                          <td>${camp.campRegNo}</td>
                          <td>${camp.campName}</td>
                          <td class="text-success"><a href="${pageContext.request.contextPath}/admin/camp/campcheckPage/${camp.campNo}">캠핑장 정보</a><i class="ti-arrow-up"></i></td>
                          <c:choose>
                          	<c:when test="${camp.campState == 0}">
                      			<td><label class="badge badge-info" >등록승인대기</label></td>
	                      	</c:when>
	                      	<c:when test="${camp.campState == 1}">
	                      		<td><label class="badge badge-success">승인</label></td>
	                      	</c:when>
	                      	<c:when test="${camp.campState == 2}">
	                      		<td><label class="badge badge-danger">종료승인대기</label></td>
	                      	</c:when>
	                      	<c:when test="${camp.campState == 3}">
	                      		<td><label class="badge badge-wait">종료</label></td>
	                      	</c:when>
                          </c:choose>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright ©2022 All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Made with by Pet's Go Admin <i class="ti-heart text-danger ml-1"></i></span>
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
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="${pageContext.request.contextPath}/../../js/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath}/../../js/hoverable-collapse.js"></script>
  <script src="${pageContext.request.contextPath}/../../js/template.js"></script>
  <script src="${pageContext.request.contextPath}/../../js/settings.js"></script>
  <script src="${pageContext.request.contextPath}/../../js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <!-- End custom js for this page-->
  
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
  <script type="text/javascript">
  	$(function(){
  		$(".dropdown-item").click(function(){
  			let campStateStr = $(this).text();
  			let campState = 0;
  			
  			if(campStateStr == "등록승인대기"){
  				campState = 0;
  			}else if(campStateStr == "승인"){
  				campState = 1;
  			}else if(campStateStr == "종료승인대기"){
  				campState = 2;
  			}else if(campStateStr == "종료"){
  				campState = 3;
  			}else if(campStateStr == "전체"){
  				campState = 4;
  			}
  			
  		
  			$.ajax({
  				type:"post",
  				url:"${pageContext.request.contextPath}/admin/camp/campcheck",
  				dataType: "json",  //서버가 응답(보내 온)한 데이터 타입(text | html | xml | json)
				data:"${_csrf.parameterName}=${_csrf.token}&campState="+campState, //서버에게 보낼 parameter 정보 
				//data:"${_csrf.parameterName}=${_csrf.token}&email=" + email,	
				success:function(data) {	
					alert(data.campList)
					//$("#campStateArr").html(campStateStr);	
					
					$.each(data.campList , function(index, item){ //item은 camp
						alert(item.campNo  + " , campEmail = " + item.campEmail);
					      $.each(data.residenceList , function(i, residence ){
					    	   //alert(i+" = resiName = " + residence.resiName)
					    	   $.each(residence , function(a , re){
					    		   alert("되니 ? "+re.resiName)
					    	   })
					      } )
					});
				}
  			});
  		});
  	})
  </script>
</body>

</html>






