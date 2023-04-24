<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String sessionId=(String)session.getAttribute("id");
	String boardIdx=String.valueOf(session.getAttribute("boardIdx"));
%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
/* 우측아래 따라다니는 슬라이드 메뉴 움직이게하는 제이쿼리 함수 */
$(function(){
	var currentPosition = parseInt($("#slideMenu").css("top")); 
	$(window).scroll(function() { 
		var position = $(window).scrollTop(); 
		$("#slideMenu").stop().animate({"top":position+currentPosition+"px"},300); });
			
	
	$('#mainMenu li').each(function(idx,item){
		var num=<%=boardIdx%>;
		console.log(num);
		if(num==idx){
			$(this).css("background-image","url('../image/greenPaint.jpg')");
			$(this).find('a').css("color","white")
		}
	});
	
	
});
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/layout_header.css?v=<%=System.currentTimeMillis() %>" />
<link rel="stylesheet" type="text/css" href="../css/layout_section.css?v=<%=System.currentTimeMillis() %>" />
<link rel="stylesheet" type="text/css" href="../css/layout_footer.css?v=<%=System.currentTimeMillis() %>" />

<style type="text/css">
</style>
<!-- 폰트추가 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<!-- font-family: 'Gowun Dodum', sans-serif; -->
<!-- 폰트추가끝 -->
<!-- 아이콘 폰트 추가 -->
<script src="https://kit.fontawesome.com/7a08883eea.js" crossorigin="anonymous"></script>
<!-- 폰트추가끝 -->

</head>

<body id="main_body">
	<div id="main">
		<div id="header">
		<div id="nav">
			<div id="mainMenuDiv">
				<div id="mainMenuIcon">
					<a href="../semi/index.jsp">
						<img src="../image/바보상자.png" id="foolbox">
					</a>
				</div>
				<ul id="mainMenu">
					<li><br><a href="../semi/mission.jsp">미션</a></li>
					<li><br><a href="../semi/manual.jsp">이용방법</a></li>
					<li><br><a href="../semi/product.jsp">상품목록</a></li>
					<li><br><a href="../semi/AllReview.jsp">이용후기</a></li>
					<li><br><a href="../semi/recipe.jsp">레시피</a></li> <!-- 레시피란 추가 및 a링크 연결 -->
					<li><br><a href="../semi/living.jsp">리빙노하우</a></li>
					<li><br><a href="../semi/AskBoard.jsp">문의하기</a></li>
				</ul>
				<div id="iconMenuDiv">
					<div>
					<%if(sessionId==null || sessionId.isEmpty()){ %>
						<a href="../semi/Login.jsp">
							<img src="../image/login.png">
							<p>로그인</p>
						</a>
					<%}else{ %>
						<a href="../semi/Logout.jsp">
							<img src="../image/login.png">
							<p>로그아웃</p>
						</a>
					<%} %>
					</div>
					<div>
						<a href="../semi/MyInformation.jsp">
							<img src="../image/profile.png">
							<p>내정보</p>
						</a>
					</div>
				</div>
			</div>
		</div>
			<div id="body">
				<div id="bodyLeft" class="body">
					<div id="bodyLeftMenu">
						<ul>
<%-- 							<li>현재 세션 아이디 : <%= (String) session.getAttribute("id") %></li>
							<li>현재 세션 게시판idx : <%= boardIdx%></li> --%>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
						</ul>
					</div>
	
				</div>
				<div id="bodyCenter" class="body">
					<section id="sectionCenter">