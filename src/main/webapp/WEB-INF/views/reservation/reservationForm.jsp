<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet's Go</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/haewon/reservationForm.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/haewon/font.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script> 
<script type="text/javascript">
	$(function() {
		$("#reserve_depth_1").click(function() {
			/* 상품명 */
			let campName = $("#campName").text();
			let resiName = $("#resiName").text();
			let camp_resi = campName+"-"+resiName;
			
			/* 총 가격 */
			let total_Price = $("#totol_price").text();
			total_Price = total_Price.replace('원', '');
			total_Price = total_Price.split(',');
			price = total_Price[0]+total_Price[1];

			/* 전화번호 */
			let campPhone = $("#campPhone").val();
			campPhone = campPhone.split('-');
			let phone = campPhone[0]+campPhone[1]+campPhone[2];
			
			var IMP = window.IMP;
			IMP.init('imp27370044');
			IMP.request_pay({
				pg : 'kakaopay',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : camp_resi,
				amount : price,
				buyer_tel : phone
			}, function(rsp) {
				if(rsp.success) {
					alert(11);
				} else {
					var msg = rsp.error_msg;
					alert(msg);
				}
			});
		});
		
		/* radio css 변경 */
		$("#paymentLists").click(function() {
			let className = $("#iconradio").attr('class');
			if(className==='sc-gvPAUg fbvmiQ') {
				$('#iconradio').attr('class', 'sc-cVUNPX brdeOY');
			} else {
				$('#iconradio').attr('class', 'sc-gvPAUg fbvmiQ');
			}
		});

		/* checkbox css 변경 */
		$('.fpAZGY').click(function() {
			let box = $('#termsAccepted');
			let boxAll = $(".sisisisi");
			let className = box.prev().attr('class');
			
			if(box.is(":checked")) {
				box.prev().attr('class', 'sc-dYzmtA dwohaZ');
				boxAll.parent().attr('class', 'sc-ezrnTI VKDJw');
				box.prop("checked", false);
				boxAll.prop("checked", false);
			} else {
				box.prev().attr('class', 'sc-dYzmtA dcApxe');
				boxAll.parent().attr('class', 'sc-ezrnTI bEVjpf');
				box.prop("checked", true);
				boxAll.prop("checked", true);
			}
		});
		
		$(".gjYalP").click(function() {
			let box = $(this).children().children().children().children().children();
			if(box.is(":checked")) {
				box.parent().attr('class', 'sc-ezrnTI VKDJw');
				box.prop("checked", false);
			} else {
				box.parent().attr('class', 'sc-ezrnTI bEVjpf');
				box.prop("checked", true);
			}
		});
		
		$('.status').click(function() {
			let box = $(this).children().children().eq(1);
			if(box.is(":checked")) {
				box.prev().attr('class', 'sc-dYzmtA dwohaZ');
				box.prop("checked", false);
			} else {
				box.prev().attr('class', 'sc-dYzmtA dcApxe');
				box.prop("checked", true);
			}
		});
		
		
		/* 
		[요약 설명]
		1. window.onload : html의 로딩이 끝난 후에 시작합니다 (이미지, 영상 등 모두 로드 완료 후 실행됨)    	
		2. window.onbeforeunload : 브라우저 새로 고침 및 종료 이벤트를 감지합니다
		*/
		/* window.onbeforeunload = function() {
			console.log("[window onbeforeunload] : [start]");
			console.log("");
			$.ajax({
				url : '/reservation/test',
				type : 'post',
				dataType : 'text',
				success : function (data) {
					alert(11);
				},
				error : function (err) {
					alert(err);
				}
			});
			return "브라우저를 종료하시겠습니까?";
		}; */
	});
