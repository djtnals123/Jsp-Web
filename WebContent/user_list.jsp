<%@page import="kr.ac.sumin.computereng.dto.UserDatatype"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.sumin.computereng.dto.PageMaker"%>
<%@page import="kr.ac.sumin.computereng.dto.Criteria"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<link rel="shortcut icon" href="/JspWeb/img/logo.png">
<title>Sumin</title>
<link rel="stylesheet" type="text/css" href="/JspWeb/css/normalize.css">
<link rel="stylesheet" type="text/css" href="/JspWeb/css/layout.css">
<link rel="stylesheet" type="text/css" href="/JspWeb/css/font.css">
<script src="/JspWeb/js/jquery.min.js"></script>
<script src="/JspWeb/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="/JspWeb/js/submenu.js"></script>
<script type="text/javascript">
</script>
</head>
<%
	List<UserDatatype> userList = (List<UserDatatype>) request.getAttribute("userList");
	PageMaker pm = (PageMaker) request.getAttribute("pageMaker");
%>
<body>
<!-- wrap :s -->
	<div id="wrapper">

		<!-- header :s -->
<%@ include file="./common/header.jsp" %>
		<!-- header :e -->


		<!-- contentsWrap :s -->
		<div id="contentsWrap">

			<!-- lnbWrap :s -->
			<div id="lnbWrap">
				<div id="lnb_title">
					<h2>사용자 관리</h2>
				</div>			
				<ul id="lnb">
					<li class="on"><a href="#">계정 관리</a></li>
				</ul>
			</div>
			<!-- lnbWrap :e -->

			<!-- container :s -->
			<div id="container">

				<div class="location">
					<span class="home"><a href="#"><img src="/JspWeb/img/layout/ico_home.png" alt=""></a></span>
					<span class="arrow">&gt;</span>
					<a href="#"> <span class="first">사용자 관리</span></a>
					<span class="arrow">&gt;</span>
					<a href="#"> <span>계정 관리</span></a>
				</div>

				<h3 id="contTi">계정 관리</h3>

				<!-- 컨텐츠영역 txt :s -->
				<div id="txt">
					
					<h4>계정 목록</h4>
					<!-- table :s -->
					<table class="tbl_basic" style="table-layout:fixed;">
			            <caption>
			                <strong>계정목록</strong>
			                <details>
			                    <summary>계정 목록</summary>
			                </details>
			            </caption>
		                <thead>
		                    <tr>
		                        <th class="trw" width=30>No</th>
		                        <th class="trw" width=120>아이디</th>
		                        <th class="trw" width=100>이름</th>
		                        <th class="trw" width=100>계정<br>유형</th>
		                        <th class="trw" width=120>병원</th>
		                        <th class="trw" width="120">E-Mail</th>
		                        <th class="trw" >가입 날짜</th>
		                    </tr>
		                </thead>
		                <tbody>
		                <%
							String role = "";
							for(int i=0; i<userList.size(); i++) {
								String[] roles = userList.get(i).getRoles();
								role = "";
								int idx = 0;
								for(String s : roles) {
									if(++idx < roles.length) role += s+",";
									else role += s;
								}
								role=role.replace("1", "관리자").replace("2", "의사").replace("3", "환자");
									
						%>
							<tr>
								<td><%=i+1 %></td>
								<td><a href="#"><%=userList.get(i).getId() %></a></td>
								<td><%=userList.get(i).getName() %></td>
								<td><%=role %></td>
								<td><%=userList.get(i).getHospital() %></td>
								<td><%=userList.get(i).getEmail() %></td>
								<td><%=userList.get(i).getDate() %></td>
							</tr>
						<%
							}
						%>
		                </tbody>
		            </table>
		            <!-- table :e -->
					
		            <!-- paging & search :s -->
		            <ul class="paginate">
   		            <% if(pm.isPrev()) { %>		
							<li class="dir prev">
								<a href="/JspWeb/controller/userList<%=pm.getCri().getQueryString(pm.getStartPage()-1) %>" title="이전페이지로 이동"></a>
							</li>
					<% } %>
					<% for(int i = pm.getStartPage(); i <= pm.getEndPage(); i++) { %>
						<%if(pm.getCri().getPage() == i) {%>
							<li class="active">
						<% } else { %>
							<li>
						<% } %>            					
								<a href="/JspWeb/controller/userList<%=pm.getCri().getQueryString(i) %>" title="<%=i %>페이지"><%=i %></a>
     						</li>
					<% } %>
		            <% if(pm.isNext()) { %>
	            			<li class="dir next">
	            				<a href="/JspWeb/controller/userList<%=pm.getCri().getQueryString(pm.getEndPage()+1) %>" title="다음페이지로 이동"></a>
	            			</li>
					<% } %>
		            
					</ul>
		            <!-- paging & search :e -->
				</div>
				<!-- 컨텐츠영역 txt :e -->

			</div>
			<!-- container :e -->

		</div>
		<!-- contentsWrap :e -->

		
		<!-- footerWrap :s -->
		<div id="footerWrap">
<%@ include file="./common/footer_main.jsp" %>
		</div>
		<!-- footerWrap :e -->
	</div>
</body>
</html>