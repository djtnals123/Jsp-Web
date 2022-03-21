<%@page import="kr.ac.sumin.computereng.dto.BoardVO"%>
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
	window.addEventListener("DOMContentLoaded", function() {
		event.preventDefault();
		var title = document.getElementById("title");
		var contents = document.getElementById("contents");
		<% BoardVO board = (BoardVO)request.getAttribute("board");%>
		document.getElementById("prescriptionFinish").addEventListener("click", function(event) {
			event.preventDefault();
			if(title.value == "" || title.value.length == 0) {
				alert("������ ������ �� �����ϴ�.");
				title.focus();
				return;
			}
			if(contents.value == "" || contents.value.length == 0) {
				alert("������ ������ �� �����ϴ�.");
				contents.focus();
				return;
			}
			document.getElementById("board_form").submit();
		});
		
		
		<%
		if(board != null) {
		%>	
			document.getElementById("title").value = <%=(String)board.getTitle() %>;
			document.getElementById("contents").value = <%=(String)board.getContents() %>;
			return;
		<%
		}
		%>

	});


</script>
</head>

<body>
<!-- wrap :s -->
	<div id="wrapper">

		<!-- header :s -->
		<div id="headerWrap">
			<div id="header">
	
				<h1 id="logo"><a href="#"><img src="/JspWeb/img/layout/logo.png" alt="����" /></a></h1>
				
				<!-- gnbWrap :s -->
				<div id="gnbWrap">	
					<div id="gnb">
						<ul class="menu">
							<li><a href="#">�Խ���</a>
								<ul class="sub">
									<li><a href="/JspWeb/controller/boardList">��������</a></li>
								</ul>
								<ul class="sub">
									<li><a href="/JspWeb/controller/boardList">�����Խ���</a></li>
								</ul>
							</li>
						</ul>
					 </div>	
			 	</div>	
				<!-- gnbWrap :e -->
				
				<div id="globalWrap">
					<ul class="global">
						<li>�ȳ��ϼ���. XXX��</li>
						<li><a href="#"> ȸ����������</a></li>
						<li><a href="#"> �α׾ƿ�</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- header :e -->


		<!-- contentsWrap :s -->
		<div id="contentsWrap">

			<!-- lnbWrap :s -->
			<div id="lnbWrap">
				<div id="lnb_title">
					<h2>�Խ���</h2>
				</div>			
				<ul id="lnb">
					<li class="on"><a href="#">��������</a></li>
					<li ><a href="#">�����Խ���</a></li>
				</ul>
			</div>
			<!-- lnbWrap :e -->

			<!-- container :s -->
			<div id="container">

				<div class="location">
					<span class="home"><a href="#"><img src="/JspWeb/img/layout/ico_home.png" alt="Ȩ"></a></span>
					<span class="arrow">&gt;</span>
					<a href="#"> <span class="first">�Խ���</span></a>
					<span class="arrow">&gt;</span>
					<a href="#"> <span>�Խ��� �ۼ�</span></a>
				</div>

				<h3 id="contTi">�Խ��� �ۼ�</h3>

				<!-- ���������� txt :s -->
				<div id="txt">
				<form id="board_form" action="/JspWeb/controller/boardModify" enctype="multipart/form-data" method="POST">
					<h4>�Խ��� �ۼ�</h4>
					<!-- table :s -->
					<table class="tbl_basic" style="table-layout:fixed;">
			            <caption>
			                <strong>�Խ��� �ۼ�</strong>
			                <details>
			                    <summary>�Խ��� ����</summary>
			                </details>
			            </caption>
		                <tbody>
							<tr>
								<td class="trw" width="200">����</td>
								<td>
									<input class="inputText2" type="text" style="width:100%" id="title" name="title" value="<%=board.getTitle() %>">
								</td>
							</tr>
							<tr>
								<td class="trw" width="200">�ۼ���</td>
								<td style="text-align: left;">
									<%=board.getWriter() %>
								</td>
							</tr>
							<tr>
								<td class="trw" width="200">����</td>
								<td style="text-align: left;">
									<input class="inputText2" type="file" name="attach_file" style="width:100%">
								</td>
							</tr>
							<tr>
								<td class="trw" width="200">����</td>
								<td>
									<textarea rows="30" cols="100" id="contents" name="contents"><%=board.getContents() %></textarea>
								</td>
							</tr>
		                </tbody>
		            </table>
		            
		            <!-- table :e -->
					
		            <!-- paging & search :s -->
					<input type="button" value="���"  class="subbtn3">
					<input id="resetBtn" type="reset" value="�ٽ��ϱ�" class="subbtn3" onclick=" ">
					<span class="rightButton" >
						<button type="submit" id="prescriptionFinish" class="mainbtn" onclick=" ">�����ϱ�</button>
					</span>
		            <!-- paging & search :e -->
			        <input type="hidden" name="no" value="<%=board.getNo() %>">
		        </form>
				</div>
				<!-- ���������� txt :e -->

			</div>
			<!-- container :e -->

		</div>
		<!-- contentsWrap :e -->

		
		<!-- footerWrap :s -->
		<%@ include file="./common/footer_main.jsp" %>
		<!-- footerWrap :e -->
	</div>
	
	<script type="text/javascript">



	


	</script>
</body>
</html>