<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<!-- banner part start-->
    <section class="banner_part" style="">
        <div class="container" alt="main_banner">
             
        </div>
    </section>
    <!-- banner part start-->

    <!-- 캠핑장예약검색 start-->
    <section class="booking_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="booking_content">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="hotel" role="tabpanel" aria-labelledby="hotel-tab">
                                <div class="booking_form">
                                    <form action="#">
                                        <div class="form-row">
                                            <div class="form_colum" style="width: 260px;">
                                                <div class="mt">
                                                    <input type="text" name="first_name" placeholder="지역명, 캠핑장명 검색" onfocus="this.placeholder = ''" onblur="this.placeholder = '지역명, 캠핑장명 검색'" required="" class="single-input-primary" style="padding: 4px 20px 3px 20px; color:#f7612f;">
                                                </div>
                                            </div>

                                            <div class="form_colum">
                                                <input id="datepicker_1" placeholder="체크인 날짜">
                                            </div>
                                            <div class="form_colum">
                                                <input id="datepicker_2" placeholder="체크아웃 날짜">
                                            </div>
                                            <div class="form_colum" style="width: 100px;">
                                                <select class="nc_select" >
                                                    <option selected>인원 </option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                </select>
                                            </div>
                                            <div class="form_btn">
                                                <a href="#" class="btn_1">search</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 캠핑장예약검색 end-->

    <!--주간 펫츠고 인기순 영역-->
    <section class="top_place section_padding" style="padding-top: 240px;">
        <div class="container">
             <span style="color: #25483a; font-family: SCDream5; font-size: 30px;">이번주 펫츠GO PICK!</span>

            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                        <img src="${pageContext.request.contextPath}/img/single_place_1.png" alt="" style="border-radius: 6px;">
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                <a href="#"><h3>경기도 캠핑장01</h3></a>
                                <p>경기도, 수원시</p>
                                <div class="place_review">
                                    <span>후기(5)</span>
                                </div>
                            </div>
                              <div class="details_icon text-right">
                                <i class="ti-share" alt="스크랩북"></i>
                              </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                     <div class="single_place">
                        <img src="${pageContext.request.contextPath}/img/single_place_2.png" alt="" style="border-radius: 6px;">

                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                <a href="#"><h3>경기도 캠핑장02</h3></a>
                                <p>경기도, 가평시</p>
                                <div class="place_review">
                                    <span>후기(105)</span>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <i class="ti-share" alt="스크랩북"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                        <img src="${pageContext.request.contextPath}/img/single_place_3.png" alt="" style="border-radius: 6px;">
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                <a href="#"><h3>경기도 캠핑장03</h3></a>
                                <p>경기도, 포천시</p>
                                <div class="place_review">
                                    <span>후기(10)</span>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <i class="ti-share" alt="스크랩북"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                   <div class="single_place">
                        <img src="${pageContext.request.contextPath}/img/single_place_4.png" alt="" style="border-radius: 6px;">
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                <a href="#"><h3>경기도 캠핑장04</h3></a>
                                <p>경기도, 용인시</p>
                                <div class="place_review">
                                    <span>후기(12)</span>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <i class="ti-share" alt="스크랩북"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                        <img src="${pageContext.request.contextPath}/img/single_place_1.png" alt="" style="border-radius: 6px;">
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                <a href="#"><h3>경기도 캠핑장05</h3></a>
                                <p>경기도, 화성시</p>
                                <div class="place_review">
                                    <span>후기(8)</span>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <i class="ti-share" alt="스크랩북"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                     <div class="single_place">
                        <img src="${pageContext.request.contextPath}/img/single_place_2.png" alt="" style="border-radius: 6px;">
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                <a href="#"><h3>경기도 캠핑장06</h3></a>
                                <p>경기도, 의왕시</p>
                                <div class="place_review">
                                    <span>후기(16)</span>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <i class="ti-share" alt="스크랩북"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 주간 펫츠고 인기순 End-->

    <!--지도로 보는 캠핑장 kakao map API -->
    <section class="event_part section_padding" style="background-image: none;">
        <div class="container">
         <span style="color: #25483a; font-family: SCDream5; font-size: 30px;">한눈에 보는 경기도 캠핑장</span>
            <div class="row">
               <div class="map_wrap" style="justify-content: center;">
                <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden; margin-top:10px;"></div>
                <div id="menu_wrap" class="bg_white">
                    <div class="option">
                        <div>
                            <form onsubmit="searchPlaces(); return false;">
                                키워드 : <input type="text" value="경기도 캠핑장" id="keyword" size="15"> 
                                <button type="submit">검색하기</button> 
                            </form>
                        </div>
                    </div>
                    <hr>
                    <ul id="placesList"></ul>
                    <div id="pagination"></div>
                </div>
            </div>
        </div>
    </div>

        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7c3557ac02cfc53e51c8d41f199888a&libraries=services"></script>
        <script>
        // 마커를 담을 배열입니다
        var markers = [];

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };  

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 

        // 장소 검색 객체를 생성합니다
        var ps = new kakao.maps.services.Places();  

        // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({zIndex:1});

        // 키워드로 장소를 검색합니다
        searchPlaces();

        // 키워드 검색을 요청하는 함수입니다
        function searchPlaces() {

            var keyword = document.getElementById('keyword').value;

            if (!keyword.replace(/^\s+|\s+$/g, '')) {
                alert('키워드를 입력해주세요!');
                return false;
            }

            // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
            ps.keywordSearch( keyword, placesSearchCB); 
        }

        // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
        function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {

                // 정상적으로 검색이 완료됐으면
                // 검색 목록과 마커를 표출합니다
                displayPlaces(data);

                // 페이지 번호를 표출합니다
                displayPagination(pagination);

            } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

                alert('검색 결과가 존재하지 않습니다.');
                return;

            } else if (status === kakao.maps.services.Status.ERROR) {

                alert('검색 결과 중 오류가 발생했습니다.');
                return;

            }
        }

        // 검색 결과 목록과 마커를 표출하는 함수입니다
        function displayPlaces(places) {

            var listEl = document.getElementById('placesList'), 
            menuEl = document.getElementById('menu_wrap'),
            fragment = document.createDocumentFragment(), 
            bounds = new kakao.maps.LatLngBounds(), 
            listStr = '';
            
            // 검색 결과 목록에 추가된 항목들을 제거합니다
            removeAllChildNods(listEl);

            // 지도에 표시되고 있는 마커를 제거합니다
            removeMarker();
            
            for ( var i=0; i<places.length; i++ ) {

                // 마커를 생성하고 지도에 표시합니다
                var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                    marker = addMarker(placePosition, i), 
                    itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                // LatLngBounds 객체에 좌표를 추가합니다
                bounds.extend(placePosition);

                // 마커와 검색결과 항목에 mouseover 했을때
                // 해당 장소에 인포윈도우에 장소명을 표시합니다
                // mouseout 했을 때는 인포윈도우를 닫습니다
                (function(marker, title) {
                    kakao.maps.event.addListener(marker, 'mouseover', function() {
                        displayInfowindow(marker, title);
                    });

                    kakao.maps.event.addListener(marker, 'mouseout', function() {
                        infowindow.close();
                    });

                    itemEl.onmouseover =  function () {
                        displayInfowindow(marker, title);
                    };

                    itemEl.onmouseout =  function () {
                        infowindow.close();
                    };
                })(marker, places[i].place_name);

                fragment.appendChild(itemEl);
            }

            // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
            listEl.appendChild(fragment);
            menuEl.scrollTop = 0;

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
            map.setBounds(bounds);
        }

        // 검색결과 항목을 Element로 반환하는 함수입니다
        function getListItem(index, places) {

            var el = document.createElement('li'),
            itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                        '<div class="info">' +
                        '   <h5>' + places.place_name + '</h5>';

            if (places.road_address_name) {
                itemStr += '    <span>' + places.road_address_name + '</span>' +
                            '   <span class="jibun gray">' +  places.address_name  + '</span>';
            } else {
                itemStr += '    <span>' +  places.address_name  + '</span>'; 
            }
                         
              itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                        '</div>';           

            el.innerHTML = itemStr;
            el.className = 'item';

            return el;
        }

        // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
        function addMarker(position, idx, title) {
            var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                imgOptions =  {
                    spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                    spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                    offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                },
                markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                    marker = new kakao.maps.Marker({
                    position: position, // 마커의 위치
                    image: markerImage 
                });

            marker.setMap(map); // 지도 위에 마커를 표출합니다
            markers.push(marker);  // 배열에 생성된 마커를 추가합니다

            return marker;
        }

        // 지도 위에 표시되고 있는 마커를 모두 제거합니다
        function removeMarker() {
            for ( var i = 0; i < markers.length; i++ ) {
                markers[i].setMap(null);
            }   
            markers = [];
        }

        // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
        function displayPagination(pagination) {
            var paginationEl = document.getElementById('pagination'),
                fragment = document.createDocumentFragment(),
                i; 

            // 기존에 추가된 페이지번호를 삭제합니다
            while (paginationEl.hasChildNodes()) {
                paginationEl.removeChild (paginationEl.lastChild);
            }

            for (i=1; i<=pagination.last; i++) {
                var el = document.createElement('a');
                el.href = "#";
                el.innerHTML = i;

                if (i===pagination.current) {
                    el.className = 'on';
                } else {
                    el.onclick = (function(i) {
                        return function() {
                            pagination.gotoPage(i);
                        }
                    })(i);
                }

                fragment.appendChild(el);
            }
            paginationEl.appendChild(fragment);
        }

        // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
        // 인포윈도우에 장소명을 표시합니다
        function displayInfowindow(marker, title) {
            var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

            infowindow.setContent(content);
            infowindow.open(map, marker);
        }

         // 검색결과 목록의 자식 Element를 제거하는 함수입니다
        function removeAllChildNods(el) {   
            while (el.hasChildNodes()) {
                el.removeChild (el.lastChild);
            }
        }
        </script>
            </section>
    <!--지도로 보는 캠핑장 end-->

  
    <!--커뮤니티-->
    <section class="client_review section_padding">
        <div class="container">
            <div class="row ">
                <div class="col-xl-6">
                    <div class="section_tittle">
                         <span style="color: #ffecdc; font-family: SCDream5; font-size: 30px;">커뮤니티 인기 콘텐츠</span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="client_review_slider owl-carousel">
                       
                            <!-- 커뮤니티 게시글01-->
                              <div class="card">
                                <div class="card__header">
                                  <div class="header-in-card">
                                    <div class="header-in-card__share-and-like">
                                      <div class="share-block">
                                        <div class="share-block__share-icon"><span></span><span></span><span></span><span></span><span></span></div>
                                        <div class="share-block__facebook-icon" id="kakaotalk-sharing-btn" href="javascript:;"></div>                            
                                        <div class="share-block__twitter-icon"></div>
                                      </div>
                                      <div class="like-block">
                                        <div class="like-block__like-icon"></div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="card__body">
                                
                                
                                 
                                  <div class="card-tags"><a href="#" target="_blank" class="card-tags__item">Animals</a>
                                    <a href="#" target="_blank" class="card-tags__item">Dog</a>
                                    <a href="#" target="_blank" class="card-tags__item">Smiling</a>
                                    <a href="#" target="_blank" class="card-tags__item">Fluffy</a>
                                    <a href="#" target="_blank" class="card-tags__item">Awesome</a>
                                </div>
                                </div><img src="${pageContext.request.contextPath}/img/community_01.jpg" alt="" class="card__image">
                              </div>
                            <!-- 커뮤니티 게시글01 End -->
                            <!-- 커뮤니티 게시글02-->
                              <div class="card">
                                <div class="card__header">
                                  <div class="header-in-card">
                                    <div class="header-in-card__share-and-like">
                                      <div class="share-block">
                                        <div class="share-block__share-icon"><span></span><span></span><span></span><span></span><span></span></div>
                                        <div class="share-block__facebook-icon" id="kakaotalk-sharing-btn" href="javascript:;"></div>
                                        <div class="share-block__twitter-icon"></div>
                                      </div>
                                      <div class="like-block">
                                        <div class="like-block__like-icon"></div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="card__body">
                                 
                                  <div class="card-tags"><a href="#" target="_blank" class="card-tags__item">Animals</a>
                                    <a href="#" target="_blank" class="card-tags__item">Dog</a>
                                    <a href="#" target="_blank" class="card-tags__item">Smiling</a>
                                    <a href="#" target="_blank" class="card-tags__item">Fluffy</a>
                                    <a href="#" target="_blank" class="card-tags__item">Awesome</a>
                                </div>
                                </div><img src="${pageContext.request.contextPath}/img/community_02.jpg" alt="" class="card__image">
                              </div>
                            <!-- 커뮤니티 게시글02 End -->
                            <!-- 커뮤니티 게시글03-->
                              <div class="card">
                                <div class="card__header">
                                  <div class="header-in-card">
                                    <div class="header-in-card__share-and-like">
                                      <div class="share-block">
                                        <div class="share-block__share-icon"><span></span><span></span><span></span><span></span><span></span></div>
                                        <div class="share-block__facebook-icon" id="kakaotalk-sharing-btn" href="javascript:;"></div>
                                        <div class="share-block__twitter-icon"></div>
                                      </div>
                                      <div class="like-block">
                                        <div class="like-block__like-icon"></div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="card__body">
                                 
                                  <div class="card-tags"><a href="#" target="_blank" class="card-tags__item">Animals</a>
                                    <a href="#" target="_blank" class="card-tags__item">Dog</a>
                                    <a href="#" target="_blank" class="card-tags__item">Smiling</a>
                                    <a href="#" target="_blank" class="card-tags__item">Fluffy</a>
                                    <a href="#" target="_blank" class="card-tags__item">Awesome</a>
                                </div>
                                </div><img src="${pageContext.request.contextPath}/img/community_03.jpg" alt="" class="card__image">
                              </div>
                            <!-- 커뮤니티 게시글03 End -->
                            <!-- 커뮤니티 게시글04-->
                              <div class="card">
                                <div class="card__header">
                                  <div class="header-in-card">
                                    <div class="header-in-card__share-and-like">
                                      <div class="share-block">
                                        <div class="share-block__share-icon"><span></span><span></span><span></span><span></span><span></span></div>
                                        <div class="share-block__facebook-icon" id="kakaotalk-sharing-btn" href="javascript:;"></div>
                                        <div class="share-block__twitter-icon"></div>
                                      </div>
                                      <div class="like-block">
                                        <div class="like-block__like-icon"></div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="card__body">
                                 
                                  <div class="card-tags"><a href="#" target="_blank" class="card-tags__item">Animals</a>
                                    <a href="#" target="_blank" class="card-tags__item">Dog</a>
                                    <a href="#" target="_blank" class="card-tags__item">Smiling</a>
                                    <a href="#" target="_blank" class="card-tags__item">Fluffy</a>
                                    <a href="#" target="_blank" class="card-tags__item">Awesome</a>
                                </div>
                                </div><img src="${pageContext.request.contextPath}/img/community_04.jpg" alt="" class="card__image">
                              </div>
                            <!-- 커뮤니티 게시글04 End -->
                            <!-- 커뮤니티 게시글05-->
                              <div class="card">
                                <div class="card__header">
                                  <div class="header-in-card">
                                    <div class="header-in-card__share-and-like">
                                      <div class="share-block">
                                        <div class="share-block__share-icon"><span></span><span></span><span></span><span></span><span></span></div>
                                        <div class="share-block__facebook-icon" id="kakaotalk-sharing-btn" href="javascript:;"></div>
                                        <div class="share-block__twitter-icon"></div>
                                      </div>
                                      <div class="like-block">
                                        <div class="like-block__like-icon"></div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="card__body">
                                 
                                  <div class="card-tags"><a href="#" target="_blank" class="card-tags__item">Animals</a>
                                    <a href="#" target="_blank" class="card-tags__item">Dog</a>
                                    <a href="#" target="_blank" class="card-tags__item">Smiling</a>
                                    <a href="#" target="_blank" class="card-tags__item">Fluffy</a>
                                    <a href="#" target="_blank" class="card-tags__item">Awesome</a>
                                </div>
                                </div><img src="${pageContext.request.contextPath}/img/community_05.jpg" alt="" class="card__image">
                              </div>
                            <!-- 커뮤니티 게시글05 End -->
                      
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--커뮤니티 end-->

    <!--광고 배너 영역-->
    <section class="best_services section_padding">
        <div class="container">
             <h2>꼼꼼한 여행 준비를 위한 펫츠고 추천!</h2>
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <div class="single_ihotel_list">
                        <a href="#"><img src="${pageContext.request.contextPath}/img/services_1.png" alt="반려견보험" style="border-radius: 6px;"></a>
                    반려견보험
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_ihotel_list">
                        <a href="#"><img src="${pageContext.request.contextPath}/img/services_2.png" alt="운전자보험" style="border-radius: 6px;"></a>
                    운전자보험
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_ihotel_list">
                        <a href="#"><img src="${pageContext.request.contextPath}/img/services_3.png" alt="배상보험" style="border-radius: 6px;"></a>
                    배상보험
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_ihotel_list">
                       <a href="#"><img src="${pageContext.request.contextPath}/img/services_4.png" alt="캠핑장비추천" style="border-radius: 6px;"></a>
                       캠핑장비추천
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--광고영역배너 End -->
	
	
</body>
</html>