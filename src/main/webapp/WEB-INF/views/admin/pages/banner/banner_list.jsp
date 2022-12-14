<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">

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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/../../vendors/select2/select2.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/../../vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/../../css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/../../images/favicon.png" />

  <style type="text/css">
    .btn-primary {float: right;}
  </style>

</head>

<body>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="${pageContext.request.contextPath}/admin/main">
        <img src="${pageContext.request.contextPath}/../../images/logo.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="${pageContext.request.contextPath}/admin/main">
        <img src="${pageContext.request.contextPath}/../../images/logo-mini.svg" alt="logo"/></a>
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
            </div>
          </li>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src="${pageContext.request.contextPath}/../../images/admin_pr.jpg" alt="profile"/>
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
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/pages/chart/chart"_list aria-expanded="false" aria-controls="chart">
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
          <div class="row">
            
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">배너관리</h4>
                  <p class="card-description">
                    펫츠고 배너관리 게시판입니다.
                  </p>
                  <div class="template-demo">
                    <a href="${pageContext.request.contextPath}/admin/pages/banner/banner_submit"><button type="button" class="btn btn-primary btn-icon-text"
                    style="margin-top: -1rem !important; margin-bottom: 10px;">
                      <i class="ti-upload btn-icon-prepend"></i>                                                    
                      배너등록
                    </button>
                  </a>
                  </div>
                  
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>
                            배너번호
                          </th>
                          <th>
                            회사명
                          </th>
                          <th>
                            등록일
                          </th>
                          <th>
                            종료일
                          </th>
                          <th>
                            노출상태
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="py-1">
                            <div>1203450</div>
                          </td>
                          <td>
                            <div>삼성화재</div>
                          </td>
                          <td>
                            <div>2022-12-10</div>
                          </td>
                          <td>
                            <div class="">
                              <div>2022-12-31</div>
                            </div>
                          </td>
                          <td>
                            N
                          </td>
                        </tr>

                        <tr>
                          <td class="py-1">
                            <div>1203450</div>
                          </td>
                          <td>
                            <div>CJ제일제당</div>
                          </td>
                          <td>
                            <div>2022-12-10</div>
                          </td>
                          <td>
                            <div class="">
                              <div>2022-12-31</div>
                            </div>
                          </td>
                          <td>
                            N
                          </td>
                        </tr>

                        <tr>
                          <td class="py-1">
                            <div>1203450</div>
                          </td>
                          <td>
                            <div>홈플러스</div>
                          </td>
                          <td>
                            <div>2022-12-10</div>
                          </td>
                          <td>
                            <div class="">
                              <div>2022-12-31</div>
                            </div>
                          </td>
                          <td>
                            F
                          </td>
                        </tr>

                        <tr>
                          <td class="py-1">
                            <div>1203450</div>
                          </td>
                          <td>
                            <div>아이디어스</div>
                          </td>
                          <td>
                            <div>2022-12-10</div>
                          </td>
                          <td>
                            <div class="">
                              <div>2022-12-31</div>
                            </div>
                          </td>
                          <td>
                            N
                          </td>
                        </tr>

                      </tbody>
                    </table>
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
</body>

</html>
