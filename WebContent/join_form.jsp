<%@page import="kr.ac.sumin.computereng.dto.UserDatatype"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<link rel="shortcut icon" href="/JspWeb/img/logo.png">
<title>ADRM</title>
<link rel="stylesheet" type="text/css" href="/JspWeb/css/normalize.css">
<link rel="stylesheet" type="text/css" href="/JspWeb/css/join.css">
<link rel="stylesheet" type="text/css" href="/JspWeb/css/font.css">

<script type="text/javascript">
<%
	Object agree = session.getAttribute("agree");
	Object isUserModify = request.getAttribute("isUserModify");
	if( !((agree == null) || (isUserModify ==null))  && (request.getAttribute("joinMessage") == null)) {
	%>	alert('�������ּ���');
		location.href = "/JspWeb/controller/agree";
	<%
	}
	else {
		String joinMessage = (String)request.getAttribute("joinMessage");
		if(joinMessage == "SUCCESS") {
		%>	alert('ȸ������ ����');
			location.href = "/JspWeb/controller/loginCheck";
		<%
		} else if(joinMessage == "DUPLICATE_ID") {
			out.print("alert('�̹� �����ϴ� ���̵��Դϴ�.');");
		}
	}	
%>
	window.addEventListener("DOMContentLoaded", function() {
		document.getElementById("btn_login").addEventListener("click", function(event) {
			event.preventDefault();
		
			var id = document.getElementById("id");
			var pw = document.getElementById("pw");
			var confirm_pw = document.getElementById("confirm_pw");
			var email = document.getElementById("email");
			var name = document.getElementById("name");
			var role1 = document.getElementById("role1");
			var role2 = document.getElementById("role2");
		
			if(id.value == "" || id.value.length == 0) {
				alert("���̵� �Է��� �ּ���.");
				return;
			}
			if(pw.value == "" || pw.value.length == 0) {
				alert("��й�ȣ�� �Է��� �ּ���.");
				return;
			}
			if(pw.value != confirm_pw.value) {
				alert("��й�ȣ�� Ȯ���� �ּ���.");
				return;
			}
			if(email.value == "" || email.value.length == 0) {
				alert("�̸����� �Է��� �ּ���.");
				return;
			}
			if(name.value == "" || name.value.length == 0) {
				alert("�̸��� �Է��� �ּ���.");
				return;
			}
			if(!role1.checked  && !role2.checked) {
				alert("ȸ�� ���´� �ݵ�� �ϳ� �̻��� �����ؾ� �մϴ�.");
				return;
			}
		
			document.getElementById("joinFrm").submit();
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
			<div id="content">
				<h4>ȸ������</h4>
				<form action="/JspWeb/controller/join" id="joinFrm" name="joinFrm" target="_top" method="post">
					<table class="tbl_basic center">
						<tbody>
							<tr>
								<td class="trw1" >ID</td>
								<td class="trw" >
									<div class="join_input_row">
										<span class="input_box">
											<label for="id" id="label_id_area" class="lbl">ID</label>
											<input type="text" id="id" name="id" class="int" maxlength="30" value="">
										</span>
									</div>
									<label for="id" class="error"></label>
								</td>
							</tr>
							<tr>
								<td class="trw1" >��й�ȣ</td>
								<td class="trw" >
									<div class="join_input_row">
										<span class="input_box">
											<label for="pw" id="label_pw_area" class="lbl">Password</label>
											<input type="password" id="pw" name="pw" class="int" maxlength="30" >
										</span>
									</div>
									<label for="pw" class="error"></label>
								</td>
							</tr>
							<tr>
								<td class="trw1" >��й�ȣ Ȯ��</td>
								<td class="trw" >
									<div class="join_input_row">
										<span class="input_box">
											<label for="pw" id="label_pw_area" class="lbl">Password</label>
											<input type="password" id="confirm_pw" name="confirm_pw" class="int" maxlength="30" >
										</span>
									</div>
									<label for="confirm_pw" class="error"></label>
								</td>
							</tr>
							<tr>
								<td class="trw1" >E-MAIL</td>
								<td class="trw" >
									<div class="join_input_row">
										<span class="input_box">
											<label for="id" id="label_id_area" class="lbl">ID</label>
											<input type="text" id="email" name="email" class="int" maxlength="30" value="">
										</span>
									</div>
									<label for="email" class="error"></label>
								</td>
							</tr>
							<tr>
								<td class="trw1" >�̸�</td>
								<td class="trw" >
									<div class="join_input_row">
										<span class="input_box">
											<label for="id" id="label_id_area" class="lbl">ID</label>
											<input type="text" id="name" name="name" class="int" maxlength="30" value="">
										</span>
									</div>
									<label for="name" class="error"></label>
								</td>
							</tr>
							<tr>
								<td class="trw1" >��������</td>
								<td class="trw" >
									<select id="hospital" name="hospital" class="select_box">
										<option value="S">������б� ����</option>
										<option value="K">������б� ����</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="trw1" >ȸ������</td>
								<td class="trw" >
									<div class="none_input_row" id="select_roll">
										<span class="chkbox_area"><input id="role1" type="checkbox" name="roles" value="3" tabindex="9" class="chkbox">ȯ��</span>
										<span class="chkbox_area"><input id="role2" type="checkbox" name="roles" value="2" tabindex="9" class="chkbox">�ǻ�</span>
									</div>
									<label for="roles" class="error"></label>
								</td>
							</tr>
						</tbody>
					</table>
					<fieldset class="login_form">
						<input id="btn_login" type="submit" title="ȸ������" alt="ȸ������" value="ȸ������" class="btn_login" onclick=" ">
						<input id="cancelBtn" type="button" title="���" alt="���" value="���" class="btn_cancel">
					</fieldset>
				</form>
			</div>
			
		</div>
		<!-- container :e -->

		<!-- footer :s -->
		<%@ include file="./common/footer_main.jsp" %>
		<!-- footer :e	 -->
		
	</div>
	<script type="text/javascript">
		<%
			UserDatatype user = (UserDatatype) request.getAttribute("loginUser");
			if(user != null) {
			%>
				document.getElementById("joinFrm").action = "/JspWeb/controller/userModify";
				document.getElementById("btn_login").value = "ȸ����������";
				document.getElementById("id").value = "<%=user.getId()%>";
				document.getElementById("id").readOnly = true;
				document.getElementById("email").value = "<%=user.getEmail()%>";
				document.getElementById("name").value = "<%=user.getName()%>";
				document.getElementById("hospital").value = "<%=user.getHospital()%>";
			<%
				for(String role : user.getRoles()) {
//					if(role.equals("1")) {
//						out.print("alert('�����ڴ� ȸ�������� ������ �� �����ϴ�.');");
//					}
					if(role.equals("2")) {
						out.print("document.getElementById('role2').checked = true;");
					}
					if(role.equals("3")) {
						out.print("document.getElementById('role1').checked = true;");
					}
				}
			}
			
			user = (UserDatatype) request.getAttribute("joinUser");
			if((String)request.getAttribute("joinMessage") == "DUPLICATE_ID" && user != null) {
			%>
				document.getElementById("email").value = "<%=user.getEmail()%>";
				document.getElementById("name").value = "<%=user.getName()%>";
				document.getElementById("hospital").value = "<%=user.getHospital()%>";
			<%
				for(String role : user.getRoles()) {
					if(role.equals("2")) {
						out.print("document.getElementById('role2').checked = true;");
					}
					if(role.equals("3")) {
						out.print("document.getElementById('role1').checked = true;");
					}
				}
			}
			
		%>
	</script>			
<!-- wrap :e -->
</body>
</html>