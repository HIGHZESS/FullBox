<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("boardIdx","1");
%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript">
	$(function(){
	    $(".accordion>li>div").click(function(){
	    $(this).next("p").slideToggle(200);
	    $(this).parent("li").siblings("li").children("p").slideUp(200);
	    });
	  });

</script>
<link rel="stylesheet" type="text/css" href="../css/menual.css?v=<%=System.currentTimeMillis()%>" />

<div>
	<div id="manual_container">
		<div id="manual_top1">
			<div class="manual_top_div1">
				<div style="width: 300px; height: 300px; display: inline-block; float: left;">
					<table style="margin: 50px 0;">
						<tr>
							<td>
							<p style="font-size: 1.2em; color: #525252; font-weight: bold;">이용방법</p>
							</td>
						</tr>
						<tr style="height:200px;">
							<td>
								<p style="font-size: 38px; font-weight: bold; line-height: 40px;">바보상자 상품구매<br>이용방법</p>	
							</td>
						</tr>
						<tr>
							<td>
								<a href="register.jsp">
									<div class="manual_join">
										<p>가입하기</p>
									</div>
								</a>	
							</td>
						</tr>
					</table>
				</div>
				<div id="manual_top_img">
					<img src="../image/manualBox.png" style="width:400px; height:400px; ">				
				</div>
			</div>
		</div>
		
		
		<div id="manual_top2">
			<div class="manual_top_div1">
				<div id="manual_top2_div1">
					<p class="title_bold_p">이렇게 <br>진행됩니다</p>
					<div style="height: 20px;"></div>
					<p class="content_p">이번 주 구출한 채소 목록이<br>월요일에 새롭게 등록됩니다
					<br>상품구매를 통해 확인하실 수 있어요.</p>
					<div style="height: 20px;"></div>
					<button onclick="location.href='product.jsp' " class="green_button">구매하러가기 > </button>
				</div>
				<div id="manual_top2_div2">
					<div class="manual_top2_div2_1">
						<img src="../image/Manual02.png" style="margin:10px 0; width: 100%;">
						<p class="content_p">품목 등록</p>
						<p>월요일</p>
					</div>
					<div class="manual_top2_div2_1">
						<img src="../image/Manual03.png" style="margin:10px 0; width: 100%;">
						<p class="content_p">결제일</p>
						<p>수요일</p>
					</div>
					<div class="manual_top2_div2_1">
						<img src="../image/manual04.png" style="margin:10px 0; width: 100%;">
						<p class="content_p">배송예상일</p>
						<p>금요일</p>
					</div>
				</div>
			</div>
		</div>
		
		
		<div id="manual_top3" style="height: 100px;">
			<div class="manual_top_div1">
				<div style="margin: 10px 0; width:400px; height: 80px; float: left;">
					<h3 style="margin: 10px 0">새벽배송으로 <span style="font-weight: bold;">더 신선하게!</span></h3>
					<p style="font-size: 0.8em;">*서울 및 일부 수도권 지역 한정</p>
				</div>
				
				<div style="margin: 17px 0; width:100px; height: 80px; float: right;">
					<img src="../image/Manual11.png" >
				</div>
			</div>
		</div>
		
		
		<div id="manual_top4" style="height: 800px;">
			<div class="manual_top_div1" style="height: 400px;">
				<div class="manual_top_div2" style="margin: 10px 0; float: left;">
					<img src="../image/Manual05.jpg" style="width: 100%;">
				</div>
				<div class="manual_top_div2" style="margin: 40px 0; float: right;">
					<h3>선물 같은 설렘, <br>어떤 채소들이 올까요?</h3><br>
					<p>
						<span class="span_color">친환경 채소</span><br>
						무농약, 유기농 인증을 받은 친환경 채소로만 구성돼요.<br><br>
						<span class="span_color">사연있는 채소</span><br>
						모양이 고르지 않거나 판로가 부족해 남겨졌지만 같은 땅에서 자란 신선한 농산물들이에요.<br><br>
						<span class="span_color">제철 채소</span><br>
						지금, 가장 맛있는 제철 채소를 수확 직후 보내드려요.
					</p>
					
				</div>
			</div>		
			<div class="manual_top_div1" style="height: 400px; position: relative; ">
				<div class="manual_top_div2" style="margin: 40px 0; float: left;">
					<h3 style="font-weight:bold; ">레시피로 남김없이 맛있게</h3><br>
					<p>
						채소를 활용해 간단하게 만드는 레시피 4~5개,<br>
						채소의 사연과 보관법 등이 알차게 담긴<br>
						레시피 페이퍼를 함께 보내드려요.<br><br>
						요리 걱정 없이 건강한 채소 식탁을 만들어 보세요.<br>
					</p>
					<button class="green_button" style="background:#e6f8ec; border-radius: 4px;" 
					onclick="location.href='recipe.jsp' ">레시피 보러가기</button>
					
				</div>
				<div id="green_box"></div>
				<div class="manual_top_div2" style="margin: 10px 0; position:absolute; right:0; z-index: 3;">
					<img src="../image/Manual06.png" style="width: 100%; z-index: 3;">
				</div>
			</div>		
		</div>
		
		
		
		<div id="manual_top5" style="background: #e6f8ec;">
			<div class="manual_top_div1" style="height: 400px;">
				<div class="manual_top_div2" style="width:300px; margin: 30px 0; float: left;">
					<h1 style="font-weight: bold;">걱정마세요!</h1>
				</div>
				
				<div class="manual_top_div2" style="width:600px; margin: 40px 0; float: right;">
					<div class="manual_check">
						<img src="../image/Manual12.png">
						<h5 style="font-weight: bold;">도착할 품목을 미리 알려드려요.</h5>
						<h6 style="font-size: 0.8em;">매주 월요일, 이번 주에는 어떤 채소들을<br>구출했는지 품목 리스트를 알려드려요.</h6>
					</div>
					<div class="manual_check">
						<img src="../image/Manual12.png">
						<h5 style="font-weight: bold;">모르는 새 결제하지 않아요</h5>
						<h6 style="font-size: 0.8em;">월요일, 품목 알림과 함께 결제 예정을 안내 드리고,<br>출고 전일에만 결제가 진행돼요.</h6>
					
					</div>
					<div class="manual_check">
						<img src="../image/Manual12.png">
						<h5 style="font-weight: bold;">배송을 자유롭게 미뤄요.</h5>
						<h6 style="font-size: 0.8em;">바쁜 일정이 있거나, 채소가 남았다면<br>1~4주, 원하는 만큼 미뤄서 받고 싶을 때 받으세요!</h6>
					
					</div>
					<div class="manual_check">
						<img src="../image/Manual12.png">
						<h5 style="font-weight: bold;">언제든지 정지와 탈퇴 할 수 있어요.</h5>
						<h6 style="font-size: 0.8em;">어떤 구속도 없어요. 언제든지 원할 때 멈추고<br>다시 시작하고 싶을 때 이용하세요.</h6>
					
					</div>
					
				</div>
			</div>	
		</div>
		<div id="manual_top6">
			<div class="manual_top_div1" style="height: 100px;">
				<div style="width:200px; height: 50px; margin: 25px auto;">
					<a href="register.jsp">
						<div id="footer_inquiry">
							<p style="font-size: 16px;">가입하기</p>
						</div>
					</a>
				</div>
			</div>	
		</div>
		
		<div id="manual_top7">
			<div>
				<p style="font-size: 2em; font-weight: bold;">FAQ</p>
			</div>
			<ul class="accordion">
		      <li>
		        <div class="QnA">Q. 어떤 채소들을 받게 되나요?</div> 
		        <p>각각의 사연으로 판로를 잃은 친환경 농산물들로 꾸려집니다.<br>
					1. 모든 채소들은 모두 무농약/유기농 인증을 받은 제철 친환경 채소들입니다.<br>
					2. 모양이나 중량으로 버려질 위기의 못난이 채소, 급식 중단으로 판로를 잃은 채소 등 구출 긴급도를 따져 소싱합니다.<br>
					3. 사연은 제각각이지만, 꼼꼼하게 선별해 맛과 신선도에는 문제가 없는 채소들로만 꾸려집니다. 
						불필요한 유통과정을 줄여 발송 직전 수확해 가장 신선하게 보내드려요.</p>
		      </li>
		      <li>
		        <div class="QnA">Q. 어떤 채소가 올지 미리 알 수 있나요?</div> 
		        <p>네! 발송 전, 이번 주의 채소 구성과 추천 레시피를 문자로 보내드립니다. 미리 다음 주의 식단을 구상해볼 수 있습니다.</p>
		      </li>
		      <li>
		        <div class="QnA">Q. 인증된 친환경 농산물이 맞나요?</div>
		        <p>맞습니다! 친환경 취급자 인증을 꼭 확인하세요.<br>
					바보상자는 친환경 취급자 인증을 받아 모든 농산물이 입고 부터 출고까지 '친환경' 제품으로만 관리/추적됩니다. <br>
					보내드리는 레시피 페이퍼에 농산물들의 인증번호와 로트번호가 기재됩니다.</p>
		      </li>
		      <li>
		        <div class="QnA">Q. 채소의 상태가 좋지 않으면 보상해주나요?</div>
		        <p>물론입니다. 산지부터 포장까지 꼼꼼히 검수하지만, 만일 만족스럽지 않은 상태의 농산물을 받으셨을 경우<br>
		        	 사진을 찍어 문의게시판으로 연락주세요. 보상을 도와드립니다. 책임지고 보상을 도와드립니다.</p>
		      </li>
		      <li>
		        <div class="QnA">Q. 채소를 다 먹지 못하면 어쩌죠?</div>
		        <p>걱정마세요! 홈페이지의 '레시피 게시판'을 이용해보세요. 채소들을 어떻게 보관해야할지 언제까지 먹어야할지<br>
		        	꼼꼼하게 알려드리고, 어떻게 맛있게 먹을 수 있을지 알려드려요.<br>
					그럼에도, 채소가 남았거나 일정이 바쁠 경우에는 ‘미루기’를 통해 배송일정을 미룰 수 있어요.</p>
		      </li>
		      <li>
		        <div class="QnA">Q. 채소들은 어떻게 소싱되나요?</div>
		        <p>바보상자 팀원들이 농가 상황을 수시로 체크하고 있습니다. 매주 산지에 방문하며 농작물과 생산환경을 확인합니다. <br>
		        건강하게 자랐지만 판로가 없는 농산물들을 농부님들께 직접 공급받습니다.<br>
				더해, 생산단계부터 완벽한 외형을 위해 과도한 방제를 하지 않는 것을 추구하는 농부님들과 파트너쉽을 맺고 있습니다.</p>
		      </li>
		      <li>
		        <div class="QnA">Q. 정말 저렴한가요?</div>
		        <p>매주 친환경 농산물의 시세를 체크하고 시세 대비 평균 20% 저렴하게 제공해드리고 있습니다. (농산물 유통정보 - kamis.or.kr)<br>
				이는 온라인 마켓에서 인증 받은 동일한 품목을, 동일 중량으로 계산했을 때 최대 35%까지 저렴한 수준입니다.<br>
				농부분들이 폐기나 밭갈이가 아닌 어글리어스 납품을 선택할 수 있도록 합리적인 정산을 지불해드림에도 <br>
				이렇게 저렴한 제공이 가능한 이유는, 중간 유통과정 없이 산지와의 직거래를 통해 유통비용을 절감하고 <br>
				정기배송 방식으로 재고를 남기지 않기 때문입니다.</p>
		      </li>
		  </ul>  
		</div>
		
		
		
	<div id="footer">
			<div id="footer_container">
				<table id="footer_table">
					<tr>
						<td colspan="2">
							<p style="font-weight: bold; font-size: 14px;">바보상자 문의상담시간</p>
						</td>
						<td rowspan="2">
							<a href="#">
								<div id="footer_inquiry">
									<p style="font-size: 16px;">문의하기</p>
								</div>
							</a>
						</td>
					</tr>
					<tr>
						<td style="width: 100px;"><p>월 - 금요일<br>토/일/공휴일</p></td>
						<td><p> 09:00 ~ 18:00 (점심시간 12:00 ~ 13:00) <br>휴무</p></td>
					</tr>
					<tr>
						<td colspan="3" style="border-top: 1px solid white;">
							<img src="../image/바보상자_수정.png">
						</td>
					</tr>
					<tr>
						<td colspan="3">
						<p>상호명 : 주식회사 바보상자  |  대표 : 김길동  |  사업자등록번호 : 100-11-00007  |  소재지 : 서울시 서대문구 신촌동<br>
								통신판매업 신고번호 : 2022-신촌동부-0001  |  제휴 및 납품 문의 : fullbox@gmail.co.kr  |  농산물 납품 및 긴급구출 제보 : fullbox@gmail.co.kr</p>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<p>서비스 이용약관개인정보 처리방침Copyright &copy; 2022 주식회사 바보상자 All rights reserved.</p>
						</td>
					</tr>

				
				
				</table>
			</div>
		</div>
	
	</div>

</div>



<%@ include file="../inc/bottom.jsp"%>