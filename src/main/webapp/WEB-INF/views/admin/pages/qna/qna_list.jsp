<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
  <!-- qna_list CSS -->
  <link href="${pageContext.request.contextPath}/css/minjeong/qna_list.css" rel="stylesheet">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/../../css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/../../images/favicon.png" />
  
  <style type="text/css">
   .pagination-container {
		text-align: center;
		margin: 10px 680px;
	}
	
	.pagination {
		position: relative;
	} 

	.pagination a {
		position: relative;
		display: inline-block;
		text-decoration: none;
		padding: 8px 16px 10px;
	}
	.pagination-newer {
		margin-right: 50px;
	}

	.pagination-older {
		margin-left: 50px;
	} 
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
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">문의답변</h4>
                  <p class="card-description">
                    회원 문의 답변게시판입니다.
                  </p>
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>
                            회원번호
                          </th>
                          <th>
                            문의 내용
                          </th>
                          <th>
                            문의등록일
                          </th>
                          <th>
                            상태
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:choose>
							<c:when test="${empty requestScope.pageList}">
								<b>작성된 문의가 없습니다.</b>
							</c:when>
							<c:otherwise>	
								<c:forEach items="${requestScope.pageList.content}" var="qna">
									<tr>
			                          <td class="py-1">
			                            <div>${qna.member.memberNo}</div>
			                          </td>
			                          <td>
			                            <div>
			                            	${qna.qnaContent}
			                            </div>
			                          </td>
			                          <td>
			                            <div class="qnadate">
			                              <div>
			                              	<fmt:parseDate value="${qna.qnaDate}" pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
			                              	<fmt:formatDate value="${parsedDateTime}" pattern="yyyy-MM-dd"/>
			                              </div>
			                            </div>
			                          </td>
			                          <td>
			                           <!--  답변상태 -->
			                            <c:choose>
			                            	<c:when test="${qna.qnaReContent == null}">
			                            		<!-- Button trigger modal -->
												<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal${qna.qnaNo}">
												  답변 대기
												</button>
												<!-- Modal -->
												<div class="modal fade" id="exampleModal${qna.qnaNo}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
												    <div class="modal-content">
												      <div class="modal-header">
												        <h3 class="modal-title fs-5" id="exampleModalLabel">문의답변 등록</h3>
												      </div>
												      <form name="replyForm" method="post" id="replyForm" action="${pageContext.request.contextPath}/admin/pages/qna/replyInsert">
													      <div class="modal-body">
													      	<b>문의 내용</b> <p>
													        ${qna.qnaContent} <br><br><br>
																<input type="hidden" name="qnaNo" value="${qna.qnaNo}" />
																<textarea class="form-control w-100" id="qnaReContent" cols="30" rows="9" 
																	placeholder="답변 내용을 작성해주세요." name="qnaReContent" value="${qna.qnaReContent}" >
																</textarea>   
													      </div>
													      <div class="modal-footer">
													      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
													        <button type="button" class="btn btn-primary"><input type="submit" value="답변 등록"></button>
													      </div>
												      </form>
												    </div>
												  </div>
												</div>
			                            	</c:when>
			                            	<c:otherwise>
			                            		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${qna.qnaNo}">
												  답변 완료
												</button>
												<!-- Modal -->
												<div class="modal fade" id="exampleModal${qna.qnaNo}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
												    <div class="modal-content">
												      <div class="modal-header">
												        <h3 class="modal-title fs-5" id="exampleModalLabel">문의답변 삭제</h3>
												      </div>
												      <form name="replyForm" method="post" id="replyForm" action="${pageContext.request.contextPath}/admin/pages/qna/replyDelete">
													      <div class="modal-body">
													      	<b>문의 내용</b> <p>
													        ${qna.qnaContent} <br><br><br>
																<input type="hidden" name="qnaNo" value="${qna.qnaNo}" />
															<b>문의답변 내용</b> <p>
															${qna.qnaReContent} <br><br><br>
													      </div>
													      <div class="modal-footer">
													      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
													        <button type="button" class="btn btn-danger"><input type="submit" value="답변 삭제"></button>
													      </div>
												      </form>
												    </div>
												  </div>
												</div>
			                            	</c:otherwise>
			                            </c:choose>			                            
			                          </td>
			                        </tr>
								</c:forEach> 
							</c:otherwise>
						</c:choose>
                      </tbody>
                    </table>
                  </div>
                  
                  <!-- 페이징 처리 start -->
	            <div style="text-align: center">
				<!--  블럭당  -->
				 <nav class="pagination-container">
					<div class="pagination">
					<c:set var="doneLoop" value="false"/>
						 <c:if test="${(startPage-blockCount) > 0}">
						      <a class="pagination-newer" href="${pageContext.request.contextPath}/admin/pages/qna/qna_list?nowPage=${startPage-1}">PREV</a>
						  </c:if>
						<span class="pagination-inner"> 
						  <c:forEach var='i' begin='${startPage}' end='${(startPage-1) + blockCount}'> 
							    <c:if test="${(i-1)>=pageList.getTotalPages()}">
							       <c:set var="doneLoop" value="true"/>
							    </c:if> 
						  <c:if test="${not doneLoop}" >
						         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/admin/pages/qna/qna_list?nowPage=${i}">${i}</a> 
						  </c:if>
						</c:forEach>
						</span> 
						<c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
						     <a class="pagination-older" href="${pageContext.request.contextPath}/admin/pages/qna/qna_list?nowPage=${startPage+blockCount}">NEXT</a>
						 </c:if>
						</div>
					</nav>  
				</div>
				<!-- 페이징 처리 end -->
                  
                  
                  
                  
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
  
  <!-- Bootstrap -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <!-- qna_list js -->
  <script src="${pageContext.request.contextPath}/js/minjeong/qna_list.js"></script>
  
  <!-- endinject -->
  <!-- Custom js for this page-->
  <!-- End custom js for this page-->
</body>

</html>
