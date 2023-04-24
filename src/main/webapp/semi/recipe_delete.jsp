<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="../css/recipe.css?v=<%=System.currentTimeMillis()%>" />
<jsp:useBean id="rService" class="com.semi3.member.model.RecipeService" scope="session"></jsp:useBean>
<jsp:useBean id="rVo" class="com.semi3.member.model.RecipeVO" scope="session"></jsp:useBean>
<%
	String no=request.getParameter("no");
	if(no==null || no.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href="list.jsp";
		</script>
		
	<%	return;
	}
%>
	<div id="recipe_header">
	<a href="recipe.jsp">
		<h1>레시피 공유 게시판</h1>
	</a>
		<br>
	</div>
<div class="divForm">
<form name="frmDelete" method="post"	action="recipe_delete_ok.jsp" >
	<!-- 삭제 처리시 필요한 no를 hidden 필드에 넣어준다 --> 
	<input type="hidden" name="no" value="<%=no %>" />
	
		<fieldset>
		<legend>글 삭제</legend><br><br>
	        <div>           
	        	<span class="sp">해당 글을 삭제하시려면 '지금삭제'를 입력해주세요</span>                      
	        </div><br>  
	        <div>           
	            <label for="pwd"></label>
	            <input type="text" id="code" name="code" />   
	        </div><br>
	        <div class="center">
	            <input type ="submit"  value="삭제" />
	        </div><br>
	    </fieldset>
    </form>
</div>

<%@ include file="../inc/bottom.jsp"%>