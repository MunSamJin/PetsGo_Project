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
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Pet's Go</title>
    
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#moreBtn").click(function() {
			let len = $("div[name=hideview]").length;
			if(len===0) {
				alert("더 이상 게시물이 없습니다.");
			} else {
				let arr = new Array(len);
				for(var i=0; i<6; i++){         
					arr[i] = $("div[name=hideview]").eq(i);
			    }
				for(var j=0; j<arr.length; j++) {
					arr[j].attr('name', 'showview');
					arr[j].css('display', 'block');
				}
				$("html, body").animate({scrollTop:$(document).height()}, 500);
			}
		});
		
		$("#filterBtn").click(function() {
			let price = $("#amount").val();
			price = price.split('-');
			
			
			let price1 = $.trim(price[0]).replace('￦','').replace(',','');
			let price2 = $.trim(price[1]).replace('￦','').replace(',','');
			
			let aa = $("#aa").val();
			
			$.ajax({
				url : '/camp/select',
				type : 'post',
				data : {
					price1:price1,
					price2:price2,
					aa:aa},
				dataType: 'json',
				success : function(result) {
					$("#listAll").empty();
					
					let str = "";
					
					$.each(result, function(index, item) {
						let imeName = item.campFilename;
						imeName = imeName.split(',')[0];
						
						let resifia = item.residenceList;
						let minprice = price2;
						$.each(resifia, function(i, j) {
							if(j.resiPrice<=price2 && j.resiPrice>=price1) {
								if(minprice>j.resiPrice) minprice = j.resiPrice;
							}
						});

						if(index<6) {
							str += '<div class="col-lg-6 col-md-6"  name="showview">';
						} else {
							str += '<div class="col-lg-6 col-md-6"  style="display: none" name="hideview">';
						}
						str += '<div class="single_place"><div class="thumb">';
						str += '<img src="${pageContext.request.contextPath}/img/seryun/'+imeName+'" alt="">';
						str += '<a href="/camp/detail?campNo='+item.campNo+'" class="prise">￦ '+minprice.toLocaleString('ko-KR')+'</a></div>';
						str += `<div class="place_info" ><a href="destination_details.html">`;
						str += '<h3>'+item.campName+'</h3></a>';
						str += '<p style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">'+item.campIntro+'</p>';
						str += `<div class="rating_days d-flex justify-content-between">`;
						str += `<span class="d-flex justify-content-center align-items-center">`;
						str += `<a href="#">(20 Review)</a></span>`;
						str += `<div class="days"><i class="fa fa-clock-o"></i><a href="#">스크랩</a>`;
						str += `</div></div></div></div></div>`;
					});
					$("#listAll").append(str);
				},
				error : function(err) {
					alert(err);
				}
			});
		});
	});
</script>
	
    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/travelo-master/img/favicon.png">

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
                        <h3>Pet's Go</h3>
                        <p>반려견과 함께 떠나는 즐거운 캠핑! 이제 어디든 가능합니다!</p>
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
                    
                        <form class="search_form" action="/camp/selectAll">
                            <div class="input_field">
                                <select class="nc_select" id="campAddr" name="campAddr">
                            		<option selected>지역명 검색 </option>
									<option value="포천시">포천시</option>
                                    <option value="평택시">평택시</option>
                                    <option value="여주시">여주시</option>
                                    <option value="가평군">가평군</option>
                                    <option value="동두천시">동두천시</option>
                                    <option value="안산시">안산시</option>
                                    <option value="김포시">김포시</option>
                                    <option value="하남시">하남시</option>
                                    <option value="용인시">용인시</option>
                                    <option value="파주시">파주시</option>
                                    <option value="연천시">연천시</option>
                                    <option value="광주시">광주시</option>
                                 </select>
                            </div>
                            
                            <div class="input_field">
                                <input id="checkIn" placeholder="${checkIn}" name="checkIn">
                            </div>
                            
                            <div class="input_field">
                                <input id="checkOut" placeholder="${checkOut }" name="checkOut">
                            </div>
                            
                            <div class="input_field">
                            	<select class="nc_select"  id="resiPeople" name="resiPeople">
                            		<option selected>인원 </option>
                            		<option value="1">1</option>
                            		<option value="2">2</option>
                            		<option value="3">3</option>
                            		<option value="4">4</option>
                            		<option value="5">5</option>
                            		<option value="6">6</option>
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
                                            <select id="aa">
                                                <option data-display="기본 정렬">기본 정렬</option>
                                                <option value="1">가격↑</option>
                                                <option value="2">가격↓</option>
                                                <option value="4">USA</option>
                                              </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="single_select">
                                            <select>
                                                <option data-display="태그 정렬">태그 정렬</option>
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
                                <button id="filterBtn" class="boxed-btn4" type="submit">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-8">
                    <div class="row" id="listAll">
        
                    	<!-- 캠핑장 목록 -->
                    	<c:forEach items="${campList}" var="camp" varStatus="status">
                    		<c:choose>
                    			<c:when test="${status.count<=6}">
                    				<div class="col-lg-6 col-md-6"  name="showview">
                    			</c:when>
                    			<c:otherwise>
                    				<div class="col-lg-6 col-md-6"  style="display: none" name="hideview">
                    			</c:otherwise>
                    		</c:choose>
		                            <div class="single_place">
		                                <div class="thumb">
		                                    <img src="${pageContext.request.contextPath}/img/seryun/${fn:split(camp.campFilename, ',')[0]}" alt="">
		                                    <c:set var="aaprice" value="100000000"/>
		                                    <c:forEach items="${camp.residenceList}" var="residence">
		                                    	<c:if test="${residence.resiPrice < aaprice}">
		                                    		 <c:set var="aaprice" value="${residence.resiPrice}"/>
		                                    	</c:if>
		                                    </c:forEach>
		                                    <a href="/camp/detail?campNo=${camp.campNo}" class="prise"><fmt:formatNumber value="${aaprice}" pattern="￦ ###,###"/></a>
		                                </div>
		                                <div class="place_info" >
		                                    <a href="${pageContext.request.contextPath}/camp/detail?campNo=${camp.campNo}"><h3>${camp.campName}</h3></a>
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
                                <button type="button" class="boxed-btn4" id="moreBtn">More Places</button>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>

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