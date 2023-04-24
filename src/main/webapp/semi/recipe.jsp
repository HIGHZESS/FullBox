<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi3.member.model.RecipeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session.setAttribute("boardIdx","4");
%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="../css/recipe.css?v=<%=System.currentTimeMillis()%>" />
<script type="text/javascript">
	$(function() {
		$('#recipe_rec_img img').each(function(idx, item) {
			var width = $(this).width();
			if (width > 300) {
				var x = (width / 2) - 150;
			}
			$(this).css("margin-left", -x);
		});
		
		$('#recipe_slide').css("width","300px");
		
		$('.button').each(function(idx,item){
			$(this).click(function(){
				var width=0;
				var divWidth = $('.recipe_header:eq('+idx+')').width();
				
				if(idx>0){
					for(var i=0;i<idx;i++){
						width+= $('.recipe_header:eq('+i+')').width(); 
					}					
					
					$('#recipe_rec_container').css("transform", "translate(-"+width+"px)");
					$('#recipe_rec_slide').css("width",""+divWidth+"px");
				}else{
					$('#recipe_rec_container').css("transform", "translate(-"+width+"px)");
					$('#recipe_rec_slide').css("width",""+divWidth+"px");
				}
			});
		});
		
			

		var idx=0;
/* 		$('.next').click(function(){
			idx++;
			var width=0;
			var firstWidth = $('.recipe_header:first').width();
			var max=$('.recipe_header').length;
			if(idx<max){
				for(var i=0;i<idx;i++){
					width+= $('.recipe_header:eq('+i+')').width(); 
				}					
				$('#recipe_rec_container').css("transform", "translate(-"+width+"px)");
			}else{
				console.log(max);
				for(var i=0;i<1;i++){
					width+= $('.recipe_header:eq('+i+')').width(); 
				}		
				$('#recipe_rec_container').css("transition", "transform 0s");
				$('#recipe_rec_container').css("transform", "translate(-"+width+"px)");
				width=0;
				idx=2;
				for(var i=0;i<idx;i++){
					width+= $('.recipe_header:eq('+i+')').width(); 
				}					
				$('#recipe_rec_container').css("transition", "transform 1s");
				$('#recipe_rec_container').css("transform", "translate(-"+width+"px)");
			}
		}); */
		

		 		$.nextSlide=function(){
				idx++;

				var width=0;
				var firstWidth = $('.recipe_header:first').width();
				var max=$('.recipe_header').length;
				
				console.log(idx);
				
				if(idx<max){
					for(var i=0;i<idx;i++){
						width+= $('.recipe_header:eq('+i+')').width(); 
					}					
					$('#recipe_rec_container').css("transform", "translate(-"+width+"px)");
					
				}else{
					console.log(max);
					for(var i=0;i<1;i++){
						width+= $('.recipe_header:eq('+i+')').width(); 
						console.log(width);
					}		
					$('#recipe_rec_container').css("transition", "transform 0s");
					$('#recipe_rec_container').css("transform", "translate(-"+width+"px)");
					width=0;
					idx=2;
					console.log(idx);
					for(var i=0;i<idx;i++){
						width+= $('.recipe_header:eq('+i+')').width(); 
					}					
					$('#recipe_rec_container').css("transition", "transform 1s");
					$('#recipe_rec_container').css("transform", "translate(-"+width+"px)");
					
				}
			};
			
		var autoSlide = setInterval(function(){
			$.nextSlide();
		}, 4000);
		
		

	$('#recipe_rec_slide').hover(function() {
			clearInterval(autoSlide);
		}, function() {
			autoSlide = setInterval(function() {
				$.nextSlide();
			}, 4000);
		});

	});
