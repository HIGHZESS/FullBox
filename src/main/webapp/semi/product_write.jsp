<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="../css/product.css?v=<%=System.currentTimeMillis() %>">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#check1').click(function(){
			$('#checkedText').val('2');
		});
		$('#check2').click(function(){
			$('#checkedText').val('3');
		});
		
		$('#check3').change(function(){
			console.log(11)
			var saleCheck = $('#check3').is(':checked');
			var price = $('#price').val();
			console.log(saleCheck)
			console.log(price)
			if(saleCheck){
				console.log(price)
				$('#priceSale').val(price*0.9);
			}else{
				$('#priceSale').val(price);
			}
		});
		
		$('#pintro').click(function(){
			var price = $('#price').val();
			$('#priceSale').val(price)
		});
		
		
	});
	

</script>
<form  method="post" action="product_write_ok.jsp" enctype="multipart/form-data">
	<h2>상품 등록하기</h2>
	<hr>
	<div id="product_frm0">
		<div id="product_frm1">
			<div id="frm1_block">
				<div>
				  <p style="text-align:left;">상품명</p>
				  <input class="input_field" type="text" placeholder="상품명을 입력하세요" name="pname">
				</div>
			</div>
			<div class=clearfix></div>
			<div id="frm1_block">
				<div>
				  <p style="text-align:left;">가격</p>
				  <input class="input_field" type="text" placeholder="가격을 입력하세요" name="price" id="price">
				  <input class="input_field" type="hidden" placeholder="할인가격" name="priceSale" id="priceSale">
				</div>
			</div>
			<div class=clearfix></div>
			<div id="frm1_block">
				<div>
				<p style="text-align:left;">파일 첨부</p>
				<label class="upload_label" for="input_file"></label> 
				<input type="file" name=fileName id="input_file" />
				</div>
			</div>
			<div class=clearfix></div>
		</div>
		<div id="radio_block">
			<div>
				<p style="text-align:center; font-size: 20px;">상품 타입 선택</p>
			</div>
			<div class="checkbox">
			    <input type="radio" name="radio" id="check1" value="2" class="checkbox1">
			    <label for="check1">채소</label>
			    <input type="radio" name="radio" id="check2" value="3" class="checkbox1">
			    <label for="check1">과일</label>
			</div>
			<br>
			<div>
				<p style="text-align:center; font-size: 20px;">할인 여부 선택</p>
			</div>
			<div class="checkbox">
				<input type="checkbox" name="DC" id="check3" value="1" class="checkbox1">
			    <label for="check1">할인</label>
			</div>
			<br>
			    안내 : 바보상자의 할인율은 모두 10%로 동일합니다.
		</div>
		<div class=clearfix></div>
	</div>
	<div id="intro">
	  <p style="text-align:center;">상품 소개</p>
	  <textarea class="textarea_field" placeholder="내용을 입력해주세요." name="pintro" id="pintro">
	  </textarea>
	</div>
	<br>
	<input type="submit" value="작성" id="submit">
	<input type="reset" value="취소"
		OnClick=history.back();>
	<input type="hidden" id="checkedText" name="vNo">
	<input type = "Button" value="글목록" 
		OnClick="location.href='product.jsp'" />
</form>
<br>

<%@ include file="../inc/bottom.jsp"%>