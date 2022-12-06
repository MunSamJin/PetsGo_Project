<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="utf-8">
<title>Pet's Go</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link
	href="${pageContext.request.contextPath}/css/seryun/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/seryun/bootstrap-responsive.min.css"
	rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/seryun/font-awesome.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/seryun/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/seryun/pages/dashboard.css"
	rel="stylesheet"><body>

	<div class="navbar navbar-fixed-top">

		<div class="navbar-inner">

			<div class="container">

				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="index.html">캠핑장 등록 신청</a>


			</div>
			<!-- /container -->

		</div>
		<!-- /navbar-inner -->

	</div>
	<!-- /navbar -->

	<div class="main">

		<div class="main-inner">

			<div class="container">

				<div class="row">

					<div class="span12">

						<div class="widget ">

							<div class="widget-header">
								<i class="icon-user"></i>
								<h3>캠핑장 등록 신청 폼</h3>
							</div>
							<!-- /widget-header -->

							<div class="widget-content">



								<div class="tabbable">
									<ul class="nav nav-tabs">
										<li class="active"><a href="#formcontrols"
											data-toggle="tab">신청폼</a></li>
										
									</ul>

									<br>

									<div class="tab-content">
										<div class="tab-pane active" id="formcontrols">
											<form id="edit-profile" class="form-horizontal" method="post" enctype="multipart/form-data" name="campInsert"
												action="${pageContext.request.contextPath}/owner/campInsert">
												<fieldset>
													<!-- <div class="control-group">
														<label class="control-label" for="campState">등록상태</label>
														<div class="controls">
															<input type="text" class="span6 disabled" id="campState" name="campState"
																value=0 disabled>
															<p class="help-block">등록 승인 이후 로그인 가능</p>
														</div>
														/controls
													</div> -->
													<!-- /control-group -->


													<div class="control-group">
														<label class="control-label" for="campName">캠핑장 이름</label>
														<div class="controls">
															<input type="text" class="span6" id="campName" name="campName">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<div class="control-group">
														<label class="control-label" for="campName">사업자 이메일</label>
														<div class="controls">
															<input type="text" class="span6" id="campEmail" name="campEmail">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<div class="control-group">
														<label class="control-label" for="campPassword">사업자 비밀번호</label>
														<div class="controls">
															<input type="password" class="span4" id="campPassword" name="campPassword">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<div class="control-group">
														<label class="control-label" for="campRegNo">사업자 등록 번호</label>
														<div class="controls">
															<input type="text" class="span6" id="campRegNo" name="campRegNo" >
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<div class="control-group">
														<label class="control-label" for="campPhone">연락처</label>
														<div class="controls">
															<input type="text" class="span6" id="campPhone" name="campPhone" placeholder="하이픈(-) 포함해서 작성">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<div class="control-group">
														<label class="control-label" for="campPost">캠핑장 우편번호</label>
														<div class="controls">
															<input type="text" id="sample6_postcode" name="campPost">
															<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<div class="control-group">
														<label class="control-label" for="campAddr">캠핑장 주소</label>
														<div class="controls">
															<p><input type="text" class="news-item-preview" id="sample6_address" name="campAddr" placeholder="주소"></p>
											                   <input type="text" id="sample6_detailAddress" placeholder="상세주소">
																<input type="text" id="sample6_extraAddress" placeholder="참고항목">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<div class="control-group">
														<label class="control-label" for="campFilename">캠핑장 사진</label>
														<div class="controls">
															<input type="text" class="span6" id="campFilename" name="campFilename">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<div class="control-group">
														<label class="control-label" for="campNotify">캠핑장 공지사항</label>
														<div class="controls">
															<input type="text" class="span6" id="campNotify" name="campNotify">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<div class="control-group">
														<label class="control-label" for="campIntro">캠핑장 소개글</label>
														<div class="controls">
															<input type="text" class="span6" id="campIntro" name="campIntro">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<div class="control-group">
														<label class="control-label" for="campFacility">캠핑장 부대시설</label>
														<div class="controls">
															<input type="text" class="span6" id="campFacility" name="campFacility">
														</div>
														<!-- /controls -->
													</div>
													
													<div class="control-group">
														<label class="control-label" for="campSurround">캠핑장 주변시설</label>
														<div class="controls">
															<input type="text" class="span6" id="campSurround" name="campSurround">
														</div>
														<!-- /controls -->
													</div>
													
													<div class="control-group">
														<label class="control-label" for="campCheckin">캠핑장 체크인 시간</label>
														<div class="controls">
															<input type="text" class="span6" id="campCheckin" name="campCheckin">
														</div>
														<!-- /controls -->
													</div>
													
													<div class="control-group">
														<label class="control-label" for="campCheckout">캠핑장 체크아웃 시간</label>
														<div class="controls">
															<input type="text" class="span6" id="campCheckout" name="campCheckout">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->


													<br />
													<br />


													<div class="control-group">
														<label class="control-label">Checkboxes</label>


														<div class="controls">
															<label class="checkbox inline"> <input
																type="checkbox"> Option 01
															</label> <label class="checkbox inline"> <input
																type="checkbox"> Option 02
															</label>
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->

													<div class="control-group">
														<label class="control-label">Radio Buttons</label>


														<div class="controls">
															<label class="radio inline"> <input type="radio"
																name="radiobtns"> Option 01
															</label> <label class="radio inline"> <input type="radio"
																name="radiobtns"> Option 02
															</label>
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->

													<div class="control-group">
														<label class="control-label" for="radiobtns">Combined
															Textbox</label>

														<div class="controls">
															<div class="input-prepend input-append">
																<span class="add-on">$</span> <input class="span2"
																	id="appendedPrependedInput" type="text"> <span
																	class="add-on">.00</span>
															</div>
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->

													<div class="control-group">
														<label class="control-label" for="radiobtns">Textbox
															with Buttons </label>

														<div class="controls">
															<div class="input-append">
																<input class="span2 m-wrap" id="appendedInputButton"
																	type="text">
																<button class="btn" type="button">Go!</button>
															</div>
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->

													<div class="control-group">
														<label class="control-label" for="radiobtns">Dropdown
															in a button group</label>

														<div class="controls">
															<div class="btn-group">
																<a class="btn btn-primary" href="#"><i
																	class="icon-user icon-white"></i> User</a> <a
																	class="btn btn-primary dropdown-toggle"
																	data-toggle="dropdown" href="#"><span class="caret"></span></a>
																<ul class="dropdown-menu">
																	<li><a href="#"><i class="icon-pencil"></i>
																			Edit</a></li>
																	<li><a href="#"><i class="icon-trash"></i>
																			Delete</a></li>
																	<li><a href="#"><i class="icon-ban-circle"></i>
																			Ban</a></li>
																	<li class="divider"></li>
																	<li><a href="#"><i class="i"></i> Make admin</a></li>
																</ul>
															</div>
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->

													<div class="control-group">
														<label class="control-label" for="radiobtns">Button
															sizes</label>

														<div class="controls">
															<a class="btn btn-large" href="#"><i
																class="icon-star"></i> Star</a> <a class="btn btn-small"
																href="#"><i class="icon-star"></i> Star</a> <a
																class="btn btn-mini" href="#"><i class="icon-star"></i>
																Star</a>
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->

													<br />


													<div class="form-actions">
														<button type="submit" class="btn btn-primary">Save</button>
														<button class="btn">Cancel</button>
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
						<h4>About Free Admin Template</h4>
						<ul>
							<li><a href="javascript:;">EGrappler.com</a></li>
							<li><a href="javascript:;">Web Development Resources</a></li>
							<li><a href="javascript:;">Responsive HTML5 Portfolio
									Templates</a></li>
							<li><a href="javascript:;">Free Resources and Scripts</a></li>
						</ul>
					</div>
					<!-- /span3 -->
					<div class="span3">
						<h4>Support</h4>
						<ul>
							<li><a href="javascript:;">Frequently Asked Questions</a></li>
							<li><a href="javascript:;">Ask a Question</a></li>
							<li><a href="javascript:;">Video Tutorial</a></li>
							<li><a href="javascript:;">Feedback</a></li>
						</ul>
					</div>
					<!-- /span3 -->
					<div class="span3">
						<h4>Something Legal</h4>
						<ul>
							<li><a href="javascript:;">Read License</a></li>
							<li><a href="javascript:;">Terms of Use</a></li>
							<li><a href="javascript:;">Privacy Policy</a></li>
						</ul>
					</div>
					<!-- /span3 -->
					<div class="span3">
						<h4>Open Source jQuery Plugins</h4>
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

					<div class="span12">
						&copy; 2013 <a href="#">Bootstrap Responsive Admin Template</a>.
					</div>
					<!-- /span12 -->

				</div>
				<!-- /row -->

			</div>
			<!-- /container -->

		</div>
		<!-- /footer-inner -->

	</div>
	<!-- /footer -->



	<script src="/js/seryun/jquery-1.7.2.min.js"></script>

	<script src="/js/seryun/bootstrap.js"></script>
	<script src="/js/seryun/base.js"></script>
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
