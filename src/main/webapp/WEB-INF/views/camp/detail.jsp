<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    
    <!-- Title -->
    <title>Pet's GO</title>

    <!-- Core Stylesheet -->
    <link href="${pageContext.request.contextPath}/dorne-master/style.css" rel="stylesheet">
    <!-- Responsive CSS -->
    <link href="${pageContext.request.contextPath}/dorne-master/css/responsive/responsive.css" rel="stylesheet">
    <!-- 캠핏 -->
    <link href="${pageContext.request.contextPath}/css/haewon/detail.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/haewon/reservationForm.css">
    
    <!-- 내부 CSS -->
    <style type="text/css">
        .listing-resi-intro {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 6; /* 라인수 */
            -webkit-box-orient: vertical;
            word-wrap: break-word;
            line-height: 1.2em;
            height: 3.6em;
            display: inline-block;
        }

        .listing-resi-img {
            max-width: 20%;
            height: auto;
            display: inline-block;
            margin-right: 10px;
        }
    </style>
    <!-- 기능 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.1/kakao.min.js"
  integrity="sha384-eKjgHJ9+vwU/FCSUG3nV1RKFolUXLsc6nLQ2R1tD0t4YFPCvRmkcF8saIfOZNWf/" crossorigin="anonymous"></script>
<script type="text/javascript">
	Kakao.init('507651c271794aae6b448c4df48e74f3');
	let kakaoUrl = 'http://localhost:9000/camp/detail?campNo='+${camp.campNo};
	let kakaoTitle = '${camp.campName}';
	let kakaoDescription = '${camp.campAddr}';

	$(function() {
		$("#copyBtn").click(function() {
			let content = $("#campAddr").text();

            alert(content);

            navigator.clipboard.writeText(content);
            alert("복사되었습니다");
        });
		
		$('.reservationBtn').click(function() {
			let addr = $(this).next().val();
			let checkIn = '${checkIn}';
			let checkOut = '${checkOut}';
			
			$.ajax({
				url : '/reservation/test',
				type: 'post',
				dataType : 'text',
				data : {
					resiNo:addr,
					checkIn:checkIn,
					checkOut:checkOut
				},
				success: function (result) {
					if(result=='입장') {
						location.href="${pageContext.request.contextPath}/reservation/reservationForm?resiNo="+addr+"&resiPeople=${resiPeople}&checkIn=${checkIn}&checkOut=${checkOut}";
					} else {
						alert("예약할 수 없습니다.");
					}
                },
                error : function(err) {
                	alert("실패");
                	console.log(err)
				}
			});
		});
		
		Kakao.Share.createDefaultButton({
		    container: '#kakaotalk-sharing-btn',
		    objectType: 'feed',
		    content: {
		      title: kakaoTitle,
		      description: kakaoDescription,
		      imageUrl:
		        'http://localhost:9000/img/seryun/camp_21_01.jpg',
		      link: {
		        // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
		        mobileWebUrl: 'https://developers.kakao.com',
		        webUrl: 'https://developers.kakao.com',
		      },
		    },
		    social: {
		      likeCount: 286,
		      commentCount: 45,
		      sharedCount: 845,
		    },
		    buttons: [
		      {
		        title: '웹으로 보기',
		        link: {
		          mobileWebUrl: kakaoUrl,
		          webUrl: kakaoUrl,
		        },
		      },
		      {
		        title: '앱으로 보기',
		        link: {
		          mobileWebUrl: kakaoUrl,
		          webUrl: kakaoUrl,
		        },
		      },
		    ],
		  });
	});
</script>
</head>

<body>
<!-- ***** Breadcumb Area Start ***** -->
<div class="breadcumb-area height-700 bg-img bg-overlay" style="background-image: url(${pageContext.request.contextPath}/img/seryun/${fn:split(camp.campFilename, ',')[0]})">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcumb-content">
                    <div class="map-ratings-review-area d-flex">
                        <a id="kakaotalk-sharing-btn" href="javascript:Kakao.Share.createDefaultButton;">공유하기</a>
                        <a id="testest" href="#">8.7</a>
                        <a href="#">Write a review</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ***** Breadcumb Area End ***** -->

