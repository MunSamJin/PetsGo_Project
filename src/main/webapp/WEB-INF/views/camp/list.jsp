<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Pet's GO</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.js"></script>
    <script type="text/javascript">
    	$(function() {
			
		});
    </script>

    <!-- CSS here -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/travelo-master/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/travelo-master/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/travelo-master/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/travelo-master/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/travelo-master/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/travelo-master/css/nice-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/travelo-master/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/travelo-master/css/jquery-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/travelo-master/css/gijgo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/travelo-master/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/travelo-master/css/slick.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/travelo-master/css/slicknav.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/travelo-master/css/style.css">
</head>

<body>
    <!-- bradcam_area  -->
    <div class="bradcam_area bradcam_bg_2">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text text-center">
                        <h3>Destinations</h3>
                        <p>Pixel perfect design with awesome contents</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->

    <!-- where_togo_area_start  -->
    <div class="where_togo_area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-3">
                    <div class="form_area">
                        <h3>Where you want to go?</h3>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="search_wrap">
                        <form class="search_form" action="#">
                            <div class="input_field">
                                <input type="text" placeholder="Where to go?">
                            </div>
                            <div class="input_field">
                                <input id="datepicker" placeholder="Date">
                            </div>
                            <div class="input_field">
                                <select>
                                    <option data-display="Travel type">Travel type</option>
                                    <option value="1">Some option</option>
                                    <option value="2">Another option</option>
                                </select>
                            </div>
                            <div class="search_btn">
                                <button class="boxed-btn4 " type="submit" >Search</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- where_togo_area_end  -->


    <div class="popular_places_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="filter_result_wrap">
                        <h3>Filter Result</h3>
                        <div class="filter_bordered" style="background-color: white;">
                            <div class="filter_inner">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="single_select">
                                            <select>
                                                <option data-display="Country">Country</option>
                                                <option value="1">Africa</option>
                                                <option value="2">canada</option>
                                                <option value="4">USA</option>
                                              </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="single_select">
                                            <select>
                                                <option data-display="Travel type">Travel type</option>
                                                <option value="1">advance</option>
                                                <option value="2">advance</option>
                                                <option value="4">premium</option>
                                              </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="range_slider_wrap">
                                            <span class="range">Prise range</span>
                                            <div id="slider-range"></div>
                                            <p>
                                                <input type="text" id="amount" readonly style="border:0; color:#7A838B; font-weight:400;">
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="reset_btn">
                                <button class="boxed-btn4" type="submit">Reset</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-8">
                    <div class="row" id="listAll">
        
                    	<!-- 캠핑장 목록 -->
                    	<c:forEach items="${campList}" var="camp">
                    		<div class="col-lg-6 col-md-6" >
	                            <div class="single_place">
	                                <div class="thumb">
	                                    <img src="${pageContext.request.contextPath}/img/seryun/${fn:split(camp.campFilename, ',')[0]}" alt="">
	                                    <c:forEach items="${camp.residenceList}" begin="0" end="1" var="residence">
	                                    	<a href="/camp/detail?campNo=${camp.campNo}" class="prise"><fmt:formatNumber value="${residence.resiPrice}" pattern="###,###"/></a>
	                                    </c:forEach>
	                                </div>
	                                <div class="place_info" >
	                                    <a href="destination_details.html"><h3>${camp.campName}</h3></a>
	                                    <p style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${camp.campIntro}</p>
	                                    <div class="rating_days d-flex justify-content-between">
	                                        <span class="d-flex justify-content-center align-items-center">
	                                             <a href="#">(20 Review)</a>
	                                        </span>
	                                        <div class="days">
	                                            <i class="fa fa-clock-o"></i>
	                                            <a href="#">스크랩</a>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
                       		</div>
                    	</c:forEach>

                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="more_place_btn text-center">
                                <a class="boxed-btn4" href="#">More Places</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 
  <!-- Modal -->
  <div class="modal fade custom_search_pop" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="serch_form">
            <input type="text" placeholder="Search" >
            <button type="submit">search</button>
        </div>
      </div>
    </div>
  </div>
    <!-- link that opens popup -->
    

    <!-- JS here -->
    <script src="${pageContext.request.contextPath}/travelo-master/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/ajax-form.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/jquery.counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/imagesloaded.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/scrollIt.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/jquery.scrollUp.min.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/jquery-ui.min.js"> </script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/jquery.slicknav.min.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/range.js"></script>
        <!-- <script src="js/gijgo.min.js"></script> -->
    <script src="${pageContext.request.contextPath}/travelo-master/js/slick.min.js"></script>
   

    
    <!--contact js-->
    <script src="${pageContext.request.contextPath}/travelo-master/js/contact.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/jquery.ajaxchimp.min.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/jquery.form.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/travelo-master/js/mail-script.js"></script>


    <script src="${pageContext.request.contextPath}/travelo-master/js/main.js"></script>
    <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }
        });
    </script>
</body>
</html>