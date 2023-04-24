<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.living.model.LivingVO"%>
<%@page import="com.semi.living.model.LivingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/living_d.css">
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:useBean id="LivingService" class="com.semi.living.model.LivingService"></jsp:useBean>
<%
	String wNo = request.getParameter("wNo");

	LivingVO vo = null;
	String imgPath="";
	try{
		vo = LivingService.selectBywNo(Integer.parseInt(wNo));
		
		String fname = vo.getfName();
		
		if(fname==null){
			imgPath="../upload/noimg.jpg";
		}else{
			imgPath="../upload/"+fname;
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	String nickname="";
%>
	<h2>상세보기</h2>
	<hr>
	<br>
	<div>
	<div id="title">
		<p style="float: left;">제목 : <%=vo.getTitle() %></p>
		<p style="float: right;">작성자 : <%nickname = LivingService.findNickname(vo.getwNo());%><%=nickname %></p><br>
	</div>
	<div id="view">
		<p>조회수 : <%=vo.getlView() %></p>
	</div>
	<div>
		<img src="<%=imgPath%>">
	</div>
	<div id="content">
	<p style="float: left;">내용 : <%=vo.getContent() %></p><br>
	</div>
	<div id="image">
	<a href="living_recUp.jsp?wNo=<%=wNo %>"><img alt="" src="../image/rec.png" style="width: 50px;height: 50px;"></a> <%=vo.getRec() %>
	</div>
		<button type="button" class="btn btn-success" id="bt">
		<a href="living.jsp" class="link-light">목록</a></button>
		<button type="button" class="btn btn-success" id="bt">
		<a href="living_update.jsp?wNo=<%=wNo%>" class="link-light">수정</a></button>
		<button type="button" class="btn btn-success" id="bt">
		<a href="living_delete.jsp?wNo=<%=wNo%>" class="link-light">삭제</a></button>
	</div>
<jsp:include page="../inc/bottom.jsp"></jsp:include>