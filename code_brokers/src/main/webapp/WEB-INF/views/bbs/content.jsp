<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CodeBrokers - 코드연구소</title>
<link rel="stylesheet" type="text/css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/index.css?ver=1">
<link rel="stylesheet" href="resources/css/joinForm.css?ver=1">
<link rel="stylesheet" href="resources/css/writeForm.css?ver=1">
<link rel="stylesheet" href="resources/css/content.css?ver=1">
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
				<div class="loader-container">
					<div class="rectangle-2"></div>
					<div class="rectangle-3"></div>
					<div class="rectangle-4"></div>
					<div class="rectangle-5"></div>
					<div class="rectangle-6"></div>
				</div>
					<a class="navbar-brand" href="/codeBrokers/index.bbs">&nbsp;&nbsp;CodeBrokers</a>
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
								<li><a href="/codeBrokers/list.bbs?pageNum=1&category=news">IT관련 기사</a></li>
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
				<h2>${category}</h2>
			</div>
			<ol class="breadcrumb">
				<li><a href="/codeBrokers/index.bbs">CodeBrokers</a></li>
				<li class="active">${category}</li>
			</ol>
		</header>
		<article>
			<div class="content" id="content">
				<!-- @@@@@CONTENT CONTENT CONTENT@@@@@ -->		
				<div class="viewContent">
					<div class="contentHeader">
						<div class="titleAndAuthor">
							<div class="title"><h4>${article.title}</h4></div>
							<div class="author">${article.id}</div>
						</div>
						<div class="dateAndCount">
							<div class="url"><a href="#">게시글 주소</a></div>
							<div class="writeDate"><strong>${article.writeDate}</strong> 글 작성 시간</div>
							<div class="hit">조회수 : ${article.hit}</div>
						</div>		
					</div>
					
					<div class="content-control-top">
						<div class="control-btn">
							<c:if test="${id == article.id}">
								<button class="btn btn-default btn-update" type="button">수정</button>
								<button class="btn btn-default btn-delete" type="button">삭제</button>
							</c:if>
							<c:if test="${id != article.id}">
								<button class="btn btn-default btn-update" type="button" disabled="disabled">수정</button>
								<button class="btn btn-default btn-delete" type="button" disabled="disabled">삭제</button>
							</c:if>
							<button class="btn btn-default btn-list" type="button">목록</button>
						</div>
					</div>
					<div class="contentBody">
						${article.content}<br /><br />
					</div>
					<div class="content-control-bottom">
						<div class="control-btn">
							<c:if test="${id == article.id}">
								<button class="btn btn-default btn-update" type="button">수정</button>
								<button class="btn btn-default btn-delete" type="button">삭제</button>
							</c:if>
							<c:if test="${id != article.id}">
								<button class="btn btn-default btn-update" type="button" disabled="disabled">수정</button>
								<button class="btn btn-default btn-delete" type="button" disabled="disabled">삭제</button>
							</c:if>
							<button class="btn btn-default btn-list" type="button">목록</button>
						</div>
					</div>
					<div class="contentFooter">
						<div class="comment">
							<div id="disqus_thread"></div>
							<script>	
								var disqus_config = function () {
// 									this.page.url = "http://pknu3.kr?" + category;
									this.page.identifier = ${category};
								};
								
								(function() { // DON'T EDIT BELOW THIS LINE
									var d = document, s = d.createElement('script');
									s.src = '//codebrokers.disqus.com/embed.js';
									s.setAttribute('data-timestamp', +new Date());
									(d.head || d.body).appendChild(s);
								})();
							</script>
							<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
						</div>
					</div>	
				</div>
			</div>
		</article>
		<footer>
			<div class="footer">ⓒ 2016. CodeBrokers all rights reserved.</div>
		</footer>
		
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="category" value="${category}">
		<input type="hidden" name="articleNum" value="${article.articleNum}">
		
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
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">								 
				</form>
			</div>
		</div>
	</div>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/index.js?ver=1"></script>
<script src="resources/js/content.js?ver=1"></script>
<script type="text/javascript" src="resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script id="dsq-count-scr" src="//codebrokers.disqus.com/count.js" async></script>
<script>
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
		document.location.href="./joinForm.member";
	})
})

</script>
</body>
</html>