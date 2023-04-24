<%@page import="com.ReviewBoard.ReviewVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<jsp:useBean id="reviewService" class="com.ReviewBoard.ReviewService"
	scope="session"></jsp:useBean>
<jsp:useBean id="reviewVO" class="com.ReviewBoard.ReviewVO"
	scope="session"></jsp:useBean>
<link rel="stylesheet" type="text/css" href="../css/Review.css" />

<title>ReviewDetail.jsp</title>
<style>
.name, .nick, {
	text-align:left;
}
.date {
	text-align:left;
	}
.num {
	color:gray;
	text-align:right;
	}


</style>
<%
//세션에서 회원번호가져오기
/* String l_mno = (String)session.getAttribute("mno");
int sessionMno = Integer.parseInt(l_mno); */

//글번호파라미터 받아오기


//type 1 : from 모든후기
//type 2 : from 내가 쓴글  => 수정가능 ! 
String type = request.getParameter("type");

%>

<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		var type = <%=type%>
		if(type==2){
				console.log(type);
				$(".hiddenbtn").show(); 
		}else if(type==1){
			$(".hiddenbtn").hide();
		}	

	}); 
</script> 
</head>
<body>

<%
String imgPath ="";
String wno = request.getParameter("wno");

if(wno==null || wno.isEmpty() || type==null || type.isEmpty()){%>
	<script type="text/javascript">
	alert('잘못된 url입니다.');
	location.href="AllReview.jsp";
</script>
	<%	return;
}

try{
	reviewVO = reviewService.selectByNo(Integer.parseInt(wno));
	
	String fname = reviewVO.getFNAME();
	
	if(fname==null){
		imgPath="../upload/nonPic.png";
	}else{	
		imgPath ="../upload/"+fname;	
	}

}catch(SQLException e){
	e.printStackTrace();
}


String nickname = "";
try{
	nickname = reviewService.findNickname(reviewVO.getwNo());
}catch(SQLException e){
	e.printStackTrace();
}
		
String content=reviewVO.getContent();
if(content!=null && !content.isEmpty()){
	content=content.replace("\r\n", "<br>");
}else{
	content="";
}

%>
	<div class="ReviewNav">
		<div class="nav">
			<a class="nav-link" href="AllReview.jsp">모든후기</a> <a class="nav-link"
				href="ReviewOnlyPhoto.jsp">사진후기</a> <a class="nav-link" href="ReviewWrite.jsp">후기작성하기</a>
			<a class="nav-link" href="myReview.jsp">내가쓴후기</a>

		</div>
	</div>

	<h2 style="color=green">글 상세보기</h2>
	<div class="divForm">
		<div class="name">
			<span class="sp1">제목</span> <span><%=reviewVO.getTitle() %></span>
		</div>
		<div class="nick">
			<span class="sp1">작성자 닉네임</span> <span><%=nickname %></span>
		</div>
		<div class="date">
			<span class="sp1">등록일</span> <span><%=reviewVO.getRegdate() %></span>
		</div>
		
		<div class="file">
			<span class="sp1">첨부파일</span>
			<div class="detailImg">
				<img src="<%=imgPath%>">
			</div>

		</div>

		<div class="lastDiv">
			<p class="content"><%=content %></p>
		</div>
		<div class="center">
			<a class="hiddenbtn" id ="hiddenBtn"
				href='ReviewEdit.jsp?wno=<%=wno%>'>수정</a> 
				<a class="hiddenbtn" id ="hiddenBtn" href='ReviewDelete.jsp?wno=<%=wno%>'>삭제</a><br>
			<a href='AllReview.jsp'>목록</a>
		</div>
	</div>
	
	
	
	
		


	<%@include file="../inc/bottom.jsp"%>