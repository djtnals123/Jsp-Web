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
<link rel="stylesheet" type="text/css" href="/JspWeb/css/signIn.css">
<link rel="stylesheet" type="text/css" href="/JspWeb/css/font.css">
<script type="text/javascript">
	<%
		String loginMessage = (String)request.getAttribute("loginMessage");
		if(request.getAttribute("loginMessage") != null) {
			if(loginMessage == "SUCCESS") {
				out.print("alert('�α��� ����');");
			} else if(loginMessage == "INVALID_ID") {
				out.print("alert('��ȿ���� �ʴ� ���̵��Դϴ�.');");
			} else if(loginMessage == "INCORRECT_PW") {
				out.print("alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.');");
			}
		}
	%>
	window.addEventListener("DOMContentLoaded", function() {
		document.getElementById("btn_login").addEventListener("click", function(event) {
			event.preventDefault();
			var id = document.getElementById("id");
			var pw = document.getElementById("pw");
			
			if(id.value == "" || id.value.length == 0) {
				alert("���̵� �Է��� �ּ���.");
				id.focus();
				return;
			}
			else if(pw.value == "" || pw.value.length == 0) {
				alert("��й�ȣ�� �Է��� �ּ���.");
				pw.focus();	
				return;
			}
			document.getElementById("login_form").submit();
		});
	});
</script>

</head>
<body>
<!-- wrap :s -->
	<div id="wrap">
		<!-- header :s -->
		<%@ include file="./common/header_main.jsp" %>
		<!-- header :e -->

		<!-- container :s -->
		<div id="container">
			<div id="content">
					<fieldset class="findif_form">
					<form action="/JspWeb/controller/loginCheck" method="get" id="login_form">
						<legend class="blind">Sign In</legend>

						<label for="id" class="error"></label>
						<div class="input_row" id="id_area">
							<span class="input_box">
								<label for="id" id="label_id_area" class="lbl">ID</label>
								<input type="text" id="id" name="id"  placeholder="ID" class="int" maxlength="30" value="">
							</span>
						</div>
						<label for="pw" class="error"></label>
						<div class="input_row" id="pw_area">
							<span class="input_box">
								<label for="pw" id="label_pw_area" class="lbl">Password</label>
								<input type="password" id="pw" name="pw"  placeholder="Password" class="int" maxlength="30" >
							</span>
						</div>
						
						<div class="login_check">
							<span class="login_check_box">
								<input type="checkbox" id="login_chk" name="nvlong" class="" tabindex="9" value="off" onchange="savedLong(this);nclks_chk('login_chk', 'log.keepon', 'log.keepoff',this,event)" onclick="msieblur(this);">
								<label for="login_chk" id="label_login_chk" class="sp">���̵� ����</label>
							</span>
						</div>

						<input type="submit" id="btn_login" title="�α���" alt="�α���" value="�α���" class="btn_login" onclick=" ">
						
						<div class="find_info">
							<ul>
								<li><a href="/JspWeb/controller/agree">ȸ������</a></li>
							</ul>
						</div>
					</form>
					</fieldset>
			</div>
		</div>
		<!-- container :e -->

		<!-- footer :s -->
		<%@ include file="./common/footer_main.jsp" %>
		<!-- footer :e	 -->

	</div>
<!-- wrap :e -->

</body>
</html>