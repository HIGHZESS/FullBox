<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
	//recipe_write_title, editordata
	try{
	String upDir="../upload";
	
	String saveDir=application.getRealPath(upDir);
	
	saveDir=config.getServletContext().getRealPath(upDir);
	//System.out.println("saveDir="+saveDir);
	saveDir="C:\\Study\\jsp_ws\\semi3\\src\\main\\webapp\\upload";
	//System.out.println("saveDir="+saveDir);
	
	
	int maxSize=20*1024*1024;
	String encoding="utf-8";
	
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, encoding, policy);
	System.out.print("업로드 완료! ");
	
	//1 title radio fileName content
	String title = mr.getParameter("title");
	String rLevel = mr.getParameter("rLevel");
	String content = mr.getParameter("content");
	
	String fName = mr.getFilesystemName("fileName");
	long fSize=0;
	String fOname ="";
	if(fName!=null && !fName.isEmpty()){
		File file = mr.getFile(fName);
		if(file!=null){
			fSize = file.length();
		}
		fOname=mr.getOriginalFileName("fileName");
	}
	
	rVo.setTitle(title);
	rVo.setContent(content);
	rVo.setrLevel(rLevel);
	
	rVo.setfName(fName);
	rVo.setfOname(fOname);
	rVo.setfSize(fSize);
	
	int mNo = (Integer) session.getAttribute("mno");
	
	//2
	String nickname=rService.selectNicknameByNo(mNo);
	int cnt=rService.insertRecipe(rVo, mNo);
	if(cnt>0){ %>
	<script type="text/javascript">
		alert("글쓰기 성공");
		location.href="recipe.jsp";
	</script>
<%}else{%>
	<script type="text/javascript">
		alert("글쓰기 실패");
		history.back();
	</script>			
<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
	System.out.print("어디가 문제일까? 4 ");

%>

</body>
</html>