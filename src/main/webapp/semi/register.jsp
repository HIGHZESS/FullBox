<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp" %>	
<link rel="stylesheet" type="text/css" href="../css/register.css" />
<link rel="stylesheet" type="text/css" href="../css/register2.css" />
<style>

</style>
<script type="text/javascript" 
	src="../../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$(".OnlyForSeller").hide();
	
	$('input[name="memType"]').change(function() {
	
		if($(this).val()=="S"){
        	$(".OnlyForSeller").show();
        }else{
        	$(".OnlyForSeller").hide();
        }
});

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

$('.btn').on('click', function() {
    var $this = $(this);
  $this.button('loading');
    setTimeout(function() {
       $this.button('reset');
   }, 8000);
});
	
function validate_userid(id){
	var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
	return pattern.test(id);
}

	
</script>
 <section>
<div class="divForm">
<form name="frm1" method="post" action="register_ok.jsp">
	<fieldset id ="registerF">
	<h2 style="color:green">회원 가입</h2>
	<h5 style="font size:5px"> 바보상자에 오신 걸 환영합니다! </h5>
	<p style="color:grey;"> 가입 후 마이페이지에서도 정보를 변경 할 수 있어요.</p>
    <div class="name">  
      
        <label for="name">성명</label>
        <input type="text" name="name" id="name" style="ime-mode:active"><span style="visibility:hidden;">필수입력항목입니다</span>
    </div>
    <div class="nickname">         
        <label for="nickname">닉네임</label>
        <input type="text" name="nickname" id="nickname">&nbsp;
    	<input type="button" value="중복확인" id="btnChkNickname" title="새창열림"><span style="visibility:hidden;">닉네임 중복확인!</span>
   
    </div>
    <div class="id"> 
        <label for="id">회원ID</label>
        <input type="text" name="id" id="id"
        		style="ime-mode:inactive">&nbsp;
        <input type="button" value="중복확인" id="btnChkId" title="새창열림"><span style="visibility:hidden;">아이디 중복확인!</span>
    </div>
    <div class="pw"> 
        <label for="pwd">비밀번호</label>
        <input type="Password" name="pwd" id="pwd"><span style="visibility:hidden;">필수입력항목입니다</span>
    </div>
    <div class="pwck"> 
        <label for="pwd2">비밀번호 확인</label>
        <input type="Password" name="pwd2" id="pwd2"><span style="visibility:hidden;">비밀번호가 일치하지않습니다</span>
    </div>
    <div class="zip"> 
        <label for="zipcode">주소</label>
        <input type="text" name="zipcode" id="zipcode" ReadOnly  
        	title="우편번호" class="width_80">
        <input type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="address" ReadOnly title="주소"  class="width_350"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="addressDetail" title="상세주소"  class="width_350">
    </div>
   
 
    <div class="mail">
        <label for="email1">이메일</label>
        <input type="text" name="email1"  id="email1" title="이메일주소 앞자리">&nbsp;@
        <select name="email2" id="email2"  title="이메일주소 뒷자리">
            <option value="naver.com">naver.com</option>
            <option value="daum.net">daum.net</option>
            <option value="gmail.com">gmail.com</option>
            <option value="etc">직접입력</option>
        </select>
        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
        	style="visibility:hidden">
    </div>
    <div class ="velue">
    	<span style ="visibility : hidden">회원유형</span>
		    <label><input type="radio" name="memType" id ="typeS" value ="S"> 판매자</label>
		    <label><input type="radio" name="memType" id ="typeC" checked value ="C"> 일반회원</label>
		    <label><input type="radio" name="memType" id ="typeM" value ="M"> 관리자</label>
    </div>
    
    <!-- 판매자 정보입력 -->
    <div class ="OnlyForSeller">
	     <div class ="sName">        
	        <label for="sName">상호명</label>
	        <input type="text" name="sName" id="sName" style="ime-mode:active">
	    </div>
	    
	     <div class ="sRegnum">        
	        <label for="sRegnum">사업자등록번호</label>
	        <input type="text" name="sRegnum" id="sRegnum" style="ime-mode:active">
	    </div>
	    
	     <div class ="sIntro">        
	     		<label for="sIntro">가게소개</label>
				<textarea rows="10" id="sIntro" name="sIntro"
				placeholder="가게소개를 입력하세요"></textarea>
		</div>
	</div>
    <div class="center">
         <button type="submit" class="btn btn-primary btn-lg" id="load2"
			data-loading-text="<i class='fa fa-spinner fa-spin '></i> Processing Order">회원가입</button>
         
    </div>
</fieldset>
	<!-- 아이디/닉네임 사용가능할경우 Y 로 셋팅 -->
    <input type ="text" name="chkId" id="chkId" style="visibility:hidden">
    <input type ="text" name="chknickname" id="chknickname" style="visibility:hidden">  
	
</form>


</div>
</section>

</body>
</html>
<%@include file="../../inc/bottom.jsp" %>	