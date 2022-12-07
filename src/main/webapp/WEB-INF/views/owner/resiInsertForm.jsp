<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="utf-8">
<title>Pet's Go</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="${pageContext.request.contextPath}/css/seryun/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/seryun/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
        rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/seryun/font-awesome.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/seryun/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/seryun/pages/dashboard.css" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    
    <style type="text/css">
		
		
		#att_zone {
		  min-height: 150px;
		  padding: 10px;
		  border: 1px solid #edeef0;
		  border-radius: 8px;
		  width: 650px;
		  height: 200px;
		  overflow: auto;
		}
		
		#att_zone:empty:before {
		  content: attr(data-placeholder);
		  color: #999;
		  font-size: 10pt;
		}

	</style>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>
	<script type="text/javascript">
		$(function(){
			
			$("#campRequest").click(function(){			
				
				$("#edit-profile").ajaxForm({
					type:"POST",
					url:"${pageContext.request.contextPath}/owner/resiInsert",
					//data:$("#edit-profile").serialize(),
					dataType:"text",
					success:function(result){
						 //alert("등록되었습니다");
						 location.href = "${pageContext.request.contextPath}/owner/resiSelect";
						 	
					},
					error:function(err){
						alert("입력사항을 다시 확인해주세요.")
					}
				});//ajax
				
				$("#edit-profile").submit();
			});//click
		})
	
	</script>
</head>
<body>
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="${pageContext.request.contextPath}/owner/campHome">캠핑장 관리</a>
      <div class="nav-collapse">
        <ul class="nav pull-right">
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-cog"></i> Account <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="javascript:;">Settings</a></li>
              <li><a href="javascript:;">Help</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-user"></i> EGrappler.com <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="javascript:;">Profile</a></li>
              <li><a href="javascript:;">Logout</a></li>
            </ul>
          </li>
        </ul>
        <form class="navbar-search pull-right">
          <input type="text" class="search-query" placeholder="Search">
        </form>
      </div>
      <!--/.nav-collapse --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /navbar-inner --> 
</div>
<!-- /navbar -->
<div class="subnavbar">
  <div class="subnavbar-inner">
    <div class="container">
      <ul class="mainnav">
        <li><a href="${pageContext.request.contextPath}/owner/campHome"><i class="icon-dashboard"></i><span>관리홈</span> </a> </li>
        <%-- <li class="active"><a href="${pageContext.request.contextPath}/owner/campManagement"><i class="icon-list-alt"></i><span>캠핑장관리</span> </a> </li> --%>
        <li class="active dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-long-arrow-down"></i><span>숙소등록</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="${pageContext.request.contextPath}/owner/campSelect">캠핑장조회</a></li>
            <%-- <li><a href="${pageContext.request.contextPath}/owner/campInsert">캠핑장등록</a></li> --%>
            <li><a href="${pageContext.request.contextPath}/owner/resiSelect">숙소조회</a></li>
            <li><a href="${pageContext.request.contextPath}/owner/resiInsertForm">숙소등록</a></li>
          </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/owner/reservManagement"><i class="icon-facetime-video"></i><span>예약관리</span> </a></li>
        <li><a href="${pageContext.request.contextPath}/owner/reservChart"><i class="icon-bar-chart"></i><span>예약통계</span> </a> </li>
      </ul>
    </div>
    <!-- /container --> 
  </div>
  <!-- /subnavbar-inner --> 
