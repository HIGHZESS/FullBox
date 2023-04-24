<%@page import="com.semi.bmember.model.bMemberVO"%>
<%@page import="com.semi.common.PagingVO"%>
<%@page import="com.semi.common.Utility"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.living.model.LivingVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.living.model.LivingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="LivingServ" class="com.semi.living.model.LivingService"
	scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String search = request.getParameter("search");	

	if(search==null) search="";
	
	LivingDAO dao = new LivingDAO();
	
	List<LivingVO> list = null;
	
	try{
		list = LivingServ.selectAll(search);
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
	
	String nickname="";

	session.setAttribute("boardIdx","5");

%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="../css/living.css">
<section class="notice">
	<div class="page-title">
		<div class="container">
			<h3>리빙 노하우 게시판</h3>
		</div>
	</div>

	<!-- board seach area -->
	<div id="board-search">
		<div class="container">
			<div class="search-window">
				<form action="">
					<div class="search-wrap">
						<label for="search" class="blind">제목 검색</label> <input
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
						<th scope="col" class="th-num">조회수</th>
						<th scope="col" class="th-num">추천수</th>
					</tr>
				</thead>
				<tbody>
				<%if(list.isEmpty()){ %>
					<tr>
						<th colspan="6">게시판에 내용이 없습니다...</th>
					</tr>
				<%}else{ %>
					<!-- 게시판 글 반복 시작점 -->
					<%
					int num = pageVO.getNum();
					int curPos = pageVO.getCurPos();
					for(int i=0;i<pageVO.getPageSize();i++){ 
						if(num-- <1)break;
						
						LivingVO vo = list.get(curPos++);
	  					%>
					<tr>
						<td><%=vo.getwNo() %></td>
						<td>
						<%nickname = LivingServ.findNickname(vo.getwNo());%>
						<%=nickname %>
						</td>
						<th><%=Utility.recWrite(vo.getwNo()) %> &nbsp;<a href="living_viewUp.jsp?wNo=<%= vo.getwNo()%>"><%=vo.getTitle() %></a>
							<%=Utility.displayNew(vo.getRegdate()) %>
						</th>
						<td><%=sdf.format(vo.getRegdate())%></td>
						<td><%=vo.getlView() %></td>
						<td><%=vo.getRec() %></td>
					</tr>
					<%} %>
				<%} %>
					<p>
						<a href="living_write.jsp" id="wP">글쓰기</a>
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
				    	<li class="page-item"><a class="page-link" href="living.jsp?nowPage=<%=i%>">
				    	<%=i %></a></li>
				     <%} %>
				    <%} %>
				  	<!-- 다음 블럭 이동 -->
				  	<%if(pageVO.getLastPage()<pageVO.getTotalPage()){ %>
					    <li class="page-item">
					      <a class="page-link" 
					      href="living.jsp?nowPage=<%=pageVO.getLastPage()+1%>" 
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