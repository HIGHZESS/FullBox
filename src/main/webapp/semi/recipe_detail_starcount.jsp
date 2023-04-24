<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/7a08883eea.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="../css/recipe.css?v=<%=System.currentTimeMillis()%>" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		/* 요리 난이도를 별점클릭을 통해서 확인하는 클릭함수 */
		var rLevel = 0;
		var result = false;
		$('.star-1').eq(1).click(function(){
				rLevel=1;
				$('#rLevel').val(rLevel);
		});
		$('.star-2').eq(1).click(function(){
				rLevel=2;
				$('#rLevel').val(rLevel);
		});
		$('.star-3').eq(1).click(function(){
				rLevel=3;
				$('#rLevel').val(rLevel);
		});
		$('.star-4').eq(1).click(function(){
				rLevel=4;
				$('#rLevel').val(rLevel);
		});
		$('.star-5').eq(1).click(function(){
				rLevel=5;
				$('#rLevel').val(rLevel);
		});
		
	});

</script>
<body>
<%
	String no = request.getParameter("no");
%>
	<form action="recipe_detail_starcount_ok.jsp" method="post">
		<div class="contstar" style="width: 310px">
			<input type="hidden" id="rLevel" name="rLevel" value="0">
			<input type="hidden" id="no" name="no" value="<%=no%>">
			<div class="stars" style="float: left; padding: 0 0">
				  <input class="star star-5" id="star-5" type="radio" name="starCount"/>
				  <label class="star star-5" for="star-5"></label>
				  <input class="star star-4" id="star-4" type="radio" name="starCount"/>
				  <label class="star star-4" for="star-4"></label>
				  <input class="star star-3" id="star-3" type="radio" name="starCount" />
				  <label class="star star-3" for="star-3"></label>
				  <input class="star star-2" id="star-2" type="radio" name="starCount" />
				  <label class="star star-2" for="star-2"></label>
				  <input class="star star-1" id="star-1" type="radio" name="starCount" />
				  <label class="star star-1" for="star-1"></label>
			</div>
			<div class="contTitle" style="float: right ">
		  		<p>원하시는 별점을 눌러주세요</p>
			</div>
			<div style="text-align: center;">
				<input type="submit" value="레시피 추천하기">
			</div>
		</div>
		</form>
		
</body>
</html>