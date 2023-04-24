<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.semi.receipt.model.receiptVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi3.member.model.PagingVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" href="../css/MyInformation.css">
<jsp:useBean id="bmemVO" class="com.semi.bmember.model.bMemberVO"
	scope="page"></jsp:useBean>
<jsp:useBean id="bmemService"
	class="com.semi.bmember.model.bMemberService" scope="session"></jsp:useBean>
<jsp:useBean id="receiptservice"
	class="com.semi.receipt.model.receiptService" scope="session"></jsp:useBean>
<jsp:useBean id="receiptVo" class="com.semi.receipt.model.receiptVO"
	scope="page"></jsp:useBean>
<jsp:useBean id="productVo" class="com.semi.product.model.ProductVO"
	scope="page"></jsp:useBean>
<jsp:useBean id="productService"
	class="com.semi.product.model.ProductService" scope="session"></jsp:useBean>
<jsp:useBean id="sellerservice"
	class="com.semi.seller.sellerService" scope="session"></jsp:useBean>
<jsp:useBean id="sellerVo"
	class="com.semi.seller.sellerVO" scope="session"></jsp:useBean>
<%@ include file="LoginCheck.jsp"%>
<style>

</style>
<script type="text/javascript" src="../../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#EditBtn').click(function(){
		location.href ="registerEdit.jsp";
	});

	$('#load1').click(function(){
		location.href ="index.jsp";
	});
	
});
$('.btn').on('click', function() {
    var $this = $(this);
  $this.button('loading');
    setTimeout(function() {
       $this.button('reset');
   }, 8000);
});
</script>
<%

String l_id = (String)session.getAttribute("id");

try{
	bmemVO = bmemService.selectByUserid(l_id);
}catch(SQLException e){
	e.printStackTrace();
}

String type = bmemVO.getSub();
String btype = "";
if(type.equals("S")){
	btype = "판매자";
}else if(type.equals("M")){
	btype = "관리자";
}else if(type.equals("C")){
	btype = "일반회원";
}else if(type == null || type.isEmpty()){%>
	<script type="text/javascript">
		alert('잘못된 url입니다.');
		location.href="index.jsp";
	</script>
	
<% return ;
}

List<receiptVO> list = null;

try{
	list = receiptservice.selectAll();
}catch(SQLException e){
	e.printStackTrace();
}

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

int nowPage=1; //현재 페이지

if(request.getParameter("nowPage")!=null){
	//현재페이지 파라미터로 받았을 때
	nowPage=Integer.parseInt((request.getParameter("nowPage")));
}

int totalW=list.size(); //총 글 수 
int pageSize=10; //한 페이지에 보여줄 글 수
int blockSize=5; //한 페이지에 보여줄 블럭 수

PagingVO pageVO = new PagingVO(nowPage, totalW, pageSize, blockSize);



%>

<div class="wrapper">

	<!-- 내정보뿌리는 div -->
	<div class="Info">
		<div class="InfoContents">
			<div id="InfoText">
				<h3>내 정보</h3>
				<img src="../image/littledeep_sprout_style1.png" class = "plant">
				<label for="mName">이름</label> <span id="mName"><%=bmemVO.getName() %></span><br>
				<img src="../image/littledeep_sprout_style1.png" class = "plant">
				<label for="mNickname">닉네임</label> <span id="mNickname"><%=bmemVO.getNickname() %></span><br>
				<img src="../image/littledeep_sprout_style1.png" class = "plant">
				<label for="mMail">이메일</label> <span id="mMail"><%=bmemVO.getEmail()%></span><br>
				<img src="../image/littledeep_sprout_style1.png" class = "plant">
				<label for="mType">회원유형</label> <span id="mType"><%=btype %></span><br>
				<img src="../image/littledeep_sprout_style1.png" class = "plant">
				<label for="mAddress">내주소</label> <span id="mAddress"><%=bmemVO.getAddress() %></span><br>
			</div>
		</div>
	</div>

	<!-- 각종버튼들 -->
	<div class="Btns">
		<button class="raise" id="EditBtn">내정보수정</button>
	</div>
	
	<!-- 구매목록 테이블 -->
	<div class="BuyList">
		<div id="MyTable">
			<table class="table">
				<thead class="table-header">
					<tr>
						<th scope="col" class="header__item">상품명</th>
						<th scope="col" class="header__item">구매일</th>
						<th scope="col" class="header__item">가격</th>
					</tr>
				</thead>
				<tbody class="table-content">
				<%if(list.isEmpty()){ %>
					<tr>
						<th colspan="5">구매내역이 없습니다</th>
					</tr>
				<%}else{ %>
					<!-- 게시판 글 반복 시작점 -->
					<%
					int num = pageVO.getNum();
					int curPos = pageVO.getCurPos();
					for(int i=0;i<pageVO.getPageSize();i++){ 
						if(num-- <1)break;
						
						receiptVo = list.get(curPos++);
						
						try{
							productVo = productService.selectBypNo(receiptVo.getpNo());
						}catch(SQLException e){
							e.printStackTrace();
						}
						
	  					%>
					<tr class="table-content">
						<td><%=productVo.getpName() %></td>
						<td><%=productVo.getRegdate() %></td>
						<td><%=productVo.getPrice() %></td>
					</tr>
					<%} %>
				<%} %>
				</tbody>
			</table>
			<div id="page">
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				    <!-- 전 블럭 이동 -->
				    <%if(pageVO.getFirstPage()>1){ %>
				    <li class="page-item">
				      <a class="page-link" 
				      href="living.jsp?nowPage=<%=pageVO.getFirstPage()-1%>"
				       aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <%} %>
				    <!-- 페이징 반복 -->
				    <%for(int i=pageVO.getFirstPage();i<=pageVO.getLastPage();i++){
				    	if(i>pageVO.getTotalPage())break;
				    	
				    	if(i==nowPage){%>
				    		<li class="page-item">
				    		<a class="page-link" style="color: blue;font-weight: bold;"><%=i %></a></li>
				  	  <%}else{ %>
				    	<li class="page-item"><a class="page-link" href="MyInformation.jsp?nowPage=<%=i%>">
				    	<%=i %></a></li>
				     <%} %>
				    <%} %>
				  	<!-- 다음 블럭 이동 -->
				  	<%if(pageVO.getLastPage()<pageVO.getTotalPage()){ %>
					    <li class="page-item">
					      <a class="page-link" 
					      href="MyInformation.jsp?nowPage=<%=pageVO.getLastPage()+1%>" 
					      aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
				    <%} %>
				</nav>
			</div>
		</div>
	</div>

	<!-- 기타확인버튼 -->
	<div style="margin: 3em;">
		<button type="button" class="btn btn-primary btn-lg " id="load1"
			data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing Order">
			Main</button>
		
	</div>
</div>





<%@include file="../../inc/bottom.jsp"%>
