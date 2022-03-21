<%@page import="kr.ac.sumin.computereng.dao.BoardDao"%>
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
		
		document.getElementById("prescriptionFinish").addEventListener("click", function(event) {
			event.preventDefault();
			if(title.value == "" || title.value.length == 0) {
				alert("제목은 공백일 수 없습니다.");
				title.focus();
				return;
			}
			if(contents.value == "" || contents.value.length == 0) {
				alert("내용은 공백일 수 없습니다.");
				contents.focus();
				return;
			}
			document.getElementById("board_form").submit();
		});
		
		document.getElementById("resetBtn").addEventListener("click", function() {
			title.value = "";
			contents.value = "";
		});
	});
</script>
</head>

<body>
<!-- wrap :s -->
	<div id="wrapper">

		<!-- header :s -->
		<div id="headerWrap">
			<div id="header">
	
				<h1 id="logo"><a href="#"><img src="/JspWeb/img/layout/logo.png" alt="충북대학교 병원" /></a></h1>
				
				<!-- gnbWrap :s -->
				<div id="gnbWrap">	
					<div id="gnb">
						<ul class="menu">
							<li><a href="#">게시판</a>
								<ul class="sub">
									<li><a href="#">공지사항</a></li>
								</ul>
								<ul class="sub">
									<li><a href="#">자유게시판</a></li>
								</ul>
							</li>
						</ul>
					 </div>	
			 	</div>	
				<!-- gnbWrap :e -->
				
				<div id="globalWrap">
					<ul class="global">
						<li>안녕하세요. XXX님</li>
						<li><a href="#"> 회원정보수정</a></li>
						<li><a href="#"> 로그아웃</a></li>
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
				<form id="board_form" action="/JspWeb/controller/boardWrite" enctype="multipart/form-data" method="POST">
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
									<input class="inputText2" type="text" style="width:100%" id="title" name="title">
								</td>
							</tr>
							<tr>
								<td class="trw" width="200">작성자</td>
								<td style="text-align: left;">
									홍길동
								</td>
							</tr>
							<tr>
								<td class="trw" width="200">파일</td>
								<td style="text-align: left;">
									<input class="inputText2" type="file" name="attach_file" style="width:100%">
								</td>
							</tr>
							<tr>
								<td class="trw" width="200">내용</td>
								<td>
									<textarea rows="30" cols="100" id="contents" name="contents"></textarea>
								</td>
							</tr>
		                </tbody>
		            </table>
		            <input class="no" type="text" style="width:0%" id="no" name="no" value="">
		            
		            <!-- table :e -->
					
		            <!-- paging & search :s -->
					<input type="button" value="취소"  class="subbtn3">
					<input id="resetBtn" type="button" value="다시하기" class="subbtn3" onclick=" ">
					<span class="rightButton" >
						<button type="submit" id="prescriptionFinish" class="mainbtn" onclick=" ">저장하기</button>
					</span>
		            <!-- paging & search :e -->
		        </form>
				</div>
				<!-- 컨텐츠영역 txt :e -->

			</div>
			<!-- container :e -->

		</div>
		<!-- contentsWrap :e -->

		
		<!-- footerWrap :s -->
		<%@ include file="./common/footer_main.jsp" %>
		<!-- footerWrap :e -->
	</div>
</body>
</html>