<%@page import="com.semi.bmember.model.bMemberVO"%>
<%@page import="com.semi.bmember.model.bMemberService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login_ok.jsp</title>
</head>
<body>
<jsp:useBean id="bmemService" class="com.semi.bmember.model.bMemberService" scope="session"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String chkSaveId = request.getParameter("chkSaveId");




String msg = "로그인실패", url ="Login.jsp";
try{
	int result = bmemService.checkLogin(id, pwd);
	
	if(result == bMemberService.LOGIN_OK){
		bMemberVO bmemVO = bmemService.selectByUserid(id);

		int mno = bmemVO.getMno();
		String nickname = bmemVO.getNickname();
		String type = bmemVO.getSub();

		//session 에 아이디,비밀번호,닉네임,회원번호seq,type 정보 저장
		session.setAttribute("mno", mno);
		session.setAttribute("id", id);
		session.setAttribute("pwd", pwd);
		session.setAttribute("nickname",nickname);
		session.setAttribute("type", type);
		
		//쿠키에 아이디 저장
		Cookie ck = new Cookie("ck_id",id);
		ck.setPath("/");
		if(chkSaveId !=null){
			ck.setMaxAge(1000*24*60*60);
			response.addCookie(ck);
		}else{
			ck.setMaxAge(0);
			response.addCookie(ck);
		}
		msg = bmemVO.getNickname()+"님, 로그인되었습니다";
		url ="index.jsp";	
	}else if(result ==bMemberService.DISAGREE_PWD){
		msg = "비밀번호가 일치하지 않습니다";
	}else if(result ==bMemberService.NONE_USERID){
		msg ="해당아이디가 존재하지않습니다";
	}
}catch(SQLException e){
	e.printStackTrace();
}

request.setAttribute("msg", msg);
request.setAttribute("url", url);


%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>