<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.ReviewBoard.ReviewVO"%>
<%@page import="com.ReviewBoard.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReviewWrite_ok.jsp</title>
</head>
<body>
<%
//ReviewWrite 에서 post 방식으로 submit

try{
	
	/* public static final String UPLOAD_PATH="../upload";
	public static final String TEST_PATH="C:\\lecture\\workspace_list\\jsp_ws\\semi3\\src\\main\\webapp\\upload";
 */

 String upDir="../upload"; //업로드할 폴더
	//업로드할 폴더의 절대경로 구하기
	/* String saveDir=application.getRealPath(upDir); */
   /* 	System.out.println("saveDir="+saveDir); */
	
   	/* String saveDir=config.getServletContext().getRealPath(upDir);
   	System.out.println("saveDir="+saveDir);
	  */
    String saveDir="C:\\Study\\jsp_ws\\semi3\\src\\main\\webapp\\upload";

	System.out.println("testDir="+saveDir); 
	
	int maxSize=20*1024*1024;
	String encoding="utf-8";
	
	//업로드시 동일한 파일명이 있을 경우 나중에 업로드한 파일에 번호를 붙여 이름 변경
	DefaultFileRenamePolicy policy=new DefaultFileRenamePolicy();
	
	MultipartRequest mr
		=new MultipartRequest(request, saveDir, maxSize, encoding, policy);
	System.out.println("업로드 완료");
	
	//업로드한 파일 정보
	
	
	String fileName=mr.getFilesystemName("upfile");
	long fileSize=0;
	String originFileName="";
	if(fileName!=null && !fileName.isEmpty()){
		File f = mr.getFile("upfile");
		fileSize=f.length();
		
		originFileName=mr.getOriginalFileName("upfile");
	}
	
	
	String mNo = mr.getParameter("mNo");
	String title = mr.getParameter("title");
	String content = mr.getParameter("content");
	
	
	//ip
	String ip=request.getRemoteAddr();
	System.out.println("ip="+ip);
	
	ip=request.getRemoteHost();
	System.out.println("ip="+ip);

	
	
	//2
	ReviewService service = new ReviewService();
	ReviewVO vo = new ReviewVO();
	
	vo.setMno(Integer.parseInt(mNo));
	vo.setTitle(title);
	vo.setContent(content);
	
	vo.setFNAME(fileName);
	vo.setFONAME(originFileName);
	vo.setFSIZE((Long)fileSize);
	

	int cnt = service.insertReview(vo);
	
	if(cnt>0){%>
		<script type="text/javascript">
				alert("글쓰기 성공");
				location.href="AllReview.jsp";
		</script>
	<%}else{%>
		<script type="text/javascript">
				alert("글쓰기 실패");
				history.back();
		</script>		
	<%}
}catch(IOException e){
	e.printStackTrace(); %>
	<script type="text/javascript">
		alert("2M 이상의 파일은 업로드 불가!");
		history.back();
	</script>
<%	}catch(SQLException e){
	e.printStackTrace();
}


%>


</body>
</html>
