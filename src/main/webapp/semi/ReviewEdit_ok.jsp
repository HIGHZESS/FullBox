<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReviewEdit_ok.jsp</title>
</head>
<body>

<%request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="reviewService" class="com.ReviewBoard.ReviewService"
		scope="session"></jsp:useBean>
	<jsp:useBean id="reviewVO" class="com.ReviewBoard.ReviewVO"
		scope="session"></jsp:useBean>
<%
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String wno = request.getParameter("wNo");

	reviewVO.setTitle(title);
	reviewVO.setContent(content);
	reviewVO.setwNo(Integer.parseInt(wno));
	
	
	String msg = "글 수정 실패", url ="AllReview.jsp";
	try {
		int cnt = reviewService.updateReview(reviewVO);
	
		if(cnt>0){
			msg = "글 수정 성공";
			url = "ReviewDetail.jsp?wno="+wno;
		}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
<h1><%=title %></h1>
<h1><%=content %></h1>
<h1><%=wno %></h1>
</body>
</html>