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
                                                            <div>
                                                                <div class="sc-eCjjWe bGoMZg sc-iXbDFI bPWFtj">
                                                                    <div style="color: inherit; font-weight: inherit; font-size: inherit;">
                                                                        <label for="isSignUp" tabindex="0" class="sc-irOPex kbQGyP">
                                                                            <span class="sc-ezrnTI VKDJw">
                                                                                <input
                                                                                type="checkbox" name="user.isSignUp"
                                                                                id="isSignUp" tabindex="-1"
                                                                                role="checkbox">
                                                                            </span>
                                                                            <a class="sc-kBPahn jzkOjd">입력된 정보로 간편 회원 가입</a>
                                                                        </label>
                                                                    </div>
                                                                    <p class="sc-eJCack dJMrgY"></p>
                                                                </div>
                                                                <div class="sc-bAffKu gaChro sc-lgGoiD jtQmFY">
                                                                    <label for="password" title="비밀번호" class="sc-bxnjHY gnmuIc">
                                                                        <i class="sc-crrszt jLdeKt sc-fkubCs gbBWBW"></i>비밀번호
                                                                    </label>
                                                                    <div class="sc-jVKKMF keJGhf">
                                                                        <div class="sc-jYCGPb eLPgDl input">
                                                                            <div class="sc-Qpmqz kFeFTm">
                                                                                <input
                                                                                    placeholder="영문+숫자+특수문자 8-20자리"
                                                                                    class="sc-dHnuKO ikCiJV"
                                                                                    type="password" maxlength="50"
                                                                                    minlength="0" tabindex="0"
                                                                                    id="password" name="user.password"
                                                                                    autocorrect="off"
                                                                                    autocapitalize="off"
                                                                                    autocomplete="off"
                                                                                    spellcheck="false"
                                                                                    aria-autocomplete="none"
                                                                                    inputmode="text" value="">
                                                                                <i class="sc-crrszt etqBmk sc-jcRCNh iQmsgE"></i>
                                                                                <i class="sc-crrszt dMgtIs sc-iuGLgT jpSwZp"></i>
                                                                            </div>
                                                                            <div class="sc-fnlXEO cCLzKl"></div>
                                                                        </div>
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
                                        
                                        <li role="listitem">
                                            <section class="sc-eFuaqX gclven">
                                                <div class="sc-JJYsw hAgyNZ">
                                                    <h3 class="sc-eCstlR bcvgNe" type="NORMAL_LARGE">투숙객 정보</h3>
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
                                                                <a class="sc-kBPahn jzkOjd">예약자 정보와 동일</a>
                                                            </label>
                                                        </div>
                                                        <p class="sc-eJCack dJMrgY"></p>
                                                    </div>
                                                </div>
                                                
                                                <div class="sc-gLDLxu vUHhk">
                                                    <div class="sc-buMMbg fNnHOO">
                                                    
                                                        <div class="sc-bAffKu gaChro sc-fPppAf fRQMrR">
                                                            <label for="rooms[0].lastName" title="영문 이름" class="sc-bxnjHY gnmuIc">
                                                                <i class="sc-crrszt jLdeKt sc-fkubCs gbBWBW"></i>이름
                                                            </label>
                                                            <div class="sc-jVKKMF keJGhf">
                                                                <div class="sc-jYCGPb eLPgDl input">
                                                                    <div class="sc-Qpmqz kFeFTm">
                                                                        <input
                                                                            placeholder="성"
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
                                                                
                                                                <div class="sc-jYCGPb eLPgDl input">
                                                                    <div class="sc-Qpmqz kFeFTm">
                                                                        <input
                                                                            placeholder="이름"
                                                                            class="sc-dHnuKO ikCiJV input_error"
                                                                            type="text" tabindex="0"
                                                                            id="rooms[0].firstName"
                                                                            name="rooms[0].firstName" autocorrect="off"
                                                                            autocapitalize="off" autocomplete="off"
                                                                            spellcheck="false" aria-autocomplete="none"
                                                                            inputmode="email" value="">
                                                                        <i class="sc-crrszt etqBmk sc-jcRCNh gnFHpz"></i>
                                                                    </div>
                                                                    <div class="sc-fnlXEO ePMXNo"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                        </li>
