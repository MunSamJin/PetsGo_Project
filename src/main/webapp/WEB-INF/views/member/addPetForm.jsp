<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<script>
		$(document).ready(function(){				
			/////////////////////////////////////
			//등록 버튼 클릭 시 유효성 체크
			$("#addPetForm").submit(function(){	
				if($("#petName").val().trim()==""){
					alert("이름을 입력해 주세요");	
					$("#petName").focus();
					return false;
				}
				
				if($("#petWeight").val().trim()==""){
					alert("몸무게를 입력해 주세요");	
					$("#petWeight").focus();
					return false;
				}
				
				/* if($("input[name=petNeuter]:checked").val() == 0 || $("input[name=petNeuter]:checked").val() == 1) {
					alert("중성화 수술 여부를 다시 확인해 주세요");						
					return false;
				} */		
			})
			
			//////////////////////////////////////////
			//몸무게 유효성 체크
			$("#petWeight").change(function(){
    			checkWeight($("#petWeight").val());
			});			
			
			function checkWeight(weight){	
				let num = /[0-9]/;	//숫자 
					
				if(!(num.test(weight))){            
			        $("#weigthValid").html("숫자 또는 '.'만 입력해 주세요").css("color","red");
			        $("#petWeight").focus();
			        return false;
			    }    
				
				$("#weigthValid").html("");
			    return true;
			}
				
			/////////////////////////////////////
			//중성화 수술 여부 checked 변경하기
			/* $("#petWeight").change(function(){
				//alert( $("input[name=petNeuter]:checked").val() );
				$("input:radio[id=notNeuter]").prop("checked", false); 
				$("input:radio[id=doneNeuter]").prop("checked", true); 
				//alert( $("input[name=petNeuter]:checked").val() );
			})
			
			$("input[name=petNeuter]:checked").val(); */
			
			
			/////////////////////////////////////
			//광견병 예방 접종일 달력
			$.datepicker.regional['ko'] = {
		        closeText: '닫기',
		        prevText: '이전달',
		        nextText: '다음달',
		        currentText: '오늘',
		        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
		        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
		        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		        '7월','8월','9월','10월','11월','12월'],
		        dayNames: ['일','월','화','수','목','금','토'],
		        dayNamesShort: ['일','월','화','수','목','금','토'],
		        dayNamesMin: ['일','월','화','수','목','금','토'],
		        weekHeader: 'Wk',
		        dateFormat: 'yy-mm-dd',
		        firstDay: 0,
		        isRTL: false,
		        showMonthAfterYear: true,
		        yearSuffix: '',
		        changeMonth: true,
		        changeYear: true,
		        showButtonPanel: true,
		        yearRange: "2020:2023"
		    };
			
		    $.datepicker.setDefaults($.datepicker.regional['ko']);
		
		    $("#datepicker").datepicker();    
		    $("#datepicker").datepicker("option", "maxDate", new Date());
			
			/////////////////////////////////////
			//취소 버튼 클릭 시 반려견 정보 페이지로 이동
			$("#addPetForm > button").click(function(){								
				location.href = "${pageContext.request.contextPath}/member/myInfo";
			})
			
		}) //ready
	</script>
</head>
<body>
	<div class="container">
		<h3>member/addPetForm.jsp</h3>
		
		<form id="addPetForm" action="${pageContext.request.contextPath}/member/addPet" method="post">
			<input type="hidden" name="memberNo" value="<sec:authentication property="principal.memberNo"/>">
			
			이름 <input type="text" name="petName" id="petName"><br>
			몸무게 <input type="text" name="petWeight" id="petWeight"> kg <br>
			<span id="weigthValid"></span><br><br>
			중성화 수술 여부 
				<input type="radio" name="petNeuter" id="notNeuter" value="0" checked> 비수술
				<input type="radio" name="petNeuter" id="doneNeuter" value="1"> 수술 <br>
			마지막 광견병 예방 접종일 <input type="text" name="petVaccine" id="datepicker"> <br>
			* 예약 시 증빙 서류를 제출하셔야 합니다.<br><br>
			
			기타 특이사항 <br>
			<textarea name="petOther" cols="50" rows="5"></textarea><br><br>
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="submit" value="등록">
			<a href="${pageContext.request.contextPath}/member/myInfo"><button type="button">취소</button></a>
		</form>
	</div>	
</body>
</html>