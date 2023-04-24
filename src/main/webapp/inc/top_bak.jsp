<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/clear.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style type="text/css">
/* 전체틀을 감싸는 main div */
#main {
	height: 2000px;
	text-align: center;
}

/* a태그 링크 */
a {
	text-decoration: none;
}

a:link {
	color: black;
}

a:visited {
	color: black;
}

/* header => nav (위쪽부분) */
#nav {
	position: fixed;
	z-index: 5;
	top: 0;
	left: 0;
	right: 0;
	width: 100%;
	height: 100px;
	background: white;
}

#foolbox {
	position: absolute;
	left: 0;
	display: inline-block;
	margin-bottom: 15px;
}

#mainMenu {
	list-style: none;
	display: inline-block;
	margin: 33px;
}

#mainMenu li {
	float: left;
	margin: 12px 24px;
}

#mainMenuDiv {
	position:relative;
	display: inline-block;
	width: 860px;
	border: 0;
	top: 0;
	margin-left: auto;
	margin-right: auto;
}

/* section을 감싸는 중앙 전체 div */
#body {
	padding-top: 100px;
	width: 100%;
	height: 100%;
}

/* section 각각의 div */
.body {
	height: 100%;
	float: left;
}

/* section중 왼쪽부분 */
#bodyLeft {
	width: 15%;
	margin-right: 40px;
	border-right: 1px solid #efefef;
}

#bodyLeftMenu {
	position: fixed;
	top: 170px;
	left: 100px;
}

#bodyLeftMenu ul li {
	margin: 20px 0;
}

/* section중 중앙부분 */
#bodyCenter {
	text-align: center;
	width: 65%;
	margin-right: 35px;
	margin-top: 80px;
}

      #carouselExampleIndicators{
      	margin: 0 auto;
      	width: 400px;
      	height: 400px;
      }
      .carousel-inner{
        width:auto;
        height:400px; /* 이미지 높이 변경 */
      }
      .carousel-item{
        width: auto;
        height:100%;
      }
      .d-block {
        display:block;
        width: auto;
        height: 100%;
      }
      




/* section중 우측부분 */
#bodyRight {
	width: 15%;
	border-left: 1px solid #efefef;
}
#slideMenu{
	position: absolute;
	margin-left: 50px;
	margin-top: 400px;
}
#slideMenu li{
	border-collapse: collapse;
	border: 1px solid #cdcdcd;
	width: 100px;
	height: 30px;
	background: white;

	
}

/* footer 아랫부분 */
#footer {
	background: #282828;
	width: 100%;
	height: 300px;
	color: white;
	text-align: center;
}

</style>
</head>
<body>
	<div id="main">
		<div id="header"></div>
		<div id="nav">
			<div id="mainMenuDiv">
				<img src="../image/바보상자.png" id="foolbox">
				<ul id="mainMenu">
					<li><a href="#">미션</a></li>
					<li><a href="#">이용방법</a></li>
					<li><a href="#">상품목록</a></li>
					<li><a href="#">이용후기</a></li>
					<li><a href="#">문의하기</a></li>
				</ul>
			</div>
		</div>
		<div id="body">
			<div id="bodyLeft" class="body">
				<div id="bodyLeftMenu">
					<ul>
						<li>테스트</li>
						<li>상품</li>
						<li>묶음 상품</li>
						<li>전체</li>
						<li>과일</li>
						<li>체소</li>
					</ul>
				</div>

			</div>
			<div id="bodyCenter" class="body">
				<section id="sectionCenter">