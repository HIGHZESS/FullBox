<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.semi.product.model.ProductVO"%>
<%@page import="com.semi.product.model.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.setAttribute("boardIdx","2");
%>
<%@ include file="../inc/top.jsp"%>

<jsp:useBean id="ProductService" class="com.semi.product.model.ProductService" 
	scope ="session"></jsp:useBean>
<jsp:useBean id="ProductVO" class="com.semi.product.model.ProductVO" 
	scope ="session"></jsp:useBean>
	
<%
	request.setCharacterEncoding("utf-8");
	String condition = request.getParameter("searchCondition");
	String keyword = request.getParameter("searchKeyword");
	if(keyword == null || keyword.isEmpty()) {
	    keyword = "";
	}
	if(condition == null || condition.isEmpty()) {
	    condition = "";
	}
	
	List<ProductVO> list = null;
	try{
		list = ProductService.selectAll(condition, keyword);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	int currentPage=1;
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt((request.getParameter("currentPage")));
	}
	
	int totalRecord=list.size();
	int pageSize=6;
	int totalPage=(int)Math.ceil((float)totalRecord/pageSize);
	int blockSize=10;
	
	int firstPage=currentPage-((currentPage-1)%blockSize);
	int lastPage=firstPage+(blockSize-1); 
	int curPos=(currentPage-1)*pageSize;
	int num=totalRecord-curPos;

	String imgPath = "";
%>
<link rel="stylesheet" type="text/css" href="../css/product.css?v=<%=System.currentTimeMillis() %>">


<div id="product_container">
	<div id="product_header">
        <h3>상품 목록 게시판</h3>
    </div>
    
	<div id="cat">
		<ul>
			<li><a href="product.jsp">전체</a></li>
			<li id="vege"><a href="product_vegi.jsp">채소</a></li>
			<li id="fruit"><a href="product_fruit.jsp">과일</a></li>
		</ul>
	</div>
	<div class="clearfix">
	</div>
	<div class="product-list">
		<!-- 게시글 목록 반복문 시작 -->
		<%for(int i=0;i<pageSize;i++){
		  	if(num-- <1) break;		
			ProductVO vo=list.get(curPos++);
				
			String fname = vo.getfName();
			
			if(fname==null){
				imgPath="../upload/no-image.png";
			}else{	
			imgPath ="../upload/"+fname;	
			
			}
			
			%>
           	<div class="product">					
				<img class="productImg" src="../upload/<%=imgPath%>">
				<div id="product_name">
				<a href="productdetail.jsp?pNo=<%=vo.getpNo()%>">
				<%=vo.getpName() %></a>
				</div>
				<div id="product_price">
				<%=vo.getPrice() %>원
				</div>
			</div>
		<%} %>
			<!-- 게시글 목록 반복문 끝 -->
	</div>

	<div id="product_Page">
		<br>
		<!-- 이전페이지로 이동 시작 -->
		<%
			if(firstPage>1){%>
				<a href="product.jsp?currentPage=<%=firstPage-1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
					◀
				</a>
		<%}
	%>
		<!-- 이전페이지로 이동 끝 -->
		<!-- 페이징공간 -->
		<%
			for(int i=firstPage;i<=lastPage;i++){
			if(i>totalPage) break; 
			if(i==currentPage){%>
				<h id="currentPageNo"> <%=i %> </h>
		<%}else{%>
				<a href='product.jsp?currentPage=<%=i %>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>[<%=i %>]</a>
		<%}
		}
	%>
		<!-- 다음페이지로 이동 시작 -->
		<%
		if(lastPage < totalPage){%>
			<a href="product.jsp?currentPage=<%=lastPage+1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
				▶
			</a>
		<%}
	%>
		<!-- 다음페이지로 이동 끝 -->
		<br>
	</div>
	<div id="product_Search">
		<form name="productfrmSearch" method="post" action="product.jsp">
			<select name="searchCondition">
	            <option value="pName" 
	            <% if(condition.equals("pName")){ %> 
	            	selected="selected" 
	            <%} %>>상품 이름</option>
	            <option value="pIntro"
	            <% if(condition.equals("pIntro")){ %>
	            	selected="selected" 
	            <%} %>>소개</option>
        	</select> 
			<input type="text" name="searchKeyword" value="<%=keyword%>" id="searchKeyword">
			<input type="submit" name="submit" value="검색">
		</form>
		<a href="product_write.jsp">
			<button id="submitbutton">상품 등록하기</button>
		</a>
		<br>
		<br>
	</div>
</div>

<%@include file="../inc/bottom.jsp" %>	