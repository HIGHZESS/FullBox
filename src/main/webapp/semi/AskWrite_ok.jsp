<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="askService" class="com.semi.AskBoard.AskBoardService"
	scope="session"></jsp:useBean>
<jsp:useBean id="askVo" class="com.semi.AskBoard.AskBoardVO"
	scope="session"></jsp:useBean>    
    
<%
request.setCharacterEncoding("utf-8");
String title = request.getParameter("title");
String content = request.getParameter("content");
String mno = request.getParameter("mno");


askVo.setTitle(title);
askVo.setContent(content);
askVo.setMno(Integer.parseInt(mno));

String msg="글작성 실패!", url="AskWrite.jsp";
try{
	int cnt = askService.insertAsk(askVo);
	
	if(cnt>0){
		msg="글작성 성공!";
		url="AskBoard.jsp";
	}
}catch(SQLException e){
	e.printStackTrace();
}
request.setAttribute("msg", msg);
request.setAttribute("url", url);



%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>AskWrite_ok.jsp</title>
</head>
<body>

<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>