</div>
<!-- /subnavbar -->
<div class="main">

		<div class="main-inner">

			<div class="container">

				<div class="row">

					<div class="span12">

						<div class="widget ">

							<div class="widget-header">
								<i class="icon-user"></i>
								<h3>숙소 등록 폼</h3>
							</div>
							<!-- /widget-header -->

							<div class="widget-content">



								<div class="tabbable">
									<ul class="nav nav-tabs">
										<li class="active"><a href="#formcontrols"
											data-toggle="tab">등록폼</a></li>
										
									</ul>
									<br>

									<div class="tab-content">
										<div class="tab-pane active" id="formcontrols">
											<form id="edit-profile" class="form-horizontal" method="post" enctype="multipart/form-data" name="resiInsert"
												action="${pageContext.request.contextPath}/owner/resiInsert">
												<fieldset>
												
													<!-- campNo를 hidden으로 넘긴다(외래키) -->
												
												 	<div class="control-group">
														<label class="control-label" for="campName">${camp.campName}</label>
														<div class="controls">
															<input type="text" class="span6 disabled" id="campName" 
																value=0 disabled>
															<p class="help-block"></p>
														</div>
													</div>
													<!-- /control-group -->


													<div class="control-group">
														<label class="control-label" for="resiName">숙소 이름</label>
														<div class="controls">
															<input type="text" class="span6" id="resiName" name="resiName">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<div class="control-group">
														<label class="control-label" for="resiType">숙소 유형</label>
														<div class="controls">
															<input type="text" class="span6" id="resiType" name="resiType">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<div class="control-group">
														<label class="control-label" for="resiEnv">숙소 주변 환경</label>
														<div class="controls">
															<input type="text" class="span4" id="resiEnv" name="resiEnv">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<div class="control-group">
														<label class="control-label" for="resiGround">숙소 바닥 형태</label>
														<div class="controls">
															<input type="text" class="span6" id="resiGround" name="resiGround" >
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<div class="control-group">
														<label class="control-label" for="resiAmeniti">숙소 편의시설</label>
														<div class="controls">
															<input type="text" class="span6" id="resiAmeniti" name="resiAmeniti" placeholder="공백없이 ','를 기준으로 작성하세요">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<div class="control-group">
														<label class="control-label" for="resiPrice">숙소 가격</label>
														<div class="controls">
															<input type="text" class="span6" id="resiPrice" name="resiPrice">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													
													<div class="control-group">
														<label class="control-label" for="resiIntro">숙소 소개글</label>
														<div class="controls">
															<!-- <input type="text" class="span6" id="campIntro" name="campIntro"> -->
															<textarea class="news-item-preview" name="resiIntro" style="white-space: pre-line;"></textarea>
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													
													<div class="control-group">
														<label class="control-label" for="resiFilename">숙소 사진</label>
														<!-- <div class="controls">
															<input type="text" class="span6" id="campFilename" name="campFilename">
														</div> -->
														<div class='controls' >
															<input type="file" id="btnAtt" name="files" multiple="multiple"/>
									                  		<div id='att_zone' data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
									                  	</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													
													<div class="control-group">
														<label class="control-label" for="resiPeople">총 제한 인원</label>
														<div class="controls">
															<input type="text" class="span6" id="resiPeople" name="resiPeople">
														</div>
														<!-- /controls -->
													</div>
													
													<div class="control-group">
														<label class="control-label" for="resiPet">입장 가능 반려견 정보</label>
														<div class="controls">
															<input type="text" class="span6" id="resiPet" name="resiPet">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->


													<br />
													<br />


													<div class="form-actions">
														<button class="btn btn-primary" id="resiInsert">신청</button>
														<button class="btn">취소</button>
													</div>
													<!-- /form-actions -->
												</fieldset>
											</form>
										</div>
									</div>
								</div>

							</div>
							<!-- /widget-content -->

						</div>
						<!-- /widget -->

					</div>
					<!-- /span8 -->

				</div>
				<!-- /row -->

			</div>
			<!-- /container -->

		</div>
		<!-- /main-inner -->

	</div>
	<!-- /main -->


<div class="extra">
  <div class="extra-inner">
    <div class="container">
      <div class="row">
                    <div class="span3">
                        <h4>
                            About Free Admin Template</h4>
                        <ul>
                            <li><a href="javascript:;">EGrappler.com</a></li>
                            <li><a href="javascript:;">Web Development Resources</a></li>
                            <li><a href="javascript:;">Responsive HTML5 Portfolio Templates</a></li>
                            <li><a href="javascript:;">Free Resources and Scripts</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Support</h4>
                        <ul>
                            <li><a href="javascript:;">Frequently Asked Questions</a></li>
                            <li><a href="javascript:;">Ask a Question</a></li>
                            <li><a href="javascript:;">Video Tutorial</a></li>
                            <li><a href="javascript:;">Feedback</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Something Legal</h4>
                        <ul>
                            <li><a href="javascript:;">Read License</a></li>
                            <li><a href="javascript:;">Terms of Use</a></li>
                            <li><a href="javascript:;">Privacy Policy</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Open Source jQuery Plugins</h4>
                        <ul>
                            <li><a href="">Open Source jQuery Plugins</a></li>
                            <li><a href="">HTML5 Responsive Tempaltes</a></li>
                            <li><a href="">Free Contact Form Plugin</a></li>
                            <li><a href="">Flat UI PSD</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /extra-inner --> 
</div>
<!-- /extra -->
<div class="footer">
  <div class="footer-inner">
    <div class="container">
      <div class="row">
        <div class="span12"> &copy; 2013 <a href="#">Bootstrap Responsive Admin Template</a>. </div>
        <!-- /span12 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /footer-inner --> 
</div>
<!-- /footer --> 
<!-- Le javascript
================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="${pageContext.request.contextPath}/js/seryun/jquery-1.7.2.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/seryun/excanvas.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/seryun/chart.min.js" type="text/javascript"></script> 
<script src="${pageContext.request.contextPath}/js/seryun/bootstrap.js"></script>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/js/seryun/full-calendar/fullcalendar.min.js"></script>
 
<script src="${pageContext.request.contextPath}/js/seryun//base.js"></script> 
	<script type="text/javascript">
		$(function(){
			
			$("#campRequest").click(function(){			
				//$("#memberListView").empty();
				
				/* if($("#address").val()==""){
					return;
				} */
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/owner/campInsert",
					data:$("#edit-profile").serialize(),
					dataType:"json",
					success:function(result){
						
						 alert("캠핑장 등록 신청이 완료되었습니다. 결과는 입력하신 이메일로 발송됩니다.");
						 
						 	
					}//function
					error:function(err){
						alert("입력사항을 다시 확인해주세요.")
						history.back();
					}
				});//ajax
			});//click
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
			                  + 'width:150px;height:120px;margin:5px;border:1px solid white;z-index:1';
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
			    attZone.addEventListener('dragenter', function(e){
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
			      
			    }, false)
    

    
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