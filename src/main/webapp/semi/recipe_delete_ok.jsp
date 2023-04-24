<%@page import="java.sql.SQLException"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="rService" class="com.semi3.member.model.RecipeService" scope="session"></jsp:useBean>
	<jsp:useBean id="rVo" class="com.semi3.member.model.RecipeVO" scope="session"></jsp:useBean>
<%
	try{
		String upDir="../upload";
		String saveDir=application.getRealPath(upDir);
		saveDir=config.getServletContext().getRealPath(upDir);
		saveDir="C:\\Study\\jsp_ws\\semi3\\src\\main\\webapp\\upload";
		request.setCharacterEncoding("utf-8");
		String no = request.getParameter("no");
		String code = request.getParameter("code");
		System.out.println(code);
		String trimCode = code.trim();
		String id = (String) session.getAttribute("id");

		

			if(trimCode.equals("지금삭제")){

				int cnt=rService.deleteByNo(Integer.parseInt(no));
				rVo=rService.selectByNo(Integer.parseInt(no));
				//게시글 삭제시 해당 게시글에 업로드된 파일까지 삭제 
				if(rVo.getfName()!=null && !rVo.getfName().isEmpty()){
					File File = new File(saveDir, rVo.getfName());
							if(File.exists()){
								boolean bool=File.delete();
								System.out.println("해당 게시글의 기존 파일 삭제:"+bool);
							}
				}
			

		%>
			<script type="text/javascript">
				alert("삭제 성공");
				location.href = "recipe.jsp";
			</script>
	<%}else{%>
			<script type="text/javascript">
				alert("잘못된 입력입니다.");
				history.back();
			</script>
			<%
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>