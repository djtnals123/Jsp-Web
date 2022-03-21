<%@page import="kr.ac.sumin.computereng.dto.UserDatatype"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
		<div id="headerWrap">
			<div id="header">
				<%
					UserDatatype user = (UserDatatype) session.getAttribute("user");
					if(user == null)
						response.sendRedirect("/JspWeb.login_form.jsp");
				%>
	
				<h1 id="logo"><a href="#"><img src="/JspWeb/img/layout/logo.png" alt="병원" /></a></h1>
				
				<!-- gnbWrap :s -->
				<div id="gnbWrap">	
					<div id="gnb">
						<ul class="menu">
						<% if(user.hasRole("1")) { %>
							<li><a href="#">사용자 관리</a>
								<ul class="sub">
									<li><a href="/JspWeb/controller/userList">계정 관리</a></li>
								</ul>
							</li>
						<% } %>
							<li><a href="#">게시판 관리</a>
								<ul class="sub">
									<li><a href="/JspWeb/controller/boardList">공지사항</a></li>
									<li><a href="/JspWeb/controller/boardList">자유게시판</a></li>
								</ul>
							</li>
						</ul>
					 </div>	
			 	</div>	
				<!-- gnbWrap :e -->
				
				<div id="globalWrap">
					<ul class="global">
						<li>안녕하세요. <%=user.getName() %>님</li>
						<li><a href="/JspWeb/controller/userModify"> 회원정보수정</a></li>
						<li><a href="/JspWeb/controller/logout"> 로그아웃</a></li>
					</ul>
				</div>
			</div>
		</div>