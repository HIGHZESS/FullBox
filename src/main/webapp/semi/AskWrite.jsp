<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="../css/living_w.css">
<%@ include file="LoginCheck.jsp"%>

<%
int mno = (int)session.getAttribute("mno");
%>


<form  method="post" action="AskWrite_ok.jsp">
	<h2>문의하기</h2>
	<input type ="hidden" name = "mno" id ="mno" value="<%=mno%>">
	<hr>
	<br>
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">제목</label>
	  <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력해주세요" name="title">
	</div>
	<div class="mb-3">
	  <label for="exampleFormControlTextarea1" class="form-label">문의 내용</label>
	  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="내용을 입력해주세요" name="content"></textarea>
	</div>
	<hr>
		<div class="form-group"> 

		<hr>
		<button type="submit" class="btn btn-primary">작성</button>
		<button type="reset" class="btn btn-primary">취소</button>
		<p><a href="living.jsp">목록</a></p>
	</div>
</form>
<jsp:include page="../inc/bottom.jsp"></jsp:include>