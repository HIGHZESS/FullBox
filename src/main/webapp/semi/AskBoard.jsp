<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.AskBoard.AskBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.semi.common.PagingVO"%>
<%
session.setAttribute("boardIdx","6");
%>
<%@page import="com.semi.common.Utility"%>
<jsp:useBean id="askService" class="com.semi.AskBoard.AskBoardService"
	scope="session"></jsp:useBean>
<jsp:useBean id="askVo" class="com.semi.AskBoard.AskBoardVO"
	scope="session"></jsp:useBean>  
<%
request.setCharacterEncoding("utf-8");
String search = request.getParameter("search");	

if(search==null) search="";
	

List<AskBoardVO> list = null;

try{
	list = askService.selectAll(search);
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


String nickname = null;

%>	
	
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="../css/living.css">

<section class="notice">
	<div class="page-title">
		<div class="container">
			<h3>문의게시판</h3>
		</div>
	</div>

	<!-- board seach area -->
	<div id="board-search">
		<div class="container">
			<div class="search-window">
				<form action="">
					<div class="search-wrap">
						<label for="search" class="blind">제목검색</label> <input
							id="search" type="text" name="search" placeholder="검색어를 입력해주세요."
							value="<%=search%>">
						<button type="submit" class="btn btn-dark">검색</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- board list area -->
	<div id="board-list">
		<div class="container">
			<table class="board-table">
				<thead>
					<tr>
						<th scope="col" class="th-num">번호</th>
						<th scope="col" class="th-num">작성자</th>
						<th scope="col" class="th-title">제목</th>
						<th scope="col" class="th-date">등록일</th>
						<th scope="col" class="th-num">답변여부</th>
						<th scope="col" class="th-num">공개여부</th>
					</tr>
				</thead>
				<tbody>
				<%if(list.isEmpty()){ %>
					<tr>
						<th colspan="5">게시판에 내용이 없습니다...</th>
					</tr>
				<%}else{ %>
					<!-- 게시판 글 반복 시작점 -->
					<%
					int num = pageVO.getNum();
					int curPos = pageVO.getCurPos();
					for(int i=0;i<pageVO.getPageSize();i++){ 
						if(num-- <1)break;
						
						askVo = list.get(curPos++);
						
						//작성자 닉네임으로 보기
						try{
							nickname = askService.findNickname(askVo.getaNo());
						}catch(SQLException e){
							e.printStackTrace();
						}
						
						
	  					%>
					<tr>
						<td><%=askVo.getaNo() %></td>
						<td><%=nickname %></td>
						<th><a href="AskDetail.jsp?aNo=<%= askVo.getaNo()%>&Mno=<%=askVo.getMno() %>"><%=askVo.getTitle() %></a>
							<%=Utility.displayNew(askVo.getRegdate()) %>
						</th>
						<td><%=sdf.format(askVo.getRegdate())%></td>
						<td><%=askVo.getReply() %></td>
						<td><%=askVo.getaPublic() %></td>
					</tr>
					<%} %>
				<%} %>
					<p>
						<a href="AskWrite.jsp" id="wP">글쓰기</a>
					</p>
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
				    	<li class="page-item"><a class="page-link" href="AskBoard.jsp?nowPage=<%=i%>">
				    	<%=i %></a></li>
				     <%} %>
				    <%} %>
				  	<!-- 다음 블럭 이동 -->
				  	<%if(pageVO.getLastPage()<pageVO.getTotalPage()){ %>
					    <li class="page-item">
					      <a class="page-link" 
					      href="AskBoard.jsp?nowPage=<%=pageVO.getLastPage()+1%>" 
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
</section>
<jsp:include page="../inc/bottom.jsp"></jsp:include>

