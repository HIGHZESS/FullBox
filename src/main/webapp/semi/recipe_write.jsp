<%@page import="com.semi3.member.model.RecipeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!-- <script src="../js/summernote/summernote-lite.js"></script>
<script src="../js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../css/summernote/summernote-lite.css"> --> <!-- 썸머노트부분 주석처리 -->

<link rel="stylesheet" type="text/css" href="../css/recipe.css?v=<%=System.currentTimeMillis()%>" />
<script type="text/javascript">
$(document).ready(function() {
/* 	//여기 아래 부분
	$('#summernote').summernote({
		  height: 500,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: ''	//placeholder 설정
	});
	
	$('#summernote').summernote('justifyLeft'); */
	
	$('#recipe_write_title').click(function(){

		if($(this).val()=="제목을 입력해주세요"){
			$(this).val("");
		}
		$(this).css("color","black");
	});

	$('#recipe_write_ta').click(function(){
		$(this).html("");
		$(this).css("color","black");
	});
	
	
	/* 요리 난이도를 별점클릭을 통해서 확인하는 클릭함수 */
	var rLevel = 0;
	var result = false;
	$('.star-1').eq(1).click(function(){
		result = confirm("요리의 난이도가 [최하]가 맞나요?");
		if(result){
			rLevel=1;
			$('#rLevel').val(rLevel);
		}
	});
	$('.star-2').eq(1).click(function(){
		result = confirm("요리의 난이도가 [하]가 맞나요?");
		if(result){
			rLevel=2;
			$('#rLevel').val(rLevel);
		}
	});
	$('.star-3').eq(1).click(function(){
		result = confirm("요리의 난이도가 [중]이 맞나요?");
		if(result){
			rLevel=3;
			$('#rLevel').val(rLevel);
		}
	});
	$('.star-4').eq(1).click(function(){
		result = confirm("요리의 난이도가 [상]이 맞나요?");
		if(result){
			rLevel=4;
			$('#rLevel').val(rLevel);
		}
	});
	$('.star-5').eq(1).click(function(){
		confirm("요리의 난이도가 [최상]이 맞나요?");
		if(result){
			rLevel=5;
			$('#rLevel').val(rLevel);
		}
	});
});
</script>

<div id="recipe_header">
	<a href="recipe.jsp">
		<h1>레시피 공유 게시판</h1>
	</a>
		<br>
</div>
	<br>
<form action="recipe_write_ok.jsp" method="post" enctype="multipart/form-data">  <!-- 글작성 => recipe_write_ok.jsp로 넘어감 --> <!-- recipe_write_title, editordata -->
	<input type="hidden" id="rLevel" name="rLevel" value="0"> <!-- 히든처리해야함 -->
	<input type="text" id="recipe_write_title" name="title" value="제목을 입력해주세요">
	
	<div class="cont">
		<div class="title">
	  		<p>요리의 난이도를 선택해주세요!</p>
		</div>
		<div class="stars">
			  <input class="star star-5" id="star-5" type="radio" name="star"/>
			  <label class="star star-5" for="star-5"></label>
			  <input class="star star-4" id="star-4" type="radio" name="star"/>
			  <label class="star star-4" for="star-4"></label>
			  <input class="star star-3" id="star-3" type="radio" name="star"/>
			  <label class="star star-3" for="star-3"></label>
			  <input class="star star-2" id="star-2" type="radio" name="star"/>
			  <label class="star star-2" for="star-2"></label>
			  <input class="star star-1" id="star-1" type="radio" name="star"/>
			  <label class="star star-1" for="star-1"></label>
		</div>
	</div>
	
	<br>
	<input type="file" name="fileName" id="fileName"><br><br>
	<textarea id="recipe_write_ta" name="content" >내용을 입력해주세요.</textarea><br>
	<div id="recipe_write_subBt">
  		<input type="submit" value="작성"><br><br>
  	</div>
</form>


<%@ include file="../inc/bottom.jsp"%>