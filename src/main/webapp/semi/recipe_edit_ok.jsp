<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
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
	<jsp:useBean id="rService" class="com.semi3.member.model.RecipeService"
		scope="session"></jsp:useBean>
	<jsp:useBean id="rVo" class="com.semi3.member.model.RecipeVO"
		scope="session"></jsp:useBean>
	<%
	//recipe_write_title, editordata
	try {
		String upDir = "../upload";

		String saveDir = application.getRealPath(upDir);

		saveDir = config.getServletContext().getRealPath(upDir);
		//System.out.println("saveDir="+saveDir);
		saveDir = "C:\\Study\\jsp_ws\\semi3\\src\\main\\webapp\\upload";
		//System.out.println("saveDir="+saveDir);

		int maxSize = 20 * 1024 * 1024;
		String encoding = "utf-8";

		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, encoding, policy);
		System.out.print("업로드 완료! ");

		//1 title radio fileName content

		String fName = mr.getFilesystemName("fileName");
		long fSize = 0;
		String fOname = "";
		if (fName != null && !fName.isEmpty()) {
			File file = mr.getFile(fName);
			fSize = file.length();
			fOname = mr.getOriginalFileName("fileName");
		}

		String no = mr.getParameter("no");
		String title = mr.getParameter("title");
		String rLevel = mr.getParameter("rLevel");
		String content = mr.getParameter("content");
		String oldFileName = mr.getParameter("oldFileName");

		rVo.setwNo(Integer.parseInt(no));
		rVo.setTitle(title);
		rVo.setContent(content);
		rVo.setrLevel(rLevel);

		rVo.setfName(fName);
		rVo.setfOname(fOname);
		rVo.setfSize(fSize);

		String id = (String) session.getAttribute("id");

		//2
		if (rService.checkUserid(id, rVo)) {
			int cnt = rService.insertRecipe(rVo);
			
			
			if (cnt > 0) {
				if(fName!=null && !fName.isEmpty()){ //새로첨부했을 경우에..
					if(oldFileName!=null && !oldFileName.isEmpty()){ //기존파일이 있을 경우에...
						File oldFile = new File(saveDir, oldFileName);
						if(oldFile.exists()){
							boolean bool=oldFile.delete();
							System.out.println("기존파일 삭제:"+bool);
						}
					}
				}
				
				%>
				<script type="text/javascript">
					alert("수정 성공");
					location.href = "recipe.jsp";
				</script>
				<%
			} else {
				%>
				<script type="text/javascript">
					alert("수정 실패");
					history.back();
				</script>
				<%
			}

		}else{ //비번불일치했지만 이미 업로드 된 경우
			if(fName!=null && !fName.isEmpty()){ //새로첨부했을 경우에..
				File newFile = new File(saveDir, fName);
					if(newFile.exists()){
						boolean bool=newFile.delete();
						System.out.println("새로운파일 삭제:"+bool);
					}
				}
		%>
			<script type="text/javascript">
				alert('아이디 불일치!');
				history.go(-1);
			</script>	
			
			
	<%}
	} catch (SQLException e) {
	e.printStackTrace();
	}catch(IOException e){
		e.printStackTrace();%>
		<script type="text/javascript">
			alert("2MB 이상의 파일은 업로드 불가!");
			history.back();
		</script>		
<%}
	
	%>
</body>
</html>