<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="reviewService" class="com.ReviewBoard.ReviewService"
	scope="session"></jsp:useBean>
<jsp:useBean id="reviewVO" class="com.ReviewBoard.ReviewVO"
	scope="session"></jsp:useBean>
	<link rel="stylesheet" type="text/css" href="../css/Review.css" />
<%@ include file="LoginCheck.jsp"%>
@import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');

<script type="text/javascript">


</script>
<style type="text/css">
.review-heading{
		color: green;
}

.writer { 
		text-align: left;
 }

.name { 
		text-align: left;
 }
 
.file { 
		text-align: left;
 }
.alert{
		color: grey;
}
.name {
  font-size: 14px;
  font-weight: 600;
  width: 300px;
}
.form_list_input input {
  margin: 6px; 
  border: 0;
  height: 38px;
  width: 50%;
  border-radius: 30px;
  box-shadow: 0 0 0 2.5px #a2cf34;
}
.form_list_input input:focus {
  outline: none;
  box-shadow: 0 0 0 2.5px #008000;
}
.form_list_input input::placeholder {
  font-weight: 300;
  color: #aaa;
}
.form_list_input label {
  float: left;
  display: none;
  padding: 3px;]
}

.form-group textarea {
  margin: 6px; 
  border: 0;
  border-radius: 15px;
  box-shadow: 0 0 0 2.5px #71363a;
}
.fform-group textarea::placeholder {
  font-weight: 300;
  color: #aaa;
}

.secondary_header {
	width: 100%;
	height: auto
	padding-top: 80px;
	padding-bottom: 30px;
	background-color: #B3B3B3;
	clear: left;

.write_input input:focus {
  outline: 3px solid #e96c7c;
}

.section1 .sectionTitleRule, .section2 .sectionTitleRule {
	margin: 0 3% 0 0;
	float: left;
	clear: both;
	
.nav {
	font-family: "Source Sans Pro";
	font-weight: normal;
	color: #000000;
	letter-spacing: 1px;
	margin-left: auto;
	text-align: center;
	transition: all 0.3s linear;
}
.nav:hover {
	color: green;
	cursor: pointer;
}



</style>
<%@include file="../inc/top.jsp"%>
<%
String l_id = (String)session.getAttribute("id");
String l_nickname = (String)session.getAttribute("nickname");

int mno =0;
try{	
 	mno = reviewService.findMno(l_id);
} catch(SQLException e){
	e.printStackTrace();
}

%>

<div class="ReviewNav">
	<div class="nav">
		<a class="nav-link" href="AllReview.jsp">모든후기</a> <a class="nav-link"
			href="ReviewOnlyPhoto.jsp">사진후기</a> <a class="nav-link" href="ReviewWrite.jsp">후기작성하기</a>
		<a class="nav-link" href="myReview.jsp">내가쓴후기</a>
	</div>
</div>
<div class="wrapper">
	<div class="review-heading">
		<br>
		<h2 style="font-size: 55px;">REVIEWS</h2>

	</div>
	<p>상품후기는 판매자에게 큰 힘이 됩니다</ap>
	<p style="color: red;">! 고의적인 욕설, 비방이 기입 될 시에는 사이트 이용 제재의 대상이 됨을
		알려드립니다. !</p>



	<form name="frmWrite" method="post" action="ReviewWrite_ok.jsp"
	enctype="multipart/form-data" >
		<span></span><input type="hidden" name="mNo" id="mNo" value =<%=mno %> >

		<ul class="form_list_input">
			<li><span></span><label for="id">작성자</label> <input type="text" id="id"
				name="id" placeholder="작성자" value =<%=l_nickname %> disabled/></li>
				
				
			<li><label for="title"> 제목</label> <input type="text" id="title"
				name="title" placeholder="제목"/></li>
		</ul>
		<br>
		 
		<div class="form-group">
			<textarea class="form-control" rows="10" id="content" name="content"
				placeholder="바보상자의 리뷰를 입력해보세요!"></textarea>
		</div>
		<div class="file">
			<label for="upfile">첨부파일</label> <input type="file" id="upfile"
				name="upfile" /> <span>(최대 2M)</span>
		</div>

		<br>
		<button class="round-black-btn" type="submit">Submit Review</button>
		<button class="round-black-btn" onclick="AllReview.jsp">Review</button>

	</form>

</div>


<%@include file="../../inc/bottom.jsp"%>
