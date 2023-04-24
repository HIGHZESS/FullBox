<%@page import="com.semi.seller.sellerVO"%>
<%@page import="com.semi.bmember.model.bMemberVO"%>
<%@page import="com.semi.product.model.ProductVO"%>
<%@page import="com.semi.receipt.model.receiptVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:useBean id="receiptService" class="com.semi.receipt.model.receiptService"></jsp:useBean>
<jsp:useBean id="ProductService" class="com.semi.product.model.ProductService"></jsp:useBean>
<jsp:useBean id="bMemberService" class="com.semi.bmember.model.bMemberService"></jsp:useBean>
<jsp:useBean id="sellerService" class="com.semi.seller.sellerService"></jsp:useBean>
<%
	ProductVO pVo= new ProductVO();
	receiptVO rVo = new receiptVO();
	bMemberVO mVo = new bMemberVO();
	sellerVO  sVo = new sellerVO();
	try{
		rVo = receiptService.selectByorNo(2);
		sVo = sellerService.selectByMno(2);
		pVo = ProductService.selectBypNo(2);
		mVo = bMemberService.selectByUserid("test2");
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<link rel="stylesheet" href="../css/order.css">
<div id="Layout">
 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblTop">
    <tr>
      <td>주문확인서</td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblTop2">
    <tr>
      <td width="45%" class="noTd">주문번호<span class="noStxt"> <%=rVo.getOrNo() %></span></td>
      <td class="name"><%=mVo.getName() %> 님</td>
      <td width="10%">귀하</td>
    </tr>
  </table>   
 <table width="100%" cellpadding="0" cellspacing="0" class="tbl stamp">
    <tr>
      <td width="7%" rowspan="5" align="center" class="titTd">판
 
      매
 
      자</td>
      <th width="25%">사업자등록번호</th>
      <td colspan="3" class="txt1"><%=sVo.getsRegnum() %></td>
    </tr>
    <tr>
      <th>상호</th>
      <td width="25%" align="center"><%=sVo.getsName() %></td>
      <th width="14%">판매번호</th>
      <td align="center"><%=sVo.getSno() %></td>
    </tr>
    <tr>
      <th>가게소개</th>
      <td colspan="3"><%=sVo.getsIntro() %></td>
    </tr>
  </table>
   <table width="100%" cellpadding="0" cellspacing="0" class="tbl stamp">
    <tr>
      <td width="7%" rowspan="5" align="center" class="titTd">구
 
      매
 
      자</td>
      <th width="20%">회원번호</th>
      <td colspan="3" class="txt1"><%=mVo.getMno() %></td>
      <th rowspan="4" width="20%" id="coo">배송유형</th>
      <td rowspan="4" class="txt1" id="coo">
      <% if(rVo.getsType().equals("N")){ %>
      일반 배송
      <% }else{ %>
      새벽 배송
      <% } %>
      </td>
    </tr>
    <tr>
      <th>닉네임</th>
      <td width="25%" align="center"><%=mVo.getNickname() %></td>
      <th width="14%">성명</th>
      <td align="center"><%=mVo.getName() %></td>
    </tr>
    <tr>
      <th>배송지</th>
      <td colspan="3"><%=mVo.getZipcode() %> : <%=mVo.getAddress() %></td>
    </tr>
    <tr>
      <th colspan="2">이메일</th>
      <td align="center" colspan="2"><%=mVo.getEmail() %></td>
    </tr>
  </table>
  <table width="100%" cellspacing="0" cellpadding="0" class="tbl">
  <tr>
  	<th colspan="3">
  		상품 정보
  	</th>
  </tr>
    <tr>
      <th>품목</th>
      <th>수량</th>
      <th>가격</th>
    </tr>
    <tr>
      <td class="item">토마토</td>
      <td class="article">1</td>
      <td class="price"><%=rVo.gettPrice() %></td>
    </tr>
  </table>
  </div>
  <button type="reset" class="btn btn-primary" id="bt123">
  <a href="index.jsp" style="color: white;">홈으로</a></button>
<jsp:include page="../inc/bottom.jsp"></jsp:include>