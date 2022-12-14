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
              <span class="menu-title">????????? ???</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">????????? ??????</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/owner/camp/campSelect">????????? ??????</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/owner/resi/resiSelect/${secCamp.campNo}">?????? ?????? ??????</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/owner/resi/resiInsertForm">?????? ??????</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">?????? ??????</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/owner/reserv/reservCheck/${secCamp.campNo}">?????? ?????? ??????</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/owner/reserv/reservChart/${secCamp.campNo}">?????? ??????</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">??????</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/owner/review/campReview/${secCamp.campNo}">?????? ??????</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">????????? ?????????</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/owner/info/campInfo">?????? ??????</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/logout">????????????</a></li>
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
                  <h4 class="card-title">?????? ?????? ??????</h4>
                  <p class="card-description">
                    
                  </p>
                  <%-- <form class="forms-sample" id="campInsertForm" name="campInsert" method="post" action="${pageContext.request.contextPath}/owner/campInsert" 
        				onSubmit='return checkValid()' enctype="multipart/form-data"> --%>
        				
                    <div class="form-group">
                      <label for="exampleInputName1">?????? ??????</label>
                      <p class="form-control" id="exampleInputName1" name="resiName">${resi.resiName}</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">?????? ??????</label>
                      <p class="form-control" id="resiType" name="resiType">${resi.resiType}</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">?????? ?????? ??????</label>
                      <p class="form-control" id="resiEnv" name="resiEnv">${resi.resiEnv}</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">?????? ?????? ??????</label>
                      <p class="form-control" id="resiGround" name="resiGround">${resi.resiGround}</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">?????? ????????????</label>
                      <p class="form-control" id="resiAmeniti" name="resiAmeniti">${resi.resiAmeniti}</p>
                    </div>
                    <div class="form-group">
                      <label>??????</label>
                      <c:set value="${fn:split(resi.resiFilename , ',')}" var="filenameArr"/>
                      	<p>
                  		<c:forEach items="${filenameArr}" var="filename">
                  			<img class="news-item-preview" name="campFilename" style="width:150px; height:120px;" src="/img/seryun/${filename}">
                  		</c:forEach>
                  		</p>
                      <!-- <input type="file"  id="btnAtt" name="files" multiple="multiple" class="file-upload-default">
                      <div class="input-group col-xs-12">
                        <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">
                        <span class="input-group-append">
                          <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                        </span>
                      </div> -->
                    </div>
                    <div class="form-group">
                      <label for="exampleTextarea1">?????????</label>
                      <p class="form-control" id="resiIntro" rows="6" name="resiIntro" style="white-space: pre-line; overflow: auto">${resi.resiIntro}</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">??????</label>
                      <p class="form-control" id="resiPrice" name="resiPrice"><fmt:formatNumber value="${resi.resiPrice}" pattern="###,### ???"/></p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">??? ?????? ??????</label>
                      <p class="form-control" id="resiPeople" name="resiPeople">${resi.resiPeople}</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">?????? ?????? ????????? ??????</label>
                      <p class="form-control" id="resiPet" name="resiPet">${resi.resiPet}</p>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">?????? ??????</label>
                      <p class="form-control" id="resiCount" name="resiCount">${fn:length(resi.residenceDetailList)}</p>
                    </div>
                    <button type="button" class="btn btn-primary mr-2" id="resiUpdateBtn">??????</button>
                    <button type="button" class="btn btn-light" id="resiSelectBtn">????????????</button>
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
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright ?? 2021.  Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash. All rights reserved.</span>
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
  
 
  <script>     
      $(function(){
    	  
    		//????????? ????????? ??????
			$("#campEmail").change(function(){
  			checkEmail($("#campEmail").val());
			});	
			
			function checkEmail(email){
				let expectEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				/* if($("#campEmail").val().equals("")){
					$("#emailValid").html("");
				}
				else  */if(!(expectEmail.test(email))){            
			        $("#emailValid").html("????????? ????????? ????????? ?????????").css("color","red");
			        $("#campEmail").focus();
			        //emailCheckRs = "";
			        return false;
			    }
			    
			    $("#emailValid").html("");
			    return true;
			}
			
			
			//???????????? ????????? ??????
			$("#campPassword").change(function(){
  			checkPassword($("#campPassword").val());
			});			
			
			function checkPassword(password){			    
				if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
			        $("#passwordValid").html("??????+?????????+???????????? ???????????? 8?????? ?????? ???????????? ?????????.").css("color","red");
			        $("#campPassword").focus();
			        return false;
			    }    
			    
			    let checkNumber = password.search(/[0-9]/g);
			    let checkEnglish = password.search(/[a-z]/ig);
			    
			    if(checkNumber < 0 || checkEnglish < 0){
			        $("#passwordValid").html("????????? ???????????? ??????????????? ?????????.").css("color","red");
			        $("#campPassword").focus();
			        return false;
			    }
			    
			    if(/(\w)\1\1\1/.test(password)){
			        $("#passwordValid").html("?????? ????????? 4??? ?????? ???????????? ??? ????????????.").css("color","red");
			        $("#campPassword").focus();
			        return false;
			    }
			    
			    $("#passwordValid").html("");
			    return true;
			}
			
			//////////////////////////////////////////
			//??????????????? ???????????? ?????? ?????? ??????
			$("#campPasswordCheck").change(function(){
				let password = $("#campPassword").val();
				let passwordCheck = $("#campPasswordCheck").val();
				
				if(passwordCheck != password) {
					$("#passwordEqual").html("??????????????? ???????????? ????????????.").css("color","red");
					$("#passwordCheck").focus();
		        	return false;
				} else {
					$("#passwordEqual").html("");
				    return true;
				}
			});
			
      })
  </script>
  <script>
  			/* att_zone : ??????????????? ????????? ?????? id, btn : file tag id */
			(imageView = function imageView(att_zone, btn){

			    var attZone = document.getElementById(att_zone);
			    var btnAtt = document.getElementById(btn)
			    var sel_files = [];
    
			    // ???????????? ?????? ????????? ????????? ?????? div ??????
			    var div_style = 'display:inline-block;position:relative;'
			                  + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
			    // ???????????? ????????? ??????
			    var img_style = 'width:100%;height:100%;z-index:none';
			    // ??????????????? ???????????? ??????????????? ??????
			    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
			                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:white';
  
			    btnAtt.onchange = function(e){
			      var files = e.target.files;
			      var fileArr = Array.prototype.slice.call(files)
			      for(f of fileArr){
			        imageLoader(f);
			      }
			    }  
			    
  
			    // ??????????????? ???????????? ?????? ??????
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
    

    
			    /*????????? ???????????? ????????? ?????? ???????????? */
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
    
			    /*????????? ????????? ?????? ?????? checkbox??? ?????? attZone??? ????????? div??? ????????? ?????? */
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
			      div.appendChild(img);
			      div.appendChild(btn)
			      return div;
			    }
			  }
			)('att_zone', 'btnAtt')

		</script>
		
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.
		
		                // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
		                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
		                var addr = ''; // ?????? ??????
		                var extraAddr = ''; // ???????????? ??????
		
		                //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
		                if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
		                    addr = data.roadAddress;
		                } else { // ???????????? ?????? ????????? ???????????? ??????(J)
		                    addr = data.jibunAddress;
		                }
		
		                // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
		                if(data.userSelectedType === 'R'){
		                    // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
		                    // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
		                    if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // ???????????? ??????, ??????????????? ?????? ????????????.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // ????????? ??????????????? ?????? ????????? ?????????.
		                    document.getElementById("sample6_extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("sample6_extraAddress").value = '';
		                }
		
		                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
		                document.getElementById('sample6_postcode').value = data.zonecode;
		                document.getElementById("sample6_address").value = addr;
		                // ????????? ???????????? ????????? ????????????.
		                document.getElementById("sample6_detailAddress").focus();
		            }
		        }).open();
		    }
		</script>
</body>

</html>
