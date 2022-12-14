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
        <a class="navbar-brand brand-logo mr-5" href="${pageContext.request.contextPath}/admin/pages/camp/campcheck"><img src="${pageContext.request.contextPath}/../../images/logo.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="${pageContext.request.contextPath}/admin/pages/camp/campcheck"><img src="${pageContext.request.contextPath}/../../images/logo-mini.svg" alt="logo"/></a>
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
           <li class="nav-item" style="display: none;">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/campcheck">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">???</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/pages/camp/campcheck" aria-expanded="false" aria-controls="camp">
              <i class="icon-paper menu-icon"></i>
              <span class="menu-title">????????? ?????? ??????</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/pages/qna/qna_list" aria-expanded="false" aria-controls="qna">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">????????????</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/pages/chart/chart_list" aria-expanded="false" aria-controls="chart">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">????????????</span>
            </a>
          </li>
          <li class="nav-item" style="display: none;">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/pages/banner/banner_list" aria-expanded="false" aria-controls="banner">
              <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">????????????</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/pages/user/user_list" aria-expanded="false" aria-controls="user">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">????????????</span>
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
                  <h4 class="card-title">????????? ?????? ??????</h4>
                  <p class="card-description">
                    <div class="dropdown">
                      <button class="btn btn-danger btn-sm dropdown-toggle" type="button" id="campStateArr" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ??????
                      </button>
                      <div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton3">
                        <h6 class="dropdown-header" style="font-weight: bold">??????</h6>
                        <a class="dropdown-item" href="#">??????</a>
                        <a class="dropdown-item" href="#">??????????????????</a>
                        <a class="dropdown-item" href="#">??????</a>
                        <a class="dropdown-item" href="#">??????????????????</a>
                        <a class="dropdown-item" href="#">??????</a>
                      </div>
                    </div>
                  </p>
                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>????????? ??????</th>
                          <th>?????????</th>
                          <th>??????</th>
                          <th>????????????</th>
                        </tr>
                      </thead>
                      <tbody id="ajaxPart">
                      	<c:forEach items="${campList}" var="camp">
                        <tr>
                          <td>${camp.campRegNo}</td>
                          <td>${camp.campName}</td>
                          <td class="text-success"><a href="${pageContext.request.contextPath}/admin/camp/campcheckPage/${camp.campNo}">????????? ??????</a><i class="ti-arrow-up"></i></td>
                          <c:choose>
                          	<c:when test="${camp.campState == 0}">
                      			<td><label class="badge badge-success" >??????????????????</label></td>
	                      	</c:when>
	                      	<c:when test="${camp.campState == 1}">
	                      		<td><label class="badge badge-info">??????</label></td>
	                      	</c:when>
	                      	<c:when test="${camp.campState == 2}">
	                      		<td><label class="badge badge-danger">??????????????????</label></td>
	                      	</c:when>
	                      	<c:when test="${camp.campState == 3}">
	                      		<td><label class="badge badge-wait">??????</label></td>
	                      	</c:when>
                          </c:choose>
                          </tr>
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
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright ??2022 All rights reserved.</span>
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
  			let style = "";
  			
  			if(campStateStr == "??????????????????"){
  				campState = 0;
  			}else if(campStateStr == "??????"){
  				campState = 1;
  			}else if(campStateStr == "??????????????????"){
  				campState = 2;
  			}else if(campStateStr == "??????"){
  				campState = 3;
  			}else if(campStateStr == "??????"){
  				campState = 4;
  			}
  			
  		
  			$.ajax({
  				type:"post",
  				url:"${pageContext.request.contextPath}/admin/camp/campcheck",
  				dataType: "json",  //????????? ??????(?????? ???)??? ????????? ??????(text | html | xml | json)
				data:"${_csrf.parameterName}=${_csrf.token}&campState="+campState, //???????????? ?????? parameter ?????? 
				//data:"${_csrf.parameterName}=${_csrf.token}&email=" + email,	
				success:function(data) {
					$("#campStateArr").html(campStateStr);	
					$("#ajaxPart").empty();
					let str = "";
					
					$.each(data, function(index, item){ 
						
						let state = "";
						let style = "";
						
						if(item.campState == 0) {
							state = "??????????????????";
							style = "badge badge-success";
						}
						else if(item.campState == 1) {
							state = "??????";
							style = "badge badge-info";
						}
						else if(item.campState == 2) {
							state = "??????????????????";
							style = "badge badge-danger";
						}
						else if(item.campState == 4) {
							state = "??????";
							style = "badge badge-wait";
						}
						else if(item.campState == 5) {
							state = "??????";
						}
						
						
						/* str += '<tr onclick=location.href="${pageContext.request.contextPath}/owner/reserv/reservDetail/' + item.reservNo + '" style="cursor:pointer;">';
						str += '<td><p>' + item.reservNo + '</p></td><td><p>' + data.memberList[index] + '</p></td><td><p>' + item.reservDate + '</p></td>';
						str += '<td><p>'+ item.reservPrice + '</p></td><td><label class="' + style + '">' + state + '</label></td></tr>'; */
            			
						
						str += '<tr><td>' + item.campRegNo + '</td><td>' + item.campName + '</td><td class="text-success">';
						str += '<a href="${pageContext.request.contextPath}/admin/camp/campcheckPage/' + item.campNo + '">????????? ??????</a><i class="ti-arrow-up"></i></td>';
						str += '<td><label class="' + style + '">' + state + '</label></td></tr>';
                        
					}); 
					
					$("#ajaxPart").append(str);
					
					/* $.each(data.campList , function(index, item){ //item??? camp
						alert(item.campNo  + " , campEmail = " + item.campEmail);
					      $.each(data.residenceList , function(i, residence ){
					    	   //alert(i+" = resiName = " + residence.resiName)
					    	   $.each(residence , function(a , re){
					    		   alert("?????? ? "+re.resiName)
					    	   })
					      } )
					}); */
				}
  			});
  		});
  	})
  </script>
</body>

</html>






