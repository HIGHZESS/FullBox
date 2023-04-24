<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String wNo = request.getParameter("wNo");
%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="../css/living_del.css">
<script type="text/javascript">
	$('#submit').click(function(){
		if($('input[type=password]').val()==)
	});
</script>
<div class="divForm">
<form name="frmDelete" method="post"	action="living_delete_ok.jsp" >
	<!-- 삭제 처리시 필요한 no를 hidden 필드에 넣어준다 --> 
	<input type="hidden" name="wNo" value="<%=wNo %>" />
	<input type="hidden" value="<%=session.getAttribute("id")%>" name="id">
		<fieldset>
		<legend>글 삭제</legend>
	        <div>           
	        	<span class="sp"><%=wNo %> 번 글을 삭제하시겠습니까?</span>                        
	        </div>

	        <div class="center">
	            <input type ="submit"  value="삭제" id="submit"/>
	            <input type = "Button" value="글목록" 
                	OnClick="location.href='living.jsp'"/>
	        </div>
	    </fieldset>
    </form>
</div>
<jsp:include page="../inc/bottom.jsp"></jsp:include>