<%@page import="com.semi.bmember.model.bMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="bmemService"
		class="com.semi.bmember.model.bMemberService" scope="session"></jsp:useBean>    
<%

request.setCharacterEncoding("utf-8");
String nickname=request.getParameter("nickname");

//2
int result=0;
if(nickname !=null && !nickname.isEmpty()){
	result=bmemService.duplicateNickname(nickname);
} 
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css"/>

<script type="text/javascript" 
	src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btUse').click(function(){
			$(opener.document).find('#nickname').val('<%=nickname%>');
			$(opener.document).find('#chknickname').val('Y');
			
			self.close();
		});
	})
</script>
</head>
<body>
<h2>닉네임 중복 검사</h2>
	<form name="frmId" method="post" action="checkNickname.jsp">
		<input type="text" name="nickname" id="nickname" 
			title="닉네임입력" value="<%=nickname%>">
		<input type="submit"  id="submit" value="닉네임 확인">
		
		<%if(result== bMemberService.UNUSABLE_NICKNAME){ %>
			<p>이미 등록된 닉네임입니다. 다른 닉네임를 입력하세요</p>
		<%}else if(result==bMemberService.USABLE_NICKNAME ) { %>
			<input type="button" value="사용하기" id="btUse">
			<p>사용가능한 닉네임입니다. [사용하기]버튼을 클릭하세요</p>
		<%} %>
	</form>
</body>
</html>