<!--                                        <li role="listItem">
                                            <section class="sc-eFuaqX gclven sc-cfvPgT coSwhX">
                                                <div class="sc-jCtXva iiWXrm"><h3 class="sc-eCstlR bcvgNe"
                                                                                  type="NORMAL_LARGE">할인 정보</h3></div>
                                                <ul role="list" class="sc-fyMqFV cbhiXf">
                                                    <li role="listItem" class="sc-bGoPvg cPsacS"><p
                                                            class="sc-eCstlR cPIeWE sc-bmpROl itSANz"
                                                            type="NORMAL_MEDIUM">쿠폰</p>
                                                        <div class="sc-eKUqMc bEkpTG">
                                                            <button class="sc-jlIlqL czaxYP sc-BnefB jqHpBm"
                                                                    type="button">쿠폰적용
                                                            </button>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </section>
                                        </li>-->
                                        <li></li>
                                        <li role="listitem">
                                            <section class="sc-eFuaqX gclven sc-iiybfK csLJSh">
                                                <div class="sc-jeUVLL fZSFdR">
                                                    <h3 class="sc-eCstlR bcvgNe" type="NORMAL_LARGE">결제 방법</h3>
                                                </div>
                                                <ul class="sc-uuamo bRsXYu sc-gVqliQ btumok" id="paymentLists">
                                                    <li class="sc-cmhfgo cvgEFu">
                                                        <div class="sc-geEGrd fDEMEC">
                                                            <div class="sc-dERszR YwQuk sc-iWBHJS kVijYD" tabindex="0">
                                                                <input type="radio" name="payment.type" tabindex="-1" id="1" value="billingKey" checked="">
                                                                <div class="sc-gvPAUg hmuA-DM">
                                                                    <div></div>
                                                                </div>
                                                                <label for="1">
                                                                    <i class="sc-crrszt etqBmk sc-bzDzvL gkousJ sc-bHBQji kKODeE"></i>
                                                                    <span class="sc-eCstlR duuteF sc-cDYKPj draSCc" type="LIGHT_MEDIUM">신용카드</span>
                                                                </label>
                                                            </div>
                                                            <section id="billingKeySection" class="sc-caVwRJ cXPOUt">
                                                                <div class="sc-iBRHOl iVHRDk">
                                                                    <div class="sc-lefGek eYTkvV">
                                                                        <p class="sc-eCstlR kZysRf sc-fBVEqz iTgnZd" type="NORMAL_SMALL">결제버튼을 선택하시면 바로 결제가 진행되며 일시불만 가능합니다. 할부를 하실 경우에는 앱카드로 결제해주세요.</p>
                                                                    </div>
                                                                    <section class="sc-gocXYf jxtKZI">
                                                                        <div id="card">
                                                                            <div class="sc-bAffKu gaChro sc-jxTFfQ lnPnVC">
                                                                                <label for="cardNumber" title="카드번호" class="sc-bxnjHY gnmuIc">
                                                                                    <i class="sc-crrszt jLdeKt sc-fkubCs gbBWBW"></i>카드번호
                                                                                </label>
                                                                                <div class="sc-jVKKMF keJGhf">
                                                                                    <div class="sc-jYCGPb eLPgDl input">
                                                                                        <div class="sc-Qpmqz kFeFTm">
                                                                                            <input placeholder=""
                                                                                                   class="sc-dHnuKO ikCiJV input_error"
                                                                                                   type="text"
                                                                                                   maxlength="19"
                                                                                                   minlength="0"
                                                                                                   tabindex="0"
                                                                                                   id="cardNumber"
                                                                                                   name="payment.cardForm.number"
                                                                                                   autocorrect="off"
                                                                                                   autocapitalize="off"
                                                                                                   autocomplete="off"
                                                                                                   spellcheck="false"
                                                                                                   aria-autocomplete="none"
                                                                                                   inputmode="numeric"
                                                                                                   value="">
                                                                                            <i class="sc-crrszt etqBmk sc-jcRCNh gnFHpz"></i>
                                                                                        </div>
                                                                                        <div class="sc-fnlXEO cCLzKl"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="sc-bAffKu gaChro sc-jxTFfQ lnPnVC">
                                                                                <label for="cardExpiryDate" title="카드 유효기간" class="sc-bxnjHY gnmuIc">
                                                                                    <i class="sc-crrszt jLdeKt sc-fkubCs gbBWBW"></i>카드 유효기간
                                                                                </label>
                                                                                <div class="sc-jVKKMF keJGhf">
                                                                                    <div class="sc-jYCGPb eLPgDl input">
                                                                                        <div class="sc-Qpmqz kFeFTm">
                                                                                            <input placeholder="MM(월) / YY(년)"
                                                                                                   class="sc-dHnuKO ikCiJV input_error"
                                                                                                   type="text"
                                                                                                   maxlength="5"
                                                                                                   minlength="0"
                                                                                                   tabindex="0"
                                                                                                   id="cardExpiryDate"
                                                                                                   name="payment.cardForm.expiry"
                                                                                                   autocorrect="off"
                                                                                                   autocapitalize="off"
                                                                                                   autocomplete="off"
                                                                                                   spellcheck="false"
                                                                                                   aria-autocomplete="none"
                                                                                                   inputmode="numeric"
                                                                                                   value="">
                                                                                            <i class="sc-crrszt etqBmk sc-jcRCNh gnFHpz"></i>
                                                                                        </div>
                                                                                        <div class="sc-fnlXEO cCLzKl"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="sc-bAffKu gaChro sc-jxTFfQ lnPnVC">
                                                                                <label for="cardPassword" title="카드 비밀번호(앞 두 자리)" class="sc-bxnjHY gnmuIc">
                                                                                    <i class="sc-crrszt jLdeKt sc-fkubCs gbBWBW"></i>카드 비밀번호(앞 두 자리)
                                                                                </label>
                                                                                <div class="sc-jVKKMF keJGhf">
                                                                                    <div class="sc-jYCGPb kfpSMn input">
                                                                                        <div class="sc-Qpmqz kFeFTm">
                                                                                            <input placeholder=""
                                                                                                   class="sc-dHnuKO ikCiJV input_error"
                                                                                                   type="password"
                                                                                                   maxlength="2"
                                                                                                   minlength="0"
                                                                                                   tabindex="0"
                                                                                                   id="cardPassword"
                                                                                                   name="payment.cardForm.pwd2Digit"
                                                                                                   autocorrect="off"
                                                                                                   autocapitalize="off"
                                                                                                   autocomplete="off"
                                                                                                   spellcheck="false"
                                                                                                   aria-autocomplete="none"
                                                                                                   inputmode="numeric"
                                                                                                   value="">
                                                                                        </div>
                                                                                        <div class="sc-jfJyPD dhUrOB">
                                                                                            <span></span>
                                                                                            <span></span>
                                                                                        </div>
                                                                                        <div class="sc-fnlXEO cCLzKl"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="sc-bAffKu gaChro sc-jxTFfQ lnPnVC">
                                                                                <label for="cardBirthday" title="카드 소유자 생년월일 혹은 사업자 등록번호" class="sc-bxnjHY gnmuIc">
                                                                                    <i class="sc-crrszt jLdeKt sc-fkubCs gbBWBW"></i>카드 소유자 생년월일 혹은 사업자 등록번호
                                                                                </label>
                                                                                <div class="sc-jVKKMF keJGhf">
                                                                                    <div class="sc-jYCGPb eLPgDl input">
                                                                                        <div class="sc-Qpmqz kFeFTm">
                                                                                            <input placeholder="생년월일 6자리 또는 사업자등록번호 10자리"
                                                                                                   class="sc-dHnuKO ikCiJV input_error"
                                                                                                   type="number"
                                                                                                   maxlength="10"
                                                                                                   minlength="0"
                                                                                                   tabindex="0"
                                                                                                   id="cardBirthday"
                                                                                                   name="payment.cardForm.birthday"
                                                                                                   autocorrect="off"
                                                                                                   autocapitalize="off"
                                                                                                   autocomplete="off"
                                                                                                   spellcheck="false"
                                                                                                   aria-autocomplete="none"
                                                                                                   inputmode="numeric"
                                                                                                   value="">
                                                                                            <i class="sc-crrszt etqBmk sc-jcRCNh gnFHpz"></i>
                                                                                        </div>
                                                                                        <div class="sc-fnlXEO cCLzKl"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </section>
                                                                </div>
                                                            </section>
                                                        </div>
                                                    </li>
                                                    <li class="sc-cmhfgo hPqFOY">
                                                        <div class="sc-geEGrd giwHNF">
                                                            <div class="sc-dERszR YwQuk sc-iWBHJS eVhvzd" tabindex="0">
                                                                <input type="radio" name="payment.type" tabindex="-1" id="3" value="card">
                                                                <div class="sc-gvPAUg fbvmiQ">
                                                                    <div></div>
                                                                </div>
                                                                <label for="3">
                                                                    <i class="sc-crrszt etqBmk sc-bzDzvL hYuFSj sc-bHBQji kKODeE"></i>
                                                                    <span class="sc-eCstlR duuteF sc-cDYKPj hSifoy" type="LIGHT_MEDIUM">앱카드</span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="sc-cmhfgo hPqFOY">
                                                        <div class="sc-geEGrd giwHNF">
                                                            <div class="sc-dERszR YwQuk sc-iWBHJS eVhvzd" tabindex="0">
                                                                <input type="radio" name="payment.type" tabindex="-1" id="19" value="kbpayNone">
                                                                <div class="sc-gvPAUg fbvmiQ">
                                                                    <div></div>
                                                                </div>
                                                                <label for="19">
                                                                    <i class="sc-crrszt etqBmk sc-bzDzvL kEMbKQ sc-bHBQji kKODeE"></i>
                                                                    <span class="sc-eCstlR duuteF sc-cDYKPj hSifoy" type="LIGHT_MEDIUM">KB Pay</span>
                                                                    <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYyIiBoZWlnaHQ9IjIyIiB2aWV3Qm94PSIwIDAgMTYyIDIyIiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8cmVjdCB3aWR0aD0iMTYyIiBoZWlnaHQ9IjIyIiByeD0iMTEiIGZpbGw9IiNGRkY2RDAiLz4KPHBhdGggZD0iTTE2LjQ3MiA5LjlIMTcuNDIyVjEyLjI5SDE4LjQwMlY2Ljc1SDE3LjQyMlY5LjA2SDE2LjQ3MlY2LjkxSDE1LjUwMlYxMkgxNi40NzJWOS45Wk0xNS4yOTIgMTAuODhDMTQuMTIyIDEwLjQyIDEzLjUzMiA5LjQzIDEzLjUzMiA4LjQzVjcuMjlIMTIuNTMyVjguNDNDMTIuNTMyIDkuNDYgMTEuOTIyIDEwLjU5IDEwLjcxMiAxMS4xNEwxMS4yNTIgMTEuOTNDMTIuMTIyIDExLjU1IDEyLjcxMiAxMC44NSAxMy4wNDIgMTAuMDJDMTMuMzgyIDEwLjc0IDEzLjk0MiAxMS4zNCAxNC43NDIgMTEuNjVMMTUuMjkyIDEwLjg4Wk0xNS4zOTIgMTQuOThDMTQuMTIyIDE0Ljk4IDEzLjM2MiAxNC42NyAxMy4zNjIgMTQuMTJDMTMuMzYyIDEzLjU2IDE0LjEyMiAxMy4yNSAxNS4zOTIgMTMuMjVDMTYuNjYyIDEzLjI1IDE3LjQyMiAxMy41NiAxNy40MjIgMTQuMTJDMTcuNDIyIDE0LjY3IDE2LjY2MiAxNC45OCAxNS4zOTIgMTQuOThaTTE1LjM5MiAxMi40NkMxMy41MTIgMTIuNDYgMTIuMzMyIDEzLjA4IDEyLjMzMiAxNC4xMkMxMi4zMzIgMTUuMTUgMTMuNTEyIDE1Ljc3IDE1LjM5MiAxNS43N0MxNy4yNzIgMTUuNzcgMTguNDUyIDE1LjE1IDE4LjQ1MiAxNC4xMkMxOC40NTIgMTMuMDggMTcuMjcyIDEyLjQ2IDE1LjM5MiAxMi40NlpNMjEuOTkxMiAxMi44OEMyMS4zODEyIDEyLjg4IDIxLjAwMTIgMTIuMDggMjEuMDAxMiAxMC42NUMyMS4wMDEyIDkuMjIgMjEuMzgxMiA4LjQxIDIxLjk5MTIgOC40MUMyMi42MDEyIDguNDEgMjIuOTgxMiA5LjIyIDIyLjk4MTIgMTAuNjVDMjIuOTgxMiAxMi4wOCAyMi42MDEyIDEyLjg4IDIxLjk5MTIgMTIuODhaTTIxLjk5MTIgNy40NEMyMC44MjEyIDcuNDQgMjAuMDUxMiA4LjY2IDIwLjA1MTIgMTAuNjVDMjAuMDUxMiAxMi42MiAyMC44MjEyIDEzLjg1IDIxLjk5MTIgMTMuODVDMjMuMTYxMiAxMy44NSAyMy45MzEyIDEyLjYyIDIzLjkzMTIgMTAuNjVDMjMuOTMxMiA4LjY2IDIzLjE2MTIgNy40NCAyMS45OTEyIDcuNDRaTTI2LjY5MTIgNi43NFYxMC4yNkgyNS42NjEyVjYuOTFIMjQuNjkxMlYxNS4zNEgyNS42NjEyVjExLjFIMjYuNjkxMlYxNS43NkgyNy42NzEyVjYuNzRIMjYuNjkxMlpNMzYuMjM2NSA5LjIyVjEwLjA2SDM3Ljg1NjVWMTIuOTRIMzguODg2NVY2LjczSDM3Ljg1NjVWOS4yMkgzNi4yMzY1Wk0zNi43MjY1IDExLjEyQzM1LjM1NjUgMTAuNzEgMzQuNTg2NSA5LjcxIDM0LjU4NjUgOC42OFY4LjU2SDM2LjQ4NjVWNy43M0gzNC41OTY1VjYuNzFIMzMuNTU2NVY3LjczSDMxLjY1NjVWOC41NkgzMy41NTY1VjguNjhDMzMuNTU2NSA5LjgyIDMyLjc3NjUgMTAuOTEgMzEuMzk2NSAxMS4zNUwzMS44OTY1IDEyLjE1QzMyLjk0NjUgMTEuODEgMzMuNzA2NSAxMS4xIDM0LjA5NjUgMTAuMThDMzQuNDk2NSAxMC45OCAzNS4yMzY1IDExLjYyIDM2LjI1NjUgMTEuOTJMMzYuNzI2NSAxMS4xMlpNMzYuNDU2NSAxMi4zOEgzNS4zOTY1VjEyLjU1QzM1LjM5NjUgMTMuNjMgMzQuMTg2NSAxNC42NiAzMi40NTY1IDE0LjkzTDMyLjg0NjUgMTUuNzRDMzQuMjU2NSAxNS41MiAzNS4zNzY1IDE0LjgxIDM1LjkyNjUgMTMuODZDMzYuNDY2NSAxNC44MiAzNy41OTY1IDE1LjUxIDM5LjAxNjUgMTUuNzRMMzkuNDE2NSAxNC45M0MzNy42NTY1IDE0LjY2IDM2LjQ1NjUgMTMuNjcgMzYuNDU2NSAxMi41NVYxMi4zOFpNNDkuMzAxOCA4Ljc3VjkuN0g0Ny4wOTE4VjEwLjVINDkuMzAxOFYxMS4zMkg1MC4zMzE4VjYuNzRINDkuMzAxOFY3Ljk3SDQ3LjQzMThDNDcuNDgxOCA3LjcxIDQ3LjUwMTggNy40MyA0Ny41MDE4IDcuMTRINDMuNDYxOFY3Ljk3SDQ2LjM2MThDNDYuMjIxOCA5LjIzIDQ1LjExMTggMTAuMjIgNDIuOTcxOCAxMC42OEw0My4zMzE4IDExLjUyQzQ1LjMyMTggMTEuMDcgNDYuNjUxOCAxMC4xNSA0Ny4yMTE4IDguNzdINDkuMzAxOFpNNDUuNTAxOCAxNC44NlYxNC4wM0g1MC4zMzE4VjExLjY5SDQ0LjQ1MThWMTIuNTFINDkuMzAxOFYxMy4yNkg0NC40NzE4VjE1LjY5SDUwLjU4MThWMTQuODZINDUuNTAxOFpNNTQuNzkxIDguNTdINTYuMjgxVjcuNzJINTIuMjAxVjguNTdINTMuNzkxVjkuMjJDNTMuNzkxIDEwLjgzIDUzLjE5MSAxMi40NiA1MS45MTEgMTMuMjZMNTIuNTMxIDE0LjAyQzUzLjQwMSAxMy40NyA1My45ODEgMTIuNSA1NC4zMDEgMTEuMzZDNTQuNjIxIDEyLjQxIDU1LjE4MSAxMy4zIDU2LjAzMSAxMy44TDU2LjYzMSAxMy4wNUM1NS4zNzEgMTIuMzIgNTQuNzkxIDEwLjc2IDU0Ljc5MSA5LjIyVjguNTdaTTU2Ljk1MSA5LjkxSDU1LjYyMVYxMC43NUg1Ni45NTFWMTUuMzNINTcuOTIxVjYuOTFINTYuOTUxVjkuOTFaTTU4Ljc3MSA2LjczVjE1Ljc2SDU5Ljc1MVY2LjczSDU4Ljc3MVpNNjYuODI2MyA3LjQ5SDY1Ljc5NjNWOC45N0M2NS43OTYzIDEwLjcxIDY0Ljg1NjMgMTIuNDQgNjMuNDE2MyAxMy4wOUw2NC4wMjYzIDEzLjk1QzY1LjExNjMgMTMuNDIgNjUuOTE2MyAxMi4zNSA2Ni4zMjYzIDExLjA0QzY2LjczNjMgMTIuMjYgNjcuNTI2MyAxMy4yNiA2OC41NjYzIDEzLjc1TDY5LjE2NjMgMTIuOTNDNjcuNzQ2MyAxMi4yOSA2Ni44MjYzIDEwLjYzIDY2LjgyNjMgOC45N1Y3LjQ5Wk02OS44ODYzIDYuNzNWMTUuNzlINzAuOTI2M1Y2LjczSDY5Ljg4NjNaTTcyLjk3NTUgMTdDNzQuMDA1NSAxNi42MSA3NC42MTU1IDE1LjggNzQuNjE1NSAxNC43NUM3NC42MTU1IDEzLjk4IDc0LjI4NTUgMTMuNTEgNzMuNzI1NSAxMy41MUM3My4yODU1IDEzLjUxIDcyLjkyNTUgMTMuOCA3Mi45MjU1IDE0LjI1QzcyLjkyNTUgMTQuNzMgNzMuMjg1NSAxNC45OSA3My42OTU1IDE0Ljk5QzczLjczNTUgMTQuOTkgNzMuNzY1NSAxNC45OSA3My44MDU1IDE0Ljk4QzczLjgwNTUgMTUuNTYgNzMuNDA1NSAxNi4wNyA3Mi43MTU1IDE2LjM1TDcyLjk3NTUgMTdaTTc5LjM0MDIgMTVIODAuNTIwMkM4MC42NDAyIDEyLjEyIDgwLjkxMDIgMTAuNDkgODIuNjQwMiA4LjM0VjcuNjNINzcuOTAwMlY4LjYxSDgxLjM2MDJDNzkuOTQwMiAxMC41OSA3OS40NzAyIDEyLjMxIDc5LjM0MDIgMTVaTTg4LjQxMzMgOS40NVYxMC4zSDkwLjA3MzNWMTMuNDZIOTEuMTAzM1Y2Ljc1SDkwLjA3MzNWOS40NUg4OC40MTMzWk04OC45OTMzIDExLjQ3Qzg3LjYwMzMgMTEuMDQgODYuODAzMyA5Ljk5IDg2LjgwMzMgOC44OFY4LjcxSDg4LjcwMzNWNy44OEg4Ni44MTMzVjYuOEg4NS43NzMzVjcuODhIODMuODczM1Y4LjcxSDg1Ljc3MzNWOC44OEM4NS43NzMzIDEwLjA3IDg0Ljk5MzMgMTEuMTcgODMuNjAzMyAxMS42NEw4NC4xMTMzIDEyLjQ0Qzg1LjE2MzMgMTIuMDkgODUuOTEzMyAxMS4zNyA4Ni4zMTMzIDEwLjQ1Qzg2LjcxMzMgMTEuMyA4Ny40NzMzIDExLjk2IDg4LjQ5MzMgMTIuMjhMODguOTkzMyAxMS40N1pNODYuMjgzMyAxNC43NlYxMi44OEg4NS4yNTMzVjE1LjZIOTEuMzMzM1YxNC43Nkg4Ni4yODMzWk05OC4wOTg2IDguMzhIMTAwLjE3OVYxMS4xNkg5OC4wOTg2VjguMzhaTTk5LjY0ODYgMTMuODVWMTEuOTlIMTAyLjUwOVYxMS4xNkgxMDEuMTk5VjguMzhIMTAyLjUyOVY3LjU1SDk1LjczODZWOC4zOEg5Ny4wNjg2VjExLjE2SDk1Ljc2ODZWMTEuOTlIOTguNjE4NlYxMy44NUg5NS4wNTg2VjE0LjdIMTAzLjI1OVYxMy44NUg5OS42NDg2Wk0xMTEuNzA4IDYuNzRIMTEwLjY3OFYxMy4zSDExMS43MDhWNi43NFpNMTA1LjQ0OCA5LjZDMTA1LjQ0OCA4Ljc3IDEwNi4wMzggOC4yMyAxMDYuODM4IDguMjNDMTA3LjYyOCA4LjIzIDEwOC4yMjggOC43NyAxMDguMjI4IDkuNkMxMDguMjI4IDEwLjQyIDEwNy42MjggMTAuOTcgMTA2LjgzOCAxMC45N0MxMDYuMDM4IDEwLjk3IDEwNS40NDggMTAuNDIgMTA1LjQ0OCA5LjZaTTEwOS4yMjggOS42QzEwOS4yMjggOC4yOCAxMDguMTk4IDcuMzQgMTA2LjgzOCA3LjM0QzEwNS40NzggNy4zNCAxMDQuNDM4IDguMjggMTA0LjQzOCA5LjZDMTA0LjQzOCAxMC45MSAxMDUuNDc4IDExLjg2IDEwNi44MzggMTEuODZDMTA4LjE5OCAxMS44NiAxMDkuMjI4IDEwLjkxIDEwOS4yMjggOS42Wk0xMDYuODQ4IDE0Ljc2VjEyLjY0SDEwNS44MDhWMTUuNkgxMTEuOTY4VjE0Ljc2SDEwNi44NDhaTTEyMC43MzcgMTEuNTFIMTE1LjUyN1YxMC4yN0gxMjAuNDY3VjkuNDZIMTE1LjUyN1Y4LjNIMTIwLjY2N1Y3LjQ3SDExNC40NzdWMTIuMzRIMTIwLjczN1YxMS41MVpNMTEzLjQ2NyAxMy44MlYxNC42NkgxMjEuNjU3VjEzLjgySDExMy40NjdaTTEyNC4yMTYgMTAuODlIMTI3LjM2NlY3LjU0SDEyMy4xNTZWOC4zOEgxMjYuMzI2VjEwLjA2SDEyMy4xNzZWMTMuNjRIMTIzLjk0NkMxMjUuNTM2IDEzLjY0IDEyNi44ODYgMTMuNTkgMTI4LjQzNiAxMy4zMkwxMjguMzI2IDEyLjQ4QzEyNi44OTYgMTIuNzEgMTI1LjY0NiAxMi43OCAxMjQuMjE2IDEyLjc5VjEwLjg5Wk0xMjkuMDc2IDYuNzJWMTUuNzlIMTMwLjExNlY2LjcySDEyOS4wNzZaTTEzNy40NDIgOC40OUgxMzkuNDUyVjcuNjRIMTM0LjM5MlY4LjQ5SDEzNi40MDJWOS4zNUMxMzYuNDAyIDEwLjkgMTM1LjQ3MiAxMi41OCAxMzQuMDcyIDEzLjIzTDEzNC42NjIgMTQuMDVDMTM1LjcyMiAxMy41NCAxMzYuNTMyIDEyLjQ3IDEzNi45MzIgMTEuMjFDMTM3LjM1MiAxMi4zOCAxMzguMTYyIDEzLjM2IDEzOS4yMTIgMTMuODJMMTM5Ljc4MiAxMy4wMUMxMzguMzcyIDEyLjQxIDEzNy40NDIgMTAuODUgMTM3LjQ0MiA5LjM1VjguNDlaTTE0MC41MDIgNi43NFYxNS43N0gxNDEuNTQyVjYuNzRIMTQwLjUwMlpNMTQ5LjQzMSAxNC44M0gxNDUuMzUxVjEzLjc4SDE0OS40MzFWMTQuODNaTTE0OS40MzEgMTIuOThIMTQ1LjM1MVYxMS45SDE0NC4zMzFWMTUuNjZIMTUwLjQ2MVYxMS45SDE0OS40MzFWMTIuOThaTTE1MC4yNTEgMTAuMzVDMTUwLjQ3MSA5LjI4IDE1MC40NzEgOC41MiAxNTAuNDcxIDcuODJWNy4xM0gxNDQuMzQxVjcuOTZIMTQ5LjQ2MUMxNDkuNDYxIDguNjIgMTQ5LjQ0MSA5LjM2IDE0OS4yMzEgMTAuMzVIMTQzLjMxMVYxMS4xOUgxNTEuNDkxVjEwLjM1SDE1MC4yNTFaIiBmaWxsPSIjNjkzNjAwIi8+Cjwvc3ZnPgo=" class="sc-bqQUSp SgvWC">
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="sc-cmhfgo hPqFOY">
                                                        <div class="sc-geEGrd giwHNF">
                                                            <div class="sc-dERszR YwQuk sc-iWBHJS eVhvzd" tabindex="0">
                                                                <input type="radio" name="payment.type" tabindex="-1" id="11" value="naverPay">
                                                                <div class="sc-gvPAUg fbvmiQ">
                                                                    <div></div>
                                                                </div>
                                                                <label for="11">
                                                                    <i class="sc-crrszt etqBmk sc-bzDzvL fjbOUu sc-bHBQji kKODeE"></i>
                                                                    <span class="sc-eCstlR duuteF sc-cDYKPj hSifoy" type="LIGHT_MEDIUM">네이버페이</span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="sc-cmhfgo hPqFOY">
                                                        <div class="sc-geEGrd giwHNF">
                                                            <div class="sc-dERszR YwQuk sc-iWBHJS eVhvzd" tabindex="0">
                                                                <input type="radio" name="payment.type" tabindex="-1" id="2" value="toss">
                                                                <div class="sc-gvPAUg fbvmiQ">
                                                                    <div></div>
                                                                </div>
                                                                <label for="2">
                                                                    <i class="sc-crrszt etqBmk sc-bzDzvL grdrja sc-bHBQji kKODeE"></i>
                                                                    <span class="sc-eCstlR duuteF sc-cDYKPj hSifoy" type="LIGHT_MEDIUM">토스</span>
                                                                    <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQyIiBoZWlnaHQ9IjIyIiB2aWV3Qm94PSIwIDAgMTQyIDIyIiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8cmVjdCB3aWR0aD0iMTQyIiBoZWlnaHQ9IjIyIiByeD0iMTEiIGZpbGw9IiNFREYzRkYiLz4KPHBhdGggZD0iTTE1Ljc2IDkuNTQ0OThIMTYuNzFWMTEuOTM1SDE3LjY5VjYuMzk0OThIMTYuNzFWOC43MDQ5OEgxNS43NlY2LjU1NDk4SDE0Ljc5VjExLjY0NUgxNS43NlY5LjU0NDk4Wk0xNC41OCAxMC41MjVDMTMuNDEgMTAuMDY1IDEyLjgyIDkuMDc0OTggMTIuODIgOC4wNzQ5OFY2LjkzNDk4SDExLjgyVjguMDc0OThDMTEuODIgOS4xMDQ5OCAxMS4yMSAxMC4yMzUgMTAgMTAuNzg1TDEwLjU0IDExLjU3NUMxMS40MSAxMS4xOTUgMTIgMTAuNDk1IDEyLjMzIDkuNjY0OThDMTIuNjcgMTAuMzg1IDEzLjIzIDEwLjk4NSAxNC4wMyAxMS4yOTVMMTQuNTggMTAuNTI1Wk0xNC42OCAxNC42MjVDMTMuNDEgMTQuNjI1IDEyLjY1IDE0LjMxNSAxMi42NSAxMy43NjVDMTIuNjUgMTMuMjA1IDEzLjQxIDEyLjg5NSAxNC42OCAxMi44OTVDMTUuOTUgMTIuODk1IDE2LjcxIDEzLjIwNSAxNi43MSAxMy43NjVDMTYuNzEgMTQuMzE1IDE1Ljk1IDE0LjYyNSAxNC42OCAxNC42MjVaTTE0LjY4IDEyLjEwNUMxMi44IDEyLjEwNSAxMS42MiAxMi43MjUgMTEuNjIgMTMuNzY1QzExLjYyIDE0Ljc5NSAxMi44IDE1LjQxNSAxNC42OCAxNS40MTVDMTYuNTYgMTUuNDE1IDE3Ljc0IDE0Ljc5NSAxNy43NCAxMy43NjVDMTcuNzQgMTIuNzI1IDE2LjU2IDEyLjEwNSAxNC42OCAxMi4xMDVaIiBmaWxsPSIjMzU3NEZGIi8+CjxwYXRoIGQ9Ik0yMS4yNzkyIDEyLjUyNUMyMC42NjkyIDEyLjUyNSAyMC4yODkyIDExLjcyNSAyMC4yODkyIDEwLjI5NUMyMC4yODkyIDguODY0OTggMjAuNjY5MiA4LjA1NDk4IDIxLjI3OTIgOC4wNTQ5OEMyMS44ODkyIDguMDU0OTggMjIuMjY5MiA4Ljg2NDk4IDIyLjI2OTIgMTAuMjk1QzIyLjI2OTIgMTEuNzI1IDIxLjg4OTIgMTIuNTI1IDIxLjI3OTIgMTIuNTI1Wk0yMS4yNzkyIDcuMDg0OThDMjAuMTA5MiA3LjA4NDk4IDE5LjMzOTIgOC4zMDQ5OCAxOS4zMzkyIDEwLjI5NUMxOS4zMzkyIDEyLjI2NSAyMC4xMDkyIDEzLjQ5NSAyMS4yNzkyIDEzLjQ5NUMyMi40NDkyIDEzLjQ5NSAyMy4yMTkyIDEyLjI2NSAyMy4yMTkyIDEwLjI5NUMyMy4yMTkyIDguMzA0OTggMjIuNDQ5MiA3LjA4NDk4IDIxLjI3OTIgNy4wODQ5OFpNMjUuOTc5MiA2LjM4NDk4VjkuOTA0OThIMjQuOTQ5MlY2LjU1NDk4SDIzLjk3OTJWMTQuOTg1SDI0Ljk0OTJWMTAuNzQ1SDI1Ljk3OTJWMTUuNDA1SDI2Ljk1OTJWNi4zODQ5OEgyNS45NzkyWiIgZmlsbD0iIzM1NzRGRiIvPgo8cGF0aCBkPSJNMzUuNTI0NSA4Ljg2NDk4VjkuNzA0OThIMzcuMTQ0NVYxMi41ODVIMzguMTc0NVY2LjM3NDk4SDM3LjE0NDVWOC44NjQ5OEgzNS41MjQ1Wk0zNi4wMTQ1IDEwLjc2NUMzNC42NDQ1IDEwLjM1NSAzMy44NzQ1IDkuMzU0OTggMzMuODc0NSA4LjMyNDk4VjguMjA0OThIMzUuNzc0NVY3LjM3NDk4SDMzLjg4NDVWNi4zNTQ5OEgzMi44NDQ1VjcuMzc0OThIMzAuOTQ0NVY4LjIwNDk4SDMyLjg0NDVWOC4zMjQ5OEMzMi44NDQ1IDkuNDY0OTggMzIuMDY0NSAxMC41NTUgMzAuNjg0NSAxMC45OTVMMzEuMTg0NSAxMS43OTVDMzIuMjM0NSAxMS40NTUgMzIuOTk0NSAxMC43NDUgMzMuMzg0NSA5LjgyNDk4QzMzLjc4NDUgMTAuNjI1IDM0LjUyNDUgMTEuMjY1IDM1LjU0NDUgMTEuNTY1TDM2LjAxNDUgMTAuNzY1Wk0zNS43NDQ1IDEyLjAyNUgzNC42ODQ1VjEyLjE5NUMzNC42ODQ1IDEzLjI3NSAzMy40NzQ1IDE0LjMwNSAzMS43NDQ1IDE0LjU3NUwzMi4xMzQ1IDE1LjM4NUMzMy41NDQ1IDE1LjE2NSAzNC42NjQ1IDE0LjQ1NSAzNS4yMTQ1IDEzLjUwNUMzNS43NTQ1IDE0LjQ2NSAzNi44ODQ1IDE1LjE1NSAzOC4zMDQ1IDE1LjM4NUwzOC43MDQ1IDE0LjU3NUMzNi45NDQ1IDE0LjMwNSAzNS43NDQ1IDEzLjMxNSAzNS43NDQ1IDEyLjE5NVYxMi4wMjVaIiBmaWxsPSIjMzU3NEZGIi8+CjxwYXRoIGQ9Ik00OC41ODk4IDguNDE0OThWOS4zNDQ5OEg0Ni4zNzk4VjEwLjE0NUg0OC41ODk4VjEwLjk2NUg0OS42MTk4VjYuMzg0OThINDguNTg5OFY3LjYxNDk4SDQ2LjcxOThDNDYuNzY5OCA3LjM1NDk4IDQ2Ljc4OTggNy4wNzQ5OCA0Ni43ODk4IDYuNzg0OThINDIuNzQ5OFY3LjYxNDk4SDQ1LjY0OThDNDUuNTA5OCA4Ljg3NDk4IDQ0LjM5OTggOS44NjQ5OCA0Mi4yNTk4IDEwLjMyNUw0Mi42MTk4IDExLjE2NUM0NC42MDk4IDEwLjcxNSA0NS45Mzk4IDkuNzk0OTggNDYuNDk5OCA4LjQxNDk4SDQ4LjU4OThaTTQ0Ljc4OTggMTQuNTA1VjEzLjY3NUg0OS42MTk4VjExLjMzNUg0My43Mzk4VjEyLjE1NUg0OC41ODk4VjEyLjkwNUg0My43NTk4VjE1LjMzNUg0OS44Njk4VjE0LjUwNUg0NC43ODk4WiIgZmlsbD0iIzM1NzRGRiIvPgo8cGF0aCBkPSJNNTQuMDc5MSA4LjIxNDk4SDU1LjU2OTFWNy4zNjQ5OEg1MS40ODkxVjguMjE0OThINTMuMDc5MVY4Ljg2NDk4QzUzLjA3OTEgMTAuNDc1IDUyLjQ3OTEgMTIuMTA1IDUxLjE5OTEgMTIuOTA1TDUxLjgxOTEgMTMuNjY1QzUyLjY4OTEgMTMuMTE1IDUzLjI2OTEgMTIuMTQ1IDUzLjU4OTEgMTEuMDA1QzUzLjkwOTEgMTIuMDU1IDU0LjQ2OTEgMTIuOTQ1IDU1LjMxOTEgMTMuNDQ1TDU1LjkxOTEgMTIuNjk1QzU0LjY1OTEgMTEuOTY1IDU0LjA3OTEgMTAuNDA1IDU0LjA3OTEgOC44NjQ5OFY4LjIxNDk4Wk01Ni4yMzkxIDkuNTU0OThINTQuOTA5MVYxMC4zOTVINTYuMjM5MVYxNC45NzVINTcuMjA5MVY2LjU1NDk4SDU2LjIzOTFWOS41NTQ5OFpNNTguMDU5MSA2LjM3NDk4VjE1LjQwNUg1OS4wMzkxVjYuMzc0OThINTguMDU5MVoiIGZpbGw9IiMzNTc0RkYiLz4KPHBhdGggZD0iTTY2LjExNDQgNy4xMzQ5OEg2NS4wODQ0VjguNjE0OThDNjUuMDg0NCAxMC4zNTUgNjQuMTQ0NCAxMi4wODUgNjIuNzA0NCAxMi43MzVMNjMuMzE0NCAxMy41OTVDNjQuNDA0NCAxMy4wNjUgNjUuMjA0NCAxMS45OTUgNjUuNjE0NCAxMC42ODVDNjYuMDI0NCAxMS45MDUgNjYuODE0NCAxMi45MDUgNjcuODU0NCAxMy4zOTVMNjguNDU0NCAxMi41NzVDNjcuMDM0NCAxMS45MzUgNjYuMTE0NCAxMC4yNzUgNjYuMTE0NCA4LjYxNDk4VjcuMTM0OThaTTY5LjE3NDQgNi4zNzQ5OFYxNS40MzVINzAuMjE0NFY2LjM3NDk4SDY5LjE3NDRaIiBmaWxsPSIjMzU3NEZGIi8+CjxwYXRoIGQ9Ik03Mi4yNjM2IDE2LjY0NUM3My4yOTM2IDE2LjI1NSA3My45MDM2IDE1LjQ0NSA3My45MDM2IDE0LjM5NUM3My45MDM2IDEzLjYyNSA3My41NzM2IDEzLjE1NSA3My4wMTM2IDEzLjE1NUM3Mi41NzM2IDEzLjE1NSA3Mi4yMTM2IDEzLjQ0NSA3Mi4yMTM2IDEzLjg5NUM3Mi4yMTM2IDE0LjM3NSA3Mi41NzM2IDE0LjYzNSA3Mi45ODM2IDE0LjYzNUM3My4wMjM2IDE0LjYzNSA3My4wNTM2IDE0LjYzNSA3My4wOTM2IDE0LjYyNUM3My4wOTM2IDE1LjIwNSA3Mi42OTM2IDE1LjcxNSA3Mi4wMDM2IDE1Ljk5NUw3Mi4yNjM2IDE2LjY0NVoiIGZpbGw9IiMzNTc0RkYiLz4KPHBhdGggZD0iTTc5LjM3ODIgMTQuNzc1QzgwLjcyODIgMTQuNzc1IDgxLjgzODIgMTMuOTk1IDgxLjgzODIgMTIuNjY1QzgxLjgzODIgMTEuNjc1IDgxLjE2ODIgMTEuMDM1IDgwLjMxODIgMTAuODI1VjEwLjc3NUM4MS4wOTgyIDEwLjQ4NSA4MS41ODgyIDkuODk0OTggODEuNTg4MiA5LjA0NDk4QzgxLjU4ODIgNy44MzQ5OCA4MC42NTgyIDcuMTQ0OTggNzkuMzM4MiA3LjE0NDk4Qzc4LjQ4ODIgNy4xNDQ5OCA3Ny44MDgyIDcuNTE0OTggNzcuMjI4MiA4LjAzNDk4TDc3LjgyODIgOC43NTQ5OEM3OC4yNDgyIDguMzQ0OTggNzguNzI4MiA4LjA3NDk4IDc5LjI5ODIgOC4wNjQ5OEM3OS45OTgyIDguMDc0OTggODAuNDI4MiA4LjQ3NDk4IDgwLjQyODIgOS4xMjQ5OEM4MC40MjgyIDkuODY0OTggNzkuOTQ4MiAxMC40MTUgNzguNDk4MiAxMC40MTVWMTEuMjY1QzgwLjE1ODIgMTEuMjY1IDgwLjY3ODIgMTEuNzk1IDgwLjY3ODIgMTIuNjA1QzgwLjY3ODIgMTMuMzc1IDgwLjEwODIgMTMuODM1IDc5LjI3ODIgMTMuODM1Qzc4LjUxODIgMTMuODM1IDc3Ljk2ODIgMTMuNDY1IDc3LjUzODIgMTMuMDI1TDc2Ljk3ODIgMTMuNzY1Qzc3LjQ2ODIgMTQuMzE1IDc4LjIxODIgMTQuNzc1IDc5LjM3ODIgMTQuNzc1WiIgZmlsbD0iIzM1NzRGRiIvPgo8cGF0aCBkPSJNODcuNzAxMyA5LjA5NDk4VjkuOTQ0OThIODkuMzYxM1YxMy4xMDVIOTAuMzkxM1Y2LjM5NDk4SDg5LjM2MTNWOS4wOTQ5OEg4Ny43MDEzWk04OC4yODEzIDExLjExNUM4Ni44OTEzIDEwLjY4NSA4Ni4wOTEzIDkuNjM0OTggODYuMDkxMyA4LjUyNDk4VjguMzU0OThIODcuOTkxM1Y3LjUyNDk4SDg2LjEwMTNWNi40NDQ5OEg4NS4wNjEzVjcuNTI0OThIODMuMTYxM1Y4LjM1NDk4SDg1LjA2MTNWOC41MjQ5OEM4NS4wNjEzIDkuNzE0OTggODQuMjgxMyAxMC44MTUgODIuODkxMyAxMS4yODVMODMuNDAxMyAxMi4wODVDODQuNDUxMyAxMS43MzUgODUuMjAxMyAxMS4wMTUgODUuNjAxMyAxMC4wOTVDODYuMDAxMyAxMC45NDUgODYuNzYxMyAxMS42MDUgODcuNzgxMyAxMS45MjVMODguMjgxMyAxMS4xMTVaTTg1LjU3MTMgMTQuNDA1VjEyLjUyNUg4NC41NDEzVjE1LjI0NUg5MC42MjEzVjE0LjQwNUg4NS41NzEzWiIgZmlsbD0iIzM1NzRGRiIvPgo8cGF0aCBkPSJNOTYuNzkwNiAxMS42ODVWMTIuNDA1SDk4LjU2MDVWMTMuMjQ1SDk5LjU5MDVWNi4zNzQ5OEg5OC41NjA1VjExLjY4NUg5Ni43OTA2Wk05NC45OTA1IDcuNDg0OThDOTUuNzMwNSA3LjQ4NDk4IDk2LjI0MDUgNy44MDQ5OCA5Ni4yNDA1IDguMzE0OThDOTYuMjQwNSA4LjgyNDk4IDk1LjczMDUgOS4xNDQ5OCA5NC45OTA1IDkuMTQ0OThDOTQuMjQwNSA5LjE0NDk4IDkzLjczMDUgOC44MjQ5OCA5My43MzA1IDguMzE0OThDOTMuNzMwNSA3LjgwNDk4IDk0LjI0MDUgNy40ODQ5OCA5NC45OTA1IDcuNDg0OThaTTk0Ljk5MDUgOS45MDQ5OEM5Ni4zMTA1IDkuOTA0OTggOTcuMjIwNiA5LjI3NDk4IDk3LjIyMDYgOC4zMTQ5OEM5Ny4yMjA2IDcuMzU0OTggOTYuMzEwNSA2LjcyNDk4IDk0Ljk5MDUgNi43MjQ5OEM5My42NjA1IDYuNzI0OTggOTIuNzUwNSA3LjM1NDk4IDkyLjc1MDUgOC4zMTQ5OEM5Mi43NTA1IDkuMjc0OTggOTMuNjYwNSA5LjkwNDk4IDk0Ljk5MDUgOS45MDQ5OFpNOTQuNTgwNiAxMi45NTVIOTUuNjEwNVYxMS4yMTVDOTYuMzgwNSAxMS4xNjUgOTcuMTcwNSAxMS4wODUgOTcuOTMwNSAxMC45NTVMOTcuODUwNSAxMC4yMTVDOTUuOTQwNiAxMC40NTUgOTMuNzIwNiAxMC40NzUgOTIuMDYwNSAxMC40ODVMOTIuMTkwNSAxMS4zMjVDOTIuOTEwNSAxMS4zMjUgOTMuNzIwNiAxMS4zMTUgOTQuNTgwNiAxMS4yNzVWMTIuOTU1Wk05NC4zMTA1IDE0LjQwNVYxMi41NzVIOTMuMjgwNVYxNS4yNDVIOTkuODAwNVYxNC40MDVIOTQuMzEwNVoiIGZpbGw9IiMzNTc0RkYiLz4KPHBhdGggZD0iTTEwNC4wNTYgNy40NTQ5OFY4LjI4NDk4SDEwNi41NDZDMTA2LjUxNiA4LjcxNDk4IDEwNi40NDYgOS4xMTQ5OCAxMDYuMzU2IDkuNTE0OThMMTAzLjU5NiA5LjY3NDk4TDEwMy43MzYgMTAuNTY1TDEwNi4wNzYgMTAuMzE1QzEwNS42NDYgMTEuMzA1IDEwNC44NjYgMTIuMTU1IDEwMy41NzYgMTIuODg1TDEwNC4xNTYgMTMuNjE1QzEwNi44NzYgMTIuMDg1IDEwNy41NDYgOS45MDQ5OCAxMDcuNTQ2IDcuNDU0OThIMTA0LjA1NlpNMTEwLjI3NiA2LjM3NDk4VjkuOTQ0OThIMTA5LjI0NlY2LjU5NDk4SDEwOC4yNzZWMTUuMDA1SDEwOS4yNDZWMTAuNzg1SDExMC4yNzZWMTUuNDI1SDExMS4yNjZWNi4zNzQ5OEgxMTAuMjc2WiIgZmlsbD0iIzM1NzRGRiIvPgo8cGF0aCBkPSJNMTE2LjA4NSA3LjEzNDk4SDExNS4wNTVWOC42MTQ5OEMxMTUuMDU1IDEwLjM1NSAxMTQuMTE1IDEyLjA4NSAxMTIuNjc1IDEyLjczNUwxMTMuMjg1IDEzLjU5NUMxMTQuMzc1IDEzLjA2NSAxMTUuMTc1IDExLjk5NSAxMTUuNTg1IDEwLjY4NUMxMTUuOTk1IDExLjkwNSAxMTYuNzg1IDEyLjkwNSAxMTcuODI1IDEzLjM5NUwxMTguNDI1IDEyLjU3NUMxMTcuMDA1IDExLjkzNSAxMTYuMDg1IDEwLjI3NSAxMTYuMDg1IDguNjE0OThWNy4xMzQ5OFpNMTE5LjE0NSA2LjM3NDk4VjE1LjQzNUgxMjAuMTg1VjYuMzc0OThIMTE5LjE0NVoiIGZpbGw9IiMzNTc0RkYiLz4KPHBhdGggZD0iTTEyNC44ODQgMTAuNDE1SDEyMy4yODRWOS4xMjQ5OEgxMjQuODg0VjEwLjQxNVpNMTI1Ljg0NCA2Ljk2NDk4SDEyNC44ODRWOC4zMTQ5OEgxMjMuMjg0VjYuOTY0OThIMTIyLjMxNFYxMS4yNDVIMTI1Ljg0NFY2Ljk2NDk4Wk0xMjMuNDY0IDEzLjEyNUgxMjguNTY0VjE1LjQyNUgxMjkuNTk0VjEyLjMwNUgxMjMuNDY0VjEzLjEyNVpNMTI4LjYxNCA2LjM4NDk4VjguNjc0OThIMTI3LjY2NFY2LjU1NDk4SDEyNi42OTRWMTEuNzc1SDEyNy42NjRWOS41MTQ5OEgxMjguNjE0VjExLjgwNUgxMjkuNTk0VjYuMzg0OThIMTI4LjYxNFoiIGZpbGw9IiMzNTc0RkYiLz4KPC9zdmc+Cg==" class="sc-bqQUSp SgvWC">
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="sc-cmhfgo hPqFOY">
                                                        <div class="sc-geEGrd giwHNF">
                                                            <div class="sc-dERszR YwQuk sc-iWBHJS eVhvzd" tabindex="0">
                                                                <input type="radio" name="payment.type" tabindex="-1" id="14" value="kakao">
                                                                <div class="sc-gvPAUg fbvmiQ">
                                                                    <div></div>
                                                                </div>
                                                                <label for="14">
                                                                    <i class="sc-crrszt etqBmk sc-bzDzvL cEDcLE sc-bHBQji kKODeE"></i>
                                                                    <span class="sc-eCstlR duuteF sc-cDYKPj hSifoy" type="LIGHT_MEDIUM">카카오페이</span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="sc-cmhfgo hPqFOY">
                                                        <div class="sc-geEGrd giwHNF">
                                                            <div class="sc-dERszR YwQuk sc-iWBHJS eVhvzd" tabindex="0">
                                                                <input type="radio" name="payment.type" tabindex="-1" id="12" value="payco">
                                                                <div class="sc-gvPAUg fbvmiQ">
                                                                    <div></div>
                                                                </div>
                                                                <label for="12">
                                                                    <i class="sc-crrszt etqBmk sc-bzDzvL iuktzQ sc-bHBQji kKODeE"></i>
                                                                    <span class="sc-eCstlR duuteF sc-cDYKPj hSifoy" type="LIGHT_MEDIUM">페이코</span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="sc-cmhfgo hPqFOY">
                                                        <div class="sc-geEGrd giwHNF">
                                                            <div class="sc-dERszR YwQuk sc-iWBHJS eVhvzd" tabindex="0">
                                                                <input type="radio" name="payment.type" tabindex="-1" id="13" value="sspay">
                                                                <div class="sc-gvPAUg fbvmiQ">
                                                                    <div></div>
                                                                </div>
                                                                <label for="13">
                                                                    <i class="sc-crrszt etqBmk sc-bzDzvL iVFBsI sc-bHBQji kKODeE"></i>
                                                                    <span class="sc-eCstlR duuteF sc-cDYKPj hSifoy" type="LIGHT_MEDIUM">삼성페이</span>
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
                                                        <div><label tabindex="0" class="sc-iitrMj hEDZFv">
                                                            <span class="sc-dYzmtA dwohaZ"></span>
                                                            <input tabindex="-1" type="checkbox" role="checkbox" name="termsAccepted.all">
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
                                                                        <input type="checkbox" name="termsAccepted.service" tabindex="-1" role="checkbox">
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
                                                                        <input type="checkbox" name="termsAccepted.thirdAgree" tabindex="-1" role="checkbox"></span
                                                                    ><a class="sc-kBPahn jzkOjd">개인정보제3자제공동의(필수)</a>
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
                                                                        <input type="checkbox" name="termsAccepted.privacy" tabindex="-1" role="checkbox">
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
                                                                    <span class="sc-ezrnTI VKDJw"><input type="checkbox" name="termsAccepted.promotion" tabindex="-1" role="checkbox"></span>
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
                                                        <span class="sc-eCstlR WoNTC sc-bqqVGf bNtUdC" type="NORMAL_LARGEST">90,659원</span>
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