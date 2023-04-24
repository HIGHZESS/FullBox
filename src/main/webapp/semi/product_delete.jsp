<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product_delete.jsp</title>
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }
	.divForm{
		width:650px;
		border:1px solid #ddd;		
	}
	/* .divForm form{
		width:650px;
	} */
	.divForm div	{
		/* clear: both; */
		border:none;
		padding: 7px 0;
		margin: 0;
		overflow: auto;
	}	
	.sp{
		font-size:0.9em;
		color:#0056AC;			
	}
	.divForm fieldset	{
		border:0;
	}
</style>
<%
		String pNo = request.getParameter("pNo");
		if(pNo==null || pNo.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href="product.jsp";
		</script>

		<%	return;
		}
%>
</head>
<body>
<div class="divForm">
<form name="frmDelete" method="post"	action="product_delete_ok.jsp" >
	<!-- 삭제 처리시 필요한 no를 hidden 필드에 넣어준다 --> 
	<input type="hidden" name="pNo" value="<%=pNo %>" />
   
		<fieldset>
		<legend>글 삭제</legend>
	        <div>           
	        	<span class="sp"><%=pNo %> 번 글을 삭제하시겠습니까?</span>                        
	        </div>
	        <div class="center">
	            <input type ="submit"  value="삭제" />
	            <input type = "Button" value="글목록" 
                	OnClick="location.href='product.jsp'" />
	        </div>
	    </fieldset>
    </form>
</div>

</body>
</html>
<%@ include file="../inc/bottom.jsp"%>