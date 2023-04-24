<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.product.model.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product_delete_ok.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String pNo = request.getParameter("pNo");
	
	ProductService serv = new ProductService();
	try{
		int cnt = serv.deleteProduct(Integer.parseInt(pNo));
		if(cnt>0){
		%>
			<script type="text/javascript">
				alert("삭제 성공");
				location.href = "product.jsp";
			</script>
		<%
		} else {
		%>
			<script type="text/javascript">
				alert("삭제 실패");
				history.back();
			</script>
		<%
		}
	}catch(SQLException e){
		e.printStackTrace();
	}

%>
</body>
</html>