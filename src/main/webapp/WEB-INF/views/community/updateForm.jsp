<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
	
	
	<script type="text/javascript">		
		$(function(){
			//alert(11);
			
			//유효성 검사
			$("input[type=submit]").click(function(){
				let f = window.document.writeForm;
				
				if ( f.boardTag1.value == "") {
				    alert( "캠핑유형을 선택해주세요." );
				    f.boardContent.focus();
					return false;
				}
				
				if ( f.boardTag2.value == "") {
				    alert( "환경을 선택해주세요." );
				    f.boardContent.focus();
					return false;
				}
				
				if ( f.boardContent.value == "") {
				    alert( "내용을 입력해주세요." );
				    f.boardContent.focus();
					return false;
				}
			
			//select 값 합치기
				 var boardTag1 =$("[name=boardTag1]").val();
				 var boardTag2 =$("[name=boardTag2]").val();
				
				 var boardTag ="";
				 
				 boardTag = "#" + boardTag1 + "#" + boardTag2;
				 
				$("[name=boardTag]").attr("value", boardTag);
			});

			
		});		
	
	</script>
	
	<style type="text/css">
		
		
		#att_zone {
		  min-height: 150px;
		  padding: 10px;
		  border: 1px solid #edeef0;
		  border-radius: 8px;
		  width: 720px;
		  height: 250px;
		  
		}
		
		#att_zone:empty:before {
		  content: attr(data-placeholder);
		  color: #999;
		  font-size: 10pt;
		}

	</style>
	
