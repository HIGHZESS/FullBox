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
<title>product_write_ok.jsp</title>
</head>
<body>
<jsp:useBean id="pServ" class="com.semi.product.model.ProductService" scope="session"></jsp:useBean>
<jsp:useBean id="pVo" class="com.semi.product.model.ProductVO" scope="session"></jsp:useBean>

<%
	try{
		String upDir="../upload";
		//업로드할 폴더의 절대경로 구하기
		String saveDir=application.getRealPath(upDir);
		System.out.println("saveDir="+saveDir);
		
		saveDir=config.getServletContext().getRealPath(upDir);
		System.out.println("saveDir="+saveDir);
		
		saveDir="C:\\Study\\jsp_ws\\semi3\\src\\main\\webapp\\upload";
		System.out.println("saveDir="+saveDir);
		
		int maxSize=10*1024*1024;
		String encoding="utf-8";
		
		DefaultFileRenamePolicy policy=new DefaultFileRenamePolicy();
		
		MultipartRequest mr
			=new MultipartRequest(request, saveDir, maxSize, encoding, policy);
		System.out.println("업로드 완료");
		
		//업로드한 파일 정보
		String fileName=mr.getFilesystemName("fileName");
		long fileSize=0;
		String originFileName=mr.getOriginalFileName("fileName");
		
		File file = mr.getFile("fileName");
		if(file!=null){
				fileSize=file.length();
		}
			
		//1
		String pname=mr.getParameter("pname");
		String pintro=mr.getParameter("pintro");
		/* int price=Integer.parseInt(mr.getParameter("price")); */
		System.out.println("price 파라미터값= "+mr.getParameter("priceSale"));
		String price = mr.getParameter("priceSale");
		String tPrice = price.trim();
		int iprice=Integer.parseInt(tPrice);
		
		//2
		pVo.setpName(pname);
		pVo.setpIntro(pintro);
		pVo.setPrice(iprice);
		
		pVo.setfName(fileName);
		pVo.setfSize(fileSize);
		pVo.setfoName(originFileName);
	
		int cnt=pServ.insertProduct(pVo);
		
		//3
		if(cnt>0){ %>
			<script type="text/javascript">
				alert("글쓰기 성공");
				location.href="product.jsp";
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
			alert("10M 이상의 파일은 업로드 불가!");
			history.back();
		</script>
<%	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
</body>
</html>