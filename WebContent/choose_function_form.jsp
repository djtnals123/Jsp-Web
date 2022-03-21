<%@page import="kr.ac.sumin.computereng.dto.UserDatatype"%>
<%@page import="org.apache.catalina.UserDatabase"%>
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
<link rel="stylesheet" type="text/css" href="/JspWeb/css/choose_func.css">
<link rel="stylesheet" type="text/css" href="/JspWeb/css/font.css">
<script type="text/javascript">	
<%
	String loginMessage = (String)request.getAttribute("loginMessage");
	if(request.getAttribute("Message") != null) {
		out.print("alert('준비중입니다.');");
	}
%>
</script>
</head>
<body>
<!-- wrap :s -->
	<div id="wrap">
		<!-- header :s -->
		<%@ include file="./common/header_main.jsp" %>
		<%
			UserDatatype user = (UserDatatype) session.getAttribute("user");
			if(user == null)
				response.sendRedirect("/JspWeb.login_form.jsp");
		%>
		<!-- header :e -->

		<!-- container :s -->
		<div id="container">
			<div id="content">
				<h4 class="hide">기능 선택</h4>
				<%
					if(user == null)
						response.sendRedirect("/JspWeb/login_form.jsp");
					
					String[] roles = user.getRoles();
					for(String role : roles) {
						if(role.equals("2")) {
				%>
					<a class="btn_wrap2" href="/JspWeb/controller/boardList?page=1">
						<span class="horizontal_align"><p><img src="/JspWeb/img/doctor.png"></p>의사<b>Doctor</b></span>
					</a>
				<% 		
						}
						if(role.equals("3")) {
				%>
					<a class="btn_wrap" href="/JspWeb/controller/patient">
						<span class="horizontal_align"><p><img src="/JspWeb/img/medicine.png"></p>환자<b>Patient</b></span>
					</a>
				<%
						}
					}
				%>
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