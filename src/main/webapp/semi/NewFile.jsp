<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/recipe.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#recipe_slide').css("width","300px");
		
		
		$('.button').each(function(idx,item){
			$(this).click(function(){
				var width=0;
				var divWidth = $('.r_inner:eq('+idx+')').width();
				
				if(idx>0){
					for(var i=0;i<idx;i++){
						width+= $('.r_inner:eq('+i+')').width(); 
					}					
					
					$('.r_container').css("transform", "translate(-"+width+"px)");
					$('#recipe_slide').css("width",""+divWidth+"px");
				}else{
					$('.r_container').css("transform", "translate(-"+width+"px)");
					$('#recipe_slide').css("width",""+divWidth+"px");
				}
			});
		});
		
		var idx=0;
		$('#rightButton').click(function(){
			idx++;
			console.log(idx);

			var width=0;
			var divWidth = $('.r_inner:eq('+idx+')').width();
			var firstWidth = $('.r_inner:first').width();
			var max=$('.r_inner').length;
			
			if(idx!=max){
				for(var i=0;i<idx;i++){
					width+= $('.r_inner:eq('+i+')').width(); 
				}					
				$('.r_container').css("transform", "translate(-"+width+"px)");
				$('#recipe_slide').css("width",""+divWidth+"px");
			}else if(idx=max){
				$('.r_container').css("transform", "translate(-"+width+"px)");
				$('#recipe_slide').css("width",""+firstWidth+"px");
				idx=0;
			}
		});
		
		$('#leftButton').click(function(){
			var width=0;
			var divWidth = $('.r_inner:eq('+idx+')').width();
			var lastWidth = $('.r_inner:last').width();
			var max=$('.r_inner').length;

			
			if(idx!=0){
				idx--;
				console.log(idx);
				var divWidth = $('.r_inner:eq('+idx+')').width();
				for(var i=0;i<idx;i++){
					width+= $('.r_inner:eq('+i+')').width(); 
				}					
				$('.r_container').css("transform", "translate(-"+width+"px)");
				$('#recipe_slide').css("width",""+divWidth+"px");
			}else if(idx==0){
				for(var i=0;i<max-1;i++){
					width+= $('.r_inner:eq('+i+')').width(); 
				}			
				$('.r_container').css("transform", "translate(-"+width+"px)");
				$('#recipe_slide').css("width",""+lastWidth+"px");
				idx=max-1;
				console.log(idx);
			}
		});
		
	});

</script>
</head>
<body style="margin: 0">
	<div id="recipe_slide">
		<div class="r_container">
			<div class="r_inner">
				<img src="../image/tomato02.jpg">
			</div>
			<div class="r_inner">
				<img src="../image/potato01.jpg">
			</div>
			<div class="r_inner">
				<img src="../image/sweetpotato01.jpg">
			</div>
			<div class="r_inner">
				<img src="../image/tomato01.jpg">
			</div>
			<div class="r_inner">
				<img src="../image/potato02.jpg">
			</div>
			<div class="r_inner">
				<img src="../image/sweetpotato02.jpg">
			</div>
			<div class="r_inner">
				<img src="../image/tomato02.jpg">
			</div>
			<div class="r_inner">
				<img src="../image/potato01.jpg">
			</div>
		</div>
	</div>
	<button class="button">1</button>
	<button class="button">2</button>
	<button class="button">3</button>
	<button class="button">4</button>
	<button class="button">5</button>
	<button class="button">6</button>
	<button id="leftButton"> [좌]  </button>
	<button id="rightButton"> [우]</button>
</body>
</html>