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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/../vendors/feather/feather.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/../vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/../vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/../css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/../images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="../images/logo.svg" alt="logo">
              </div>
              <h4>관리자 로그인</h4>
              
				<c:if test="${param.error!=null}">
					<span style="color:red">정보를 다시 확인해주세요</span>
				</c:if>
				
              <form class="pt-3" action="${pageContext.request.contextPath}/admin/adminLogin" method="post">
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="exampleInputEmail1" name="id" placeholder="ID">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" name="password" placeholder="Password">
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <div class="mt-3">
                 <%--  <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="${pageContext.request.contextPath}/admin/main">로그인</a> --%>
                	<input type="submit" class="btn btn-primary" value="로그인">
                </div>
                <!-- <div class="my-2 d-flex justify-content-between align-items-center">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" class="form-check-input">
                      Keep me signed in
                    </label>
                  </div>
                  <a href="#" class="auth-link text-black">Forgot password?</a>
                </div> -->
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="${pageContext.request.contextPath}/../vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="${pageContext.request.contextPath}/../js/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath}/../js/hoverable-collapse.js"></script>
  <script src="${pageContext.request.contextPath}/../js/template.js"></script>
  <script src="${pageContext.request.contextPath}/../js/settings.js"></script>
  <script src="${pageContext.request.contextPath}/../js/todolist.js"></script>
  <!-- endinject -->
</body>

</html>
