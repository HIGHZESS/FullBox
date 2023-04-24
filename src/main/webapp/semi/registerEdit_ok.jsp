<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerEdit_ok.jsp</title>
</head>
<body>
<jsp:useBean id="bmemVO" class="com.semi.bmember.model.bMemberVO"
		scope="page"></jsp:useBean>
<jsp:useBean id="bmemService"
		class="com.semi.bmember.model.bMemberService" scope="session"></jsp:useBean>
<jsp:useBean id="sellerService"
		class="com.semi.seller.sellerService" scope="session"></jsp:useBean>
<jsp:useBean id="sellerVO"
		class="com.semi.seller.sellerVO" scope="session"></jsp:useBean>
	

<%
request.setCharacterEncoding("utf-8");
String mno = request.getParameter("mno");
String pwd = request.getParameter("pwd");
String zipcode = request.getParameter("zipcode");
String address = request.getParameter("address");
String addressDetail = request.getParameter("addressDetail");
String sub =request.getParameter("memType");
String email1=request.getParameter("email1");
String email2=request.getParameter("email2");
String email3 =request.getParameter("email3");

String email="";

if(email1!=null && !email1.isEmpty()){
		if(email2.equals("etc")){
		   if(email3!=null && !email3.isEmpty()){			
				email=email1+"@"+email3;		
		   }
		}else{
			email=email1+"@"+email2;
		}
}
bmemVO.setMno(Integer.parseInt(mno));
bmemVO.setPwd(pwd);
bmemVO.setZipcode(zipcode);
bmemVO.setAddress(address);
bmemVO.setAddressDetail(addressDetail);
bmemVO.setSub(sub);
bmemVO.setEmail(email);



//판매자 정보 수정
String sName = request.getParameter("sName");
String sRegnum = request.getParameter("sRegnum");
String sIntro = request.getParameter("sIntro");

sellerVO.setMno(Integer.parseInt(mno));
sellerVO.setsName(sName);
sellerVO.setsRegnum(Integer.parseInt(sRegnum));
sellerVO.setsIntro(sIntro);


String msg = "회원수정실패", url = "registerEdit.jsp";
String type ="";
try {
	//회원insert => bmember 테이블
	int cnt = bmemService.updateMember(bmemVO);
	
	if(cnt>0){
		
		type = bmemService.findTypeByMno(Integer.parseInt(mno));
		
		if(type=="S"||type.equals("S")){
			int result = sellerService.updateSeller(sellerVO);
		
			if(result>0){
				msg ="판매자회원정보수정이 완료되었습니다";
				url ="index.jsp";
			}else{
				url ="registerEdit.jsp";
			}
			
		}else{
			msg ="회원정보수정이 완료되었습니다";
			url ="index.jsp";
		}
		
	}else{
		msg ="비밀번호가 올바르지않습니다";
	}

}catch(SQLException e){
	e.printStackTrace();
}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);

%>

<jsp:forward page="../common/message.jsp"></jsp:forward>


</body>
</html>