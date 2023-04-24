<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="askService" class="com.semi.AskBoard.AskBoardService"
	scope="session"></jsp:useBean>
<jsp:useBean id="askVo" class="com.semi.AskBoard.AskBoardVO"
	scope="session"></jsp:useBean>
<jsp:useBean id="reboardService" class="com.semi.AskReboard.AskReboardService"
	scope="session"></jsp:useBean>
<jsp:useBean id="reboardVo" class="com.semi.AskReboard.AskReboardVO"
	scope="session"></jsp:useBean> 
<jsp:include page="../inc/top.jsp"></jsp:include>
<%@ include file="LoginCheck.jsp"%>
<link rel="stylesheet" href="../css/living_d.css">
<style>
.AskReply {
	margin-bottom: 114px;
}
textarea#recontent {margin-bottom: 36px;}

label.form-label {margin: 13px;}
</style>

<%
String aNo = request.getParameter("aNo");

int l_mno = (int) session.getAttribute("mno");
String mNo = request.getParameter("Mno");
String nickname = (String)session.getAttribute("nickname");

//관리자의 경우
boolean isManager = false;
String type = (String)session.getAttribute("type");
if(type =="M" || type.equals("M")){
	isManager = true;	
}

//reply "N" = 답변작성할수있게
//reply "Y" = 작성된답변볼수있게
boolean IsReplyOk =false;

try {
	askVo = askService.selectByaNo(Integer.parseInt(aNo));
	
	String reply = askVo.getReply();
	if(reply=="Y" || reply.equals("Y")){
		IsReplyOk = true;
		try{	
			reboardVo = reboardService.selectByAno(Integer.parseInt(aNo));
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

} catch (SQLException e) {
	e.printStackTrace();
}



%>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".AskReply").hide();
		$(".ReplyOk").hide();
		if (<%=l_mno%>==<%=mNo%>) {
			console.log(type);
			$("button:eq(1)").show();
			$("button:eq(2)").show();

		} else {
			$("button:eq(1)").hide();
			$("button:eq(2)").hide();
		}
		
		//답변 달린경우 회원,관리자 모두에게 답변을 보여주고,
		//관리자 id 의 경우 답글작성가능
		if(<%=IsReplyOk%>){
			$(".ReplyOk").show();
			
		}else{
			$(".ReplyOk").hide();
			
				if(<%=isManager%>){
		        	$(".AskReply").show();
		        }else{
		        	$(".AskReply").hide();
		        }
		}

	});
</script>
</head>
<body>

	<h2>상세보기</h2>
	<hr>
	<br>
	<p>
		글 번호 :
		<%=askVo.getaNo()%></p>
	<br>
	<p>
		작성자 :
		<%=askVo.getMno()%></p>
	<br>
	<p>
		제목 :
		<%=askVo.getTitle()%></p>
	<br>
	<p>
		내용 :
		<%=askVo.getContent()%></p>
	<br>

	<button type="button" class="btn btn-success" id="bt">
		<a href="AskBoard.jsp" class="link-light">목록</a>
	</button>
	<button type="button" class="btn btn-success" id="bt">
		<a href="AskEdit.jsp?aNo=<%=aNo%>" class="link-light">수정</a>
	</button>
	<button type="button" class="btn btn-success" id="bt">
		<a href="AskDelete.jsp?aNo=<%=aNo%>" class="link-light">삭제</a>
	</button>
	
	<!-- 답변완료 -->
	<div class="ReplyOk">
		<hr>
			<div class="firstDiv">
				<span class="sp1">답변작성자 : </span> <span><%=reboardVo.getMno()%></span>
			</div>
			<div class="SecondDiv">
				<label for="recontent" class="form-label">[ 등록된 답변 ]</label>
				<textarea class="form-control" id="recontent" rows="10"
					placeholder="내용을 입력해주세요" name="recontent" disabled><%=reboardVo.getRecontent()%></textarea>
			</div>
	</div>

	<!-- 답변하기 -->
	<div class="AskReply">
		<hr>
		<form name="frm1" method="post" action="AskReboardWrite_ok.jsp">

			<input type="hidden" name="mNo" id="mNo" value="<%=l_mno%>">
			<input type="hidden" name="aNo" id="aNo" value="<%=aNo%>">

			<div class="firstDiv">
				<span class="sp1">관리자닉네임 : </span> <span><%=nickname%></span>
			</div>
			<div class="SecondDiv">
				<label for="recontent" class="form-label">[ 답글작성 ]</label>
				<textarea class="form-control" id="recontent" rows="10"
					placeholder="내용을 입력해주세요" name="recontent"></textarea>
				<input type="submit" class="btn btn-success" id="replyBtn" value="등록" style="color:black; width: 70px; height: 40px;">
			</div>
		</form>
	</div>
	
<jsp:include page="../inc/bottom.jsp"></jsp:include>

	
	