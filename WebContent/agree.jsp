<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<link rel="shortcut icon" href="/JspWeb/img/logo.png">
<title>Sumin Lecture</title>
<link rel="stylesheet" type="text/css" href="/JspWeb/css/normalize.css">
<link rel="stylesheet" type="text/css" href="/JspWeb/css/join.css">
<link rel="stylesheet" type="text/css" href="/JspWeb/css/font.css">

<script type="text/javascript">
	
	window.addEventListener("DOMContentLoaded", function() {
		document.getElementById("agreeBtn").addEventListener("click", function(event) {
			event.preventDefault();
		
			var agree = document.getElementById("agree");
			
			if(agree.checked == true) {
				document.getElementById("agreeFrm").submit();
			}
			else{
				alert("개인정보수집에 동의해야 회원가입이 가능합니다.");
				agree.focus();
			}
		
		});
	});
</script>
<style type="text/css">
	#joinFrm label.error {
		color: #ff0000;
		display: none;
	}
</style>
<title>Sumin Lecture</title>
</head>
<body>
	<!-- wrap :s -->
	<div id="wrap">
		<!-- header :s -->
		<%@ include file="./common/header_main.jsp" %>
		<!-- header :e -->

		<!-- container :s -->
		<div id="container">
			<div id="content1">
				<h4>개인정보처리취급방침</h4>
				<fieldset class="text_area" style="letter-spacing:0.1em;word-spacing: 0.2em;line-height: 1.5">
				가나다라마바사아자차카타파하
				
				</fieldset>				
				<form action="/JspWeb/controller/agree" id="agreeFrm" name="agreeFrm" method="post">
				<label for="agree">동의합니다.</label><input id="agree" name="agree" type="checkbox">
				<fieldset class="login_form">
					<input id="cancelBtn" type="button" title="취소" alt="취소" value="취소" class="btn_cancel">
					<input id="agreeBtn" type="submit" title="전송" alt="전송" value="전송" class="btn_login" onclick=" ">
				</fieldset>
				</form>
			</div>
		</div>
		<!-- container :e -->

		<!-- footer :s -->
		
		<!-- footer :e	 -->

	

	</div>
<!-- wrap :e -->
</body>
</html>