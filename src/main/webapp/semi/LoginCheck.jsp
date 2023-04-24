<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String l_userid = (String)session.getAttribute("id");

	if(l_userid==null || l_userid.isEmpty()){ 
		String ctxPath=request.getContextPath();
		String url = ctxPath+"/semi/Login.jsp";
	%>
		<script type="text/javascript">
			alert('먼저 로그인하세요!');
			location.href="<%=url%>";
		</script>
		
	<%	return;
	}
%>