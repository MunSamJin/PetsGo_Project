<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
	img {width:"200px"; heigh:"150px";}
	.widget-content {}
	
</style>
    
</head>
<body>
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="index.html">캠핑장 관리</a>
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
        <li class="active dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-long-arrow-down"></i><span>숙소조회</span> <b class="caret"></b></a>
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
        <!-- /span6 -->
        <div class="span6">
          
          <!-- /widget --> 
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3>숙소 리스트</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <ul class="news-items">
              <c:forEach items="${resiList}" var="resi">
              
                <li>
                  
                  <a href="${pageContext.request.contextPath}/owner/resiDetail?resiNo=${resi.resiNo}">
                  <div class="news-item-date" > 
                  
                  	<c:set value="${fn:split(resi.resiFilename , ',')}" var="filenameArr"/>
                  	<span class="news-item-day"><img style="width:200px" src="${pageContext.request.contextPath}/img/seryun/${fn:split(resi.resiFilename , ',')[0]}" ></span> 
                  	<span class="news-item-month"><fmt:formatNumber value="${resi.resiPrice}" pattern="###,###"/></span> </div>
                  	
                  <div class="news-item-detail"> 
                  	<p class="news-item-title" target="_blank">${resi.resiName}</p>
                    <p class="news-item-preview" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; display: inline-block;">>${resi.resiIntro}</p>
                  </div>
                  </a>
                </li>
                </c:forEach>
              </ul>
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget -->
       
        </div>
        <!-- /span6 --> 
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
</body>
</html>