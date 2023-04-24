<%@page import="com.semi.bmember.model.bMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="bmemService"
		class="com.semi.bmember.model.bMemberService" scope="session"></jsp:useBean>    

<%

//[1] register.jsp에서 중복확인 버튼 클릭하면 open() => 새창 열림, get방식
//=> http://localhost:9090/herbmall/member/checkUserid.jsp?userid=hong
//[2] checkUserid.jsp에서 아이디확인 버튼 클릭하면 post방식으로 서브밋
	

request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");

//2
int result=0;
if(id !=null && !id.isEmpty()){
	result=bmemService.duplicateId(id);
}


%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkUserid.jsp</title>
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css"/>

<script type="text/javascript" 
	src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btUse').click(function(){
			$(opener.document).find('#id').val('<%=id%>');
			$(opener.document).find('#chkId').val('Y');
			
			self.close();
		});
	})
</script>
</head>
<body>
<h2>아이디 중복 검사</h2>
	<form name="frmId" method="post" action="checkUserid.jsp">
		<input type="text" name="id" id="id" 
			title="아이디입력" value="<%=id%>">
		<input type="submit"  id="submit" value="아이디 확인">
		
		<%if(result==bMemberService.UNUSABLE_ID){ %>
			<p>이미 등록된 아이디입니다. 다른 아이디를 입력하세요</p>
		<%}else if(result==bMemberService.USABLE_ID ) { %>
			<input type="button" value="사용하기" id="btUse">
			<p>사용가능한 아이디입니다. [사용하기]버튼을 클릭하세요</p>
		<%} %>
	</form>
</body>
</html>