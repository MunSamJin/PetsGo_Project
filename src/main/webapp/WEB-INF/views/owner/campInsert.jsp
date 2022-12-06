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
					data-target=".nav-collap
se"> <span class="icon-bar"></span> <span
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
											<form id="edit-profile" class="form-horizontal" method="post"
												action="${pageContext.request.contextPath}/owner/campInsert">
												<fieldset>
													<div class="control-group">
														<label class="control-label" for="campState">등록상태</label>
														<div class="controls">
															<input type="text" class="span6 disabled" id="campState" name="campState"
																value=0 disabled>
															<p class="help-block">등록 승인 이후 로그인 가능</p>
														</div>
														<!-- /controls -->
													</div>
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
															<input type="text" class="span6" id="campPhone" name="campPhone" value="하이픈(-) 포함해서 작성">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<div class="control-group">
														<label class="control-label" for="campPost">캠핑장 우편번호</label>
														<div class="controls">
															<input type="text" class="span6" id="campPost" name="campPost">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<div class="control-group">
														<label class="control-label" for="campAddr">캠핑장 주소</label>
														<div class="controls">
															<input type="text" class="span6" id="campAddr" name="campAddr">
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


</body>

</html>