</script>
<jsp:useBean id="rService" class="com.semi3.member.model.RecipeService" scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String condition = request.getParameter("searchCondition");
	String keyword = request.getParameter("searchKeyword");
	   if(keyword == null || keyword.isEmpty()) {
		      keyword = "";
		   }
	   if(condition == null || condition.isEmpty()) {
		      condition = "";
		   }
   
	/* 전체 글 리스트를 불러오는 list (selectAll) */
	List<RecipeVO> list=null;
	try{
		list=rService.selectAll(condition, keyword);
		System.out.println(list);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	/* 별점 top3 게시글을 불러오는 list (selectRank) */
	List<RecipeVO> list_rank=null;
	try{
		list_rank=rService.selectRank();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	/* 페이징처리 */
	int currentPage=1;
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt((request.getParameter("currentPage")));
	}
	
	int totalRecord=list.size();
	int pageSize=7;
	int totalPage=(int)Math.ceil((float)totalRecord/pageSize);
	int blockSize=5;
	
	int firstPage=currentPage-((currentPage-1)%blockSize);
	int lastPage=firstPage+(blockSize-1); 
	int curPos=(currentPage-1)*pageSize;
	int num=totalRecord-curPos;
		



	
	
%>


<div id="recipe_container">
	<div id="recipe_header">
		<a href="recipe.jsp">
		<h1>레시피 공유 게시판</h1>
		</a>
		<br>
	</div>

	<div id="recipe_rec_slide">
		<div id="recipe_rec_container">
			
			<!-- 최상단 평점 top3 노출되는부분 시작 -->
			
			<%for(int i=0;i<5;i++){ 
				if(list_rank!=null && !list_rank.isEmpty() && list.size()>2){
				RecipeVO rVo=null;
					if(i==0 || i==3){
						rVo=list_rank.get(2);
					}else if(i==1 || i==4){
						rVo=list_rank.get(1);
					}else if(i==2){
						rVo=list_rank.get(0);
					}
					
					String content=rVo.getContent();
					if(content!=null && !content.isEmpty()){
						content=content.replace("\r\n", "<br>");
					}else{
						content="";
					}
				
			%>
			<a href="recipe_countUpdate.jsp?no=<%=rVo.getwNo()%>">
				<div class="recipe_header">
					<div id="recipe_rec_img">
						<%if(rVo.getfOname()==null || rVo.getfOname().isEmpty()){ %>
							<img src="../image/바보상자.png">
						<%}else{ %>
							<img src="../upload/<%=rVo.getfName()%>">
						<%} %>
					</div>
					<div id="recipe_rec_info">

					
						<h3 style="font-size: 15px; font-weight: bold;"><%=rVo.getTitle()%></h3><br>
						<h6><%=content%></h6>
					</div>
				</div>
			</a>
			<%}
			}%>
			<!-- 최상단 평점 top3 노출되는부분 끝 -->
			
		</div>
	</div>
	<div id="recipe_rec_button" hidden="hidden">
		<button class="button">1</button>
		<button class="button">2</button>
		<button class="button">3</button>
		<button class="button">4</button>
		<button class="button">5</button>
	</div><br>
	<div style="border-top: 1px solid green "></div>
	<div id="recipe_board_container">
		<!-- 게시글 목록 반복문 시작 -->
		<%for(int i=0;i<pageSize;i++){
		  	if(num-- <1) break;		
			RecipeVO vo=list.get(curPos++);
			
			/* 게시글 작성일 1일미만은 시간으로, 1일이상은 날짜로 */
			Date date = new Date();
			long dateDiff=(date.getTime() - vo.getRegdate().getTime())/(1000*60*60);
			
			SimpleDateFormat overSdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat underSdf = new SimpleDateFormat("HH시 mm분");
			
			String content=vo.getContent();
			if(content!=null && !content.isEmpty()){
				content=content.replace("\r\n", "<br>");
			}else{
				content="";
			}
			
			%>
			<div class="recipe_board_inner">
				<div class="recipe_board_imgbox">
					<div class="recipe_board_div">
						<%if(vo.getfOname()==null || vo.getfOname().isEmpty()){ %>
							<img src="../image/바보상자.png" class="recipe_board_img">
						<%}else{ %>
							<img alt="게시글이미지" src="../upload/<%=vo.getfName()%>" class="recipe_board_img">
						<%} %>
					</div>
				</div>
				<a href="recipe_countUpdate.jsp?no=<%=vo.getwNo()%>" class="recipe_board_content_a">
					<div class="recipe_board_contentbox">
						<div class="recipe_board_title">
						<%=vo.getTitle() %>
						</div>
						<div class="recipe_board_content">
							<%=content %>
						</div>
					</div>
				</a>
				<div class="recipe_board_pointbox">
					<%if(vo.getStCount()==0){ %>
						<p class="noCount">아직<br>추천이<br>없습니다</p>
					<%}else{ %>
						<p class="count"><%=Math.round((double)vo.getStar()/(double)vo.getStCount()*10)/10.0 %></p>
					<%} %>
				</div>
				<div class="recipe_board_regdate">
					<%if(dateDiff<24){ %>
						<%=underSdf.format(vo.getRegdate()) %>
					<%}else{ %>
						<%=overSdf.format(vo.getRegdate()) %>
					<%} %>
				</div>
			</div>
		<%} %>
		<!-- 게시글 목록 반복문 끝 -->
	</div>
	<div id="recipe_paging">
		<br>
		<!-- 이전페이지로 이동 시작 -->
		<%
			if(firstPage>1){%>
				<a href="recipe.jsp?currentPage=<%=firstPage-1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
					◀
				</a>
		<%}
	%>
		<!-- 이전페이지로 이동 끝 -->
		<!-- 페이징공간 -->
		<%
			for(int i=firstPage;i<=lastPage;i++){
			if(i>totalPage) break; 
			if(i==currentPage){%>
				<h id="currentPageNo"> <%=i %> </h>
		<%}else{%>
				<a href='recipe.jsp?currentPage=<%=i %>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>[<%=i %>]</a>
		<%}
		}
	%>
		<!-- 다음페이지로 이동 시작 -->
		<%
		if(lastPage < totalPage){%>
			<a href="recipe.jsp?currentPage=<%=lastPage+1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
				▶
			</a>
		<%}
	%>
		<!-- 다음페이지로 이동 끝 -->
		<br>
	</div>
	<div id="recipe_search">
		<form action="recipe.jsp" id="recipe_frm">
			<select name="searchCondition">
	            <option value="title" 
	            <% if(condition.equals("title")){ %> 
	            	selected="selected" 
	            <%} %>>제목</option>
	            <option value="content"
	            <% if(condition.equals("content")){ %>
	            	selected="selected" 
	            <%} %>>내용</option>
        	</select> 
		<input type="text" name="searchKeyword" id="searchKeyword">
		<input type="submit" name="submit" id="recipe_search_submitBt" value="검색">
		</form>
		<div style="display: inline-block; float: right;">
			<a href="recipe_write.jsp">
				<div class="button">
					<p>글쓰러 가기</p>
				</div>
			</a>
		</div>
		<br>
		<br>
	</div>
</div>





<%@ include file="../inc/bottom.jsp"%>