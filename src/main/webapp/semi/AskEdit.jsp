<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="askService" class="com.semi.AskBoard.AskBoardService"
scope="session"></jsp:useBean>
<jsp:useBean id="askVo" class="com.semi.AskBoard.AskBoardVO"
	scope="session"></jsp:useBean>  
<jsp:include page="../inc/top.jsp"></jsp:include>    

<%
	String aNo = request.getParameter("aNo");
	
	if (aNo == null || aNo.isEmpty()) {
	%>
	<script type="text/javascript">
		alert('잘못된 url입니다.');
		location.href = "AskBoard.jsp";
	</script>

	<%
	return;
	}
	try{
		askVo = askService.selectByaNo(Integer.parseInt(aNo));

	}catch(SQLException e){
		e.printStackTrace();	
	}
	



%>
<link rel="stylesheet" href="../css/living_w.css">
<form  method="post" action="AskEdit_ok.jsp">
	<input type="hidden" name="aNo" value="<%=aNo%>">
	<h2>문의글 수정</h2>
	<hr>
	<div id="div1">
	<br>
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">글 제목</label>
	  <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력해주세요" name="title"
	  	value="<%=askVo.getTitle()%>">
	</div>
	<div class="mb-3">
	  <label for="exampleFormControlTextarea1" class="form-label">글 내용</label>
	  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="내용을 입력해주세요" name="content"
	  	><%=askVo.getContent()%></textarea>
	</div>
		<input type="submit" value="수정">
		<input type="reset" value="취소">
		<p><a href="AskBoard.jsp">목록</a></p>
	</div>
</form>
<jsp:include page="../inc/bottom.jsp"></jsp:include>

