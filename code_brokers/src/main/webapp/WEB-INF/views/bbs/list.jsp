<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CodeBrokers</title>
<link rel="stylesheet" type="text/css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/index.css?ver=1">
<link rel="stylesheet" href="resources/css/joinForm.css?ver=1">
<link rel="stylesheet" href="resources/css/writeForm.css?ver=1">
</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/codeBrokers/index.bbs">Brand</a>
				</div>
	
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="/codeBrokers/list.bbs?pageNum=1&category=notice">공지사항</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">코드 연구실&nbsp;<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/codeBrokers/list.bbs?pageNum=1&category=apiLab">API 연구실</a></li>
								<li><a href="/codeBrokers/list.bbs?pageNum=1&category=patternLab">패턴 연구실</a></li>
								<li><a href="/codeBrokers/list.bbs?pageNum=1&category=exceptionLab">Exception 연구실</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">강의실&nbsp;<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">강의실1</a></li>
								<li><a href="#">강의실2</a></li>
								<li><a href="#">강의실3</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">개발자 포럼&nbsp;<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/codeBrokers/list.bbs?pageNum=1&category=knowhow">노하우 전수</a></li>
								<li><a href="/codeBrokers/list.bbs?pageNum=1&category=qna">묻고 답하기</a></li>
								<li><a href="/codeBrokers/list.bbs?pageNum=1&category=free">사는 이야기</a></li>
							</ul></li>
	
						<li><a href="/codeBrokers/test.bbs">테스트 메뉴</a></li>		
						<c:if test="${id == null}">
							<li id="login">
								<a href="#loginModalLayer" class="modalLink">
								<span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;로그인</a>
							</li>
						</c:if>
						<c:if test="${id != null}">
							<li class="dropdown" id="login"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">${nickname}&nbsp;&nbsp;&nbsp;<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">회원정보 수정</a></li>
									<li><a href="#">쪽지함</a></li>
									<li><a href="/codeBrokers/logout.login">로그아웃</a></li>
								</ul>
							</li>
						</c:if>
					</ul>
				</div>		
				<!-- /.navbar-collapse -->
			</div>
				<!-- /.container-fluid -->
		</nav>
		<header>
			<div class="jumbotron">
				<h2>${category} (총 게시글 수 : ${totalCount})</h2>
			</div>
			<ol class="breadcrumb">
				<li><a href="/codeBrokers/index.bbs">CodeBrokers</a></li>
				<li class="active">${category}</li>
			</ol>
		</header>
		<article>
			<div class="content" id="content">
				<!-- @@@@@CONTENT CONTENT CONTENT@@@@@ -->
				<c:if test="${totalCount == 0}">
					<br /><h3 align="center">작성된 글이 없습니다.</h3><br />
				</c:if>		
				<div class="container" id="tableContainer">
					<div class="table-responsive">
						<c:if test="${totalCount != 0}">
						<table class="table table-hover" >
							<thead>
								<tr>
									<th>글번호</th>
									<th>제 &nbsp;&nbsp;&nbsp; 목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>수정일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="article" items="${articleList}">
								<tr>
									<td><c:out value="${article.articleNum}"/></td>					
									<td>
										<c:if test="${article.depth == 1}">
											<img src="resources/image/reply1.png" width="${16 * article.depth}" height="16">
										</c:if>
										<c:if test="${article.depth > 1}">
											<img src="resources/image/reply.png" width="${16 * article.depth}" height="${16 / article.depth}">
											<img src="resources/image/reply1.png" width="16" height="16">
										</c:if>
										<a href="/codeBrokers/content.bbs?articleNum=${article.articleNum}&pageNum=${pageNum}&category=${category}" class="showContent">
											${article.title}
	<%-- 							<c:if test="${article.commentCount != 0}"> --%>
	<%-- 							<span style="color:red">(${article.commentCount})</span>  --%>
	<%-- 							</c:if> --%>
										</a>
									</td>
									<c:if test="${id==null}">
										<td>${article.id}</td>
									</c:if>
									<c:if test="${id!=null}">
										<td><label class="memId">${article.id}</label></td>
									</c:if>
									<td>${article.writeDate}</td>
									<td>${article.updateDate}</td>
									<td>${article.hit}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<div align="center">	  
				   			${pageCode}
						</div>
						</c:if>
					</div>
					<c:if test="${id != null}">
						<button class="btn btn-default" id="writeBtn">글쓰기</button>
					</c:if>	
					<c:if test="${id == null}">
						<button class="btn btn-default" id="writeBtn" disabled="disabled">글쓰기</button>
					</c:if>
					<input type="hidden" name="category" value="${category}">
					<input type="hidden" name="totalCount" value="${totalCount}">				
				</div>
				
			</div>
		</article>
		<footer>
			<div class="footer">ⓒ 2016. CodeBrokers all rights reserved.</div>
		</footer>
		<div id="mask"></div>
		<div id="loginModalLayer">
			<div class="loginView">
				<p>로그인<span class="glyphicon glyphicon-remove" aria-hidden="true"></span></p>
				<form action="/codeBrokers/login.login" method="post" id="loginForm">
					<p><input type="text" class="form-control" name="id" id ="loginId" placeholder="아이디"></p> 
					<p><input type="password" class="form-control" name="password" id="loginPassword" placeholder="패스워드"></p>
					<p><input type="checkbox" id="loginCheck">&nbsp;로그인 유지<button class="btn btn-default btn-sm" id="find">ID/PW 찾기</button></p>
					<p><button class="btn btn-default" id="join" type="button">회원가입</button>
							<button class="btn btn-primary" id="login" type="submit">
							<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;로그인</button>
					</p>								 
				</form>
			</div>
		</div>
	</div>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/index.js?ver=1"></script>
<script src="resources/js/list.js?ver=1"></script>
<script type="text/javascript" src="resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
$.ajaxSetup({
	type : "post",
	dataType : "text",
	error : function(xhr) {
		alert("error : " + xhr.statusText);
	}	
})

$(function() {
	$("#loginForm").on("submit", function() {
		var id = $("#loginId").val();
		var password = $("#loginPassword").val();
		
		if (id.length == 0) {
			alert("아이디를 입력하세요.");
			$("#loginId").focus();
			return false;
		}
		
		if (password == "") {
			alert("패스워드를 입력하세요.");
			$("#loginPassword").focus();
			return false;
		}
		$("#loginForm").submit();
	})
	
	$("#join").on("click", function() {
		$.ajax({
			url : "/codeBrokers/joinForm.member",
			success : function(data) {
				$("#loginModalLayer").hide();
				$("#mask").hide();
				$("#content").html(data);
			}
		})
	})
})

</script>
</body>
</html>
