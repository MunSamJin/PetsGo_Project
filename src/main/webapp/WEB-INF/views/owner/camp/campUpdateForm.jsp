<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


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
</head>

<body>
  <sec:authentication var="secCamp" property="principal" />
  
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
                  <h4 class="card-title">캠핑장 정보 수정</h4>
                  <p class="card-description">
                    
                  </p>
                  <form class="forms-sample" name="campUpdate" method="post" action="${pageContext.request.contextPath}/owner/campUpdate" 
        				onSubmit='return checkValid()' enctype="multipart/form-data">
        			<input type="hidden" name="campNo" value="${secCamp.campNo}">
        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        			
                    <div class="form-group">
                      <label for="exampleInputName1">* 캠핑장 이름</label>
                      <input type="text" class="form-control" id="campName" name="campName" value="${secCamp.campName}">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail3">* Email(이메일)</label>
                      <input type="email" class="form-control" id="campEmail" name="campEmail" value="${secCamp.campEmail}">
                      <span id="emailValid"></span>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword4">* 비밀번호</label>
                      <input type="password" class="form-control" id="campPassword" name="campPassword" value="${secCamp.campPassword}">
                      <span id="passwordValid"></span>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword4">비밀번호 확인</label>
                      <input type="password" class="form-control" id="campPasswordCheck">
                      <span id="passwordEqual"></span>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">* 연락처</label>
                      <input type="text" class="form-control" id="campPhone" name="campPhone" oninput="autoHyphen2(this)" maxlength="13" placeholder="'-'없이 숫자만 입력해 주세요" value="${secCamp.campPhone}">
                      <script>
						const autoHyphen2 = (target) => {
							target.value = target.value
							.replace(/[^0-9]/g, '')
							.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
						}
					  </script>
                    </div>
                    
                    <!-- <div class="form-group">
                      <label for="exampleSelectGender">Gender</label>
                        <select class="form-control" id="exampleSelectGender">
                          <option>Male</option>
                          <option>Female</option>
                        </select>
                    </div> -->
                    <div class="form-group">
                      <label>* 파일 업로드</label>
                      
                      <c:set value="${fn:split(secCamp.campFilename , ',')}" var="filenameArr"/>
                      	<p>
                  		<c:forEach items="${filenameArr}" var="filename">
                  			<img class="news-item-preview" name="campFilename" style="width:150px; height:120px;" src="/img/seryun/${filename}">
                  		</c:forEach>
                  		</p>
                  		
                      <input type="file"  id="btnAtt" name="files" multiple="multiple" class="file-upload-default">
                      <div class="input-group col-xs-12">
                        <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">
                        <span class="input-group-append">
                          <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                        </span>
                      </div>
                      <span id='att_zone' data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></span>
                    </div>
                    
                    <div class="form-group">
                      <label for="exampleInputCity1">* 우편번호</label>
                      <p><input type="text" class="form-control" id="sample6_postcode" name="campPost" value="${secCamp.campPost}"></p>
					  <p><input type="button" class="btn btn-primary mr-2" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">* 주소</label>
                      <p><input type="text" class="form-control" id="sample6_address" name="campAddr" value="${secCamp.campAddr}"></p>
                      <p><input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소 : 입력하지 않아도 됩니다"></p>
					  <p><input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목"></p>
                    </div>
                    <div class="form-group">
                      <label for="exampleTextarea1">* 공지사항</label>
                      <textarea class="form-control" id="campNotify" rows="4" name="campNotify" style="white-space: pre-line;">${secCamp.campNotify}</textarea>
                    </div>
                    <div class="form-group">
                      <label for="exampleTextarea1">소개글</label>
                      <textarea class="form-control" id="campIntro" rows="4" name="campIntro" style="white-space: pre-line;">${secCamp.campIntro}</textarea>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">* 부대시설</label>
                      <input type="text" class="form-control" id="campFacility" name="campFacility" value="${secCamp.campFacility}" placeholder="여러개 작성시 꼭 ',' 콤마로 구분해주세요">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">* 체크인 시간</label>
                      <input type="text" class="form-control" id="campCheckin" name="campCheckin" value="${secCamp.campCheckin}" placeholder="24시간 단위로 작성해주세요(24:00)">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">* 체크아웃 시간</label>
                      <input type="text" class="form-control" id="campCheckout" name="campCheckout" value="${secCamp.campCheckout}" placeholder="24시간 단위로 작성해주세요(24:00)">
                    </div>
                    <button type="submit" class="btn btn-primary mr-2" id="campUpdate" name="campUpdate">수정</button>
                    <button class="btn btn-light" id="updateCancelBtn">취소</button>
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
  <script>     
      $(function(){
    	  	$("#updateCancelBtn").click(function(){
    	  		$(location).attr('href','${pageContext.request.contextPath}/owner/camp/campSelect');
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
					$("#passwordCheck").focus();
		        	return false;
				} else {
					$("#passwordEqual").html("");
				    return true;
				}
			});
			
			
			//사업자 등록 번호 중복 체크			
			$("#campRegNo").keyup(function(){
				let campRegNo = $(this).val().trim();

			    $.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/owner/campRegNoCheck",	
					dataType: "text",  //서버가 응답(보내 온)한 데이터 타입(text | html | xml | json)
					data: "campRegNo=" + campRegNo, //서버에게 보낼 parameter 정보 
					//data:"${_csrf.parameterName}=${_csrf.token}&email=" + email,	
					success:function(data) {						
						if(data == "fail") {
							$("#campRegNoCheck").html("이미 등록된 사업자 번호입니다.").css("color","red");
							//nicknameCheckRs = "";
						} else {						
							$("#campRegNoCheck").html("");
						}					
					}//callback			
				});//ajax

			});//keyup 
      })
  </script>
  <script>
  			/* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
			(imageView = function imageView(att_zone, btn){

			    var attZone = document.getElementById(att_zone);
			    var btnAtt = document.getElementById(btn)
			    var sel_files = [];
    
			    // 이미지와 체크 박스를 감싸고 있는 div 속성
			    var div_style = 'display:inline-block;position:relative;'
			                  + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
			    // 미리보기 이미지 속성
			    var img_style = 'width:100%;height:100%;z-index:none';
			    // 이미지안에 표시되는 체크박스의 속성
			    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
			                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:white';
  
			    btnAtt.onchange = function(e){
			      var files = e.target.files;
			      var fileArr = Array.prototype.slice.call(files)
			      for(f of fileArr){
			        imageLoader(f);
			      }
			    }  
			    
  
			    // 탐색기에서 드래그앤 드롭 사용
			    /*attZone.addEventListener('dragenter', function(e){
			      e.preventDefault();
			      e.stopPropagation();
			    }, false)
    
			    attZone.addEventListener('dragover', function(e){
			      e.preventDefault();
			      e.stopPropagation();
			      
			    }, false)
  
			    attZone.addEventListener('drop', function(e){
			      var files = {};
			      e.preventDefault();
			      e.stopPropagation();
			      var dt = e.dataTransfer;
			      files = dt.files;
			      for(f of files){
			        imageLoader(f);
			      }
			      
			    }, false)*/
    

    
			    /*첨부된 이미지를 배열에 넣고 미리보기 */
			    imageLoader = function(file){
			      sel_files.push(file);
			      var reader = new FileReader();
			      reader.onload = function(ee){
			        let img = document.createElement('img')
			        img.setAttribute('style', img_style)
			        img.src = ee.target.result;
			        attZone.appendChild(makeDiv(img, file));
			      }
			      
			      reader.readAsDataURL(file);
			    }
    
			    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
			    makeDiv = function(img, file){
			      var div = document.createElement('div')
			      div.setAttribute('style', div_style)
			      
			      var btn = document.createElement('input')
			      btn.setAttribute('type', 'button')
			      btn.setAttribute('value', 'x')
			      btn.setAttribute('delFile', file.name);
			      btn.setAttribute('style', chk_style);
			      btn.onclick = function(ev){
			        var ele = ev.srcElement;
			        var delFile = ele.getAttribute('delFile');
			        for(var i=0 ;i<sel_files.length; i++){
			          if(delFile== sel_files[i].name){
			            sel_files.splice(i, 1);      
			          }
			        }
        
			        dt = new DataTransfer();
			        for(f in sel_files) {
			          var file = sel_files[f];
			          dt.items.add(file);
			        }
			        btnAtt.files = dt.files;
			        var p = ele.parentNode;
			        attZone.removeChild(p)
			      }
			      div.appendChild(img)
			      div.appendChild(btn)
			      return div
			    }
			  }
			)('att_zone', 'btnAtt')

		</script>
		
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("sample6_extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("sample6_extraAddress").value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample6_postcode').value = data.zonecode;
		                document.getElementById("sample6_address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("sample6_detailAddress").focus();
		            }
		        }).open();
		    }
		</script>
</body>

</html>
