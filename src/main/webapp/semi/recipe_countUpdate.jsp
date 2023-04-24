<%@page import="java.sql.SQLException"%>
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
<%
	//1
	String no = request.getParameter("no");
	if(no==null || no.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 접근입니다');
			history.go(-1);
		</script>
		
		<%return;
	}
	//2
	try{
		int cnt = rService.updateCount(Integer.parseInt(no));
		//3
		if(cnt>0){
			response.sendRedirect("recipe_detail.jsp?no="+no);
		}else{%>
			<script type="text/javascript">
				alert('조회수 증가 실패!');
				history.back();
			</script>
		<% }
	}catch(SQLException e){
		e.printStackTrace();
	}

%>
</body>
</html>