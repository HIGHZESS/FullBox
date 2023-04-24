<%@page import="com.semi.common.Utility"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<jsp:useBean id="rService" class="com.semi3.member.model.RecipeService" scope="session"></jsp:useBean>
<jsp:useBean id="rVo" class="com.semi3.member.model.RecipeVO" scope="session"></jsp:useBean>
<%
String no = request.getParameter("no");
if(no==null || no.isEmpty()){%>
<script type="text/javascript">
	alert('잘못된 url입니다.');
	location.href="list.jsp";
</script>

<%	return;
}
try{
	rVo=rService.selectByNo(Integer.parseInt(no));
}catch(SQLException e){
	e.printStackTrace();
}

String originalFileName=rVo.getfOname();

%>
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
		if($(this).html()="내용을 입력해주세요."){
			$(this).html("");
		}
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
	
	
	var level = <%=rVo.getrLevel() %>;
	$('.stars').children('input[type=radio]').each(function(idx,item){
		console.log(level);
		if(level==idx){
		$('#star-'+idx+'').prop('checked', true);
		console.log(idx);
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
<form action="recipe_edit_ok.jsp" method="post" enctype="multipart/form-data">  <!-- 글작성 => recipe_write_ok.jsp로 넘어감 --> <!-- recipe_write_title, editordata -->
	<input type="text" id="rLevel" name="rLevel" value="<%=rVo.getrLevel() %>">
	<input type="text" name="no" value="<%=no %>" />
	<input type="text" name="oldFileName" value="<%=rVo.getfName() %>" />
	<input type="text" id="recipe_write_title" name="title" value="<%=rVo.getTitle() %>">
	
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
    <div>
       <!-- <span class="sp1">첨부파일목록</span><br> -->
       <%if(originalFileName!=null && !originalFileName.isEmpty()){ %>
       <div style="float: left; text-align: left;">
			<span style="text-align: left">
	         	<%=Utility.getFileInfo(rVo) %>
			</span>
			<br>
			<span style="color: green;font-weight: bold;">첨부파일을 새로 지정할 경우 기존 파일은 삭제됩니다.</span>
       	</div>
       <%} %>
   </div>
	<textarea id="recipe_write_ta" name="content" ><%=rVo.getContent() %></textarea><br>
	<div id="recipe_write_subBt">
  		<input type="submit" value="수정완료"><br><br>
  	</div>
</form>


<%@ include file="../inc/bottom.jsp"%>