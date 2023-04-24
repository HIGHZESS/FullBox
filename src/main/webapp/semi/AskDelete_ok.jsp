<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="askService" class="com.semi.AskBoard.AskBoardService"
	scope="session"></jsp:useBean>
     
<%
	request.setCharacterEncoding("utf-8");
	String aNo = request.getParameter("aNo");
	
	String msg="삭제가 실패했습니다" , url="AskBoard.jsp";
	try{
		int cnt = askService.deleteAsk(Integer.parseInt(aNo));
		if(cnt>0){
			msg="삭제가 완료되었습니다!";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
