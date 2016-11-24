<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Code Brokers</title>
<link rel="stylesheet" type="text/css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/codeBrokers.css">
<style>
.content > div {
	border-bottom: 1px solid #ddd;
}

.joinForm {
	display: block;
	border-bottom: 1px solid #ddd;
}

.joinForm label {
	width: 150px;
	margin-top: 25px;
	text-align: right;
}

.joinForm .form-control {
	width: 200px;
	height: 25px;
	float: right;
	margin-top: 25px;
	margin-right: 600px;
}

.joinForm p {
	margin-left: 155px;
}

input[type=radio] {
	margin-left: 35px;
}

.submitDiv {
	margin-top: 15px;
	float: right;
}
</style>
</head>
<body>
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
				<a class="navbar-brand" href="/codeBrokers/index.cbs">Brand</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">공지사항</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">코드 연구실<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">API 연구실</a></li>
							<li><a href="#">패턴 연구실</a></li>
							<li><a href="#">Exception 연구실</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">강의실<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">강의실1</a></li>
							<li><a href="#">강의실2</a></li>
							<li><a href="#">강의실3</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">개발자 포럼<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">노하우 전수</a></li>
							<li><a href="#">묻고 답하기</a></li>
							<li><a href="#">사는 이야기</a></li>
						</ul></li>

					<li><a href="/codeBrokers/test.cbs">테스트 메뉴</a></li>
					<li id="login">
<%-- 								<c:if test="{id == null}"> --%>
						<a href="#loginModalLayer" class="modalLink"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;로그인</a>
<%-- 								</c:if> --%>
<%-- 								<c:if test="{id != null}"> --%>
<%-- 									${nickName} 님 반갑습니다^^ --%>
<%-- 								</c:if> --%>
					</li>
				</ul>
			</div>		
			<!-- /.navbar-collapse -->
		</div>
			<!-- /.container-fluid -->
	</nav>
	<header>
		<div class="jumbotron">
			<h2>공지사항</h2>
		</div>
		<ol class="breadcrumb">
			<li><a href="/codeBrokers/index.cbs">메인으로</a></li>
			<li class="active">공지사항</li>
		</ol>
	</header>
	<article>
		<div class="content">
			<div><h3>회원가입</h3></div>
			<form action="/codeBrokers/join.cbs" method="post">
				<div class="joinForm">
					<label>아이디</label>
					<input type="text" class="form-control" id="joinId" placeholder="영문 또는 숫자 6~12자">
					<label>비밀번호</label>
					<input type="password" class="form-control" id="joinPassword" placeholder="영문, 숫자 포함 8~14자">
					<label>비밀번호 확인</label>
					<input type="password" class="form-control" id="joinPassword2" placeholder="한번 더 입력해 주세요.">
					<label>이메일</label>
					<input type="text" class="form-control" id="joinEmail" placeholder="example@gamil.com">
					<label>닉네임</label>
					<input type="text" class="form-control" id="joinNickname" placeholder="한글 2~6자, 영문 6~12자">
					<label>메일링 가입</label>
					<input type="radio" name="emailPermit" value="yes" checked="checked">&nbsp;예
					<p><input type="radio" name="emailPermit" value="no">&nbsp;아니오</p>
					<label>쪽지 허용</label>
					<input type="radio" name="notePermit" value="all" checked="checked">&nbsp;모두 허용
					<p><input type="radio" name="notePermit" value="friends">&nbsp;등록된 친구만 허용</p>
					<p><input type="radio" name="notePermit" value="ignore">&nbsp;모두 허용 안함</p>
				</div>
				<div class="submitDiv">
					<button class="btn btn-default" id="cancel" type="button" onclick="location.href='/codeBrokers/index.cbs'">취소</button>
					<button class="btn btn-primary" id="join" type="submit">등록</button>
				</div>
			</form>
		</div>
	</article>
	<footer>
		<div class="footer">
			<h2>here is footer...^^</h2>
		</div>
	</footer>
<div id="mask"></div>
<div id="loginModalLayer">
	<div class="loginView">
		<p>로그인<span class="glyphicon glyphicon-remove" aria-hidden="true"></span></p>
		<form method="post" id="loginForm">
			<p><input type="text" class="form-control" id="loginId" placeholder="아이디"></p> 
			<p><input type="password" class="form-control" id="loginPassword" placeholder="패스워드"></p>
			<p><input type="checkbox" id="loginCheck">&nbsp;로그인 유지<button class="btn btn-default btn-sm" id="find">ID/PW 찾기</button></p>
			<p><button class="btn btn-default" id="join" type="button" onclick="location.href='/codeBrokers/joinForm.cbs'">회원가입</button>
					<button class="btn btn-primary" id="login">
					<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;로그인</button>
			</p>								 
		</form>
	</div>
</div>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/codeBrokers.js"></script>
</body>
</html>