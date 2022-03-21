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
$(document).ready(function () {
	$("#modifyBtn").on('click', function() {
		location.href='/JspWeb/controller/boardModify?no=<%=request.getParameter("no") %>';
	});

	$("#deleteBtn").on('click', function() {
		location.href='/JspWeb/controller/boardDelete?no=<%=request.getParameter("no") %>';
	});

	$("#listBtn").on('click', function() {
		location.href='/JspWeb/controller/boardList';
	});
});
</script>
</head>
<%
	BoardVO board = (BoardVO) request.getAttribute("board");
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
					<h2>게시판</h2>
				</div>			
				<ul id="lnb">
					<li class="on"><a href="/JspWeb/controller/boardList">공지사항</a></li>
					<li ><a href="/JspWeb/controller/boardList">자유게시판</a></li>
				</ul>
			</div>
			<!-- lnbWrap :e -->

			<!-- container :s -->
			<div id="container">

				<div class="location">
					<span class="home"><a href="#"><img src="/JspWeb/img/layout/ico_home.png" alt="홈"></a></span>
					<span class="arrow">&gt;</span>
					<a href="#"> <span class="first">게시판</span></a>
					<span class="arrow">&gt;</span>
					<a href="#"> <span>게시판 작성</span></a>
				</div>

				<h3 id="contTi">게시판 작성</h3>

				<!-- 컨텐츠영역 txt :s -->
				<div id="txt">
					
					<h4>게시판 작성</h4>
					<!-- table :s -->
					<table class="tbl_basic" style="table-layout:fixed;">
			            <caption>
			                <strong>게시판 작성</strong>
			                <details>
			                    <summary>게시판 내용</summary>
			                </details>
			            </caption>
		                <tbody>
							<tr>
								<td class="trw" width="200">제목</td>
								<td>
									<%=board.getTitle() %>
								</td>
							</tr>
							<tr>
								<td class="trw" width="200">작성자</td>
								<td style="text-align: left;">
									<%=board.getWriter() %>
								</td>
							</tr>
							<%
							if(board.getAttachFile() != null) {
							%>
							<tr>
								<td class="trw" width="200">첨부파일</td>
								<td>
									<a href="/JspWeb/controller/download?filename=<%=board.getAttachFile().getSaveFileName()%>">
									<%=board.getAttachFile().getSaveFileName() %>
									</a>
								</td>
							</tr>
							<%
							}
							%>
								<td class="trw" width="200" height="400">내용</td>
								<td style="text-align: left; vertical-align: top;">
									<%=board.getContents() %>
								</td>
							</tr>
		                </tbody>
		            </table>
		            <!-- table :e -->
					
		            <!-- paging & search :s -->
					<input type="button" value="수정" id="modifyBtn" class="subbtn3" onclick="location.href='/JspWeb/controller/LoadBoardModify?no=<%=board.getNo()%>'">
					<input type="button" value="삭제" id="deleteBtn" class="subbtn3">
					<span class="rightButton" >
						<button type="button" id="listBtn" class="mainbtn">목록</button>
					</span>
		            <!-- paging & search :e -->
				</div>
				<!-- 컨텐츠영역 txt :e -->

			</div>
			<!-- container :e -->

		</div>
		<!-- contentsWrap :e -->

		
		<!-- footerWrap :s -->
		<%@ include file="./common/footer.jsp" %>
		<!-- footerWrap :e -->
	</div>
</body>
</html>