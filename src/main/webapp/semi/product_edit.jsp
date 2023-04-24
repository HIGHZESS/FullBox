<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.product.common.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<jsp:useBean id="pServ" class="com.semi.product.model.ProductService" scope="session"></jsp:useBean>
<jsp:useBean id="pVo" class="com.semi.product.model.ProductVO" scope="session"></jsp:useBean>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
</script>
<%
	String pNo = request.getParameter("pNo");
	if(pNo==null || pNo.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href="product.jsp";
		</script>
	
	<%	return;
	}
	
	try{
		pVo= pServ.selectBypNo(Integer.parseInt(pNo));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	String pIntro=pVo.getpIntro();
	if(pIntro==null) pIntro="";
	
	String originFileName=pVo.getfoName();
	String fileName=pVo.getfName();
	if(fileName==null) fileName="";
	

%>
<link rel="stylesheet" type="text/css" href="../css/product.css?v=<%=System.currentTimeMillis() %>">
<form  method="post" action="product_edit_ok.jsp" enctype="multipart/form-data">
	<!-- 수정 처리시 필요한 no를 hidden 필드에 넣어준다 --> 
	<input type="hidden" name="pno" value="<%=pVo.getpNo()%>"/>
	
	<h2>상품 수정하기</h2>
	<hr>
	<div id="product_frm0">
		<div id="product_frm1">
			<div id="frm1_block">
				<div>
				  <p style="text-align:left;">상품명</p>
				  <input class="input_field" type="text" placeholder="수정할 상품명을 입력하세요" name="pname"
				  	value="<%=pVo.getpName()%>">
				</div>
			</div>
			<div class=clearfix></div>
			<div id="frm1_block">
				<div>
				  <p style="text-align:left;">가격</p>
				  <input class="input_field" type="text" placeholder="수정할 가격을 입력하세요" name="price"
				  	value="<%=pVo.getPrice()%>">
				</div>
			</div>
			<div class=clearfix></div>
			<div id="frm1_block">
				<div>
				<p style="text-align:left;">파일 첨부</p>
				<label class="upload_label" for="input_file"></label>
				<input type="file" name=fileName id="upfile" />
				</div>
				<div class=clearfix></div>
				<br>
				<div id="file_list">
		         <span>첨부파일목록</span>            
		         <%if(originFileName!=null && !originFileName.isEmpty()){ %>
		         	<span>
		         	<%=Utility.getFileInfo(originFileName, pVo.getfSize()) %>
		         	</span>
		         	<br>
		         	<span style="color: green;font-weight: bold;">
		         		첨부파일을 새로 지정할 경우 기존 파일은 삭제됩니다.</span>
		         <%} %>
			   	</div>
			</div>
			<div class=clearfix></div>
		</div>
		<div id="radio_block">
			<div>
				<p style="text-align:center; font-size: 20px;">상품 타입 선택</p>
			</div>
			<div class="checkbox">
			    <input type="checkbox" name="Vegetable" id="check1" value="1" class="checkbox1">
			    <label for="check1">채소</label>
			    <input type="checkbox" name="Fruit" id="check2" value="1" class="checkbox1">
			    <label for="check1">과일</label>
			</div>
			<br>
			<div>
				<p style="text-align:center; font-size: 20px;">할인 여부 선택</p>
			</div>
			<br>
			<div class="checkbox">
				<input type="checkbox" name="DC" id="check3" value="1" class="checkbox1">
			    <label for="check1">할인</label>
			</div>
			<br>
			<br>
			    안내 : 바보상자의 할인율은 모두 10%로 동일합니다.
		</div>
		<div class=clearfix></div>
		<br>
	</div>
		<div id="intro">
		  <p style="text-align:center;">상품 소개</p>
		  <input class="textarea_field" type="text" placeholder="수정할 내용을 입력해주세요." name="pintro"
		  	value="<%=pVo.getpIntro()%>">
		</div>
	<br>
	<input type="submit" value="수정">
	<input type="reset" value="취소"
		OnClick=history.back();>
	<input type = "Button" value="글목록" 
		OnClick="location.href='product.jsp'" />
</form>
<br>

<%@ include file="../inc/bottom.jsp"%>	