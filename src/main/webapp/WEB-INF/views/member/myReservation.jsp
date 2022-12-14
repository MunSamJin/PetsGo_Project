<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>PetsGo</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/fontawesome/css/all.min.css">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gijgo.min.css">
    <!-- niceselect CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css">
    <!-- slick CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <!-- my_reservation style CSS --> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/my_reservation.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage_style.css">
    
    <script type="text/javascript">
    	$(function(){
    		//alert("?????? ???????");
    		
    		/*????????????????????????*/
    		$("a[name=cancelPayAtag]").on("click", function(){
    			//alert("????????");
    			
    			//var reservState = 0;
    			//var reservState = $("input[name=cancelPay]").val();
    			//alert("????????????????" + reservState);
    			
    			var reservationNo = 0;
    			//alert("???????????????? " + $("input[name=reservationNo]").val());
    			
    			$.ajax({
    				url : "${pageContext.request.contextPath}/member/cancelPay", //??????????????????
    				type : "post", //????????????(get, post, put, delete, patch)
    				dataType : "json", //????????? ??????(?????????) ??? ???????????????(text | hrml | xml | json)
    				data : { reservationNo : $("input[name=reservationNo]").val() ,
    						 "${_csrf.parameterName}" : "${_csrf.token}"
    				}, //???????????? ?????? parameter ??????
    				success : function(result){ //???????????? ????????? result
    					//alert("??????????????? ?" + result); 
    					location.href="${pageContext.request.contextPath}/member/myReservation"
    				}, 
    				error : function(){
    					alert(err+"????????????!")
    				}
    			});//ajaxEnd
    			
    		});//????????????????????????
    		
    	});//readyEnd
    </script>

</head>