</head>
<body>
	<div style="position: relative; padding: 32px; border: 1px solid #edeef0; border-radius: 8px;
				width: 80%; margin-top: 50px; margin-left: auto; margin-right: auto; margin-bottom: 50px">
		

		<form name="writeForm" method="post" action="${pageContext.request.contextPath}/community/update" 
			  onSubmit='return checkValid()' enctype="multipart/form-data">			  
			  
			<%-- <input type=hidden name="memberNo" value="${member.memberNo}"> --%>
			
			<input type="hidden" name="boardTag" value="">
			
			<input type="hidden" name="boardNo" value="${board.boardNo }"/>
					  
			<table style="width: 70%; margin-left: auto; margin-right: auto;">
				<tr>
					<td>
						<select name="boardTag1" 
								style="display: inline-block; margin-left: 6px; border-color: #4876ef; color: gray; background-color: #fff;
									   border: 1px solid #edeef0; box-sizing: border-box; text-align: center;padding: 0 8px 1px; height: 24px;
									   border-radius: 4px; font-size: 12px; letter-spacing: -0.5px; line-height: 20px; cursor: pointer;">
							<option value="">캠핑유형</option>
							<option value="오토캠핑">오토캠핑</option>
							<option value="방갈로">방갈로</option>
							<option value="카라반">카라반</option>
							<option value="글램핑">글램핑</option>
							<option value="펜션">펜션</option>
							<option value="차박">차박</option>
						</select>
			
						<select name="boardTag2"
								style="display: inline-block; margin-left: 6px; border-color: #4876ef; color: gray; background-color: #fff;
					  	  			   border: 1px solid #edeef0; box-sizing: border-box; text-align: center;padding: 0 8px 1px; height: 24px;
					 				   border-radius: 4px; font-size: 12px; letter-spacing: -0.5px; line-height: 20px; cursor: pointer;">
							<option value="">환경</option>
							<option value="바다">바다</option>
						    <option value="산">산</option>
						    <option value="강">강</option>
						    <option value="호수">호수</option>
						    <option value="계곡">계곡</option>
						    <option value="기타">기타</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>
						<p style="white-space: pre-line;">
							<textarea name="boardContent" rows="10" cols="100" 
									  style="font-size: 10pt; white-space: pre-line; border: 1px solid #edeef0; border-radius: 8px;">${board.boardContent }</textarea>
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<div id='image_preview' >
							<br>
				        	<!-- <input type='file' id='btnAtt' name="file" multiple='multiple' /> -->
				      		<input type='file' id='btnAtt' name="files" multiple='multiple' />  
			    			<div id='att_zone' data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
	  					</div>
					</td>
				</tr>
				<tr>
					<td>
						<div style="text-align: right;">
							<br>
	  						<input type="button" value="뒤로가기" onclick="javascript:history.back();"
	  								style="display: inline-block; margin-left: 6px; border-color: #4876ef; color: #4876ef; background-color: #fff;
					 					   border: 1px solid #4876ef; box-sizing: border-box; text-align: center;padding: 0 8px 1px; height: 24px;
					 					   border-radius: 4px; font-size: 12px; letter-spacing: -0.5px; line-height: 20px; cursor: pointer;"/>
					  
	  						<input type=submit value=수정하기
	  							   style="display: inline-block; margin-left: 6px;border-color: #d7dce5; color: #5c667b; background-color: #fff;
			   		  					  padding: 0 8px 1px; height: 24px; border-radius: 4px; font-size: 12px; letter-spacing: -0.5px;
			   		  					  line-height: 20px; border: 1px solid #edeef0; box-sizing: border-box; text-align: center;cursor: pointer;"/>
	  					</div>
					</td>
				</tr>
			</table>
	  		
	  	</form>	
	</div>



	<script>
  			/* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
			(imageView = function imageView(att_zone, btn){

			    var attZone = document.getElementById(att_zone);
			    var btnAtt = document.getElementById(btn)
			    var sel_files = [];
    
			    // 이미지와 체크 박스를 감싸고 있는 div 속성
			    var div_style = 'display:inline-block;position:relative;'
			                  + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
			    // 미리보기 이미지 속성
			    var img_style = 'width:100%;height:100%;z-index:none';
			    // 이미지안에 표시되는 체크박스의 속성
			    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
			                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:white';
  
			    btnAtt.onchange = function(e){
			      var files = e.target.files;
			      var fileArr = Array.prototype.slice.call(files)
			      for(f of fileArr){
			        imageLoader(f);
			      }
			    }  
			    
  
			    // 탐색기에서 드래그앤 드롭 사용
			    attZone.addEventListener('dragenter', function(e){
			      e.preventDefault();
			      e.stopPropagation();
			    }, false)
    
			    attZone.addEventListener('dragover', function(e){
			      e.preventDefault();
			      e.stopPropagation();
			      
			    }, false)
  
			    attZone.addEventListener('drop', function(e){
			      var files = {};
			      e.preventDefault();
			      e.stopPropagation();
			      var dt = e.dataTransfer;
			      files = dt.files;
			      for(f of files){
			        imageLoader(f);
			      }
			      
			    }, false)
    

    
			    /*첨부된 이미지를 배열에 넣고 미리보기 */
			    imageLoader = function(file){
			      sel_files.push(file);
			      var reader = new FileReader();
			      reader.onload = function(ee){
			        let img = document.createElement('img')
			        img.setAttribute('style', img_style)
			        img.src = ee.target.result;
			        attZone.appendChild(makeDiv(img, file));
			      }
			      
			      reader.readAsDataURL(file);
			    }
    
			    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
			    makeDiv = function(img, file){
			      var div = document.createElement('div')
			      div.setAttribute('style', div_style)
			      
			      var btn = document.createElement('input')
			      btn.setAttribute('type', 'button')
			      btn.setAttribute('value', 'x')
			      btn.setAttribute('delFile', file.name);
			      btn.setAttribute('style', chk_style);
			      btn.onclick = function(ev){
			        var ele = ev.srcElement;
			        var delFile = ele.getAttribute('delFile');
			        for(var i=0 ;i<sel_files.length; i++){
			          if(delFile== sel_files[i].name){
			            sel_files.splice(i, 1);      
			          }
			        }
        
			        dt = new DataTransfer();
			        for(f in sel_files) {
			          var file = sel_files[f];
			          dt.items.add(file);
			        }
			        btnAtt.files = dt.files;
			        var p = ele.parentNode;
			        attZone.removeChild(p)
			      }
			      div.appendChild(img)
			      div.appendChild(btn)
			      return div
			    }
			  }
			)('att_zone', 'btnAtt')

		</script>



</body>
</html>