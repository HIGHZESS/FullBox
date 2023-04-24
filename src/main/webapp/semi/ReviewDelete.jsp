<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="LoginCheck.jsp"%>
<jsp:useBean id="reviewService" class="com.ReviewBoard.ReviewService"
	scope="session"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<%
//detail 에서 get 방식으로 넘어옴
String wno = request.getParameter("wno");

try{
	int cnt = reviewService.deleteReview(Integer.parseInt(wno));

	if(cnt>0){%>
		<script type="text/javascript">
			alert("삭제 성공");
			location.href = "AllReview.jsp";
		</script>
	<% }else{ %>
		<script type="text/javascript">
			alert("삭제실패");
			history.back();
		</script>		
		<%	}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>


</body>
</html>