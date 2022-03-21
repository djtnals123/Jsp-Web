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
	
				<h1 id="logo"><a href="#"><img src="/JspWeb/img/layout/logo.png" alt="����" /></a></h1>
				
				<!-- gnbWrap :s -->
				<div id="gnbWrap">	
					<div id="gnb">
						<ul class="menu">
						<% if(user.hasRole("1")) { %>
							<li><a href="#">����� ����</a>
								<ul class="sub">
									<li><a href="/JspWeb/controller/userList">���� ����</a></li>
								</ul>
							</li>
						<% } %>
							<li><a href="#">�Խ��� ����</a>
								<ul class="sub">
									<li><a href="/JspWeb/controller/boardList">��������</a></li>
									<li><a href="/JspWeb/controller/boardList">�����Խ���</a></li>
								</ul>
							</li>
						</ul>
					 </div>	
			 	</div>	
				<!-- gnbWrap :e -->
				
				<div id="globalWrap">
					<ul class="global">
						<li>�ȳ��ϼ���. <%=user.getName() %>��</li>
						<li><a href="/JspWeb/controller/userModify"> ȸ����������</a></li>
						<li><a href="/JspWeb/controller/logout"> �α׾ƿ�</a></li>
					</ul>
				</div>
			</div>
		</div>