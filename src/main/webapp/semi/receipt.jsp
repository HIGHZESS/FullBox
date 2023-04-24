<%@page import="com.semi.bmember.model.bMemberVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:useBean id="bMemberService" class="com.semi.bmember.model.bMemberService"></jsp:useBean>
<%
	String id = (String)request.getAttribute("id");
	bMemberVO memVo = new bMemberVO();
	try{
		memVo = bMemberService.selectByUserid(id);
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<div>
	<h2>주문확인서</h2>
	<hr>
	<p>주문번호 :</p>
	<p>배송지 :	</p>
	<p>총금액 : </p>
	<p>상품번호 : </p>
	<p>판매자번호 : </p>
	<p>회원번호 :	<%=memVo.getMno() %></p>
</div>
<jsp:include page="../inc/bottom.jsp"></jsp:include>