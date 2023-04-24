<%@page import="com.semi.bmember.model.bMemberService"%>
<%@page import="com.semi.bmember.model.bMemberVO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.semi.living.model.LivingVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="LivingService" class="com.semi.living.model.LivingService"></jsp:useBean>
<jsp:useBean id="bMemberService" class="com.semi.bmember.model.bMemberService"></jsp:useBean>
<%
	//MultipartRequest 객체 생성 성공 => 업로드 완료
	//실패 => IOException 발생(파일 용량 초과 등)
	String upDir="../upload";//업로드할 폴더
	//업로드할 폴더의 절대경로 구하기
	String saveDir=application.getRealPath(upDir);
	System.out.println("saveDir="+saveDir);
			
	saveDir=config.getServletContext().getRealPath(upDir);
	System.out.println("saveDir="+saveDir);
	
	//업로드 최대용량
	
	saveDir="C:\\lecture\\workspace_list\\jsp_ws\\semi3\\src\\main\\webapp\\upload";
	
	int maxSize=50*1024*1024; //업로드 최대용량 50M
	String encoding="utf-8";
	
	//업로드시 동일한 파일명이 있을 경우 나중에 업로드한 파일에 번호를 붙여 이름 변경
	DefaultFileRenamePolicy policy=new DefaultFileRenamePolicy();
	
	MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize,
			encoding, policy);
	out.print("업로드 완료!");
	
	//업로드된 파일 정보 얻어오기
	String fileName = mr.getFilesystemName("fileName");//업로드 된 파일명(변경후)
	String originFileName = mr.getOriginalFileName("fileName");
	//=>업로드 된 파일명 원본
	
	File file = mr.getFile("fileName");
	long fileSize=0;
	if(file!=null){
		fileSize= file.length();
	}
	
	request.setCharacterEncoding("utf-8");
	String id = mr.getParameter("id");
	String wNo = mr.getParameter("wNo");
	String title = mr.getParameter("title");
	String content = mr.getParameter("content");
	
	bMemberVO memVo = new bMemberVO();
	try{
		memVo = bMemberService.selectByUserid(id);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	LivingVO vo = new LivingVO();
	vo.setwNo(Integer.parseInt(wNo));
	vo.setTitle(title);
	vo.setContent(content);
	vo.setfName(fileName);
	vo.setfSize(fileSize);
	vo.setfOname(originFileName);
	vo.setmNo(memVo.getMno());
	
	String msg="글수정 실패!", url="living.jsp";
	try{
		int cnt = LivingService.updateLiving(vo);
		if(cnt>0){
			msg="글수정 성공!";
			url="living.jsp";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>living_update_ok.jsp</title>
</head>
<body>
<jsp:forward page="message.jsp"></jsp:forward>
</body>
</html>