<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="../css/LoginMain.css" />
<%
	String ck_value ="";
	Cookie[] ckArr = request.getCookies();
	if(ckArr!=null){
		for(int i=0;i<ckArr.length;i++){
			if(ckArr[i].getName().equals("ck_id")){
				ck_value=ckArr[i].getValue();
				break;
			}
		}
	}
%>


<div class="login-page">
	<div class="form">
		<form class="login-form" method="post" action="Login_ok.jsp">
			<input type="text" placeholder="username" id="id" name="id"
				value="<%=ck_value%>" /> <input type="password"
				placeholder="password" id="pwd" name="pwd" />
			<button type="submit">로그인</button>
			<input type="checkbox" name="chkSaveId" id="saveId"
				<%if(ck_value!=null && !ck_value.isEmpty()){ %> checked="checked"
				<%} %>><br> <label for="saveId">아이디 저장하기</label>
			<p class="message">
				Not registered? <a href="register.jsp">Create an
					account</a>
			</p>
		</form>
	</div>
</div>


<%@include file="../../inc/bottom.jsp"%>
