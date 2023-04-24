<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="LoginCheck.jsp"%>
<%
	String aNo = request.getParameter("aNo");


if (aNo == null || aNo.isEmpty()) {
	%>
	<script type="text/javascript">
		alert('잘못된 url입니다.');
		location.href = "AskBoard.jsp";
	</script>

	<%
	return;
	}
%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="../css/living_del.css">
<div class="divForm">
<form name="frmDelete" method="post"action="AskDelete_ok.jsp" >
	<!-- 삭제 처리시 필요한 no를 hidden 필드에 넣어준다 --> 
	<input type="hidden" name="aNo" value="<%=aNo %>" />
   
		<fieldset>
		<legend>글 삭제</legend>
	        <div>           
	        	<span class="sp"><%=aNo %> 번 글을 삭제하시겠습니까?</span>                        
	        </div>
	        <div>           
	            <label for="pwd">비밀번호</label>
	            <input type="password" id="pwd" name="pwd" />   
	        </div>
	        <div class="center">
	            <input type ="submit"  value="삭제" />
	            <input type = "Button" value="글목록" 
                	OnClick="location.href='AskBoard.jsp'" />
	        </div>
	    </fieldset>
    </form>
</div>
<jsp:include page="../inc/bottom.jsp"></jsp:include>