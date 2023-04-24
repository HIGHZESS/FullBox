<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="LoginCheck.jsp"%>
<link rel="stylesheet" type="text/css" href="../css/register.css" />
<link rel="stylesheet" type="text/css" href="../css/registerEdit.css" />
<link rel="stylesheet" type="text/css" href="../css/register2.css" />
<link rel="stylesheet" type="text/css" href="../css/registerEdit2.css" />
<jsp:useBean id="bmemVO" class="com.semi.bmember.model.bMemberVO"
	scope="page"></jsp:useBean>
<jsp:useBean id="bmemService"
	class="com.semi.bmember.model.bMemberService" scope="session"></jsp:useBean>
<jsp:useBean id="sellerService" class="com.semi.seller.sellerService"
	scope="session"></jsp:useBean>
<jsp:useBean id="sellerVO" class="com.semi.seller.sellerVO"
	scope="session"></jsp:useBean>
<%@ include file="../../inc/top.jsp"%>
<style>





</style>
<%
String l_id = (String)session.getAttribute("id");
int mno = (int)session.getAttribute("mno");
String l_type = (String)session.getAttribute("type");

try{
	bmemVO = bmemService.selectByUserid(l_id);
	
	if(l_type=="S" || l_type.equals("S")){
		sellerVO = sellerService.selectByMno(mno);
	}
}catch(SQLException e){
	e.printStackTrace();
}

//주소 null check
String address = bmemVO.getAddress();
String addressdetail = bmemVO.getAddressDetail();
String zipcode = bmemVO.getZipcode();

if(address == null || address.isEmpty()) {
	address = "";
 }
if(addressdetail == null || addressdetail.isEmpty()) {
	addressdetail = "";
 }
if(zipcode == null || zipcode.isEmpty()) {
	zipcode = "";
 }

//이메일 null check
String email=bmemVO.getEmail();

String email1="";
String email2="";
if(email !=null && !email.isEmpty()){
	String [] emailArr = email.split("@");
	email1 = emailArr[0];
	email2 = emailArr[1];
}

String[] emailList= {"naver.com","daum.net","gmail.com"};
boolean isEtc = false; //직접입력이면 true로 바꿔줌
int count =0;

for(int i =0;i<emailList.length;i++){
	if(emailList[i].equals(email2)){
		count++;
		break;
	}
}

if(count==0){
	isEtc = true;
}


//판매자
String sregnum=""; //사업자등록번호
String sname="";
String sintro="";
if(sregnum == null || sregnum.isEmpty()) {
	sregnum = "";
 }
if(sname == null || sname.isEmpty()) {
	sname = "";
 }
if(sintro == null || sintro.isEmpty()) {
	sintro = "";
 }

String type = bmemVO.getSub();


%>

<script type="text/javascript" src="../../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">	
	$(function() {
			if (<%=type.equals("S")%>) {
				$(".OnlyForSeller").show();
			} else {
				$(".OnlyForSeller").hide();
			}
		
		
		$('form[name=frm1]').submit(function(){
			if($.trim($('#name').val()) == ""){
				$('#name').next().css('visibility','visible');
				$('#name').focus();
				event.preventDefault();		
			}else if($.trim($('#nickname').val()) == ""){
				$('#nickname').next().css('visibility','visible');
				$("#nickname").focus();
				event.preventDefault();
		 	}else if(!validate_userid($("#userid").val())) {
				alert("아이디는 영문, 숫자, _(밑줄문자)만 가능합니다");
				$("#userid").focus();
				event.preventDefault();
		 	}else if($("#pwd").val().length<1) {
		 		$('#pwd').next().css('visibility','visible');
			    $("#pwd").focus();
			    event.preventDefault();
			}else if($("#pwd").val()!=$("#pwd2").val()) {
				$('#pwd2').next().css('visibility','visible');
			    $("#pwd2").focus();
			    event.preventDefault();
			}else if($('#chkId').val()!='Y'){
				$('#btnChkId').next().css('visibility','visible');
				$("#btnChkId").focus();
				event.preventDefault();			
			}else if($('#chknickname').val()!='Y'){
				$('#btnChkNickname').next().css('visibility','visible');
				$("#btnChkNickname").focus();
				event.preventDefault();			
			}
		});
			

		$('#btnChkId').click(function(){
			var userid=$('#id').val();
			
			window.open("checkUserid.jsp?id="+userid,"idcheck",
		"width=400,height=350,location=yes,resizable=yes,top=100,left=50");	
		});
		$('#btnChkNickname').click(function(){
			var nickname=$('#nickname').val();
			
			window.open("CheckNickname.jsp?nickname="+nickname,"NicknameCheck",
		"width=400,height=350,location=yes,resizable=yes,top=100,left=50");	
		});
		
		$('#btnZipcode').click(function(){
			
			window.open("zipcode.jsp","address",
		"width=400,height=350,location=yes,resizable=yes,top=100,left=50");	
		});
		
		
		
	});
</script>
<style type="text/css">

</style>


