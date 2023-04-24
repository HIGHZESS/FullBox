<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ReviewBoard.ReviewVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="com.ReviewBoard.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session.setAttribute("boardIdx","3");
%>
<%@include file="../../inc/top.jsp"%>
<jsp:useBean id="reviewService" class="com.ReviewBoard.ReviewService"
	scope="session"></jsp:useBean>
<jsp:useBean id="reviewVO" class="com.ReviewBoard.ReviewVO"
	scope="session"></jsp:useBean>
<link rel="stylesheet" type="text/css" href="../css/Review.css" />
<%
//세션에서 아이디 불러오기
String l_id = (String)session.getAttribute("id");
%>

<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">	
	$(function(){
		
		
		$('#selectBox').change(function() {
		    var result = $('#selectBox option:selected').val();
		    if (result == 'mno') {
		      $("#mycontent").attr("readonly",true);
		      $('#mycontent').attr('value',"<%=l_id%>");

		    }
		  }); 
		
		
	});
</script>




<%





request.setCharacterEncoding("utf-8");
String condition=request.getParameter("searchCondition");
String keyword=request.getParameter("searchKeyword");

if(keyword == null || keyword.isEmpty()) {
    keyword = "";
 }
if(condition == null || condition.isEmpty()) {
    condition = "";
 }

List<ReviewVO> list = null;
try {
	list = reviewService.selectAll(condition, keyword);
} catch (SQLException e) {
	e.printStackTrace();
}

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

int currentPage=1;  //현재 페이지

//list.jsp?currentPage=3
if(request.getParameter("currentPage")!=null){
	currentPage=Integer.parseInt((request.getParameter("currentPage")));
}

//[1] 현재 페이지와 무관한 변수
int totalRecord=list.size();  //총레코드 수  17
int pageSize=5; //한 페이지에 보여줄 레코드(행) 수
int totalPage=(int)Math.ceil((float)totalRecord/pageSize); //총 페이지 수
int blockSize=10; //한 블럭에 보여줄 페이지 수

//[2] 현재 페이지를 이용해서 계산하는 변수
int	firstPage=currentPage-((currentPage-1)%blockSize); //블럭의 시작페이지
//=> 1, 11, 21...
int lastPage=firstPage+(blockSize-1); //블럭의 마지막 페이지, 10,20,30...

//페이지당 ArrayList에서의 시작 index => 0, 5, 10, 15, 20…
int curPos=(currentPage-1)*pageSize;
//페이지당 글 리스트 시작 번호
int num=totalRecord-curPos;


String imgPath ="";

%>

<div class="wrapper">
	<div class="ReviewNav">
		<div class="nav">
			<a class="nav-link" href="AllReview.jsp">모든후기</a> <a class="nav-link"
				href="ReviewOnlyPhoto.jsp">사진후기</a> <a class="nav-link" href="ReviewWrite.jsp">후기작성하기</a>
			<a class="nav-link" href="myReview.jsp">내가쓴후기</a>
		</div>
	</div>
	<div class="content">
	<% if(keyword!=null && !keyword.isEmpty()){ %>
	<p>검색어 : <%=keyword %>, <%=list.size() %>건 검색되었습니다.</p>
<%} %>
	
		<table>
			<colgroup>
				<col style="width: 20%;" />
				<col style="width: 70%;" />
				<col style="width: 10%;" />
			</colgroup>
			<%if(list.isEmpty()){ %>
			<tr>
				<td colspan="5" class="align_center">해당 글이 존재하지 않습니다.</td>
			</tr>
			<%}else{ %>
			<!--게시판 내용 반복문 시작  -->	
			<%
			for (int i = 0; i < pageSize; i++) {
				if(num-- <1) break;
				
				 reviewVO = list.get(curPos++);
				
				 //사진첨부안됐으면 기본이미지로 보여주기
				 try{
					reviewVO = reviewService.selectByNo(reviewVO.getwNo());
					
					String fname = reviewVO.getFNAME();
					
					if(fname==null){
						imgPath="../upload/nonPic.png";
					}else{	
					imgPath ="../upload/"+fname;	
					
					}
				}catch(SQLException e){
					e.printStackTrace();
				}
				 
				 
			%>

			<tr class="reviewbox">
				<td scope="col"><div>
						<img class="reviewImg" src="../upload/<%=imgPath%>">
					</div></td>
				<td scope="col">
					<div>
						<div class="reviewInfo">
						<div id = "forHover">
							<h5><a href ="ReviewDetail.jsp?wno=<%=reviewVO.getwNo()%>&type=1" style = "text-decoration-line: none">
							<%=reviewVO.getTitle()%></a></h5>
							<p class=""><%=sdf.format(reviewVO.getRegdate())%></p>
						</div>
						</div>
						<div id ="pdiv">
						<p class="reviewcontent" id="contentArea"><%=reviewVO.getContent()%></p>
							</div>
					</div>
				</td>
				<td scope="col">

				</td>
			</tr>
			  <%}//for %>	 
	  <!--반복처리 끝  -->
	 <%}//if %> 
		</table>
	</div> <!--테이블 div  -->

	<!-- 이전블럭으로 이동 -->
	<%
		if(firstPage>1){ %>
			<a href='AllReview.jsp?currentPage=<%=firstPage-1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
				<img src='../image/first.JPG'>
			</a>	
	<%	} %>	
	
	
<!-- 페이지 번호 추가 -->							
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%
		for(int i=firstPage;i<=lastPage;i++){
			if(i>totalPage) break;  
			
			if(i==currentPage){	%>
				<span style="color: blue;font-weight: bold;font-size: 1em">
					<%=i %></span>
			<%}else{ %>
				<a href
	='AllReview.jsp?currentPage=<%=i%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
					[<%=i %>]</a>
			<%} %>		
	<%	} %>
	
	
	<!--  페이지 번호 끝 -->
	<!-- 다음 블럭으로 이동 -->
	<%
		if(lastPage < totalPage){ %>
			<a href='AllReview.jsp?currentPage=<%=lastPage+1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
				<img src='../image/last.JPG'>
			</a>	
	<%	} %>
	<div class="divSearch">
   	<form name="frmSearch" method="post" action='AllReview.jsp'>
        <select name="searchCondition" id ="selectBox">
            <option value="title" 
            	<% if(condition.equals("title")){ %>
            		selected="selected"
            	<%} %>
            >제목</option>
            <option value="content" 
            	<% if(condition.equals("content")){ %>
            		selected="selected"
            	<%} %>
            >내용</option>
           
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력"
        	value="<%=keyword%>" id="mycontent">   
		<input type="submit" value="검색">
    </form>
</div>


	
</div>

<%@include file="../../inc/bottom.jsp"%>
