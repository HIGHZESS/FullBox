<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:include page="LoginCheck.jsp"></jsp:include>
<link rel="stylesheet" href="../css/living_w.css">
<form  method="post" action="living_write_ok.jsp" enctype="multipart/form-data">
	<input type="hidden" value="<%=session.getAttribute("id")%>" name="id">
	<h2>리빙 노하우 게시판 글쓰기</h2>
	<hr>
	<div id="div1">
	<br>
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">글 제목</label>
	  <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력해주세요" name="title">
	</div>
	<div class="mb-3">
	  <label for="exampleFormControlTextarea1" class="form-label">글 내용</label>
	  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="내용을 입력해주세요" name="content"></textarea>
	</div>
	<hr>
		<div class="form-group"> 
		파일 : <input type="file" name="fileName" id="File"><br>
		</div>
		<hr>
		<button type="submit" class="btn btn-primary" id="bt123">작성</button>
		<button type="reset" class="btn btn-primary" id="bt123">취소</button>
		<button type="reset" class="btn btn-primary" id="bt123"><a href="living.jsp" style="color: white;">목록</a></button>
	</div>
</form>
<jsp:include page="../inc/bottom.jsp"></jsp:include>