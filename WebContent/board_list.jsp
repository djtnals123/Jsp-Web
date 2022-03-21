<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.sumin.computereng.dto.BoardVO"%>
<%@page import="kr.ac.sumin.computereng.dto.PageMaker"%>
<%@page import="kr.ac.sumin.computereng.dto.Criteria"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<link rel="shortcut icon" href="/JspWeb/img/logo.png">
<title>sumin</title>
<link rel="stylesheet" type="text/css" href="/JspWeb/css/normalize.css">
<link rel="stylesheet" type="text/css" href="/JspWeb/css/layout.css">
<link rel="stylesheet" type="text/css" href="/JspWeb/css/font.css">
<script src="/JspWeb/js/jquery.min.js"></script>
<script src="/JspWeb/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="/JspWeb/js/submenu.js"></script>
<script type="text/javascript">	
	window.addEventListener("DOMContentLoaded", function() {
		document.getElementById("mainbtn").addEventListener("click", function(event) {
			event.preventDefault();
			location.href = "/JspWeb/board_write.jsp";
		});
	});
</script>
</head>
<%
	List<BoardVO> boardList = (List<BoardVO>) request.getAttribute("boardList");
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
					<h2>게시판</h2>
				</div>			
				<ul id="lnb">
					<li class="on"><a href="./get_board_list.jsp">공지사항</a></li>
					<li ><a href="./get_board_list.jsp">자유게시판</a></li>
				</ul>
			</div>
			<!-- lnbWrap :e -->

			<!-- container :s -->
			<div id="container">

				<div class="location">
					<span class="home"><a href="#"><img src="/JspWeb/img/layout/ico_home.png" alt="병원"></a></span>
					<span class="arrow">&gt;</span>
					<a href="#"> <span class="first">게시판</span></a>
					<span class="arrow">&gt;</span>
					<a href="#"> <span>공지사항</span></a>
				</div>

				<h3 id="contTi">공지 사항</h3>

				<!-- 컨텐츠영역 txt :s -->
				<div id="txt">
					
					<h4>공지사항</h4>
					<!-- table :s -->
					<table class="tbl_basic" style="table-layout:fixed;">
			            <caption>
			                <strong>공지사항</strong>
			                <details>
			                    <summary>공지사항</summary>
			                </details>
			            </caption>
		                <thead>
		                    <tr>
		                        <th class="trw" width=30>No</th>
		                        <th class="trw">제목</a></th>
		                        <th class="trw" width=100>작성자</th>
		                        <th class="trw" width=120>작성일</th>
		                    </tr>
		                </thead>
		                <tbody>
						<%
								for(int i=0; i<boardList.size(); i++) {
									int no= boardList.get(i).getNo();
						%>
								<tr>
									<td><%=no %></td>
									<td><a href=<%="/JspWeb/controller/boardRead?no="+no %>><%=boardList.get(i).getTitle() %></a></td>
									<td><%=boardList.get(i).getWriter() %></td>
									<td><%=boardList.get(i).getFormatDate() %></td>
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
								<a href="/JspWeb/controller/boardList<%=pm.getCri().getQueryString(pm.getStartPage()-1) %>" title="이전페이지로 이동"></a>
							</li>
					<% } %>
					<% for(int i = pm.getStartPage(); i <= pm.getEndPage(); i++) { %>
						<%if(pm.getCri().getPage() == i) {%>
							<li class="active">
						<% } else { %>
							<li>
						<% } %>            					
								<a href="/JspWeb/controller/boardList<%=pm.getCri().getQueryString(i) %>" title="<%=i %>페이지"><%=i %></a>
     						</li>
					<% } %>
		            <% if(pm.isNext()) { %>
	            			<li class="dir next">
	            				<a href="/JspWeb/controller/boardList<%=pm.getCri().getQueryString(pm.getEndPage()+1) %>" title="다음페이지로 이동"></a>
	            			</li>
					<% } %>

					</ul>
					<div id="searchtab">
					<form class="search_info" style="background: #ffffff">
					<li>
						<select name="option" class="searchOption">
							<option <%if("1".equals(pm.getCri().getOption())) {%> selected <% } %> value="1" >제목</option>
							<option <%if("2".equals(pm.getCri().getOption())) {%> selected <% } %> value="2" >내용</option>
							<option <%if("3".equals(pm.getCri().getOption())) {%> selected <% } %> value="3" >제목+내용</option>
							<option <%if("4".equals(pm.getCri().getOption())) {%> selected <% } %> value="4" >작성자</option>
						</select>
						<input type="text" name="keyword" class="inputText" value=
							"<%=pm.getCri().getKeyword()==null?"":pm.getCri().getKeyword()%>" class="inputText" placeholder="조건 입력"/>
						<input type="submit" id="searchButton" class="submitbtn" value="검색" class="searchBtn"/>
					</li>
					</form>
					</div>
		            <!-- paging & search :e -->
					<span class="rightButton" >
						<button type="button" class="mainbtn" id="mainbtn">게시판 작성</button>
					</span>
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