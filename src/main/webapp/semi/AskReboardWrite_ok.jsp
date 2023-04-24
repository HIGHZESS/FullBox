<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <jsp:useBean id="reboardService" class="com.semi.AskReboard.AskReboardService"
	scope="session"></jsp:useBean>
<jsp:useBean id="reboardVo" class="com.semi.AskReboard.AskReboardVO"
	scope="session"></jsp:useBean>  
	
<jsp:useBean id="askVo" class="com.semi.AskBoard.AskBoardVO"
	scope="session"></jsp:useBean>
<jsp:useBean id="askService" class="com.semi.AskBoard.AskBoardService"
	scope="session"></jsp:useBean>
	
<%
request.setCharacterEncoding("utf-8");
String recontent = request.getParameter("recontent");
String mNo = request.getParameter("mNo");
String aNo = request.getParameter("aNo");

reboardVo.setRecontent(recontent);
reboardVo.setMno(Integer.parseInt(mNo));
reboardVo.setAno(Integer.parseInt(aNo));


String msg="답글작성 실패!", url="AskBoard.jsp";
try{
	int cnt = reboardService.insertReply(reboardVo);
	int result = askService.updateIsReply(reboardVo.getAno());
	
	if(cnt>0){
		msg="답글작성 성공!";
		url="AskBoard.jsp";
	}

}catch(SQLException e){
	e.printStackTrace();
}
request.setAttribute("msg", msg);
request.setAttribute("url", url);



%>	

	
<jsp:forward page="../common/message.jsp"></jsp:forward>