<!-- ***** Single Listing Area Start ***** -->
<section class="dorne-single-listing-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <!-- Single Listing Content -->
                <div class="col-12 col-lg-8">
                    <div class="single-listing-content">
                        <div class="single-listing-nav">
                            <nav>
                                <ul id="listingNav">
                                    <li class="active"><a href="#overview">소개글</a></li>
                                    <li><a href="#menu">숙소</a></li>
                                    <li><a href="#review">후기</a></li>
                                    <li><a href="#lomap">지도</a></li>
                                </ul>
                            </nav>
                        </div>

                        <div class="overview-content mt-50" id="overview">
                        	<p>${camp.campIntro}</p>
                        	<div class="row mt-5">
                        		<!-- 편의시설 목록 -->
                        		<!-- 반복문 -->
                        		<c:set var="facility" value="${camp.campFacility}"/>
                                <c:set var="facilityList" value="${fn:split(facility,',')}"/>
                                <c:forEach items="${facilityList}" var="facilityaoao">
                                       	  <div class="col-6">
                                    <label class="custom-control custom-checkbox mb-3">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-indicator"></span>

                                       	<span class="custom-control-description">${facilityaoao}</span>
                                    </label>
                                </div>
                                 </c:forEach>

                            </div>
                        </div>

                        <div class="listing-menu-area mt-100" id="menu">
                        	<h4>숙소</h4>
                        		<!-- 숙소 목록 -->
                        		<c:forEach items="${camp.residenceList}" var="resi">
                        			<div class="single-listing-menu d-flex justify-content-between">
	                        			<!-- Listing Menu Title -->
	                        			<div class="listing-menu-title">
	                        				<h6>${resi.resiName}</h6>
		                        			<div>
			                        			<span class="listing-resi-img">
			                        				<img alt="" src="${pageContext.request.contextPath}/img/seryun/${fn:split(resi.resiFilename, ',')[0]}">
			                        			</span>
			                        			<p class="listing-resi-intro">${resi.resiIntro}</p>
		                        			</div>
	                        			</div>
                        	
			                        	<!-- Listing Menu Price -->
			                        	<div class="listing-menu-price">
			                        		<h6><fmt:formatNumber value="${resi.resiPrice}" pattern="###,###"/></h6>
			                        		<button class="reservationBtn" type="button" style="margin-top: 80px">예약하기</button>
			                        		<input type="hidden" name="resiNo" value="${resi.resiNo}">
			                        	</div>
		                        	</div>
		                        </c:forEach>
                        	<a href="#" class="btn dorne-btn mt-50">더보기</a>
                        </div>

                        <div class="listing-reviews-area mt-100" id="review">
                            <h4>후기</h4>
                            
                            <c:forEach items="${boardList}" var="board">
                            	<c:set value="${fn:split(board.boardFileName,',')}" var="fileNames"/>
                            	<div class="single-review-area">
	                                <div class="reviewer-meta d-flex align-items-center">
	                                    <img src="${pageContext.request.contextPath}/img/${fileNames[0]}"  alt="">
	                                    <div class="reviewer-content">
	                                        <div class="review-title-ratings d-flex justify-content-between">
	                                            <h5>“${board.boardTag}”</h5>
	                                            <div class="ratings">
	                                            	<c:forEach items="${fileNames}" var="fileName">
	                                            		<img src="${pageContext.request.contextPath}/img/${fileName}" alt="">
	                                            	</c:forEach>
	                                            </div>
	                                        </div>
	                                        <p>${board.boardContent}</p>
	                                    </div>
	                                </div>
	                                <div class="reviewer-name">
	                                    <h6>${board.member.memberNickname}</h6>
	                                    <p>${board.boardDate}</p>
	                                </div>
	                            </div>                            
                            </c:forEach>

                        </div>

                        <!-- 지도 -->
                        <div class="location-on-map mt-50" id="lomap">
                        	<h4>지도</h4>
                        	<div class="location-map">
                        		<div id="map" style="width: 100%; height: 350px;"></div>
                        	</div>
                        </div>

                    </div>
                </div>

                <!-- Listing Sidebar -->
                <div class="col-12 col-md-8 col-lg-4">
                    <div class="listing-sidebar">

                        <!-- Listing Verify -->
                        <div class="listing-verify" style="border: 1px solid #DEE2E7;">
                            <div class="listing-title">
                            
                            	<!-- 캠핏 -->
                            	<div class="sc-cZwWEu gPtEgF">
                            		<div class="sc-iFwKgL ddSshY">
                            			<h2 class="sc-cOFTSb jBEnhQ typography-footnote typography-regular">오토캠핑</h2>
                            			<h1 id="campName" class="sc-cOFTSb imhVFu typography-title3 typography-bold">${camp.campName}</h1>
                            			<a target="_blank" href="https://map.kakao.com/?q=${camp.campAddr}" rel="noreferrer"class="sc-kTvvXX jmHfJv">
	                                    	<svg width="16" height="16" viewBox="0 0 24 24" fill="#1A9EFE" xmlns="http://www.w3.org/2000/svg"class="left-icon">
	                                    		<path fill-rule="evenodd" clip-rule="evenodd" 
	                                        		d="M13.8861 20.677C16.2513 18.2327 20 13.7649 20 10C20 5.58172 16.4183 2 12 2C7.58172 2 4 5.58172 4 10C4 13.7649 7.74868 18.2327 10.1139 20.677C11.159 21.757 12.841 21.757 13.8861 20.677ZM12 12C13.1046 12 14 11.1046 14 10C14 8.89543 13.1046 8 12 8C10.8954 8 10 8.89543 10 10C10 11.1046 10.8954 12 12 12Z" 
	                                        		fill="current"></path>
	                                    	</svg>
	                                    	<span id="campAddr" class="sc-cOFTSb WfkUw typography-body2 typography-medium">${camp.campAddr}</span>
	                                    	<svg width="20" height="20" viewBox="0 0 24 24" fill="#4E5354" xmlns="http://www.w3.org/2000/svg"class="chevron-icon">
	                                    		<path fill-rule="evenodd" clip-rule="evenodd" 
	                                        		d="M9.77338 7.53033C10.0663 7.23744 10.5411 7.23744 10.834 7.53033L15.0767 11.773C15.3696 12.0659 15.3696 12.5407 15.0767 12.8336L10.834 17.0763C10.5411 17.3692 10.0663 17.3692 9.77338 17.0763C9.48049 16.7834 9.48049 16.3085 9.77338 16.0156L13.4857 12.3033L9.77338 8.59099C9.48049 8.2981 9.48049 7.82322 9.77338 7.53033Z" 
	                                        		fill="current"></path>
	                                    	</svg>
	                                    </a>
	                                    <button id="copyBtn" class="sc-kgUAyh iqrlSM typography-body2 typography-bold">복사하기</button>
                            		</div>
                            		
                            		<div>
                            			<span class="sc-cOFTSb cfBlSr typography-body2 typography-medium">
                            				<svg width="16" height="16"viewBox="0 0 24 24"fill="#FFD53D"xmlns="http://www.w3.org/2000/svg"class="left-icon">
                            					<g clip-path="url(#clip0_12347_27003)">
                            						<path fill-rule="evenodd" clip-rule="evenodd" 
                            							d="M8.09468 15.9592L11.3326 19.1971C13.7108 21.5753 17.2092 22.035 19.6336 20.447C19.8531 20.3337 20.0562 20.1872 20.2365 20.0069L20.7046 19.5388C21.5256 18.7178 21.2836 17.2146 20.1922 16.3554L17.4747 14.216C16.5822 13.5134 15.4206 13.4902 14.7492 14.1615L14.0702 14.8405C13.0525 14.1964 12.0943 13.4834 11.3324 12.7215C10.5704 11.9596 9.85744 11.0013 9.21336 9.98364L9.89236 9.30464C10.5637 8.6333 10.5405 7.47169 9.83784 6.57917L7.69848 3.86166C6.83927 2.77025 5.33605 2.52827 4.5151 3.34922L4.047 3.81732C3.86667 3.99766 3.72015 4.20079 3.60687 4.4203C2.01884 6.84469 2.47852 10.343 4.85677 12.7213L8.09468 15.9592Z" 
                            							fill="current"></path>
                            					</g>
                            					<defs>
                            						<clipPath id="clip0_12347_27003">
                            							<rect width="24" height="24" fill="white"></rect>
                            						</clipPath>
                            					</defs>
                            				</svg>${camp.campPhone}
                            			</span>
                            		</div>
                            		
                            		<c:set var="checkInDate" value="20${fn:split(checkIn,'/')[0]}-${fn:split(checkIn,'/')[1]}-${fn:split(checkIn,'/')[2]}"/>
                                    <fmt:parseDate var="parsedDate" value="${checkInDate}" pattern="yyyy-MM-dd"/>
                                    <c:set var="checkOutDate" value="20${fn:split(checkOut,'/')[0]}-${fn:split(checkOut,'/')[1]}-${fn:split(checkOut,'/')[2]}"/>
                                    <fmt:parseDate var="parsedOutDate" value="${checkOutDate}" pattern="yyyy-MM-dd"/>
                                    
                            		<div>
                            		<section class="sc-eFuaqX innHcv sc-fQnBjv cPDpkJ">
                                                <div class="sc-fAPzgY fKgEtY">
                                                    <div class="sc-iciGqv duLNAF">
                                                        <h5 class="sc-eCstlR kZysRf sc-hnSKda cWgHbh" type="NORMAL_SMALL">체크인</h5>
                                                        <p class="sc-eCstlR cPIeWE" type="NORMAL_MEDIUM"><fmt:formatDate value="${parsedDate}" pattern="MM월 dd일 (E)"/>
                                                        ${camp.campCheckin}</p>
                                                    </div>
                                                    <span class="sc-lrvPq cDWtwr">${fn:split(checkOut,'/')[2]-fn:split(checkIn,'/')[2]}박</span>
                                                    <div class="sc-iciGqv duLNAF">
                                                        <h5 class="sc-eCstlR kZysRf sc-hnSKda cWgHbh" type="NORMAL_SMALL">체크아웃</h5>
                                                        <p class="sc-eCstlR cPIeWE" type="NORMAL_MEDIUM"><fmt:formatDate value="${parsedOutDate}" pattern="MM월 dd일 (E)"/>
                                                            ${camp.campCheckout }</p>
                                                    </div>
                                                </div>
                                                <ul class="sc-bWcrqT bPuRoh sc-dJbuOE kyacOP">
                                                    <li class="sc-hymteE cwmltB">
                                                        <p class="sc-eCstlR kZysRf sc-cgwasx eqTIAy" type="NORMAL_SMALL">성인</p>
                                                        <p class="sc-eCstlR kZysRf sc-kTLXcG dpOkRE" type="NORMAL_SMALL" id="reservPeople">${resiPeople}명</p>
                                                    </li>
                                                </ul>
                                            </section>
                            		</div>
                            		
                            	</div>
                            </div>
                        </div>
                        
                        <!-- 복사하기 애니메이션 -->
                        <div class="sc-eXBvqI jVbyiQ" id="modal">
                        	<div class="sc-fmrZth cXICfK none">
                        		<svg width="32px" height="32px" viewBox="0 0 24 24" fill="#FFFFFF" xmlns="http://www.w3.org/2000/svg">
                        			<path fill-rule="evenodd" clip-rule="evenodd" d="M19.5303 6.46967C19.8232 6.76256 19.8232 7.23744 19.5303 7.53033L9.53033 17.5303C9.38968 17.671 9.19891 17.75 9 17.75C8.80109 17.75 8.61032 17.671 8.46967 17.5303L3.96967 13.0303C3.67678 12.7374 3.67678 12.2626 3.96967 11.9697C4.26256 11.6768 4.73744 11.6768 5.03033 11.9697L9 15.9393L18.4697 6.46967C18.7626 6.17678 19.2374 6.17678 19.5303 6.46967Z" fill="current"></path>
                        		</svg>
                        		<span>복사완료</span>
                        	</div>
                        </div>

                        <!-- Opening Hours Widget -->
                        <div class="opening-hours-widget mt-50">
                            <h6>Opening Hours</h6>
                            <ul class="opening-hours">
                                <li>
                                    <p>${camp.campCheckin} - ${camp.campCheckout }</p>
                                </li>
                            </ul>
                        </div>

                        <!-- Author Widget -->
                       <!--  <div class="author-widget mt-50 d-flex align-items-center">
                            <img src="img/clients-img/1.jpg" alt="">
                            <div class="authors-name">
                                <a href="#">James Smith</a>
                                <p>The Author</p>
                            </div>
                        </div>

                        Contact Form
                        <div class="contact-form contact-form-widget mt-50">
                            <h6>Contact Business</h6>
                            <form action="#">
                                <div class="row">
                                    <div class="col-12">
                                        <input type="text" name="name" class="form-control" placeholder="Your Name">
                                    </div>
                                    <div class="col-12">
                                        <input type="email" name="email" class="form-control" placeholder="Email Address">
                                    </div>
                                    <div class="col-12">
                                        <textarea name="message" class="form-control" id="Message" cols="30" rows="10" placeholder="Your Message"></textarea>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn dorne-btn">Send</button>
                                    </div>
                                </div>
                            </form>
                        </div> -->

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Single Listing Area End ***** -->
    
<!-- jQuery-2.2.4 js -->
<script src="${pageContext.request.contextPath}/dorne-master/js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="${pageContext.request.contextPath}/dorne-master/js/bootstrap/popper.min.js"></script>
<!-- Bootstrap-4 js -->
<script src="${pageContext.request.contextPath}/dorne-master/js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins js -->
<script src="${pageContext.request.contextPath}/dorne-master/js/others/plugins.js"></script>
<!-- Kakao Maps js -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=507651c271794aae6b448c4df48e74f3&libraries=services,clusterer,drawing"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    var addr = document.getElementById('campAddr');
    var campName = document.getElementById('campName').innerText;
    var str = '<div style="width:150px;text-align:center;padding:6px 0;">'+campName+'</div>';

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(addr.innerText, function (result, status) {

        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: str
            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        }
    });
</script>

<!-- Active JS -->
<script src="${pageContext.request.contextPath}/dorne-master/js/active.js"></script>
</body>

</html>