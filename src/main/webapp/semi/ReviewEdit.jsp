<%@page import="java.sql.SQLException"%>
<%@page import="com.ReviewBoard.ReviewVO"%>
<%@page import="com.ReviewBoard.ReviewService"%>
<%@page import="com.ReviewBoard.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<jsp:useBean id="reviewService" class="com.ReviewBoard.ReviewService"
	scope="session"></jsp:useBean>
<jsp:useBean id="reviewVO" class="com.ReviewBoard.ReviewVO"
	scope="session"></jsp:useBean>
<link rel="stylesheet" type="text/css" href="../css/Review.css" />

<title>ReviewEdit.jsp</title>
<style>
textarea.form-control {
	width: 60%;
}
</style>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {

	});
</script>
</head>
<body>

	<%
	//ReviewDetail 에서 수정a태그 get 방식 이동
	String wno = request.getParameter("wno");
	if (wno == null || wno.isEmpty()) {
	%>
	<script type="text/javascript">
		alert('잘못된 url입니다.');
		location.href = "AllReview.jsp";
	</script>

	<%
	return;
	}

		try {
			reviewVO = reviewService.selectByNo(Integer.parseInt(wno));
		} catch (SQLException e) {
			e.printStackTrace();
		}

	String content = reviewVO.getContent();
	if (content == null)content = "";

	//회원번호로 닉네임 불러오기 (DAO join)
	String nickname = "";
		try {
			nickname = reviewService.findNickname(Integer.parseInt(wno));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
	<div class="ReviewNav">
		<div class="nav">
			<a class="nav-link" href="AllReview.jsp">모든후기</a> <a class="nav-link"
				href="#">사진후기</a> <a class="nav-link" href="ReviewWrite.jsp">후기작성하기</a>
			<a class="nav-link" href="#">내가쓴후기</a>

		</div>
	</div>


	<div class="wrapper">
		<div class="review-heading">Review Edit</div>
		<p>글을 수정하세요</p>
		<form name="frmWrite" method="post" action="ReviewEdit_ok.jsp">
			<input type="hidden" name="wNo" value="<%=wno%>" />
			<div>
				<label for="id">작성자</label> <input type="text" id="id" name="id"
					value="<%=nickname%>" disabled />
			</div>
			<div>
				<label for="title">제목</label> <input type="text" id="title"
					name="title" value="<%=reviewVO.getTitle()%>" />
			</div>
			<div class="form-group">
				<textarea class="form-control" rows="10" id="content" name="content">
				<%=content%>
				</textarea>
			</div>
			<div>
				<label for="upfile">첨부파일</label> <input type="file" id="upfile"
					name="upfile" /> <span>(최대 2M)</span>
			</div>
			
			<input type = "submit" value ="수정">
	
			
		</form>
			<button onclick="location.href='AllReview.jsp'">목록</button>
	</div>



<%@include file="../inc/bottom.jsp"%>