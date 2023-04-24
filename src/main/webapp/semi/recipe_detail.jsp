<%@page import="com.semi3.member.model.UserInfoVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="../css/recipe.css?v=<%=System.currentTimeMillis()%>" />
<jsp:useBean id="rService" class="com.semi3.member.model.RecipeService" scope="session"></jsp:useBean>
<jsp:useBean id="rVo" class="com.semi3.member.model.RecipeVO" scope="session"></jsp:useBean>
<jsp:useBean id="userVo" class="com.semi.bmember.model.bMemberVO" scope="session"></jsp:useBean>
<%
	//1
	String no = request.getParameter("no");
	if(no==null || no.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href="recipe.jsp";
		</script>
		
	<% return;
	}
	//2

	try{
		rVo=rService.selectByNo(Integer.parseInt(no));
		userVo=rService.userByNo(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
	//3
	String content=rVo.getContent();
	if(content!=null && !content.isEmpty()){
		content=content.replace("\r\n","<br>");
	}else{
		content="";
	}
	float star=0;
	if(rVo.getStCount()!=0){
		star= rVo.getStar()/rVo.getStCount();
	}
	String id=(String) session.getAttribute("id"); //현재 로그인중인 아이디
/* 		if(id==null || id.isEmpty()){
			id="";
		}else{
			id = (String) session.getAttribute("id"); 
		} */
	String writeId = userVo.getId();	 //작성자 아이디
	boolean equalId;
	if(writeId.equals(id)){
		equalId=true;
	}else{
		equalId=false;
	}
	
%>
<script type="text/javascript">
	$(function(){
		var width=$('#image').width();
		$('#recipe_top_info').css("width",width);

		
		/* 게시글 난이도에따라 난이도별점(radio) 체크되게하는 함수 */
		var level = <%=rVo.getrLevel() %>;
		$('.stars').children('input[type=radio]').each(function(idx,item){
			console.log(level);
			if(level==idx){
			$('#star-'+idx+'').prop('checked', true);
			console.log(idx);
			}
		});
		
		/* 작성자면 수정/삭제버튼 노출, 비작성자면 추천버튼 노출 */
		console.log(<%=equalId%>);
		if(<%=equalId %>){
			$('#recipe_deteil_buttonDiv').show();
			$('#recipe_deteil_buttonDiv_rec').hide();
		}else{
			$('#recipe_deteil_buttonDiv').hide();
			$('#recipe_deteil_buttonDiv_rec').show();
		}
		
	});
</script>

<div id="recipe_detail_container">
	<div id="recipe_header">
	<a href="recipe.jsp">
		<h1>레시피 공유 게시판</h1>
	</a>
		<br>
	</div>
	<div id="recipe_top">
		<div id="recipe_top_image">
						<%if(rVo.getfOname()==null || rVo.getfOname().isEmpty()){ %>
							<img src="../image/바보상자.png" id="image">
						<%}else{ %>
							<img src="../upload/<%=rVo.getfName()%>" id="image">
						<%} %>
		
		
		</div>
		<div id="recipe_top_info">
			<div id="recipe_top_view">
				<img src="../image/icon_man.png">
				<p><%=rVo.getrView() %>명</p>
			</div>
			<div id="recipe_top_id">
				<img src="../image/id.png">
				<p>[ <%=userVo.getNickname() %> ]</p>
			</div>
			<div id="recipe_top_star">
				<img src="../image/icon_star.png">
				<p><%= Math.round((double)rVo.getStar()/(double)rVo.getStCount()*10)/10.0 %>점</p>
			</div>
		</div>
		

		
		
		<div class="cont">
			<div class="title">
		  		<p>요리 난이도</p>
			</div>
			<div class="stars">
				  <input class="star star-5" id="star-5" type="radio" name="star" onclick="return(false)" />
				  <label class="star star-5" for="star-5"></label>
				  <input class="star star-4" id="star-4" type="radio" name="star" onclick="return(false)" />
				  <label class="star star-4" for="star-4"></label>
				  <input class="star star-3" id="star-3" type="radio" name="star" onclick="return(false)" />
				  <label class="star star-3" for="star-3"></label>
				  <input class="star star-2" id="star-2" type="radio" name="star" onclick="return(false)" />
				  <label class="star star-2" for="star-2"></label>
				  <input class="star star-1" id="star-1" type="radio" name="star" onclick="return(false)" />
				  <label class="star star-1" for="star-1"></label>
			</div>
		</div>
		<br>
		<div id="recipe_detail_title">
			<span>[ <%=rVo.getTitle() %> ]</span>
		</div><br><br>
		<div id="recipe_detail_content">
			<span><%=content %></span>
		</div>
		<br><br><br>

		
		<div id="recipe_deteil_buttonDiv">
			<a href="recipe_edit.jsp?no=<%=no %>" class="button_a">
				<div class="button">
					<p>수정</p>
				</div>
			</a>
			<a href="recipe_delete.jsp?no=<%=no %>" class="button_a">
				<div class="button">
					<p>삭제</p>
				</div>
			</a>
		</div>
		<div id="recipe_deteil_buttonDiv_rec">
			<a href="#" class="button_a"
				 onclick="window.open('recipe_detail_starcount.jsp?no=<%=no %>','게시글추천','width=340, height=200,location=yes, resizable=yes, top=300px, left=500px')">
				<div class="button">
					<p>레시피 추천!</p>
				</div>
			</a>
		</div>
	</div>
	<br>
	<br>
	<br>
	
</div>


<%@ include file="../inc/bottom.jsp"%>