<body>
	
	
    <!--================ Area =================-->
		    <section class="blog_area single-post-area section_padding">
		        <div class="container">
		        	<div class="my_topmenu">?????? ????????????</div>
		            <div class="row">
		                <div class="col-lg-4">
		                    <div class="blog_right_sidebar">
		                    <sec:authentication var="mvo" property="principal" />
							<aside class="single_sidebar_widget instagram_feeds" style="text-align: center;">                          
	                             <div class="my_img">
	                                 <img class="img-fluid" src="${pageContext.request.contextPath}/img/regi_profile/${mvo.memberProfile}" >
	                             </div>
	                              <h4 class="widget_title">${mvo.memberNickname}???</h4><br>
		                                  
		                         <a href="javascript:void(0);" name="communityList">
		                         	<img src="${pageContext.request.contextPath}/img/bookmark_1.png" alt="" style="width: 7%; opacity: 68%;">
		                         	<p style="display: inline-block;">?????????</p>
		                         </a>
		                         &nbsp
		                         <i class="far fa-star" style="opacity: 68%;"></i>
		                         <a href="javascript:void(0);" name="likeList">
		                         	<p style="display: inline-block;">?????????</p>
		                         </a>			                         
	                         </aside>
			            </div>
		                </div>
		                <div class="col-lg-8 mb-5 mb-lg-0">
		                    <div class="blog_left_sidebar">
		                       <!-- ???????????? - ?????????????????? -->
		                       <c:forEach items="${requestScope.reservation}" var="reservation" varStatus="status" >
			                        
			                        <article class="blog_item">
			                            <div class="blog_item_img">
			                                <img class="card-img rounded-0" src="${pageContext.request.contextPath}/img/seryun/${fn:split(reservation.residence.resiFilename,',')[0]}" alt="">
			                                <div href="#" class="blog_item_date">
			                                    <span class="check_in">
			                                        <p>check-in</p>
			                                        <h3>${reservation.reservCheckin.substring(6,8)}???</h3>
			                                        <p>${reservation.reservCheckin.substring(3,5)}???</p>
			                                    </span>
			
			                                    <span class="check_center">
			                                        
			                                    </span>
			
			                                    <span class="check_out">
			                                        <p>check-out</p>
			                                        <h3>${reservation.reservCheckout.substring(6,8)}???</h3>
			                                        <p>${reservation.reservCheckout.substring(3,5)}???</p>
			                                    </span>
			                                </div>
			                            </div>
			                            <div class="blog_details">
			                                <a class="d-inline-block" href="#">
			                                	<h5>${reservation.camp.campName }</h5>
			                                    <h2>${reservation.residence.resiName}</h2>
			                                    
			                                </a>
			                                <div class="rev_detail">
			                                    <div class="detials01">
			                                        <p>????????? ??????</p>                                       
			                                           <span>?????? : </span><span>${reservation.reservName}</span> <br>
			                                           <span>??????????????? : </span><span>${reservation.reservPhone}</span>
			                                    </div>
			                                    <div class="detials02">
			                                        <p>?????? ??????</p>                                       
			                                           <span>???????????? : </span><span>${reservation.reservPrice}???</span> <br>
			                                           <span>???????????? : </span><span>${reservation.reservType}</span>
			                                    </div>
			                                </div>
			                                <ul class="blog-info-link">
			                                    <li><span><i class="far fa-user"></i> ?????? ${reservation.reservPeople}???</span></li>
			                                    <li>
			                                    	<span>
			                                    		<i class="far fa-check-circle"></i>
			                                    		<c:choose>
			                                    			<c:when test="${reservation.reservState eq 0}">
			                                    				?????? ??????(?????? ??????)
			                                    				<li style="font-size: 13px;">
			                                    					<a href="javascript:void(0);" name="cancelPayAtag">
			                                    						<i class="far fa-times-circle"></i> ????????????
			                                    						<input type="hidden" name="cancelPay" value="${reservation.reservState}">
			                                    						<input type="hidden" name="reservationNo" value="${reservation.reservNo}">
			                                    					</a>
			                                    				</li>
			                                    			</c:when>
			                                    			<c:when test="${reservation.reservState eq 1}">
			                                    				????????????
			                                    				<li style="color: #f7612f;"><i class="far fa-star"></i> ????????????</li>
			                                    			</c:when>
			                                    			<c:when test="${reservation.reservState eq 3}">
			                                    				????????????			                                   
			                                    			</c:when>
			                                    			<c:when test="${reservation.reservState eq 4}">
			                                    				??????????????????			                                   
			                                    			</c:when>
			                                    			
			                                    		</c:choose>
			                                    	</span>
			                                    </li>
			                                    
			                                </ul>
			                            </div>			                        
			                        </article>
		                        </c:forEach>
		                        
		                        <!-- <nav class="blog-pagination justify-content-center d-flex">
		                            <ul class="pagination">
		                                <li class="page-item">
		                                    <a href="#" class="page-link" aria-label="Previous">
		                                        <i class="ti-angle-left"></i>
		                                    </a>
		                                </li>
		                                <li class="page-item">
		                                    <a href="#" class="page-link">1</a>
		                                </li>
		                                <li class="page-item active">
		                                    <a href="#" class="page-link">2</a>
		                                </li>
		                                <li class="page-item">
		                                    <a href="#" class="page-link" aria-label="Next">
		                                        <i class="ti-angle-right"></i>
		                                    </a>
		                                </li>
		                            </ul>
		                        </nav> -->
		                    </div>
		                </div>
		                
		            </div>
		        </div>
		    </section>
    
    
    <!--================ Area end =================-->

    <!-- jquery plugins here-->
    <script src="${pageContext.request.contextPath}js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="${pageContext.request.contextPath}js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="${pageContext.request.contextPath}js/bootstrap.min.js"></script>
    <!-- magnific js -->
    <script src="${pageContext.request.contextPath}js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="${pageContext.request.contextPath}js/owl.carousel.min.js"></script>
    <!-- masonry js -->
    <script src="${pageContext.request.contextPath}js/masonry.pkgd.js"></script>
    <!-- masonry js -->
    <script src="${pageContext.request.contextPath}js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}js/gijgo.min.js"></script>
    <!-- contact js -->
    <script src="${pageContext.request.contextPath}js/jquery.ajaxchimp.min.js"></script>
    <script src="${pageContext.request.contextPath}js/jquery.form.js"></script>
    <script src="${pageContext.request.contextPath}js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}js/mail-script.js"></script>
    <script src="${pageContext.request.contextPath}js/contact.js"></script>
    <!-- custom js -->
    <script src="${pageContext.request.contextPath}js/custom.js"></script>
</body>

</html>