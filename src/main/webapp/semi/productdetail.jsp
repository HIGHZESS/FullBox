<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<jsp:useBean id="pServ" class="com.semi.product.model.ProductService" scope="session"></jsp:useBean>
<jsp:useBean id="pVo" class="com.semi.product.model.ProductVO" scope="session"></jsp:useBean>
<%
	String imgPath ="";
	String pno=request.getParameter("pNo");
	if(pno==null || pno.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href="product.jsp";
		</script> 
		
	<%	return;
	}
	
	try{
		pVo=pServ.selectBypNo(Integer.parseInt(pno));	
		String fname = pVo.getfName();
		
		if(fname==null){
			imgPath="../upload/no-image.png";
		}else{	
			imgPath ="../upload/"+fname;	
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	String pintro=pVo.getpIntro();
	if(pintro!=null && !pintro.isEmpty()){
		pintro=pintro.replace("\r\n", "<br>");
	}else{
		pintro="";
	}
	
%>    
<link rel="stylesheet" type="text/css" href="../css/product.css?v=<%=System.currentTimeMillis() %>">
<h2>상품 상세보기</h2>
<hr>
<div id= detail_contetnt>
	<div id="content_inner">
		<div id="product_frm3">
			<div id="detail_imgblock">
					<img class=detailImg src="<%=imgPath%>">
			</div>
			<div class=clearfix></div>
			<br>
		</div>
		<div id="product_frm4">
			<div id="detail_infoblock">
				<span style="float:left; font-size: 20px;">상품이름 : <%=pVo.getpName() %></span>
			</div>
			<div class=clearfix></div>
			<br>
			<br>
			<div>
				<span style="float:left; font-size: 20px;">가격 : <%=pVo.getPrice() %>원</span>
			</div>
			<div class=clearfix></div>
			<br>
		</div>
		<div id="product_frm4">
			<div id="pIntro">
				<p style="text-align:center; font-size: 20px;">상품 소개</p>			
				<p><%=pintro%></p>
			</div>
		</div>
	</div>
</div>
<div>
	<div id="productdetail_btline">
		<a href='product_edit.jsp?pNo=<%=pno%>'>
			<button type="button" class="button" id="bt">수정</button></a>
       	<a href='product_delete.jsp?pNo=<%=pno%>&fileName=<%=pVo.getfName()%>'>
			<button type="button" class="button" id="bt">삭제</button></a> 
       	<a href='product.jsp'>			
       		<button type="button" class="button" id="bt">목록</button></a>
	</div>
</div>
<hr>
<form action="order_ok.jsp" method="post" >
	<input type="hidden" value="<%=pVo.getPrice()%>" name="tPrice">
	<input type="hidden" value="<%=pVo.getpNo() %>" name="pno">
	<input type="hidden" value="<%=pVo.getsNo() %>" name="sno">
	<input type="hidden" value="<%=(int)session.getAttribute("mno") %>" name="mno">
<div id="order_bt">
	<div>
		<input type="submit" value="주문하기" class="btn-3d green">
	</div>
</div>
</form>
<br>
<%@ include file="../inc/bottom.jsp"%>
