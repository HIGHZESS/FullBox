<%@page import="java.sql.SQLException"%>
<%@page import="com.semi3.member.model.RecipeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.setAttribute("boardIdx","7");
%>
<jsp:include page="../inc/top.jsp" />
<link rel="stylesheet" type="text/css" href="../css/index.css?v=<%=System.currentTimeMillis()%>" />

<script type="text/javascript">
/* 메인화면 캐러셀의 전환속도를 바꾸는 함수 */
 	$(function(){
 		


	
	/* 메인화면 슬라이드 시작 */

		var idx=0;
 		$.nextSlide=function(){
		idx++;

		var width=0;
		var max=6;
		
		
		if(idx<max){
			for(var i=0;i<idx;i++){
				console.log('이프안쪽 포문');
				width+= 910;
			}					
			$('#banner_container').css("transform", "translate(-"+width+"px)");
			
		}else{
			console.log('엘스문 시작');
			for(var i=0;i<1;i++){
				width+= 910;
				console.log('엘스문 안쪽 포문');
			}		
			$('#banner_container').css("transition", "transform 0s");
			$('#banner_container').css("transform", "translate(-"+width+"px)");
			width=0;
			idx=2;
			for(var i=0;i<idx;i++){
				console.log('엘스문 두번째 포문');
				width+= $('.banner:eq('+i+')').width(); 
			}					
			$('#banner_container').css("transition", "transform 1.5s");
			$('#banner_container').css("transform", "translate(-"+width+"px)");
			
		}
	};
		
	var autoSlide = setInterval(function(){
		$.nextSlide();
	}, 5000);
	
	

$('#recipe_rec_slide').hover(function() {
		clearInterval(autoSlide);
	}, function() {
		autoSlide = setInterval(function() {
			$.nextSlide();
		}, 5000);
	});
	
/* $(window).scroll( function(){
    $('.index_container').each( function(i){
        var bottom_of_object = $(this).offset().top + $(this).outerHeight() + 200;
        var bottom_of_window = $(window).scrollTop() + $(window).height();
        if( bottom_of_window > bottom_of_object ){
        	console.log('멈춤')
            $(this).animate({'opacity':'1'},500);
        	$('.index_container').css("transform", "translateX(150px)");
        	console.log('나타남')
        }else{
        	console.log('멈춤')
            $(this).animate({'opacity':'0'},500);
        	$('.index_container').css("transform", "translateX(-150px)");
        	console.log('사라짐')
        }
    }); 
}); */
	
	
});
</script>
<%
	session.setAttribute("boardIdx","7");
%>
<jsp:useBean id="rService" class="com.semi3.member.model.RecipeService" scope="session"></jsp:useBean>
<%
List<RecipeVO> list_rank=null;
try{
	list_rank=rService.selectRank();
}catch(SQLException e){
	e.printStackTrace();
}

%>
<br>
<div id="banner_slide">
	<div id="banner_container">
		<div class="banner">
			<a href="#"><img src="../image/배너4.png"> </a>		
		</div>
		<div class="banner">
			<a href="#"><img src="../image/배너1.png"> </a>		
		</div>
		<div class="banner">
			<a href="#"><img src="../image/배너2.png"> </a>		
		</div>
		<div class="banner">
			<a href="#"><img src="../image/배너3.png"> </a>		
		</div>
		<div class="banner">
			<a href="#"><img src="../image/배너4.png"> </a>		
		</div>
		<div class="banner">
			<a href="#"><img src="../image/배너1.png"> </a>		
		</div>
	</div>
</div>



<div style="width: 910px;">
	<img src="../image/index_dialog.png" style="width: 650px;">



</div>


<div style="width: 910px;">
	<div style="height: 200px;">
	</div>
	<div style="height: 100px;">
		<p style="font-size: 2em; font-weight: bold; text-align: left; margin-top: 20px;">금주의 레시피</p>
	</div>
	<div class="index_container">
	<%for(int i=0;i<3; i++){ 
		RecipeVO rVo=list_rank.get(i);	
		String content=rVo.getContent();
		if(content!=null && !content.isEmpty()){
			content=content.replace("\r\n", "<br>");
		}else{
			content="";
		}
	 %>
			<a href="recipe_countUpdate.jsp?no=<%=rVo.getwNo()%>">
				<div class="recipe_header">
					<div class="recipe_rec_img">
						<%if(rVo.getfOname()==null || rVo.getfOname().isEmpty()){ %>
							<img src="../image/바보상자.png">
						<%}else{ %>
							<img src="../upload/<%=rVo.getfName()%>">
						<%} %>
					</div>
					<div class="recipe_rec_title">
						<h3 style="margin-top: 15px; font-size: 1.2em; font-weight: bold;"><%=rVo.getTitle()%></h3>
					</div>
					<div class="recipe_rec_content">
						<h3 style="margin: 15px 7px; font-size: 1.2em; text-align: left;"><%=content%></h3>
					</div>
				</div>
			</a>

	<%} %>
		<div id="recipe_under">
			<a href="recipe.jsp">	
				<p style="font-size: 1.5em; font-weight: bold; text-align: right; margin: 10px 10px 0 0;">더 많은 레시피를 확인해보세요!</p>
			</a>
		</div>
	</div>
	<div style="height: 400px;">
	</div>

</div>


<jsp:include page="../inc/bottom.jsp" />