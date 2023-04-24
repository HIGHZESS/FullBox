<%@page import="java.sql.SQLException"%>
<%@page import="com.ReviewBoard.ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp"%>
<%@ include file="LoginCheck.jsp"%>
<link rel="stylesheet" type="text/css" href="../css/Review.css" />
<jsp:useBean id="reviewService" class="com.ReviewBoard.ReviewService" scope="session"></jsp:useBean>
<jsp:useBean id="reviewVO" class="com.ReviewBoard.ReviewVO" scope="session"></jsp:useBean>

<%

int mno = (int)session.getAttribute("mno");

List<ReviewVO> list = null;

try {
	list = reviewService.selectMyReview(mno);
} catch (SQLException e) {
	e.printStackTrace();
}

/* int 변수 = Integer.parsInt(String.valueof("변환 값")); */
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

String imgPath= "";

%>


<div class="wrapper">
<div class="ReviewNav">
		<div class="nav">
			<a class="nav-link" href="AllReview.jsp">모든후기</a> <a class="nav-link"
				href="ReviewOnlyPhoto.jsp">사진후기</a> <a class="nav-link" href="ReviewWrite.jsp">후기작성하기</a>
			<a class="nav-link" href="myReview.jsp">내가쓴후기</a>
		</div>
	</div>
	<div class ="myReviewTable">
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
							<h5><a href ="ReviewDetail.jsp?wno=<%=reviewVO.getwNo()%>&type=2" style = "text-decoration-line: none">
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
				 <p>추천수<br>조회수</p>
				</td>
			</tr>
			  <%}//for %>	 
	  <!--반복처리 끝  -->
	 <%}//if %> 
		</table>
		</div>
</div>


<%@include file="../../inc/bottom.jsp"%>