</script>
</head>
<body style="overflow: auto; background-color: rgb(238, 238, 238);">
<div id="app">
    <div class="sc-bcmZex gteUcj">
        <main id="main" class="sc-eARyco KFAvO">
            <main class="sc-hrKtKx bCasfL">
                <div id="topScroll">
                    <form id="hotel-order" class="sc-gYfxtZ homUxT">
                        <fieldset form="hotel-order">
                            <legend>현재 폼에선 고객님이 선택하신 호텔을 결제할 수 있습니다</legend>
                            <ul role="list" class="sc-aAgHk geylbQ">
                                <section class="sc-eapPAy fyqDSB">
                                    <ul class="sc-jnrPYG eLYxSG">
                                    
                                    	<!-- 스케줄관리 -->
                                        <li role="listitem">
                                            <div class="sc-iKFwRF dVSHzy sc-cclajh gGZSfC">
                                                <i class="sc-crrszt etqBmk sc-cNageQ iFaNVZ sc-jOFsKT iFSEcX"></i>
                                                <p class="sc-eCstlR cPIeWE sc-bXOijO kVwekS" type="NORMAL_MEDIUM">
                                                    00:59:32 제한 시간 이내에 결제 가능
                                                </p>
                                            </div>
                                        </li>
                                        
                                        <li role="listitem">
                                            <section class="sc-kEBlUt dkxNuU">
                                                <section class="sc-eFuaqX gclven sc-eFWBRL hxbKAF">
                                                    <div class="sc-jTyylJ iytynw">
                                                        <h3 class="sc-eCstlR bcvgNe" type="NORMAL_LARGE">예약자 정보</h3>
                                                        <button class="sc-jlIlqL emvdap" type="button" style="padding: 0px; color: rgb(255, 55, 92);">
                                                            로그인
                                                            <div class="sc-iWRHom cJdOEe">
                                                                <i class="sc-crrszt bMPAFE sc-tYqdw drHvKW"></i>
                                                            </div>
                                                        </button>
                                                    </div>
                                                    <div data-focus-guard="true" tabindex="-1" style="width: 1px; height: 0px; padding: 0px; overflow: hidden; position: fixed; top: 1px; left: 1px;"></div>
                                                    <div data-focus-guard="true" tabindex="-1" style="width: 1px; height: 0px; padding: 0px; overflow: hidden; position: fixed; top: 1px; left: 1px;"></div>
                                                    <div data-focus-lock-disabled="disabled">
                                                        <div class="sc-dJzHlK hmHTCZ">
                                                            <label for="email-auto-injection-prevent-dummy" style="overflow: hidden;">
                                                                <input type="email"
                                                                       id="email-auto-injection-prevent-dummy"
                                                                       name="email-auto-injection-prevent-dummy"
                                                                       inputmode="email"
                                                                       spellcheck="false" autocomplete="off"
                                                                       autocapitalize="off" autocorrect="off"
                                                                       tabindex="-1" class="sc-ekbpNA drSUhD">
                                                            </label>
                                                            <div class="sc-bAffKu gaChro sc-kkjtCC dBlGXQ">
                                                                <label for="email" title="이메일" class="sc-bxnjHY gnmuIc">
                                                                    <i class="sc-crrszt jLdeKt sc-fkubCs gbBWBW"></i>이메일
                                                                </label>
                                                                <div class="sc-jVKKMF keJGhf">
                                                                    <div class="sc-jYCGPb eLPgDl input">
                                                                        <div class="sc-Qpmqz kFeFTm">
                                                                            <input
                                                                                    placeholder="Pet's_Go@naver.com"
                                                                                    class="sc-dHnuKO ikCiJV input_error"
                                                                                    type="email" maxlength="50"
                                                                                    minlength="0" tabindex="0"
                                                                                    id="email"
                                                                                    name="user.email" autocorrect="off"
                                                                                    autocapitalize="off"
                                                                                    autocomplete="off"
                                                                                    spellcheck="false"
                                                                                    aria-autocomplete="none"
                                                                                    inputmode="email" value="">
                                                                            <i class="sc-crrszt etqBmk sc-jcRCNh gnFHpz"></i>
                                                                        </div>
                                                                        <div class="sc-fnlXEO cCLzKl"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="sc-bAffKu gaChro sc-kkjtCC dBlGXQ">
                                                                <label for="koreanFamilyName" title="한글 이름" class="sc-bxnjHY gnmuIc">
                                                                    <i class="sc-crrszt jLdeKt sc-fkubCs gbBWBW"></i>한글 이름
                                                                </label>
                                                                <div class="sc-jVKKMF keJGhf">
                                                                    <div class="sc-jYCGPb eLPgDl input">
                                                                        <div class="sc-Qpmqz kFeFTm">
                                                                            <input
                                                                                placeholder="한글 성"
                                                                                class="sc-dHnuKO ikCiJV input_error"
                                                                                type="text" maxlength="50" minlength="0"
                                                                                tabindex="0" id="koreanFamilyName"
                                                                                name="user.krFamilyName"
                                                                                autocorrect="off" autocapitalize="off"
                                                                                autocomplete="off" spellcheck="false"
                                                                                aria-autocomplete="none"
                                                                                inputmode="text" value="">
                                                                            <i class="sc-crrszt etqBmk sc-jcRCNh gnFHpz"></i>
                                                                        </div>
                                                                        <div class="sc-fnlXEO cCLzKl"></div>
                                                                    </div>
                                                                    <div class="sc-jYCGPb eLPgDl input">
                                                                        <div class="sc-Qpmqz kFeFTm">
                                                                            <input
                                                                                placeholder="한글 이름"
                                                                                class="sc-dHnuKO ikCiJV input_error"
                                                                                type="text" tabindex="0"
                                                                                id="koreanGivenName"
                                                                                name="user.krGivenName"
                                                                                autocorrect="off" autocapitalize="off"
                                                                                autocomplete="off" spellcheck="false"
                                                                                aria-autocomplete="none"
                                                                                inputmode="text" value="">
                                                                            <i class="sc-crrszt etqBmk sc-jcRCNh gnFHpz"></i>
                                                                        </div>
                                                                        <div class="sc-fnlXEO ePMXNo"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="sc-bAffKu gaChro sc-kkjtCC dBlGXQ">
                                                                <label for="engLastName" title="영문 이름" class="sc-bxnjHY gnmuIc">
                                                                    <i class="sc-crrszt jLdeKt sc-fkubCs gbBWBW"></i>영문 이름
                                                                </label>
                                                                <div class="sc-jVKKMF keJGhf">
                                                                    <div class="sc-jYCGPb eLPgDl input">
                                                                        <div class="sc-Qpmqz kFeFTm">
                                                                            <input
                                                                                placeholder="영문 성"
                                                                                class="sc-dHnuKO ikCiJV input_error"
                                                                                type="text" maxlength="50" minlength="0"
                                                                                tabindex="0" id="engLastName"
                                                                                name="user.lastName" autocorrect="off"
                                                                                autocapitalize="off" autocomplete="off"
                                                                                spellcheck="false"
                                                                                aria-autocomplete="none"
                                                                                inputmode="email" value="">
                                                                            <i class="sc-crrszt etqBmk sc-jcRCNh gnFHpz"></i>
                                                                        </div>
                                                                        <div class="sc-fnlXEO cCLzKl"></div>
                                                                    </div>
                                                                    <div class="sc-jYCGPb eLPgDl input">
                                                                        <div class="sc-Qpmqz kFeFTm">
                                                                            <input
                                                                                placeholder="영문 이름"
                                                                                class="sc-dHnuKO ikCiJV input_error"
                                                                                type="text" tabindex="0"
                                                                                id="engFirstName" name="user.firstName"
                                                                                autocorrect="off" autocapitalize="off"
                                                                                autocomplete="off" spellcheck="false"
                                                                                aria-autocomplete="none"
                                                                                inputmode="email" value="">
                                                                            <i class="sc-crrszt etqBmk sc-jcRCNh gnFHpz"></i>
                                                                        </div>
                                                                        <div class="sc-fnlXEO ePMXNo"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="sc-bAffKu gaChro sc-kkjtCC dBlGXQ">
                                                                <label for="cellPhone" title="휴대폰" class="sc-bxnjHY gnmuIc">
                                                                    <i class="sc-crrszt jLdeKt sc-fkubCs gbBWBW"></i>휴대폰
                                                                </label>
                                                                <div class="sc-jVKKMF keJGhf">
                                                                    <div class="sc-jYCGPb eLPgDl input">
                                                                        <div class="sc-Qpmqz kFeFTm">
                                                                            <input
                                                                                placeholder="숫자만 입력해 주세요"
                                                                                class="sc-dHnuKO ikCiJV input_error"
                                                                                type="tel" maxlength="50" minlength="0"
                                                                                tabindex="0" id="cellPhone"
                                                                                name="user.phone" autocorrect="off"
                                                                                autocapitalize="off" autocomplete="off"
                                                                                spellcheck="false"
                                                                                aria-autocomplete="none" inputmode="tel"
                                                                                value="">
                                                                            <i class="sc-crrszt etqBmk sc-jcRCNh gnFHpz"></i>
                                                                        </div>
                                                                        <div class="sc-fnlXEO cCLzKl"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <p class="sc-eCstlR cPIeWE sc-emTlPW kCRssT sc-bvVdvH gqDTUc" type="NORMAL_MEDIUM"></p>
                                                        <button loading="0" type="submit" role="button" class="sc-eggMyH giyYyF sc-cHUBYa jSCCnv" disabled="">로그인</button>
                                                    </div>
                                                    <div data-focus-guard="true" tabindex="-1" style="width: 1px; height: 0px; padding: 0px; overflow: hidden; position: fixed; top: 1px; left: 1px;"></div>
                                                </section>
                                            </section>
                                        </li>
                                        
                                        <!-- 반려견 정보 -->
                                        <li role="listitem">
                                            <section class="sc-eFuaqX gclven">
                                                <div class="sc-JJYsw hAgyNZ">
                                                    <h3 class="sc-eCstlR bcvgNe" type="NORMAL_LARGE">반려견 정보</h3>
                                                    <div class="sc-eCjjWe bGoMZg sc-kEbmIj qmrJc">
                                                        <div style="color: inherit; font-weight: inherit; font-size: inherit;">
                                                            <label for="isSameGuest" tabindex="0" class="sc-irOPex kbQGyP">
                                                                <span class="sc-ezrnTI VKDJw">
                                                                    <input type="checkbox"
                                                                           name="user.isSameGuest"
                                                                           id="isSameGuest"
                                                                           tabindex="-1"
                                                                           role="checkbox">
                                                                </span>
                                                                <a class="sc-kBPahn jzkOjd">반려견 정보 불러오기</a>
                                                            </label>
                                                        </div>
                                                        <p class="sc-eJCack dJMrgY"></p>
                                                    </div>
                                                </div>
                                                
                                                <div class="sc-gLDLxu vUHhk">
                                                    <div class="sc-buMMbg fNnHOO">
                                                    
                                                    	<!-- 이름 -->
                                                        <div class="sc-bAffKu gaChro sc-fPppAf fRQMrR">
                                                            <label for="rooms[0].lastName" title="이름" class="sc-bxnjHY gnmuIc">
                                                                <i class="sc-crrszt jLdeKt sc-fkubCs gbBWBW"></i>이름
                                                            </label>
                                                            <div class="sc-jVKKMF keJGhf">
                                                                <div class="sc-jYCGPb eLPgDl input">
                                                                    <div class="sc-Qpmqz kFeFTm">
                                                                        <input
                                                                            placeholder="이름"
                                                                            class="sc-dHnuKO ikCiJV input_error"
                                                                            type="text" maxlength="50" minlength="0"
                                                                            tabindex="0" id="rooms[0].lastName"
                                                                            name="rooms[0].lastName" autocorrect="off"
                                                                            autocapitalize="off" autocomplete="off"
                                                                            spellcheck="false" aria-autocomplete="none"
                                                                            inputmode="email" value="">
                                                                        <i class="sc-crrszt etqBmk sc-jcRCNh gnFHpz"></i>
                                                                    </div>
                                                                    <div class="sc-fnlXEO cCLzKl"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                        <!-- 몸무게 -->
                                                        <div class="sc-bAffKu gaChro sc-fPppAf fRQMrR">
                                                            <label for="rooms[0].lastName" title="몸무게" class="sc-bxnjHY gnmuIc">
                                                                <i class="sc-crrszt jLdeKt sc-fkubCs gbBWBW"></i>몸무게
                                                            </label>
                                                            <div class="sc-jVKKMF keJGhf">
                                                                <div class="sc-jYCGPb eLPgDl input">
                                                                    <div class="sc-Qpmqz kFeFTm">
                                                                        <input
                                                                            placeholder="몸무게"
                                                                            class="sc-dHnuKO ikCiJV input_error"
                                                                            type="text" maxlength="50" minlength="0"
                                                                            tabindex="0" id="rooms[0].lastKg"
                                                                            name="rooms[0].lastName" autocorrect="off"
                                                                            autocapitalize="off" autocomplete="off"
                                                                            spellcheck="false" aria-autocomplete="none"
                                                                            inputmode="email" value="">
                                                                        <i class="sc-crrszt etqBmk sc-jcRCNh gnFHpz"></i>
                                                                    </div>
                                                                    <div class="sc-fnlXEO cCLzKl"></div>
                                                                </div>
                                                            </div>
                                                        </div> 
                                                        
                                                        <!-- 중성화수술여부 / 손해배상보험여부 -->
                                                        <div class="sc-bAffKu gaChro sc-fPppAf fRQMrR">
                                                            <label for="rooms[0].statsus" title="중성화수술여부 / 손해배상보험여부" class="sc-bxnjHY gnmuIc">
                                                                <i class="sc-crrszt jLdeKt sc-fkubCs gbBWBW"></i>중성화수술여부 / 손해배상보험여부
                                                            </label>
                                                            <div class="sc-hlWxgi frhqBu sc-fLkZIC fpAZGY">
                                                            	<div style="display: inline-block; margin-right: 10px;" class="status">
		                                                        	<label tabindex="0" class="sc-iitrMj hEDZFv">
			                                                            <span class="sc-dYzmtA dwohaZ"></span>
			                                                            <input tabindex="-1" type="checkbox" role="checkbox" name="termsAccepted.all">
			                                                            <div class="sc-gfHBtU jbvope">
			                                                                <span class="sc-eUWgZB eNBUVZ">중성화수술여부</span>
			                                                                <p class="sc-hxqEdz gAfJaM"></p>
		                                                          	  	</div>
		                                                        	</label>
		                                                        </div>
		                                                        <div style="display: inline-block;" class="status">
		                                                        	<label tabindex="0" class="sc-iitrMj hEDZFv">
			                                                            <span class="sc-dYzmtA dwohaZ"></span>
			                                                            <input tabindex="-1" type="checkbox" role="checkbox" name="termsAccepted.all">
			                                                            <div class="sc-gfHBtU jbvope">
			                                                                <span class="sc-eUWgZB eNBUVZ">손해배상보험여부</span>
			                                                                <p class="sc-hxqEdz gAfJaM"></p>
		                                                          	  	</div>
		                                                        	</label>
		                                                        </div>
		                                                    </div>
		                                                 </div> 

                                                    </div>
                                                </div>
                                            </section>
                                        </li>
                                        
                                        <li></li>
                                        
                                        <!-- *************** 결제 *************** -->
                                        <li role="listitem">
                                            <section class="sc-eFuaqX gclven sc-iiybfK csLJSh">
                                                <div class="sc-jeUVLL fZSFdR">
                                                    <h3 class="sc-eCstlR bcvgNe" type="NORMAL_LARGE">결제 방법</h3>
                                                </div>
                                                <ul class="sc-uuamo bRsXYu sc-gVqliQ btumok" id="paymentLists">
                                                    <li class="sc-cmhfgo hPqFOY">
                                                        <div class="sc-geEGrd giwHNF">
                                                            <div class="sc-dERszR YwQuk sc-iWBHJS eVhvzd" tabindex="0">
                                                                <input type="radio" name="payment.type" tabindex="-1" id="14" value="kakao">
                                                                <div id="iconradio" class="sc-gvPAUg fbvmiQ">
                                                                    <div></div>
                                                                </div>
                                                                <label for="14">
                                                                    <i class="sc-crrszt etqBmk sc-bzDzvL cEDcLE sc-bHBQji kKODeE"></i>
                                                                    <span class="sc-eCstlR duuteF sc-cDYKPj hSifoy" type="LIGHT_MEDIUM">카카오페이</span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <div class="sc-eueixo gliSHu sc-hRNfOR eQsCKi">
                                                    <p class="sc-eCstlR jpqOZC sc-jFEWv TcHLb" type="BOLD_MEDIUM"></p>
                                                </div>
                                            </section>
                                        </li>
                                        
                                        <li role="listitem">
                                            <section class="sc-eFuaqX innHcv" style="transition: none 0s ease 0s;">
                                                <div class="sc-eJFUuS ismojC">
                                                    <div class="sc-hlWxgi frhqBu sc-fLkZIC fpAZGY">
                                                        <div>
                                                        	<label tabindex="0" class="sc-iitrMj hEDZFv">
	                                                            <span class="sc-dYzmtA dwohaZ"></span>
	                                                            <input tabindex="-1" type="checkbox" role="checkbox" name="termsAccepted.all" id="termsAccepted">
	                                                            <div class="sc-gfHBtU jbvope">
	                                                                <span class="sc-eUWgZB eNBUVZ">전체 약관을 확인하고 결제에 동의합니다</span>
	                                                                <p class="sc-hxqEdz gAfJaM"></p>
                                                          	  </div>
                                                        	</label>
                                                        </div>
                                                    </div>
                                                    <div class="sc-hoVFIN gjYalP">
                                                        <div class="sc-eCjjWe kbGsZc sc-gHHUoD hjEcpi">
                                                            <div style="color: inherit; font-weight: inherit; font-size: inherit;">
                                                                <label tabindex="0" class="sc-irOPex kbQGyP">
                                                                    <span class="sc-ezrnTI VKDJw">
                                                                        <input type="checkbox" name="termsAccepted.service" tabindex="-1" role="checkbox"class="sisisisi">
                                                                    </span>
                                                                    <a class="sc-kBPahn jzkOjd">서비스이용약관(필수)</a>
                                                                </label>
                                                            </div>
                                                            <p class="sc-eJCack dJMrgY"></p>
                                                        </div>
                                                        <a tabindex="0" class="sc-iCdvFH NpVJE">자세히 보기</a>
                                                    </div>
                                                    <div class="sc-hoVFIN gjYalP">
                                                        <div class="sc-eCjjWe kbGsZc sc-gHHUoD hjEcpi">
                                                            <div style="color: inherit; font-weight: inherit; font-size: inherit;">
                                                                <label tabindex="0" class="sc-irOPex kbQGyP input_error">
                                                                    <span class="sc-ezrnTI VKDJw">
                                                                        <input type="checkbox" name="termsAccepted.thirdAgree" tabindex="-1" role="checkbox" class="sisisisi">
                                                                    </span>
                                                                    <a class="sc-kBPahn jzkOjd">개인정보제3자제공동의(필수)</a>
                                                                </label>
                                                            </div>
                                                            <p class="sc-eJCack dJMrgY"></p>
                                                        </div>
                                                        <a tabindex="0" class="sc-iCdvFH NpVJE">자세히 보기</a>
                                                    </div>
                                                    <div class="sc-hoVFIN gjYalP">
                                                        <div class="sc-eCjjWe kbGsZc sc-gHHUoD hjEcpi">
                                                            <div style="color: inherit; font-weight: inherit; font-size: inherit;">
                                                                <label tabindex="0" class="sc-irOPex kbQGyP">
                                                                    <span class="sc-ezrnTI VKDJw">
                                                                        <input type="checkbox" name="termsAccepted.privacy" tabindex="-1" role="checkbox" class="sisisisi">
                                                                    </span>
                                                                    <a class="sc-kBPahn jzkOjd">개인정보처리방침(필수)</a>
                                                                </label>
                                                            </div>
                                                            <p class="sc-eJCack dJMrgY"></p>
                                                        </div>
                                                        <a tabindex="0" class="sc-iCdvFH NpVJE">자세히 보기</a>
                                                    </div>
                                                    <div class="sc-hoVFIN gjYalP">
                                                        <div class="sc-eCjjWe kbGsZc sc-gHHUoD hjEcpi">
                                                            <div style="color: inherit; font-weight: inherit; font-size: inherit;">
                                                                <label tabindex="0" class="sc-irOPex kbQGyP">
                                                                    <span class="sc-ezrnTI VKDJw"><input type="checkbox" name="termsAccepted.promotion" tabindex="-1" role="checkbox" class="sisisisi"></span>
                                                                    <a class="sc-kBPahn jzkOjd">광고성정보수신동의(선택)</a>
                                                                </label>
                                                            </div>
                                                            <p class="sc-eJCack dJMrgY"></p>
                                                        </div>
                                                        <a tabindex="0" class="sc-iCdvFH NpVJE">자세히 보기</a>
                                                    </div>
                                                </div>
                                            </section>
                                        </li>
                                        <li role="listitem">
                                            <section class="sc-cYlfLE gOnOsS">
                                                <i class="sc-crrszt etqBmk sc-eeKVJR bOWsao"></i>
                                                <p class="sc-eCstlR duuteF" type="LIGHT_MEDIUM">
                                                <div>예약자 정보를 올바르게 입력했는지 확인해주세요.</div>
                                                </p>
                                            </section>
                                        </li>
                                        <li role="listitem">
                                            <section class="sc-eFuaqX bLcvwy sc-dwyexY MVOcR">
                                                <div class="sc-lkCfru jRYMQr">
                                                    <button class="sc-jlIlqL gfPcYi sc-hKEiJx egMFgE sc-dNDXdn fFgrpb" type="button">
                                                        <div>
                                                            <div class="sc-ieGRMn kJcKWB">
                                                                <p class="sc-eCstlR cPIeWE" type="NORMAL_MEDIUM">무료 취소</p>
                                                                <i class="sc-crrszt bMPAFE sc-eeKVJR gWSXvs sc-bMYRWI eojHFt"></i>
                                                            </div>
                                                            <div class="sc-chbAZy fYNrHG">12월 6일 (화) 전까지</div>
                                                        </div>
                                                    </button>
                                                    <div class="sc-cAwhgt gdXdaB">
                                                    	<input type="hidden"  id="campPhone" name="campPhone" value="${resi.camp.campPhone}">
                                                        <span class="sc-eCstlR bcvgNe sc-jXupuA dMIIFw" type="NORMAL_LARGE">1박</span>
                                                        <span class="sc-eCstlR WoNTC sc-bqqVGf bNtUdC" type="NORMAL_LARGEST" name="totalprice"><fmt:formatNumber value="${resi.resiPrice}" pattern="###,###원"/></span>
                                                        <button type="button" class="sc-jlIlqL fJYNoF sc-iNpdUm jiDwyR" id="reserve_depth_1" tabindex="0">결제하기</button>
                                                    </div>
                                                </div>
                                            </section>
                                        </li>
                                    </ul>
                                    <ul class="sc-dVBxmz fWIHRN">
                                        <li role="listitem">
                                            <section class="sc-eFuaqX innHcv sc-fQnBjv cPDpkJ">
                                                <section class="sc-Sdmup dzbhjS">
                                                    <h3 id="campName" class="sc-eCstlR fvjAAR" type="BOLD_LARGEST">${resi.camp.campName}</h3>
                                                    <p id="resiName" class="sc-eCstlR kCSdWV sc-hWiVVa ktKpVm" type="LARGE_NORMAL">${resi.resiName}</p>
                                                </section>
                                                <div class="sc-fAPzgY fKgEtY">
                                                    <div class="sc-iciGqv duLNAF">
                                                        <h5 class="sc-eCstlR kZysRf sc-hnSKda cWgHbh" type="NORMAL_SMALL">체크인</h5>
                                                        <p class="sc-eCstlR cPIeWE" type="NORMAL_MEDIUM">12월 8일 (목) 3:00 PM</p>
                                                    </div>
                                                    <span class="sc-lrvPq cDWtwr">1박</span>
                                                    <div class="sc-iciGqv duLNAF">
                                                        <h5 class="sc-eCstlR kZysRf sc-hnSKda cWgHbh" type="NORMAL_SMALL">체크아웃</h5>
                                                        <p class="sc-eCstlR cPIeWE" type="NORMAL_MEDIUM">12월 9일 (금) 11:00 AM</p>
                                                    </div>
                                                </div>
                                                <ul class="sc-bWcrqT bPuRoh sc-dJbuOE kyacOP">
                                                    <li class="sc-hymteE cwmltB">
                                                        <p class="sc-eCstlR kZysRf sc-cgwasx eqTIAy" type="NORMAL_SMALL">성인</p>
                                                        <p class="sc-eCstlR kZysRf sc-kTLXcG dpOkRE" type="NORMAL_SMALL">2명</p>
                                                    </li>
                                                    <li class="sc-hymteE cwmltB">
                                                        <p class="sc-eCstlR kZysRf sc-cgwasx eqTIAy" type="NORMAL_SMALL">침대 타입</p>
                                                        <p class="sc-eCstlR kZysRf sc-kTLXcG dpOkRE" type="NORMAL_SMALL">더블침대 1개</p>
                                                    </li>
                                                </ul>
                                                <div class="sc-fGPjCt eTAvwj">
                                                    <div class="sc-ffkNAL gfExxe">
                                                        <button class="sc-jlIlqL gfPcYi sc-hKEiJx egMFgE" type="button">
                                                            <div>
                                                                <div class="sc-ieGRMn kJcKWB">
                                                                    <p class="sc-eCstlR cPIeWE" type="NORMAL_MEDIUM">무료 취소</p>
                                                                    <i class="sc-crrszt bMPAFE sc-eeKVJR gWSXvs sc-bMYRWI eojHFt"></i>
                                                                </div>
                                                                <div class="sc-chbAZy fYNrHG">12월 6일 (화) 전까지</div>
                                                            </div>
                                                        </button>
                                                    </div>
                                                    <p class="sc-eCstlR fvjAAR sc-ixNrWI NySAs" type="BOLD_LARGEST" name="totalprice">90,659원</p>
                                                </div>
                                            </section>
                                        </li>
                                        <li role="listitem">
                                            <section class="sc-eFuaqX gclven">
                                                <div class="sc-kVmhlm isoEBF">
                                                    <h3 class="sc-eCstlR bcvgNe" type="NORMAL_LARGE">결제 금액</h3>
                                                </div>
                                                <div class="sc-dBoRSD dOWlJn sc-Cnssr fJrrvp">
                                                    <div class="sc-ecTnUl byTpPR">
                                                        <span>숙소 요금</span>
                                                        <div id="resiPrice"><fmt:formatNumber value="${resi.resiPrice}" pattern="###,###원"/></div>
                                                    </div>
                                                    <div class="sc-ecTnUl erqPQp">
                                                        <span id="">손해배상 보험 요금</span>
                                                        <div>10,000원</div>
                                                    </div>
                                                    <div class="sc-kYnagK iMuGWb"></div>
                                                    <div class="sc-ecTnUl cXCLax">
                                                        <span>총 요금</span>
                                                        <em style="text-align: right;">
                                                            <p id="totol_price" class="sc-eCstlR fvjAAR" type="BOLD_LARGEST" name="totalprice">90,659원</p>
                                                            <p class="sc-eCstlR kZysRf sc-kvMJw iHITov" type="NORMAL_SMALL">손해배상 보험 요금 포함</p>
                                                        </em>
                                                    </div>
                                                </div>
                                            </section>
                                        </li>
                                        <li role="listitem">
                                            <section class="sc-eFuaqX gclven">
                                                <div class="sc-hlsGSa dgoLqm">
                                                	<h3 class="sc-eCstlR bcvgNe sc-hmXrp fhrqMl" type="NORMAL_LARGE">추가 요청사항</h3>
                                                	<span>별도 요청사항 기입</span>
                                                </div>
                                                <div>
                                                	<textarea name="customRemarks" type="textarea"
                                                               placeholder="추가 요청에 대한 세부 내용을 포함해 주시면 숙박 시설에 전달해 드립니다. 요청하신 사항이 반드시 제공되는 것은 아니며, 숙박 시설으로 직접 문의 부탁 드립니다."
                                                               form="hotel-order" maxlength="200" minlength="0"
                                                               class="sc-dsxaqW fiVXtw"></textarea>
                                                    <em class="sc-kkBfgx cEXIEJ">
                                                    	<p class="sc-eCstlR kZysRf sc-jVKBdY UUozp" type="NORMAL_SMALL"></p>0 / 200
                                                    </em>
                                                </div>
                                            </section>
                                        </li>
                                        <li role="listitem">
                                            <ul class="sc-euuyxL uqwcO">
                                                <li>
                                                    <section class="sc-eFuaqX gclven sc-ljRaeN kKsuvV">
                                                        <div class="sc-jmhFuu bSihpL title-container">
	                                                        <h3 class="sc-eCstlR bcvgNe sc-dUrmIn YyGzd" type="NORMAL_LARGE">중요사항</h3>
	                                                        <em type="DOWN_MORE_ARROW" class="sc-httYss hyapgQ">※꼭 유념해주세요!</em>
                                                        </div>
                                                        <div class="sc-cbDFGl hkjwZr">
                                                            <div>Front desk staff will greet guests on arrival.</div>
                                                            <div class="sc-hjWSTT eYQtSd"></div>
                                                        </div>
                                                        <button class="sc-fmlJrY jtLrHF sc-gyUflj gBMlfb" type="button">
                                                            <span>자세히 보기</span><i class="sc-crrszt bMPAFE sc-tYqdw eFgseW"></i>
                                                        </button>
                                                    </section>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </section>
                            </ul>
                        </fieldset>
                    </form>
                    <div></div>
                </div>
            </main>
        </main>
    </div>
</div>
</body>
</html>