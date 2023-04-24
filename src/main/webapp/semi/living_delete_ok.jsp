<%@page import="com.semi.living.model.LivingVO"%>
<%@page import="com.semi.bmember.model.bMemberVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="LivingService" class="com.semi.living.model.LivingService"></jsp:useBean>
<jsp:useBean id="bMemberService" class="com.semi.bmember.model.bMemberService"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String wNo = request.getParameter("wNo");
	String id = request.getParameter("id");
	
	LivingVO vo = new LivingVO();
	bMemberVO memVo = new bMemberVO();
	String msg="삭제가 실패했습니다" , url="living.jsp";
	try{
		vo = LivingService.selectBywNo(Integer.parseInt(wNo));
		memVo = bMemberService.selectByUserid(id);
		if(memVo.getMno()==vo.getmNo()){
			int cnt = LivingService.deleteLiving(Integer.parseInt(wNo));
			if(cnt>0){
				msg="삭제가 완료되었습니다!";
			}
		}else{
			msg="본인만 삭제할 수 있습니다";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="message.jsp"></jsp:forward>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>