<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="LivingService" class="com.semi.living.model.LivingService"></jsp:useBean>
<%
	String wNo = request.getParameter("wNo");
	
	
	try{
		LivingService.recUpdate(Integer.parseInt(wNo));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	response.sendRedirect("living_detail.jsp?wNo="+wNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>