<section>
	<div class="divForm">
		<form name="frm1" method="post" action="registerEdit_ok.jsp">
		<input type="hidden" name="mno" id="mno" value = "<%=mno%>">
			<fieldset id ="registerF">
				<h2 style="color: green">회원수정</h2>
				<h5 style="font size: 5px">고객님의 정보를 수정해주세요</h5>
				<p style="color: grey;">고객님의 소중한 정보는 바보상자에서 잘 관리하고있습니다</p>
				
				<div class ="name">
					<label for="name">성명</label> 
					<input type="text" name="name" id="name" style="ime-mode: active" value = "<%=bmemVO.getName()%>" disabled><span style="visibility: hidden;">필수입력항목입니다</span>
				</div>
				<div class="nickname">
					<label for="nickname">닉네임</label>&nbsp; <input type="text"
						name="nickname" id="nickname" style="ime-mode: inactive" value = "<%=bmemVO.getNickname()%>" >
					<input type="button" value="중복확인" id="btnChkNickname" title="새창열림" ><span
						style="visibility: hidden;">닉네임 중복확인!</span>
				</div>
				<div class="id">
					<label for="id">회원ID</label>&nbsp; <input type="text" name="id"
						id="id" style="ime-mode: inactive" value = "<%= l_id%>" disabled>&nbsp; <input
						type="button" value="중복확인" id="btnChkId" title="새창열림" ><span
						style="visibility: hidden;">아이디 중복확인!</span>
				</div>
				<div class="pw">
					<label for="pwd">비밀번호</label> <input type="Password" name="pwd"
						id="pwd"  value ="<%=bmemVO.getPwd()%>" disabled><span style="visibility: hidden;">필수입력항목입니다</span>
				</div>
				<div class="pwck">
					<label for="pwd2">비밀번호 확인</label> <input type="Password"
						name="pwd2" id="pwd2"><span style="visibility: hidden;">비밀번호가
						일치하지않습니다</span>
				</div>
				<div class="zip">
					<label for="zipcode">주소</label> <input type="text" name="zipcode"
						id="zipcode" ReadOnly title="우편번호" class="width_80"  value = "<%=zipcode%>"> <input
						type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림"><br />
					<span class="sp1">&nbsp;</span> <input type="text" name="address"
						ReadOnly title="주소" class="width_350" value = "<%=address%>"><br /> <span
						class="sp1">&nbsp;</span> <input type="text" name="addressDetail"
						title="상세주소" class="width_350" value = "<%=addressdetail%>">
				</div>

				<div class="mail">
					<label for="email1">이메일</label> <input type="text" name="email1"
						id="email1" title="이메일주소 앞자리" value ="<%=email1%>">&nbsp; @ <select name="email2"
						id="email2" title="이메일주소 뒷자리">
						<option value="naver.com" <%if(email2.equals("naver.com")){%>
							selected="selected" <% }%>>naver.com</option>

						<option value="daum.net" 
						<%if(email2.equals("daum.net")){%>
							selected="selected"
							 <% }%>>daum.net</option>
						<option value="gmail.com" <%if(email2.equals("gmail.com")){%>
							selected="selected" <% }%>>gmail.com</option>
						<option value="etc">직접입력</option>
					</select> <input type="text" name="email3" id="email3"
						title="직접입력인 경우 이메일주소 뒷자리" style="visibility: hidden"
						<%if (isEtc) {%> 
							style="visibility:visible" 
							value="<%=email2%>"
						<%} else {%> 
							style="visibility:hidden" 
							<%}%>
						>
				</div>
				<div class ="velue">
					<span style ="visibility : hidden">회원유형</span>
				    <label><input type="radio" name="memType" id ="typeS" value ="S" 
				    <%if (type =="S" ||type.equals("S")) {%> 
					checked ="checked"
						<%}%> disabled> 판매자</label>
				    <label><input type="radio" name="memType" id ="typeC" checked value ="C" 	
				    <%if (type =="C" ||type.equals("C")) {%> 
				    checked ="checked"
						<%}%> disabled> 일반회원</label>
				    <label><input type="radio" name="memType" id ="typeM" value ="M" 	
				    <%if (type =="M" ||type.equals("M")) {%> 
					checked ="checked"
						<%}%> disabled> 관리자</label>
				</div>

				<!-- 판매자 정보입력 -->
				<div class="OnlyForSeller">
					<div class ="sName">
						<label for="sName">상호명</label> <input type="text" name="sName"
							id="sName" style="ime-mode: active" value ="<%=sname%>">
					</div>

					<div class ="sRegnum">
						<label for="sRegnum">사업자등록번호</label> <input type="text"
							name="sRegnum" id="sRegnum" style="ime-mode: active" value = "<%=sregnum%>">
					</div>

					<div class ="sIntro">
						<label for="sIntro">가게소개</label>
						<textarea rows="10" id="sIntro" name="sIntro"
							placeholder="가게소개를 입력하세요"><%=sintro%></textarea>
					</div>
				</div>
				<div class="center">
					<button type="submit" class="btn btn-primary btn-lg" id="load2"
			data-loading-text="<i class='fa fa-spinner fa-spin '></i> Processing Order">수정</button>
         </div>
			</fieldset>
			<!-- 아이디/닉네임 사용가능할경우 Y 로 셋팅 -->
			<input type="text" name="chkId" id="chkId" value="Y" disabled style="visibility:hidden"> 
			<input type="text" name="chknickname" id="chknickname" value="<%=type%>" style="visibility:hidden">

		</form>
	</div>
</section>


</body>
</html>
<%@include file="../../inc/bottom.jsp"%>
