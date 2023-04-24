<%@page import="com.semi.seller.sellerVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register_ok.jsp</title>
</head>
<body>
	<jsp:useBean id="bmemVO" class="com.semi.bmember.model.bMemberVO"
		scope="page"></jsp:useBean>
	<jsp:useBean id="bmemService"
		class="com.semi.bmember.model.bMemberService" scope="session"></jsp:useBean>
	<jsp:useBean id="sellerService"
		class="com.semi.seller.sellerService" scope="session"></jsp:useBean>
	
	
	<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String nickname = request.getParameter("nickname");
	String id = request.getParameter("id");
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
	bmemVO.setName(name);
	bmemVO.setId(id);
	bmemVO.setPwd(pwd);
	bmemVO.setZipcode(zipcode);
	bmemVO.setAddress(address);
	bmemVO.setAddressDetail(addressDetail);
	bmemVO.setNickname(nickname);
	bmemVO.setSub(sub);
	bmemVO.setEmail(email);
	

	String msg = "회원가입실패", url = "register.jsp";
	int mno =0;
	try {
		//회원insert => bmember 테이블
		int cnt = bmemService.insertbMember(bmemVO);

		//회원유형 판매자(S)일 경우 판매자 정보 insert => seller 테이블
		if(sub.equals("S")){
			
		//저장된 아이디로 회원번호 찾기
		mno = bmemService.findMnoById(id);
		
			String sName = request.getParameter("sName");
			String sRegnum = request.getParameter("sRegnum");
			String sIntro = request.getParameter("sIntro");
			
			sellerVO vo = new sellerVO();		
			
			vo.setsRegnum(Integer.parseInt(sRegnum));
			vo.setsIntro(sIntro);
			vo.setsName(sName);
			vo.setMno(mno);
			
			try{
				int cnt2 = sellerService.insertSeller(vo);
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if (cnt > 0) {
			msg = "회원가입되었습니다.";
			url = "Login.jsp";
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}

	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	%>
	<jsp:forward page="../common/message.jsp"></jsp:forward>

</body>
</html>