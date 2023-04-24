<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="rService" class="com.semi3.member.model.RecipeService" scope="session"></jsp:useBean>
<jsp:useBean id="rVo" class="com.semi3.member.model.RecipeVO" scope="session"></jsp:useBean>
<%
	String no=request.getParameter("no"); //올라갈 게시글
	String rLevel=request.getParameter("rLevel"); //올라갈 점수
	
	int cnt = rService.updateStcount(Integer.parseInt(no), Integer.parseInt(rLevel));
	if(cnt>0){%>
	<script type="text/javascript">
		alert('추천이 완료되었습니다');
		opener.parent.location.reload();
		window.close();
	</script>
	<%}

	%>

</body>
</html>