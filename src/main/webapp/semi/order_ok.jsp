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
<jsp:useBean id="receiptService" class="com.semi.receipt.model.receiptService" scope="session"></jsp:useBean>
<jsp:useBean id="receiptVo" class="com.semi.receipt.model.receiptVO" scope="session"></jsp:useBean>
<%
/* tprice 가격 / pno 상품번호 / sno 판매자번호 / mno 지금 로그인한 아이디 번호 */

	String tPrice = request.getParameter("tPrice");
	String pno = request.getParameter("pno");
	String sno = request.getParameter("sno");
	String mno = request.getParameter("mno");
	
	receiptVo.settPrice(Integer.parseInt(tPrice));
	receiptVo.setpNo(Integer.parseInt(pno));
	receiptVo.setsNo(Integer.parseInt(sno));
	receiptVo.setmNo(Integer.parseInt(mno));
	
	try{
		int cnt=receiptService.insertRecipe(receiptVo);
		
		if(cnt>0){ %>
		<script type="text/javascript">
			alert("구매 성공");
			location.href="MyInformation.jsp";
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert("구매 실패");
			history.back();
		</script>			
	<%}
	}catch(SQLException e){
		e.printStackTrace();
	}



%>
</body>
</html>