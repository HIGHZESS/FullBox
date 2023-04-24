<%@page import="com.semi.living.model.LivingVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:useBean id="LivingService" class="com.semi.living.model.LivingService"></jsp:useBean>
<%
	String wNo = request.getParameter("wNo");
	/* String mNo = request.getParameter("mNo"); */
	LivingVO vo = new LivingVO();
	try{
		vo = LivingService.selectBywNo(Integer.parseInt(wNo));
		
		String No = Integer.toString(vo.getwNo());
		/* if(!No.equals(mNo)){
			
		} */
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
<link rel="stylesheet" href="../css/living_w.css">
<form  method="post" action="living_update_ok.jsp" enctype="multipart/form-data">
	<input type="hidden" name="wNo" value="<%=wNo%>">
	<br><br><br>
	<input type="hidden" value="<%=session.getAttribute("id")%>" name="id">
	<h2>리빙 노하우 글 수정</h2>
	<div id="div1">
	<br>
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">글 제목</label>
	  <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력해주세요" name="title"
	  	value="<%=vo.getTitle()%>">
	</div>
	<div class="mb-3">
	  <label for="exampleFormControlTextarea1" class="form-label">글 내용</label>
	  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="내용을 입력해주세요" name="content"
	  	><%=vo.getContent()%></textarea>
	</div>
		파일 : <input type="file" name="fileName" id="File"><br>
		<input type="submit" value="수정">
		<input type="reset" value="취소">
		<p><a href="living.jsp">목록</a></p>
	</div>
</form>
<jsp:include page="../inc/bottom.jsp"></jsp:include>