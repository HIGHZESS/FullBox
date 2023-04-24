<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="askService" class="com.semi.AskBoard.AskBoardService"
scope="session"></jsp:useBean>
<jsp:useBean id="askVo" class="com.semi.AskBoard.AskBoardVO"
	scope="session"></jsp:useBean>      
<%
	request.setCharacterEncoding("utf-8");
	String aNo = request.getParameter("aNo");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	askVo.setaNo(Integer.parseInt(aNo));
	askVo.setTitle(title);
	askVo.setContent(content);
	
	String msg="글수정 실패!", url="AskBoard.jsp";
	try{
		int cnt = askService.updateAsk(askVo);
		if(cnt>0){
			msg="글수정 성공!";
			url="AskBoard.jsp";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	
	


%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
